<frog>

  <div class="container">
    <div class="row">
      <div class="col-sm">
        <img src="images/frog-think.gif" class="center"/>
        <h3>旅かえる Let's travel</h3>
        <p>step 1: pack bag for the frog</p>
        <p>step 2: start a new journey to get postcards</p>
        <h5>Number of postcards: { numOfCard }</h5>
        <button type="button" class="btn btn-success start" data-toggle="modal" data-target="#modal">Start new journey</button>

      </div>

      <div class="col-sm">
        <div class="container">
          <div class="row">

            <div class="col-sm">
              <food></food>
            </div>
            <div class="col-sm">
              <item></item>
            </div>
            <div class="col-sm">
              <charm></charm>
            </div>

          </div>

          <div class="row teach">
            <input type="text" class="words" ref="messageEl" placeholder="Teach your frog some words...">
            <input type="text" ref="diffEl" placeholder="Enter difficulty (0 to 5)">
            <button type="button" class="btn btn-outline-success submit" onclick={ submit }>Tell him</button>
            <button type="button" class="btn btn-outline-success submit" onclick={ save }>Save Word</button>
            <button type="button" class="btn btn-outline-success submit" onclick={ remove }>Forget this word</button>
          </div>

          <div class="order_query">
            <div class="order">
              <p>order data by</p>
              <select ref="order" value="" onchange={ orderResults }>
                <option value="default">default</option>
                <option value="difficulty">difficulty</option>
              </select>
            </div>

            <div class="filter">
              <p>filter by level of difficulty</p>
              <select ref="difficult" value="" onchange={ filterResults }>
                <option value="default">Default</option>
                <option value="easy">easy</option>
                <option value="medium">medium</option>
                <option value="hard">hard</option>
              </select>
            </div>
          </div>

          <div class="row">Words:
            <word each={ myWords }>
              &nbsp;&nbsp;{word}
            </word>
          </div>

        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">You get a new postcard from your frog!</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <img src={ this.cardImage } class="card"/>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal" onclick={savePicture}>Save the postcard</button>
        </div>
      </div>
    </div>
  </div>

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/vue"></script>

  <script>

    var that = this;
    this.cardImage = "images/r" + Math.floor(Math.random() * 9) + ".png";

    this.numOfCard = 0;
    this.modalname = "modal"
    this.messages = [];
    this.myWords = [];
    var wordRef = rootRef.child('words');

    this.save = function () {
      var key = wordRef.push().key;


      // Our data object that we will write to the database. We could design this model to have other properties, like author.
      var word = {
        id: key,
        word: this.refs.messageEl.value,
        difficulty: this.refs.diffEl.value
      }

      wordRef.child(key).set(word);
    }

    wordRef.on('value', function (snap) {
      let dataAsObj = snap.val();

      var tempData = [];
      console.log(tempData);

      //instead of statically typing out the array value, we now read it in from the firebase data obj using a js for loop structure
      for (key in dataAsObj) {
        tempData.push(dataAsObj[key]);
      }

      //finally, we copy this array back to our tag's property field console.log("myMemes", tag.myMemes);
      that.myWords = tempData;

  //    var content = " " + dataAsObj[dataAsObj.length-1].word;
  //    var wordAdd = {
  //      word: content
  //    };
  //    that.myWords.push(wordAdd);

      //same question, 4th time of encounter. Why do we need to call tag update here?
      that.update();
      observable.trigger('updateWords', tempData);
      console.log(that.myWords);
    });



    //order result start

    orderResults(event){
      //1. get order value
      let order = this.refs.order.value;
      // console.log("order", order);

      let orderResult = wordRef;
      console.log("wordRef", wordRef);

      if (order == "difficulty"){
        orderResult = orderResult.orderByChild('difficulty');
        console.log("order by difficulty", orderResult);
      }else{
        // default, nothing happens
      }

      orderResult.once('value', function (snap) {
        // let rawdata = snap.val();
        // console.log("datafromfb", datafromfb);
        let tempData = [];

        snap.forEach(function(child) {
           tempData.push(child.val()); // NOW THE CHILDREN PRINT IN ORDER
       });

        that.myWords = tempData;

        that.update();
        observable.trigger('updateWords', tempData);
      });
    }


    filterResults(event) {
  //get current filter value
  var diff = this.refs.difficult.value;
  //order memes by child property funnees
  let queryResult = wordRef.orderByChild('difficulty');
  console.log("queryResult", queryResult);

  //combine with additional functions to form complex queries
  if (diff == "easy") {
    queryResult = queryResult.startAt('0').endAt('2');
      console.log("queryResult for no fun", queryResult);
  } else if (diff == "medium") {
    queryResult = queryResult.startAt('3').endAt('4');
    console.log("queryResult for very full", queryResult);
  } else if (diff == "hard") {
    queryResult = queryResult.equalTo('5');
    console.log("queryResult for some fun", queryResult);
  } else {
    //default, no query needed
  }

  queryResult.once('value', function (snap) {
    let rawdata = snap.val();
    // console.log("datafromfb", datafromfb);
    let tempData = [];
    for (key in rawdata) {
      tempData.push(rawdata[key]);
    }
    // console.log("myMemes", tag.myMemes);
    that.myWords = tempData;

    that.update();
    observable.trigger('updateWords', tempData);
  });
}


    showFood(event) {
      var text = event.target.innerHTML;
      var x = document.getElementById('foodImage');
      x.setAttribute("src", "images/food/" + text + ".png");
    }

    showCharm(event) {
      var text = event.target.innerHTML;
      var x = document.getElementById('charmImage');
      x.setAttribute("src", "images/charm/" + text + ".png");
    }
    showItem(event) {
      var text = event.target.innerHTML;
      var x = document.getElementById('itemImage');
      x.setAttribute("src", "images/item/" + text + ".png");
      observable.trigger('pickCard', text);
    }

    savePicture(e) {
      this.numOfCard = this.numOfCard + 1;
    }

    observable.on('pickCard', function (text) {
      that.cardImage = "images/" + text + "p.png";
      that.update();
    })

    var audio = new Audio("BGM.mp3");
    audio.play();

    this.submit = function (event) {

      var content = " " + that.messages;
    //  var wordAdd = {
    //    word: content
    //  };
      this.myWords.push(content);
      this.refs.messageEl.value = "";
      //}else {  var content = " "+this.refs.messageEl.value ;    var wordAdd = {word: content};    this.myWords.push(wordAdd);  this.refs.messageEl.value = "";  }

    }

    this.remove = function (event) {
      // console.log('EVENT:', event); console.log('EVENT.ITEM', event.item);
      var wordText = event.target;
      for (var i = 1; i < this.myWords.length; i++) {
        var numOfIfExist = this.myWords[i].word.search(wordText);
        console.log(numOfIfExist);
        if (numOfIfExist != -1) {
          var index = i;
          this.myWords.splice(i, 1);
          return;
        }
      }

    }
  </script>

  <style>
    :scope {
      text-align: center;
    }
    .center {
      display: block;
      margin-left: auto;
      margin-right: auto;
    }
    .container {
      margin-top: 100px;
    }
    img {
      margin: 20px;
    }
    .start {
      margin-top: 20px;
    }
    .card {
      margin-left: -15px;
    }
    .teach {
      margin-top: 20px;
      margin-left: 5px;
    }
    .submit {
      margin-top: 10px;
      margin-left: 20px;
    }
    .interaction {
      margin-top: 20px;
      margin-left: 20px;
    }
  </style>
</frog>

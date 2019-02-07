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
              <img src="" id="foodImage">
              <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle btn-success" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Choose food
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                  <a class="dropdown-item" onclick={showBagel}>bagel</a>
                  <a class="dropdown-item" onclick={showPie}>pie</a>
                  <a class="dropdown-item" onclick={showSandwich}>sandwich</a>
                  <a class="dropdown-item" onclick={showScorn}>scorn</a>
                </div>
              </div>
            </div>
            <div class="col-sm">
              <img src="" id="itemImage">
              <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle btn-success" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Choose item
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                  <a class="dropdown-item" onclick={showBowl}>bowl</a>
                  <a class="dropdown-item" onclick={showLamp}>lamp</a>
                  <a class="dropdown-item" onclick={showTent}>tent</a>
                </div>
              </div>
            </div>
            <div class="col-sm">
              <img src="" id="charmImage">
              <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle btn-success" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Choose charm
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" onclick={showButton}>
                  <a class="dropdown-item" onclick={showAmulet}>amulet</a>
                  <a class="dropdown-item" onclick={showBell}>bell</a>
                  <a class="dropdown-item" onclick={showClover}>clover</a>
                </div>
              </div>
            </div>
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
          <img src={ cardImage } class="card"/>
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
    this.cardImage = "images/r" + Math.floor(Math.random() * 9) + ".png";
    this.numOfCard = 0;
    showBagel(e) {
      var x = document.getElementById('foodImage');
      x.setAttribute("src", "images/food/bagel.png");
    }
    showPie(e) {
      var x = document.getElementById('foodImage');
      x.setAttribute("src", "images/food/pie.png");
    }
    showSandwich(e) {
      var x = document.getElementById('foodImage');
      x.setAttribute("src", "images/food/sandwich.png");
    }
    showScorn(e) {
      var x = document.getElementById('foodImage');
      x.setAttribute("src", "images/food/scorn.png");
    }
    showAmulet(e) {
      var x = document.getElementById('charmImage');
      x.setAttribute("src", "images/charm/amulet.png");
    }
    showBell(e) {
      var x = document.getElementById('charmImage');
      x.setAttribute("src", "images/charm/bell.png");
    }
    showClover(e) {
      var x = document.getElementById('charmImage');
      x.setAttribute("src", "images/charm/clover.png");
    }
    showBowl(e) {
      var x = document.getElementById('itemImage');
      x.setAttribute("src", "images/item/bowl.png");
    }
    showLamp(e) {
      var x = document.getElementById('itemImage');
      x.setAttribute("src", "images/item/lamp.png");
    }
    showTent(e) {
      var x = document.getElementById('itemImage');
      x.setAttribute("src", "images/item/tent.png");
    }
    savePicture(e) {
      this.numOfCard = this.numOfCard + 1;
    }
    var audio = new Audio("BGM.mp3");
    audio.play();
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
  </style>
</frog>
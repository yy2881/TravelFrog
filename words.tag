<words>
  <word each={ myWords }>

  </word>

  <script>
    var tag = this;
    this.myWords = [];

    observable.on('updateWords', function (passedData) {
      tag.myWords = passedData;
      tag.update();
    });


  </script>

</words>

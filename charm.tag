<charm>
  <img src="" id="charmImage">
  <div class="dropdown">
    <button class="btn btn-secondary dropdown-toggle btn-success" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      Choose charm
    </button>
    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" onclick={showButton}>
      <a class="dropdown-item" onclick={parent.showCharm}>amulet</a>
      <a class="dropdown-item" onclick={parent.showCharm}>bell</a>
      <a class="dropdown-item" onclick={parent.showCharm}>clover</a>
    </div>
  </div>
</charm>

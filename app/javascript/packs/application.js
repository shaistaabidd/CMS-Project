import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
Rails.start()
Turbolinks.start()
ActiveStorage.start()
$(document).ready(function() {

  var clickOnPopupLink = function(){
    $('body').on('click', '.static-popup-link', function(){
      $('#myModal').modal('show');
    });
  }

  clickOnPopupLink();

});
// require("packs/demo.js");

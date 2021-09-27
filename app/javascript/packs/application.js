// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require("jquery")
import "bootstrap"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(document).ready(function(){
    $('.dropdown-toggle').dropdown();
});

$(function () {
  $('.title-bars').click(function(){
    // メニューバーが開かれているなら
    if($('.nav').hasClass('open')){
      $('.nav').removeClass('open');

      // Font Awesomeを×にする
      $('.title-bars').children('i').removeClass().addClass('fas fa-bars');

    }
    // メニューバーが開かれていないなら
    else{
      $('.nav').addClass('open');

      // Font Awesomeをメニューバーにする
      $('.title-bars').children('i').removeClass().addClass('fas fa-times');
    }
    })
});

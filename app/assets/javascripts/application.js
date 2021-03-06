// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= bootstrap-sprockets
//= require_tree .


$(document).ready(function(){
  requestButtonListener();
  cancelToClose();

});

var requestButtonListener = function(){
  $('#request-button').on('click', function(event){
    event.preventDefault();
    var request = $.ajax({
      url: '/request/new',
      method: 'GET'
    });
    request.done(function(response){
      $('#requests').html(response)
    });
    request.fail(function(response){

    });
  })

}

var cancelToClose = function(){
  $('body').on('click', '#cancel', function(event){
    event.preventDefault();
    console.log("Stopped");
    $('#request-form').hide();
  });
};
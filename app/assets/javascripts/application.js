// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery.ui.all
//= require jquery_ujs
//= require autocomplete-rails
//= require dataTables/jquery.dataTables
//= require foundation
//= require jquery_nested_form
//= require toastr
//= require rails.validations
//= require rails.validations.simple_form
//= require ckeditor/init
//= require topics

$(document).ready(function(){
  $('.ajax_page').click(function(){
    $('#page_nav').html('loading .....');
  });
});
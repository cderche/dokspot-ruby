// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

$(function () {

  function launchSpinner() {
    var opts = {
      lines: 13, // The number of lines to draw
      length: 20, // The length of each line
      width: 10, // The line thickness
      radius: 25, // The radius of the inner circle
      corners: 1, // Corner roundness (0..1)
      rotate: 0, // The rotation offset
      direction: 1, // 1: clockwise, -1: counterclockwise
      color: '#000', // #rgb or #rrggbb or array of colors
      speed: 1, // Rounds per second
      trail: 50, // Afterglow percentage
      shadow: false, // Whether to render a shadow
      hwaccel: false, // Whether to use hardware acceleration
      className: 'spinner', // The CSS class to assign to the spinner
      zIndex: 2e9, // The z-index (defaults to 2000000000)
      top: '50%', // Top position relative to parent
      left: '50%' // Left position relative to parent
    };
    var target = document.getElementById('spinner-placeholder');
    var spinner = new Spinner(opts).spin(target);
  }

  $("[data-toggle='tooltip']").tooltip();
  $("[data-toggle='popover']").popover();

  $('#new_customer').submit(function () {

    function validName(value){
      var regex = new RegExp("[a-zA-Z].+$");
      return regex.test(value);
    }

    function validEmail(value){
      var regex = new RegExp("[a-zA-Z\_\.]+@[a-zA-Z\_\.]+");
      return regex.test(value);
    }

    function validCountry(value){
      var regex = new RegExp("[a-zA-Z].+$");
      return regex.test(value);
    }

    function validTelephone(value){
      var regex = new RegExp("[0-9]+$");
      return regex.test(value);
    }

    function validCompare(value1, value2){
      return (value1 == value2);
    }

    //alert("Handler for .submit() called.");

    // Get the Login Name value and trim it
    var name = $.trim($('#customer_full_name').val());
    var country = $.trim($('#customer_country').val());
    var telephone = $.trim($('#customer_telephone').val());
    var email = $.trim($('#customer_email').val());
    var email_confirmation = $.trim($('#customer_email_confirmation').val());

    var errors = "<b>Please review:</b><br><ul>";
    var error_exists = false;

    var valid_n = validName(name);
    var valid_c = validCountry(country);
    var valid_t = validTelephone(telephone);
    var valid_e = validEmail(email);
    var valid_ec = validCompare(email,email_confirmation);

    if (valid_n == false) {
      error_exists = true;
      errors = errors + "<li>Your Name</li>";
    }

    if (valid_c == false) {
      error_exists = true;
      errors = errors + "<li>Your Country</li>";
    }

    if (valid_t == false) {
      error_exists = true;
      errors = errors + "<li>Your Telephone Number</li>";
    }

    if (valid_e == false) {
      error_exists = true;
      errors = errors + "<li>Your Email</li>";
    }

    if (valid_ec == false) {
      error_exists = true;
      errors = errors + "<li>Your Emails do not match</li>";
    }

    if (error_exists){
      errors = errors + "</ul>";
      $( "#callbackErrorMessage" ).empty();
      $( "#callbackErrorMessage" ).append('<div class="alert alert-danger">'+errors+"</div>");
      //alert(text)
      return false;
    }else{
      launchSpinner()
    }
  });

});

(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-50717184-1', 'auto');
  ga('send', 'pageview');


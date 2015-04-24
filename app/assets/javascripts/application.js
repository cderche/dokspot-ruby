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
  $("[data-toggle='tooltip']").tooltip();
  $("[data-toggle='popover']").popover();

  //$("#callbackButton").click(function(){
    //alert("Handler for .click() called.");
  //});

  $('#new_customer').submit(function () {
    //alert("Handler for .submit() called.");

    // Get the Login Name value and trim it
    var name = $.trim($('#customer_full_name').val());
    var country = $.trim($('#customer_country').val());
    var telephone = $.trim($('#customer_telephone').val());

    var text = "You forget to enter your: <br><ul>";
    var result = true;

    // Check if NAME empty of not
    if (name === '') {
        //alert('Name is empty.');
        text = text + "<li>Name</li>"
        result = false;
    }

    // Check if COUNTRY empty of not
    if (country === '') {
        //alert('Name is empty.');
        text = text + "<li>Country</li>"
        result = false;
    }

    // Check if TELEPHONE empty of not
    if (telephone === '') {
        //alert('Name is empty.');
        text = text + "<li>Telephone</li>"
        result = false;
    }

    if (result == false){
      $( "#callbackErrorMessage" ).empty();
      $( "#callbackErrorMessage" ).append('<div class="alert alert-danger">'+text+"</div>");
      //alert(text)
      return false;
    }
  });

});

(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-50717184-1', 'auto');
  ga('send', 'pageview');


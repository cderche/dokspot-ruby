# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->

  $(".download").click (e) ->
    e.preventDefault() #stop the browser from following
    #window.location.href = "uploads/file.doc"
    #alert target.href
    #alert 'hello world'
    window.location.href = this.href
    return
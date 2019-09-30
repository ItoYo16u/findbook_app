# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on "turbolinks:load",()->
    $("#show_more").on "click",()->
      $(".review_card").each ()->
        $(this).css("display","flex")
      $(this).css("display","none")

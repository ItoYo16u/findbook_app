# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on "turbolinks:load",()->
    $(".tab_menu").on "click", ()->
      $(this).addClass("is-active")
      $(this).siblings().removeClass("is-active")
      $("#{$(this).attr("target")}").addClass("is-active")
      $("#{$(this).attr("target")}").siblings().removeClass("is-active")
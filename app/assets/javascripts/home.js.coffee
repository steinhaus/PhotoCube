# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(window).ready ->
  $('.autoriza').click ->
    phid = $(this).attr 'phid'
    $.ajax
      type: "POST",
      url: "/change",
      data: 
        id: phid
        what: 'ok'
      success: ->
        location.reload()
  $('.deleta').click ->
    phid = $(this).attr 'phid'
    $.ajax
      type: "POST",
      url: "/change",
      data: 
        id: phid
        what: "delete"
      success: ->
        location.reload()
  $('.desautoriza').click ->
    phid = $(this).attr 'phid'
    $.ajax
      type: "POST",
      url: "/change",
      data: 
        id: phid
        what: 'des'
      success: ->
        location.reload()
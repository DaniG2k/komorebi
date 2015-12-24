# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Add padding to text over image tiles 
$ ->
  $('h2').wrapInner '<span>'
  $('h2 br').before('<span class=\'spacer\'>').after '<span class=\'spacer\'>'
  return
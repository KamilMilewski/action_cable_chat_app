App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    unless data.message.blank?
      $('#messages-table').append data.message
      scroll_bottom()

$(document).on 'turbolinks:load', ->
  submit_message()
  scroll_bottom()

submit_message = () ->
  $('#message_content').on 'keydown', (e) ->
    if e.keyCode is 13 && !e.shiftKey
      $('input').click()
      e.target.value = ""
      e.preventDefault()
scroll_bottom = () ->
  $('#messages').scrollTop($('#messages')[0].scrollHeight)

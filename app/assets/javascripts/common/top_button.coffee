$ ->
  $window   = $(window)
  $document = $(document)
  $body     = $(document.body)
  $button   = $('#scroll_top')
  states    = { invisible: 0, visible: 1, transition: 2 }
  state     = states.invisible

  fade_in = ->
    state = states.transition
    $button.fadeIn 'slow', -> state = states.visible
  fade_out = ->
    state = states.transition
    $button.fadeOut 'slow', -> state = states.invisible

  $window.on 'scroll', ->

    if state == states.invisible && $document.scrollTop() > 0
      fade_out()
    else if $document.scrollTop() == 0
      fade_in()
    else if $window.scrollTop() + $window.height() == $document.height()
      fade_out()
  
  $button.on 'click', ->
    $body.animate({ scrollTop: 0 }, 'slow')

$ ->
  $window   = $(window)
  $document = $(document)
  $body     = $(document.body)
  $button   = $('#scroll_top')
  states    = { invisible: 0, visible: 1, transition: 2 }
  state     = states.invisible

  $window.on 'scroll', ->

    if state == states.invisible && $document.scrollTop() > 0
      state = states.transition
      $button.fadeIn 'slow', -> state = states.visible

    else if state == states.visible && $document.scrollTop() == 0
      state = states.transition
      $button.fadeOut 'slow', -> state = states.invisible

  $button.on 'click', ->
    $body.animate({ scrollTop: 0 }, 'slow')

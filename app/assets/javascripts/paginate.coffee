$ ->
  $(window).on 'scroll', ->

    next_page_url = $('.pagination a[rel=next]').attr('href')

    if next_page_url && $(window).scrollTop() > $(document).height() - $(window).height() - 100

      $('.pagination').empty()

      $.ajax
        url: next_page_url
        success: (data) ->
          $('#articles').append(data)

    else if ! next_page_url

      $('.pagination').empty()

    return

$ ->
  $('#article_search').on 'submit',
    (event) ->
      search_term = $('#search').val()
      search_url  = this.action + search_term

      event.preventDefault()

      if !!search_term
        window.location = search_url

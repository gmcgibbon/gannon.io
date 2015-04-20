$ ->

  $('.category_new a').on 'click', ->
    $this     = $(this)
    $list     = $this.parent().parent()
    new_title = window.prompt 'Choose a category title:'
    create_json =
      category:
        title: new_title
        slug:  null
    if new_title
      $.ajax
        method: 'POST'
        data: create_json
        url: '/category'
        success: (data) ->
          window.location.reload()

  $('.category .edit a').on 'click', ->
    $this     = $(this)
    $cat      = $this.parent().parent()
    $title    = $cat.find('a:first')
    slug      = $cat.data('slug')
    new_title = window.prompt 'Choose a new category title:', $title.text()
    update_json =
      category:
        title: new_title
        slug:  null
    if new_title
      $.ajax
        method: 'PUT'
        url: '/category/' + slug
        data: update_json
        success: (data) ->
          $cat.data('slug', data.slug)
          $title.text(data.title)
          $title.attr('href', '/category/' + data.slug)

  $('.category .destroy a').on 'click', ->
    $this     = $(this)
    $cat      = $this.parent().parent()
    slug      = $cat.data('slug')
    confirm   = window.confirm 'Delete category?'

    if confirm
      $.ajax
        method: 'DELETE'
        url:  '/category/' + slug
        success: (data) ->
          $cat.empty()

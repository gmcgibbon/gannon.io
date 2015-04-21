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
        url: "/category/#{slug}"
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
        url:  "/category/#{slug}"
        success: (data) ->
          $cat.parent().remove()

  $('.category .add a, .category .remove a').on 'click', ->
    $this   = $(this)
    $span   = $this.parent()
    $cat    = $this.parent().parent()
    slug    = $cat.data('slug')
    article = $cat.data('article')
    is_post = $span.attr('class') == 'add'

    relation_json =
      article:
        slug: article

    if is_post
      $.ajax
        method: 'POST'
        url: "/category/#{slug}/relate"
        data: relation_json
        success: (data) ->
          $this.text('Remove')
          $span.toggleClass('add remove')
    else
      $.ajax
        method: 'DELETE'
        url: "/category/#{slug}/relate"
        data: relation_json
        success: (data) ->
          $this.text('Add')
          $span.toggleClass('remove add')

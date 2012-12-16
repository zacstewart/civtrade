$ ->
  $('#shop_item_name').typeahead
    source: (query, process) ->
      $.ajax
        url: '/items'
        dataType: 'json'
        data:
          term: query
        success: (data) ->
          process $.map(data, (item) -> item.name)

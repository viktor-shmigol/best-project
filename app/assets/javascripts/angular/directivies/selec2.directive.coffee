bestProject.directive "select2", ->
  (scope, element, attrs) ->
    element.select2
      minimumInputLength: 3
      triggerChange: true
      ajax:
        url: '/users'
        dataType: 'json'
        data: (term) ->
          { q: term }
        results: (data) ->
          { results: data['data'] }

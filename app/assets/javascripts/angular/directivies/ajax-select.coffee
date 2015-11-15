bestProject.directive "ajaxSelect", ->
  (scope, element, attrs) ->
    element.select2
      minimumInputLength: 3
      triggerChange: true
      ajax:
        url: attrs.ajaxSelect
        dataType: 'json'
        data: (term) ->
          term
        processResults: (data) ->
          results: data

bestProject.directive "select2", ->
  (scope, element, attrs) ->
    element.select2
      minimumResultsForSearch: 5

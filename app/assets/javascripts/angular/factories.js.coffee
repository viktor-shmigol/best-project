angular.module('BestProject').factory 'Task', ['$resource', ($resource) ->
  $resource('/tasks/:id', {id: '@id'}, {update: {method: 'PUT'}})
]

angular.module('BestProject').factory 'Board', ['$resource', ($resource) ->
  $resource('/boards/:id', {id: '@id'}, {update: {method: 'PUT'}})
]

angular.module('BestProject').factory 'Task', ['$resource', ($resource) ->
  $resource('/tasks/:id', {id: '@id'}, {update: {method: 'PUT'}})
]

angular.module('BestProject').factory 'Board', ['$resource', ($resource) ->
  $resource('/boards/:id', {id: '@id'}, {update: {method: 'PUT'}})
]

angular.module('BestProject').factory 'List', ['$resource', ($resource) ->
  $resource('/lists/:id', {id: '@id'}, {update: {method: 'PUT'}})
]

angular.module('BestProject').factory 'Member', ['$resource', ($resource) ->
  $resource('/members/:id', {id: '@id'}, {update: {method: 'PUT'}})
]

angular.module('BestProject').factory 'User', ['$resource', ($resource) ->
  $resource('/users/:id', {id: '@id'}, {update: {method: 'PUT'}})
]

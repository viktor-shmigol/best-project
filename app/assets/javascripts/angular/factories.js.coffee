angular.module('BestProject').factory 'Task', ['$resource', ($resource) ->
  $resource('/tasks/:id', {id: '@id'}, {update: {method: 'PUT'}})
]

angular.module('BestProject').factory 'Board', ['$resource', ($resource) ->
  $resource('/boards/:id', {id: '@id'}, {update: {method: 'PUT'}})
]

angular.module('BestProject').factory 'List', ['$resource', ($resource) ->
  $resource('/lists/:id', {id: '@id'}, {update: {method: 'PUT'}})
]

angular.module('BestProject').factory 'BoardMember', ['$resource', ($resource) ->
  $resource('/user_boards/:id', {id: '@id'}, {update: {method: 'PUT'}})
]

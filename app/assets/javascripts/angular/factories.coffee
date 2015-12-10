bestProject.factory 'Task', ['$resource', ($resource) ->
  $resource('/tasks/:id', {id: '@id'}, {update: {method: 'PUT'}})
]

bestProject.factory 'Board', ['$resource', ($resource) ->
  $resource('/boards/:id', {id: '@id'}, {update: {method: 'PUT'}})
]

bestProject.factory 'List', ['$resource', ($resource) ->
  $resource('/lists/:id', {id: '@id'}, {update: {method: 'PUT'}})
]

bestProject.factory 'Member', ['$resource', ($resource) ->
  $resource('/members/:id', {id: '@id'}, {update: {method: 'PUT'}})
]

bestProject.factory 'User', ['$resource', ($resource) ->
  $resource('/users/:id', {id: '@id'}, {update: {method: 'PUT'}})
]

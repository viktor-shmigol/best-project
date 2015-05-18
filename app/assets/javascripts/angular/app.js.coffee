app = angular.module 'BestProject', [
  'ngRoute'
  'ngResource'
  'ngAnimate'
  'angular.filter'
  'mgcrea.ngStrap'
  'ui.sortable'
]

app.config(['$controllerProvider', ($controllerProvider) ->
  $controllerProvider.allowGlobals()
])

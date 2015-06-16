app = angular.module 'BestProject', [
  'ngRoute'
  'ngResource'
  'ngAnimate'
  'angular.filter'
  'mgcrea.ngStrap'
  'ui.sortable'
  'ui.date'
  'ui.select2'
  'angular-loading-bar'
]

app.config(['$controllerProvider', ($controllerProvider) ->
  $controllerProvider.allowGlobals()
])

app.config ['cfpLoadingBarProvider', (cfpLoadingBarProvider) ->
    cfpLoadingBarProvider.latencyThreshold = 10
]

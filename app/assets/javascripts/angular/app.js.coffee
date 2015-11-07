@bestProject = angular.module 'BestProject', [
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

bestProject.config ['cfpLoadingBarProvider', (cfpLoadingBarProvider) ->
    cfpLoadingBarProvider.latencyThreshold = 10
]

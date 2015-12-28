@bestProject = angular.module 'BestProject', [
  'ngRoute'
  'ngResource'
  'ngAnimate'
  'ngCookies'
  'angular.filter'
  'mgcrea.ngStrap'
  'ui.sortable'
  'ui.date'
  'ui.select2'
  'angular-loading-bar'
  'xeditable'
  'flash'
]

bestProject.config ['cfpLoadingBarProvider', (cfpLoadingBarProvider) ->
  cfpLoadingBarProvider.latencyThreshold = 10
]

bestProject.run ['editableOptions', '$rootScope','$location', 'Auth',
  (editableOptions, $rootScope, $location, Auth) ->
    editableOptions.theme = 'bs3';

    $rootScope.$on '$routeChangeError', (event, current, previous, eventObj) ->
      if eventObj.authenticated == false
        $location.path '/sign_in'
]

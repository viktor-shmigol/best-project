bestProject.controller 'MainCtrl', [ '$scope', 'Auth', ($scope, Auth) ->
  $scope.$on '$routeChangeStart', () ->
    $scope.currentUser = Auth.getUserInfo() unless Auth.getUserInfo().hasOwnProperty('$promise')

  $scope.logout = ->
    $scope.currentUser = undefined
    Auth.logout()
]

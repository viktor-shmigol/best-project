bestProject.controller 'MainCtrl', [ '$scope', 'Auth', ($scope, Auth) ->
  $scope.$on '$routeChangeStart', () ->
    $scope.currentUser = Auth.getUserInfo()

  $scope.logout = ->
    $scope.currentUser = undefined
    Auth.logout()
]

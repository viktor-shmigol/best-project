bestProject.controller 'SignInCtrl', [ '$scope', 'Auth', ($scope, Auth) ->

  $scope.login = ->
    Auth.login($scope.user)
]

bestProject.controller 'SignUpCtrl', [ '$scope', 'Auth', ($scope, Auth) ->
  $scope.registrationForm = {}

  $scope.signUp = ->
    Auth.signUp($scope.registrationForm)
]

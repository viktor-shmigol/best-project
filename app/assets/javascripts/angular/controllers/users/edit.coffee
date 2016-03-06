bestProject.controller 'UserEditCtrl', [ '$scope', 'Flash', 'User', '$q', ($scope, Flash, User, $q) ->
  $scope.user = $scope.currentUser

  $scope.update = ->
    User.update $scope.user,
      () ->
        Flash.create 'success', 'Successfully updated your profile!'
      (response) ->
        messages = ''
        angular.forEach response.data.errors, (value, key) ->
          messages += "#{key}: #{value}"
        $q.all().then () ->
          Flash.create 'danger', messages
]

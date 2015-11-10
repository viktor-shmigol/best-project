bestProject.controller 'MembersCtrl', ['$scope', 'Member','User', ($scope, Member, User) ->
  $scope.members = Member.query(board_id: $scope.boardId)
  $scope.users = User.query()
]

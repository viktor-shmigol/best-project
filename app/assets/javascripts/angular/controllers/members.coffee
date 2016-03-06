bestProject.controller 'MembersCtrl', ['$scope', 'Member','User','roleTypes', ($scope, Member, User, roleTypes) ->
  $scope.members = Member.query(board_id: $scope.boardId)
  $scope.newMember =
    board_id: $scope.boardId
  $scope.roleTypes = roleTypes

  $scope.invite = ->
    Member.save user_board: $scope.newMember
    , (response) ->
      $scope.members.push(response.member)
      $scope.isFormShow = false

  $scope.delete = (id, index) ->
    if confirm('Are you sure?')
      Member.delete id: id, board_id: $scope.boardId
      , () ->
        $scope.members.splice(index,1)
]

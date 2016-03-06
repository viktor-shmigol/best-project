bestProject.controller 'EditBoardCtrl', ['$scope', 'Board','Member', '$routeParams', ($scope, Board, Member, $routeParams) ->
  $scope.boardId = $routeParams.boardId
  $scope.board = Board.get(id: $scope.boardId)

  $scope.update = (data)->
    if data is ''
      return "Can't be blank"
    else
      Board.update(id: $scope.board.slug, board: { name: data })
]

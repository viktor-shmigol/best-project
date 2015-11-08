bestProject.controller 'EditBoardCtrl', ['$scope', 'Board', '$routeParams', ($scope, Board, $routeParams) ->
  $scope.boardId = $routeParams.boardId
  $scope.board = Board.get(id: $scope.boardId)

  $scope.update = (data)->
    if data is ''
      return "Can't be blank"
    else
      Board.update(id: $scope.boardId, board: { name: data })
]

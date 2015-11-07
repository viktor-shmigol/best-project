bestProject.controller 'ShowBoardCtrl', ['$scope', 'Board', '$routeParams', ($scope, Board, $routeParams) ->
  $scope.boardId = $routeParams.boardId

  $scope.board = Board.get(id: $scope.boardId)
]

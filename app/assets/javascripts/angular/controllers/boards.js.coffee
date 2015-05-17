@BoardsCtrl = ['$scope', 'Board', ($scope, Board) ->
  $scope.newBoard = {}

  $scope.boards = Board.query()

  $scope.addNew = ->
    board = Board.save($scope.newBoard,
      () ->
        $scope.boards.push(board)
        $scope.newBoard = {}
    )

  $scope.delete = (board_id, index) ->
    if confirm('Впевнений?')
      Board.delete
        id: board_id
      , (success) ->
        $scope.boards.splice(index,1)
        return
]

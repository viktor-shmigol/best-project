bestProject.controller 'NewBoardCtrl', ['$scope', 'Board', ($scope, Board) ->
  $scope.newBoard = {}

  $scope.create = ->
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

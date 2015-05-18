@BoardsCtrl = ['$scope', 'Board', '$routeParams', ($scope, Board, $routeParams) ->
  $scope.boardId = $routeParams.boardId
  $scope.newBoard = {}

  $scope.boards = Board.query (response) ->
    $.each response, ->
      $scope.board = @ if @id == parseInt($scope.boardId)

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

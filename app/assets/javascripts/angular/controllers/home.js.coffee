@HomeCtrl = ['$scope', 'Board', ($scope, Board) ->

  $scope.boards = Board.query()
]

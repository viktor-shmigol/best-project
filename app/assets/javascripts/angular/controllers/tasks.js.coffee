@TasksCtrl = ['$scope', 'Task', '$routeParams', ($scope, Task, $routeParams) ->
  $scope.boardId = $routeParams.boardId

  $scope.newTask = {
    board_id: $scope.boardId
  }

  $scope.addNew = (list_id) ->
    $scope.newTask.task_list_id = list_id
    task = Task.save($scope.newTask,
      () ->
        $scope.tasklist[list_id].push(task)
        $scope.newTask = {}
    )
]

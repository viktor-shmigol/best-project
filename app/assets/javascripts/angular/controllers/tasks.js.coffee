@TasksCtrl = ['$scope', 'Task', '$routeParams', ($scope, Task, $routeParams) ->
  $scope.boardId = $routeParams.boardId

  $scope.newTask = {
    board_id: $scope.boardId
  }

  $scope.addNew = (listId) ->
    $scope.newTask.list_id = listId
    task = Task.save($scope.newTask,
      () ->
        $scope.tasks[listId].push(task)
        $scope.newTask = {}
    )

  $scope.delete = (taskId, index, listId) ->
    if confirm('Впевнений?')
      Task.delete
        id: taskId
      , (success) ->
        $scope.tasks[listId].splice(index,1)
        return
]

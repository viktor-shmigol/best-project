bestProject.controller 'TasksCtrl', [
  '$scope', 'Task', '$routeParams', 'points', 'taskTypes',
  ($scope, Task, $routeParams, points, taskTypes) ->
    $scope.boardId = $routeParams.boardId
    $scope.labels = taskTypes
    $scope.points = points

    $scope.newTask = {
      board_id: $scope.boardId
      points: null
    }

    $scope.addNew = (listId) ->
      $scope.newTask.list_id = listId
      task = Task.save($scope.newTask,
        () ->
          $scope.tasks[listId].push(task)
          $scope.taskModal.hide()
          $scope.newTask = {}
      )

    $scope.delete = (taskId, index, listId) ->
      if confirm('Are you sure?')
        Task.delete
          id: taskId
        , (success) ->
          $scope.tasks[listId].splice(index,1)
          return

]

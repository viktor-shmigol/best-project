bestProject.controller 'EditTasksCtrl', [
  '$scope', 'Task', 'points', 'taskTypes',
  ($scope, Task, points, taskTypes) ->
    $scope.labels = taskTypes
    $scope.points = points

    $scope.update = (task, data) ->
      if data is ''
        return "Can't be blank"
      else
        Task.update id: task.id, task
]

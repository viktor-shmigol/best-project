bestProject.controller 'TasksCtrl', ['$scope', 'Task', '$routeParams', ($scope, Task, $routeParams) ->
  $scope.boardId = $routeParams.boardId

  $scope.labels = ['Bug', 'Feature']

  $scope.points = [
    {name: 'Unestimated', value: null}
    {name: '0 points', value: 0}
    {name: '1 points', value: 1}
    {name: '2 points', value: 2}
    {name: '3 points', value: 3}
  ]

  $scope.newTask = {
    board_id: $scope.boardId
    points: null
  }

  $scope.addNew = (listId) ->
    $scope.newTask.list_id = listId
    console.log $scope.newTask
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

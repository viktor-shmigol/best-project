@TaskListsCtrl = ['$scope', 'TaskList', '$routeParams', ($scope, TaskList, $routeParams) ->
  $scope.boardId = $routeParams.boardId

  $scope.newTaskList = {
    board_id: $scope.boardId
  }

  $scope.taskLists = TaskList.query(board_id: $scope.boardId)

  $scope.addNew = ->
    taskList = TaskList.save($scope.newTaskList,
      () ->
        $scope.taskLists.push(taskList)
        $scope.newTaskList = {}
    )

  $scope.delete = (taskList_id, index) ->
    if confirm('Впевнений?')
      TaskList.delete
        id: taskList_id
      , (success) ->
        $scope.taskLists.splice(index,1)
        return
]

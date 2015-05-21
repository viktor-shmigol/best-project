@TaskListsCtrl = ['$scope', 'TaskList', 'Task', '$routeParams', '$filter', ($scope, TaskList, Task, $routeParams, $filter) ->
  $scope.boardId = $routeParams.boardId

  $scope.newTaskList = {
    board_id: $scope.boardId
  }

  $scope.taskLists = TaskList.query(board_id: $scope.boardId)

  $scope.addNew = ->
    taskList = TaskList.save($scope.newTaskList,
      () ->
        $scope.taskLists.push(taskList)
        $scope.tasklist[taskList.id] = {}
        $scope.newTaskList = {}
    )

  $scope.delete = (taskList_id, index) ->
    if confirm('Впевнений?')
      TaskList.delete
        id: taskList_id
      , (success) ->
        $scope.taskLists.splice(index,1)
        return

  $scope.tasklist = {}

  $scope.newTask = {
    board_id: $scope.boardId
  }

  $scope.tasks = Task.query
    board_id: $scope.boardId
    (response) ->
      $.each response, ->
        $scope.tasklist[@task_list_id] = $filter('filter')(response, task_list_id: @task_list_id)

  $scope.sortableOptions =
    placeholder: 'app-ph'
    connectWith: '.task-list'
    update: (e, ui) ->
      console.log(ui.item.index())
    receive: (e, ui) ->
      id = $(e.target).attr('id')
      task_id = $(ui.item).attr('id')
      Task.update(id: task_id, { task_list_id: id })
]

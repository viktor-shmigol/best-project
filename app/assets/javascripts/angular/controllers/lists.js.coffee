@ListsCtrl = ['$scope', 'List', 'Task', '$routeParams', '$filter', ($scope, List, Task, $routeParams, $filter) ->
  $scope.boardId = $routeParams.boardId
  $scope.tasks = {}

  $scope.newList = {
    board_id: $scope.boardId
  }

  $scope.lists = List.query
    board_id: $scope.boardId
    (response) ->
      emptyList = $filter('filter')(response, {assigned: false})
      $.each emptyList, ()->
        $scope.tasks[@id] = []

  $scope.addNew = ->
    list = List.save($scope.newList,
      () ->
        $scope.lists.push(list)
        $scope.tasks[list.id] = []
        $scope.newList.name = ''
    )

  $scope.delete = (list_id, index) ->
    if confirm('Впевнений?')
      List.delete
        id: list_id
      , (success) ->
        $scope.lists.splice(index,1)
        return


  $scope.newTask = {
    board_id: $scope.boardId
  }

  Task.query
    board_id: $scope.boardId
    (response) ->
      $.each response, ->
        $scope.tasks[@list_id] = $filter('filter')(response, list_id: @list_id)

  $scope.taskSortableOptions =
    animation: 200
    connectWith: '.task-list'
    update: (e, ui) ->
      id = $(e.target).attr('id')
      position = ui.item.index() + 1
      task_id = $(ui.item).attr('id').replace('task_', '')
      Task.update(id: task_id, task: { list_id: id, target_position: position })
    receive: (e, ui) ->
      id = $(e.target).attr('id')
      task_id = $(ui.item).attr('id').replace('task_', '')
      Task.update(id: task_id, task: { list_id: id })

  $scope.listSortableOptions =
    animation: 200
    connectWith: '.list-sortable'
    update: (e, ui) ->
      id = $(ui.item).attr('id').replace('list_', '')
      position = ui.item.index() + 1
      List.update(id: id, list: { target_position: position })
]

bestProject.factory 'taskDecorator', [ 'Task', '$modal', (Task, $modal) ->
  ($scope) ->

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

    $scope.taskModalShow = (url, item) ->
      $scope.list = item
      $scope.task = item
      $scope.taskModal = $modal(scope: $scope, template: url, show: false, animation: 'am-fade-and-scale')
      $scope.taskModal.$promise.then $scope.taskModal.show
]

bestProject.factory 'modalDialogDecorator', [
  '$modal', ($modal) ->
    ($scope) ->
      $scope.showModal = (url) ->
        $scope.dialog = $modal(
          scope: $scope
          templateUrl: url
          show: true)
        $scope.dialog.$promise.then $scope.dialog.show
]

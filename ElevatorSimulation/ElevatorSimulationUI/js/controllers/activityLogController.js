'use restrict';
simApp.controller('activityLogController',
	function($scope, simData) {
		$scope.showError = false;
		$scope.dbError = "";

		$scope.buildings = simData.buildings;
		$scope.activityLogs = simData.activityLogs;

		if (simData.error !== undefined) {
			setTimeout(function() {
				$scope.$apply(function() {
					$scope.showError = true;
					$scope.dbError = simData.error;
				});
			}, 1);
		}
		$scope.showBuildingDetails = false;
		$scope.selectedBuilding = {};

		$scope.showBuildingInfo = function () {
			
			if ($scope.selectedBuilding !== null) {
				setTimeout(function() {
					$scope.$apply(function() {
						$scope.showBuildingDetails = true;
					});
				}, 1);
			} else {
				setTimeout(function () {
					$scope.$apply(function () {
						$scope.showBuildingDetails = false;
					});
				}, 1);
			}
			
		}

	});
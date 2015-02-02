'use restrict';
simApp.controller('mainController',
	function ($scope, $location) {

		$scope.viewActivityLog = function () {
			$location.path('/viewLog').replace();
		}
		$scope.goHome = function () {
			$location.path('/').replace();
		}

	});
'use restrict';

simApp.factory('simData', function ($rootScope, $resource) {

	var simData = {};

	var baseApiAddress = $rootScope.baseApiAddress;

	var buildingResource = $resource(baseApiAddress + "/buildings" );
	simData.getBuildings = function () {
		return buildingResource.query({ method: 'GET', isArray: true })
			.$promise.then(
				function (result) {
					simData.buildings = result;
				},
				function (error) {
					simData.error = error.data;
				}
			);
	};
	simData.saveActivityLog = function (activityLog) {
		var url = baseApiAddress + "/SaveActivityLog";
		var resource = $resource(url);

		return resource.save(activityLog);
	};


	var activityLogResource = $resource(baseApiAddress + "/activityLogs" );
	simData.getActivityLogs = function () {
		return activityLogResource.query({ method: 'GET', isArray: true })
			.$promise.then(
				function (result) {
					simData.activityLogs = result;
				},
				function (error) {
					simData.error = error.data;
				}
			);
	};

	return simData;
});
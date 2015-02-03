'use strict';
var simApp = angular.module('simApp', ['ngResource', 'ngSanitize', 'ngRoute', 'ngAnimate'])
	.run(function($rootScope) {
		$rootScope.baseApiAddress = 'http://localhost:47783/api';
	})
	.config(function ($routeProvider, $locationProvider) {
		$routeProvider.when('/', {
			templateUrl: 'templates/Building.html',
			controller: 'buildingController',
			resolve: {
				getBuildings: function (simData) {
					return simData.getBuildings();
				}
				
			}
		}),
		$routeProvider.when('/viewLog', {
			templateUrl: 'templates/ActivityLogs.html',
			controller: 'activityLogController',
			resolve: {
				getBuildings: function (simData) {
					return simData.getBuildings();
				},
				getActivityLogs: function (simData) {
					return simData.getActivityLogs();
				}

			}
		})
	.otherwise({ redirectTo: '/' });
	$locationProvider.html5Mode(true);
});
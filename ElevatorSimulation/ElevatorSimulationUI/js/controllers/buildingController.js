'use restrict';
simApp.controller('buildingController',
	function ($scope, simData, $timeout, $filter, $routeParams, $route, $interval) {
		$scope.showError = false;
		$scope.dbError = "";

		$scope.buildingStyle = { "zoom": "70%" };
		$scope.buildings = simData.buildings;
		if (simData.error !== undefined) {
			setTimeout(function () {
				$scope.$apply(function () {
					$scope.showError = true;
					$scope.dbError = simData.error;
				});
			}, 1);
		}
		$scope.showBuildingDetails = false;
		$scope.showBuildingFloors = false;
		$scope.selectedBuilding = {};
		$scope.floors = [];
		$scope.queue = [];

		var setupFloors = function () {
			$scope.currentFloor = 1;

			var upImgSrc = "/Images/up_arrow.png";
			var downImgSrc = "/Images/down_arrow.png";

			$scope.floors = [];

			for (var i = 0; i < $scope.selectedBuilding.NumberOfFloors; i++) {
				var f = i + 1;
				var imgSrc = "/Images/Number" + f + ".png";
				var position = 117 * ($scope.selectedBuilding.NumberOfFloors - f);

				var floor = {
					"index": f,
					"floorId": "floor" + f,
					"number": f,
					"numberImgSrc": imgSrc,
					"upImgSrc": upImgSrc,
					"downImgSrc": downImgSrc,
					"position": position
				}
				floor.style = { "top": floor.position };

				if (f === 1) {
					floor.downImgSrc = "";
				}
				if (f === $scope.selectedBuilding.NumberOfFloors) {
					floor.upImgSrc = "";
				}
				$scope.floors.push(floor);
			}
		}

		var setupLifts = function() {
			$scope.lifts = [];
			for (var l = 0; l < $scope.selectedBuilding.NumberOfElevators; l++) {
				var k = l + 1;
				var lift = { "liftId": "lift" + k };
				lift.isIdle = true;
				lift.style = { "top": $scope.floors[$scope.currentFloor - 1].position }
				lift.leftDoorStyle = {
					"background": "#98bf21",
					"height": "96px",
					"width": "1px",
					"top": "0",
					"left": "0",
					"position": "absolute",
					"border-style": "solid"
				}
				lift.rightDoorStyle = {
					"background": "#98bf21",
					"height": "96px",
					"width": "1px",
					"top": "0",
					"left": "181px",
					"position": "absolute",
					"border-style": "solid"
				}
				lift.currentFloor = $scope.currentFloor;
				lift.doorClosed = false;

				$scope.lifts.push(lift);
			}
		}

		$scope.showBuilding = function () {
			setTimeout(function () {
				$scope.$apply(function () {
					$scope.showBuildingDetails = true;
					$scope.showBuildingFloors = false;
				});
			}, 1);

			setupFloors();

			setupLifts();

			setTimeout(function () {
				$scope.$apply(function () {
					$scope.showBuildingFloors = true;
				});
			}, 1);
		}

		var recordActivity = function (lift, toFloor, direction, floorNumber) {
			var activityDescription = "Move from Floor " + lift.currentFloor + " to Floor " + toFloor;
			var liftNumber = 0;
			var callButtonActivity = "";

			if (direction !== undefined) {
				callButtonActivity = "Call button " + direction.toUpperCase() + " pressed at Floor " + floorNumber;
			}

			for (var k = 0; k < $scope.lifts.length; k++) {
				if ($scope.lifts[k] === lift) {
					liftNumber = k + 1;
					$scope.lifts[k].currentFloor = toFloor;
					break;;
				}
			}
			var activityLog = {};
			activityLog.Building = $scope.selectedBuilding;
			activityLog.ActivityDescription = activityDescription;
			activityLog.LiftNumber = liftNumber;
			activityLog.CallButtonActivity = callButtonActivity;

			simData.saveActivityLog(activityLog)
				.$promise.then(
					function (result) {
					},
					function (error) {
						setTimeout(function () {
							$scope.$apply(function () {
								$scope.showError = true;
								$scope.dbError = error.data;
							});
						}, 1);
					});
		}

		var openElevatorDoors = function (lift) {

			var leftDoor = $("#leftDoor" + lift.liftId);
			var rightDoor = $("#rightDoor" + lift.liftId);
			if (lift.doorClosed) {
				lift.doorClosed = false;
				leftDoor.animate({
					width: "1px"
				}, 1000);
				rightDoor.animate({
					width: "1px",
					left: "181px"
				}, 1000);
			}
		}

		$scope.move = function (lift, toFloor, direction, floorNumber) {

			if (lift.currentFloor === toFloor) return;

			var leftDoor = $("#leftDoor" + lift.liftId);
			var rightDoor = $("#rightDoor" + lift.liftId);

			if (!lift.doorClosed) {
				lift.isIdle = false;
				leftDoor.animate({
					width: "95px"
				}, 1000);

				rightDoor.animate({
					width: "95px",
					left: "95px"
				}, 1000, function () {

					lift.doorClosed = true;
					
					var liftDiv = $("#" + lift.liftId);

					var duration = Math.abs(lift.currentFloor - toFloor) * 1000;

					var toFloorPosition = $scope.floors[toFloor - 1].position;
					liftDiv.animate({
						top: toFloorPosition
					}, duration, function () {

						recordActivity(lift, toFloor, direction, floorNumber);
						openElevatorDoors(lift);
						lift.isIdle = true;
					});
				});
			}

		}

		var pickALift = function(direction, floorNumber) {
			if ($scope.lifts.length === 1 && $scope.lifts[0].isIdle) {
				return $scope.lifts[0];
			}
			for (var k = 0; k < $scope.lifts.length; k++) {
				if ($scope.lifts[k].currentFloor === floorNumber && $scope.lifts[k].isIdle) {
					return $scope.lifts[k];
				}
			}
			
			var goingDownLifts = [];
			for (var k = 0; k < $scope.lifts.length; k++) {
				if ($scope.lifts[k].currentFloor > floorNumber && $scope.lifts[k].isIdle) {
					goingDownLifts.push($scope.lifts[k]);
				}
			}

			if (goingDownLifts.length > 0) {
				goingDownLifts = $filter("orderBy")(goingDownLifts, "currentFloor");
			}
			var goingUpLifts = [];
			for (var k = 0; k < $scope.lifts.length; k++) {
				if ($scope.lifts[k].currentFloor < floorNumber && $scope.lifts[k].isIdle) {
					goingUpLifts.push($scope.lifts[k]);
				}
			}
			if (goingUpLifts.length > 0) {
				goingUpLifts = $filter("orderBy")(goingUpLifts, "currentFloor", true);
			}

			if (direction === "up") {
				if (goingUpLifts.length > 0) {
					return goingUpLifts[0];
				} else {
					return goingDownLifts[0];
				}
			}
			if (direction === "down") {
				if (goingDownLifts.length > 0) {
					return goingDownLifts[0];
				} else {
					return goingUpLifts[0];
				}
			}
			return {};
		}

		$scope.callButtonPressed = function(direction, floorNumber) {
			var liftObj = pickALift(direction, floorNumber);

			if (liftObj === undefined) {
				$scope.queue.push({ "direction": direction, "floorNumber": floorNumber });
				return;
			};

			liftObj.isIdle = false;
			openElevatorDoors(liftObj);
			
			$scope.move(liftObj, floorNumber, direction, floorNumber);
		}

		$scope.processQueue = function () {
			if ($scope.queue.length === 0) return;

			for (var k = 0; k < $scope.lifts.length; k++) {
				if ($scope.lifts[k].isIdle) {
					var queue = $scope.queue[0];
					$scope.callButtonPressed(queue.direction, queue.floorNumber);
					$scope.queue.shift();
					return;
				}
			}
		}

		$interval(function () { $scope.processQueue(); }, 2000, false);
		
	});
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ElevatorSimulationRepository.DataModel
{
	public class Building
	{
		public int BuildingId { get; set; }
		public string BuildingName { get; set; }
		public int NumberOfFloors { get; set; }
		public int NumberOfElevators { get; set; }
	}
}
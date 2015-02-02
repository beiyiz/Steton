using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ElevatorSimulationRepository.DataModel
{
	public class ActivityLog
	{
		public string ActivityDescription { get; set; }
		public int LiftNumber { get; set; }
		public string CallButtonActivity { get; set; }
		public DateTime ActivityDate { get; set; }
		public Building Building { get; set; }
	
	}
}

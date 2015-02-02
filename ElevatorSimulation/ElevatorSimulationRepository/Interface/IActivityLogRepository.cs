using ElevatorSimulationRepository.DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ElevatorSimulationRepository.Interface
{
	public interface IActivityLogRepository
	{
		bool AddActivityLog(ActivityLog activityLog);
		IEnumerable<ActivityLog> GetActivityLogs();
	}
}

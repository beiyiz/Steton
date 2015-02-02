using ElevatorSimulationRepository.DataModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ElevatorSimulationRepository.Interface;

namespace ElevatorSimulationRepository.Repository
{
	public class ActivityRepository : IActivityLogRepository
	{
		public bool AddActivityLog(ActivityLog activityLog)
		{
			try
			{
				using (SqlConnection conn = new SqlConnection(Properties.Settings.Default.DefaultDBConnection))
				{
					conn.Open();
					using (SqlCommand cmd = new SqlCommand("dbo.AddActivityLog", conn))
					{
						cmd.CommandType = CommandType.StoredProcedure;
						cmd.Parameters.Add("@BuildingId", SqlDbType.Int).Value = activityLog.Building.BuildingId;
						cmd.Parameters.Add("@ActivityDescription", SqlDbType.VarChar, 255).Value = activityLog.ActivityDescription;
						
						cmd.Parameters.Add("@LiftNumber", SqlDbType.Int).Value = activityLog.LiftNumber;
						cmd.Parameters.Add("@CallButtonActivity", SqlDbType.VarChar, 255).Value =  activityLog.CallButtonActivity;

						cmd.ExecuteNonQuery();
						return true;
					}
				}
			}
			catch (Exception ex)
			{
				throw;
			}
			
		}
		public IEnumerable<ActivityLog> GetActivityLogs()
		{
			List<ActivityLog> activityLogs = new List<ActivityLog>();
			try
			{
				using (SqlConnection conn = new SqlConnection(Properties.Settings.Default.DefaultDBConnection))
				{
					conn.Open();
					using (SqlCommand cmd = new SqlCommand("dbo.GetActivityLogs", conn))
					{
						cmd.CommandType = CommandType.StoredProcedure;

						SqlDataReader rdr = cmd.ExecuteReader();

						if (rdr.HasRows)
						{
							while (rdr.Read())
							{
								ActivityLog activityLog = new ActivityLog()
								{
									Building =  new Building()
									{
										BuildingId = int.Parse(rdr["BuildingId"].ToString()),
										BuildingName = rdr["BuildingName"].ToString(),
										NumberOfFloors = int.Parse(rdr["NumberOfFloors"].ToString()),
										NumberOfElevators = int.Parse(rdr["NumberOfElevators"].ToString()),
									},
									ActivityDate = DateTime.Parse(rdr["ActivityDate"].ToString()),
									ActivityDescription = rdr["ActivityDescription"].ToString(),
									CallButtonActivity = rdr["CallButtonActivity"].ToString(),
									LiftNumber = int.Parse(rdr["LiftNumber"].ToString()),
								};
								activityLogs.Add(activityLog);
							}
						}
						return activityLogs;
						
					}
				}
			}
			catch (Exception ex)
			{
				throw;
			}

		}
	}
}

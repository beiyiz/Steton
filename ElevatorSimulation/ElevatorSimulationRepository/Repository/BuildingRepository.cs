using ElevatorSimulationRepository.DataModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ElevatorSimulationRepository.Interface;

namespace ElevatorSimulationRepository.Repository
{
    public class BuildingRepository : IBuildingRepository
    {
	    public IEnumerable<Building> GetBuildings()
	    {
			List<Building> buildings = new List<Building>();

		    try
		    {
			    using (SqlConnection conn = new SqlConnection(Properties.Settings.Default.DefaultDBConnection))
			    {
				    conn.Open();
				    using (SqlCommand cmd = new SqlCommand("dbo.GetBuildings", conn))
				    {

					    cmd.CommandType = CommandType.StoredProcedure;

					    SqlDataReader rdr = cmd.ExecuteReader();

					    if (rdr.HasRows)
					    {
						    while (rdr.Read())
						    {
							    Building building = new Building()
							    {
								    BuildingId = int.Parse(rdr["BuildingId"].ToString()),
								    BuildingName = rdr["BuildingName"].ToString(),
								    NumberOfFloors = int.Parse(rdr["NumberOfFloors"].ToString()),
								    NumberOfElevators = int.Parse(rdr["NumberOfElevators"].ToString()),
							    };
							    buildings.Add(building);
						    }
					    }

				    }
			    }

			    return buildings;
		    }
		    catch (Exception ex)
		    {
			    throw;
		    }
			
	    }
    }
}

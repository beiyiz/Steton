using ElevatorSimulationRepository;
using ElevatorSimulationRepository.DataModel;
using ElevatorSimulationRepository.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using ElevatorSimulationRepository.Interface;

namespace ElevatorSimulation.Controllers
{
	[EnableCors(origins: "*", headers: "*", methods: "*")]
    public class BuildingController : ApiController
    {
		readonly IBuildingRepository _repo;

		public BuildingController()
		{
			_repo = new BuildingRepository();
		}

		public BuildingController(IBuildingRepository repository)
		{
			_repo = repository;
		}

		[Route("api/buildings")]
		public HttpResponseMessage GetBuildings()
		{
			try
			{
				var buildings = _repo.GetBuildings();
				if (buildings == null) throw new HttpResponseException(HttpStatusCode.NotFound);

				HttpResponseMessage response = Request.CreateResponse<IEnumerable<Building>>(HttpStatusCode.OK, buildings);

				return response;
			}
			catch (Exception ex)
			{
				string msg = ex.Message;
				HttpResponseMessage response = Request.CreateResponse<string>(HttpStatusCode.InternalServerError, msg);
				return response;
			}

		}
    }
}

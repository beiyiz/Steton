using ElevatorSimulationRepository.DataModel;
using ElevatorSimulationRepository.Interface;
using ElevatorSimulationRepository.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace ElevatorSimulation.Controllers
{
	[EnableCors(origins: "*", headers: "*", methods: "*")]
	public class ActivityLogController : ApiController
	{
		readonly IActivityLogRepository _repo;

		public ActivityLogController()
		{
			_repo = new ActivityRepository();
		}

		public ActivityLogController(IActivityLogRepository repository)
		{
			_repo = repository;
		}

		[Route("api/SaveActivityLog")]
		public HttpResponseMessage SaveActivityLog(ActivityLog activityLog)
		{
			try
			{
				var addLog = _repo.AddActivityLog(activityLog);
				HttpResponseMessage response = Request.CreateResponse<bool>(HttpStatusCode.OK, true);
				return response;
			}
			catch (Exception ex)
			{
				string msg = ex.Message;
				HttpResponseMessage response = Request.CreateResponse<string>(HttpStatusCode.InternalServerError, msg);
				return response;
			}
		}
		[Route("api/activityLogs")]
		public HttpResponseMessage GetActivityLogs()
		{
			try
			{
				var activityLogs = _repo.GetActivityLogs();
				if (activityLogs == null) throw new HttpResponseException(HttpStatusCode.NotFound);

				HttpResponseMessage response = Request.CreateResponse<IEnumerable<ActivityLog>>(HttpStatusCode.OK, activityLogs);

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

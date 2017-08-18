using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.Service.Comm.Interface;

namespace TestingCenterSystem.Service.Comm
{
    public class ErrorLogService : BaseService<PDP_ERROR_LOG>, IErrorLogService
    {
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.Service.Comm.Interface;

namespace TestingCenterSystem.Service.Comm
{
    public class ProcLogService : BaseService<PDP_PROC_LOG>, IProcLogService
    {
        public string DataItemCatCode()
        {
            return "2";
        }

        public string InGroupCatCode()
        {
            return "1";
        }

        public string KPICatCode()
        {
            return "3";
        }
    }
}

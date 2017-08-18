using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestingCenterSystem.Models.PDP;

namespace TestingCenterSystem.Service.Comm.Interface
{
    public interface IProcLogService : IBaseService<PDP_PROC_LOG>
    {
        string InGroupCatCode();
        string DataItemCatCode();
        string KPICatCode();
    }
}

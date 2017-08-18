using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestingCenterSystem.Models;
using TestingCenterSystem.Models.PDP;

namespace TestingCenterSystem.Service.comm.Interface
{
    public interface IProcStateService : IBaseService<PDP_PROC_STAT>
    {
        string InGroupProcCatCode();
        string DataItemProcCatCode();
        string KPIProcCatCode();
        string LockProcStatCode();
        string HasNotExeProcStatCode();
        string HadExedProcStatCode();
        string ClearDBProcStatCode();

        void InGroupDoExecute(int sdId,string contentId);
        void DataItemDoExecute(int sdId, string contentId);
        void KPIDoExecute(int sdId, string contentId);
       
        void InGroupDoClear(int sdId, string contentId);
        void DataItemDoClear(int sdId, string contentId);
        void KPIDoClear(int sdId, string contentId);
        void InGroupLockExecute(int sdId, string contentId);
        void DataItemLockExecute(int sdId, string contentId);
        void KPILockExecute(int sdId, string contentId);
    }
}

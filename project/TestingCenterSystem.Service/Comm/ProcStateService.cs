using System;
using TestingCenterSystem.Models;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.Service.comm.Interface;

namespace TestingCenterSystem.Service.InGroup
{
    public class ProcStateService : BaseService<PDP_PROC_STAT>, IProcStateService
    {
       
        
        public string KPIProcCatCode()
        {
            return "3";
        }

        public string DataItemProcCatCode()
        {
            return "2";
        }
        public string ClearDBProcStatCode()
        {
            return "3";

        }

        public string HadExedProcStatCode()
        {
            return "2";
        }

        public string HasNotExeProcStatCode()
        {
            return "1";
        }

        public string InGroupProcCatCode()
        {
            return "1";
        }

        public void InGroupDoExecute(int sdId, string contentId)
        {
            var status = Get(r=>r.SD_ID==sdId&&r.PROC_CONTENT_ID==contentId);
            if (status==null)
            {
                Insert(new PDP_PROC_STAT() {SD_ID=sdId,PROC_CAT_CODE=InGroupProcCatCode(),PROC_CONTENT_ID=contentId,PROC_STAT_CODE=HadExedProcStatCode() });
            }
            else
            {
                status.PROC_STAT_CODE = HadExedProcStatCode();
                Update(status);
            }
        }

        public void DataItemDoExecute(int sdId, string contentId)
        {
            var status = Get(r => r.SD_ID == sdId && r.PROC_CONTENT_ID == contentId);
            if (status == null)
            {
                Insert(new PDP_PROC_STAT() { SD_ID = sdId, PROC_CAT_CODE = DataItemProcCatCode(), PROC_CONTENT_ID = contentId, PROC_STAT_CODE = HadExedProcStatCode() });
            }
            else
            {
                status.PROC_STAT_CODE = HadExedProcStatCode();
                Update(status);
            }
        }

        public void KPIDoExecute(int sdId, string contentId)
        {
            var status = Get(r => r.SD_ID == sdId && r.PROC_CONTENT_ID == contentId);
            if (status == null)
            {
                Insert(new PDP_PROC_STAT() { SD_ID = sdId, PROC_CAT_CODE = KPIProcCatCode(), PROC_CONTENT_ID = contentId, PROC_STAT_CODE = HadExedProcStatCode() });
            }
            else
            {
                status.PROC_STAT_CODE = HadExedProcStatCode();
                Update(status);
            }
        }

        public void InGroupDoClear(int sdId, string contentId)
        {
            var status = Get(r => r.SD_ID == sdId && r.PROC_CONTENT_ID == contentId);
            if (status == null)
            {
                Insert(new PDP_PROC_STAT() { SD_ID = sdId, PROC_CAT_CODE = InGroupProcCatCode(), PROC_CONTENT_ID = contentId, PROC_STAT_CODE = ClearDBProcStatCode() });
            }
            else
            {
                status.PROC_STAT_CODE = ClearDBProcStatCode();
                Update(status);
            }
        }

        public void DataItemDoClear(int sdId, string contentId)
        {
            var status = Get(r => r.SD_ID == sdId && r.PROC_CONTENT_ID == contentId);
            if (status == null)
            {
                Insert(new PDP_PROC_STAT() { SD_ID = sdId, PROC_CAT_CODE = DataItemProcCatCode(), PROC_CONTENT_ID = contentId, PROC_STAT_CODE = ClearDBProcStatCode() });
            }
            else
            {
                status.PROC_STAT_CODE = ClearDBProcStatCode();
                Update(status);
            }
        }

        public void KPIDoClear(int sdId, string contentId)
        {
            var status = Get(r => r.SD_ID == sdId && r.PROC_CONTENT_ID == contentId);
            if (status == null)
            {
                Insert(new PDP_PROC_STAT() { SD_ID = sdId, PROC_CAT_CODE = KPIProcCatCode(), PROC_CONTENT_ID = contentId, PROC_STAT_CODE = ClearDBProcStatCode() });
            }
            else
            {
                status.PROC_STAT_CODE = ClearDBProcStatCode();
                Update(status);
            }
        }

        public string LockProcStatCode()
        {
            return "4";
        }

        public void InGroupLockExecute(int sdId, string contentId)
        {
            var status = Get(r => r.SD_ID == sdId && r.PROC_CONTENT_ID == contentId);
            if (status == null)
            {
                Insert(new PDP_PROC_STAT() { SD_ID = sdId, PROC_CAT_CODE = InGroupProcCatCode(), PROC_CONTENT_ID = contentId, PROC_STAT_CODE = LockProcStatCode() });
            }
            else
            {
                status.PROC_STAT_CODE = LockProcStatCode();
                Update(status);
            }
        }

        public void DataItemLockExecute(int sdId, string contentId)
        {
            var status = Get(r => r.SD_ID == sdId && r.PROC_CONTENT_ID == contentId);
            if (status == null)
            {
                Insert(new PDP_PROC_STAT() { SD_ID = sdId, PROC_CAT_CODE = DataItemProcCatCode(), PROC_CONTENT_ID = contentId, PROC_STAT_CODE = LockProcStatCode() });
            }
            else
            {
                status.PROC_STAT_CODE = LockProcStatCode();
                Update(status);
            }
        }

        public void KPILockExecute(int sdId, string contentId)
        {
            var status = Get(r => r.SD_ID == sdId && r.PROC_CONTENT_ID == contentId);
            if (status == null)
            {
                Insert(new PDP_PROC_STAT() { SD_ID = sdId, PROC_CAT_CODE = KPIProcCatCode(), PROC_CONTENT_ID = contentId, PROC_STAT_CODE = LockProcStatCode() });
            }
            else
            {
                status.PROC_STAT_CODE = LockProcStatCode();
                Update(status);
            }
        }
    }
}

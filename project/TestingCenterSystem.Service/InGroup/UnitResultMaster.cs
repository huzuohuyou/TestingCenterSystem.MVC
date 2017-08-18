using TestingCenterSystem.Models.Unit;

namespace TestingCenterSystem.Service.InGroup
{
    class UnitResultMaster: UnitBaseService<UN_SD_CPATS>
    {
        public bool isExist(int sd_id,string cpat_no)
        {
            return base.Exists(r => r.SD_ID == sd_id&&r.SD_CPAT_NO== cpat_no);
        }
    }
}

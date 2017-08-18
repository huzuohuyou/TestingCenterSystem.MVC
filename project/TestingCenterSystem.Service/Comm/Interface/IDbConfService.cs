using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestingCenterSystem.Models.PDP;

namespace TestingCenterSystem.Service.comm.Interface
{
    public interface IDbConfService : IBaseService<PDP_DB_CONF>
    {
        List<string> TestConnect(PDP_DB_CONF model);
        int CDR_CONF_FLAG();
        int UNIT_CONF_FLAG();
        int CI_CONF_FLAG();
    }
}

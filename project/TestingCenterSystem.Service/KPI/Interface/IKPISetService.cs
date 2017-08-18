using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestingCenterSystem.Models;
using TestingCenterSystem.Models.PDP;

namespace TestingCenterSystem.Service.KPI.Interface
{
    public interface IKPISetService : IBaseService<SD_EKPI_FORMULA>
    {
        Tuple<string, bool> ValidateFormula(SD_EKPI_FORMULA body, List<SD_EKPI_PARAM> pList);
    }
}

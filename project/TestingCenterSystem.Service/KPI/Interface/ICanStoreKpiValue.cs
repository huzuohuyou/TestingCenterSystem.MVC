using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestingCenterSystem.Models;
using TestingCenterSystem.ViewModels.KPI;

namespace TestingCenterSystem.Service.KPI.Interface
{
    public interface ICanStoreKpiValue
    {
        void StoreKPIValue();
    }
}

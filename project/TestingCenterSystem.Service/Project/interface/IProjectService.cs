using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestingCenter.Models;
using TestingCenter.Models.UN;
using TestingCenterSystem.Models;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.ViewModels;

namespace TestingCenterSystem.Service.Project.Interface
{
    public interface IProjectService : IBaseService<PDP_PROJECT>
    {
        ProjectViewModel GetCurrentSD();
        UNContext GetCurrentUnitDbContext();
        CDRContext GetCurrentCDRDbContext();
    }
}

using System;
using System.Collections.Generic;
using TestingCenterSystem.Models.Unit;
using TestingCenterSystem.ViewModels.InGroup;

namespace TestingCenterSystem.Service.InGroup.Interface
{
    public interface IPatientInfoService //: IBaseService<PatientInfoViewModel>
    {
        Tuple<bool, string> Insert(List<PatientInfoViewModel> patientinfos,List<UN_SD_CPATS> cpats, List<UN_SD_CPAT_DETAIL> details, int primaryKey);
    }
}

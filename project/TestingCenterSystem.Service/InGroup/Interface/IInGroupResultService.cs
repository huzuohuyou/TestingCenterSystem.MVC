using System;
using System.Collections.Generic;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.Models.Unit;
using TestingCenterSystem.ViewModels;
using TestingCenterSystem.ViewModels.InGroup;

namespace TestingCenterSystem.Service.InGroup.Interface
{
    public interface IInGroupResultService
    {
        Page<InGroupResultViewModel> GetList(int pageIndex, int pageSize, List<InGroupResultViewModel> data);//,List<InGroupResultViewModel> data
        List<InGroupResultViewModel> GetList(List<UN_SD_CPAT_DETAIL> details, string primaryKey);
        List<InGroupResultViewModel> GetResultList(string fiterId);//string patientId, DateTime startTime, DateTime endTime, 
        Tuple<bool, string> Locking(int filterId);
        Tuple<bool, string> ClearUniteData(int filterId);
        PDP_PROC_STAT getStat(string filterId);
    }
}

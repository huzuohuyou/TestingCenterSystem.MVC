using Elight.Infrastructure;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using TestingCenter.Models;
using TestingCenterSystem.Models.Unit;
using TestingCenterSystem.Service.InGroup.Interface;
using TestingCenterSystem.Service.Project;
using TestingCenterSystem.Service.Project.Interface;
using TestingCenterSystem.ViewModels.InGroup;
using TestingCenterSystem.ViewModels.Project;

namespace TestingCenterSystem.Service.InGroup
{
    public class PatientInfoService : BaseService<PatientInfoViewModel>, IPatientInfoService// BaseService<PatientInfoViewModel>,
    {
        public readonly IProjectService _projectService = new ProjectService();
        public int sd_id = ProjectProvider.Instance.Current.SD_ID;
        public string sd_code = ProjectProvider.Instance.Current.SD_CODE;

        //private List<PatientInfoViewModel> GetPatientInfo(List<UN_SD_CPAT_DETAIL> detaillist)
        //{
        //    using (CDRContext cdrContext = _projectService.GetCurrentCDRDbContext())
        //    {
        //        List<PatientInfoViewModel> patientinfolist = new List<PatientInfoViewModel>();
        //        detaillist.ForEach(r => patientinfolist.Add(new PatientInfoViewModel()
        //        {
        //            CHECK_RECORD = cdrContext.DP_CHECK_RECORD.Where(e => e.PATIENT_NO == r.PATIENT_NO).ToList(),
        //            EMR_RECORD = cdrContext.DP_EMR_RECORD.Where(e => e.PATIENT_NO == r.PATIENT_NO).ToList(),
        //            IN_ORDERS = cdrContext.DP_IN_ORDERS.Where(e => e.PATIENT_NO == r.PATIENT_NO).ToList(),
        //            IN_PATIENT = cdrContext.DP_IN_PATIENT.Where(e => e.PATIENT_NO == r.PATIENT_NO).FirstOrDefault(),
        //            OUT_EMR = cdrContext.DP_OUT_EMR.Where(e => e.PATIENT_NO == r.PATIENT_NO).ToList(),
        //            OUT_PATIENT = cdrContext.DP_OUT_PATIENT.Where(e => e.PATIENT_NO == r.PATIENT_NO).ToList(),
        //            OUT_RECIPE = cdrContext.DP_OUT_RECIPE.Where(e => e.PATIENT_NO == r.PATIENT_NO).ToList(),
        //            PATHOLOGY_RECORD = cdrContext.DP_PATHOLOGY_RECORD.Where(e => e.PATIENT_NO == r.PATIENT_NO).ToList(),
        //            PATIENT_NO = r.PATIENT_NO,
        //            TEST_RECORD = cdrContext.DP_TEST_RECORD.Where(e => e.PATIENT_NO == r.PATIENT_NO).ToList(),
        //            TEST_RESULT = cdrContext.DP_TEST_RESULT.Where(e => e.PATIENT_NO == r.PATIENT_NO).ToList(),
        //            TEST_RESULT_GERM = cdrContext.DP_TEST_RESULT_GERM.Where(e => e.PATIENT_NO == r.PATIENT_NO).ToList(),
        //        }));
        //        return patientinfolist;
        //    }
        //}

        public Tuple<bool,string> Insert(List<PatientInfoViewModel> patientinfos, List<UN_SD_CPATS> cpats, List<UN_SD_CPAT_DETAIL> details, int primaryKey)//List<PatientInf> patientList, 
        {
            try
            {
                if (cpats.Select(r => r.SD_CODE).FirstOrDefault() == sd_code)
                {
                    var _unitPatientInfo = new UnitPatientInfo();
                    _unitPatientInfo.BatchInsert(patientinfos, cpats, details, primaryKey);
                    return new Tuple<bool, string>(true, "执行入库成功");
                    //var patientListString = patientList.ToJson();
                    //List<PatientInf> resultlist = JsonConvert.DeserializeObject<List<PatientInf>>(patientListString);//.DeserializeObject<List<PatientInf>>(patientListString);
                }
                else
                {
                    return new Tuple<bool, string>(false, "调用的webapi与病种不匹配");
                }
            }
            catch (Exception ex)
            {
                return new Tuple<bool, string>(false, ex.Message);
            }
        }
    }

}

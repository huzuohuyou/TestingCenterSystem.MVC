using Elight.Infrastructure;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using TestingCenter.Models.UN;
using TestingCenterSystem.Models.Unit;
using TestingCenterSystem.Service.Project;
using TestingCenterSystem.Service.Project.Interface;
using TestingCenterSystem.ViewModels.InGroup;
using TestingCenterSystem.ViewModels.Project;

namespace TestingCenterSystem.Service.InGroup
{
    class UnitPatientInfo : UnitBaseService<PatientInfoViewModel>
    {
        public readonly IProjectService _projectService = new ProjectService();
        UnitResultDetail _unitResultDetail = new UnitResultDetail();
        UnitResultMaster _unitResultMaster = new UnitResultMaster();

        public int sd_id = ProjectProvider.Instance.Current.SD_ID;
        public string sd_code = ProjectProvider.Instance.Current.SD_CODE;
        public string user_name = OperatorProvider.Instance.Current.RealName;
        /// <summary>
        /// 实现批量插入
        /// </summary>
        /// <param name="patientList"></param>
        /// <returns></returns>
        public void BatchInsert(List<PatientInfoViewModel> patientList, List<UN_SD_CPATS> cpats, List<UN_SD_CPAT_DETAIL> details, int primaryKey)//IEnumerable<PatientInf> patientList
        {
            try
            {
                using (UNContext unContext = _projectService.GetCurrentUnitDbContext())
                {
                    using (var trans = unContext.Database.BeginTransaction(IsolationLevel.ReadCommitted))
                    {
                        foreach (var patient in patientList)
                        {
                            if (isExistPNO(patient.PATIENT_NO))
                            {
                                continue;
                            }
                            unContext.BulkInsert(patient.IN_PATIENT??new List<UN_CPAT_IN_PATIENT>());
                            //unContext.CPAT_IN_PATIENT.Add(patient.IN_PATIENT);
                            unContext.BulkInsert(patient.CHECK_RECORD??new List<UN_CPAT_CHECK_RECORD>());
                            unContext.BulkInsert(patient.EMR_RECORD??new List<UN_CPAT_EMR_RECORD>());
                            unContext.BulkInsert(patient.IN_ORDERS??new List<UN_CPAT_IN_ORDERS>());
                            unContext.BulkInsert(patient.OUT_EMR??new List<UN_CPAT_OUT_EMR>());
                            unContext.BulkInsert(patient.OUT_PATIENT??new List<UN_CPAT_OUT_PATIENT>());
                            unContext.BulkInsert(patient.OUT_RECIPE??new List<UN_CPAT_OUT_RECIPE>());
                            unContext.BulkInsert(patient.PATHOLOGY_RECORD??new List<UN_CPAT_PATHOLOGY_RECORD>());
                            unContext.BulkInsert(patient.TEST_RECORD??new List<UN_CPAT_TEST_RECORD>());
                            unContext.BulkInsert(patient.TEST_RESULT??new List<UN_CPAT_TEST_RESULT>());
                            unContext.BulkInsert(patient.TEST_RESULT_GERM??new List<UN_CPAT_TEST_RESULT_GERM>());
                            unContext.BulkInsert(patient.ANESTHESIA_RECORD??new List<UN_CPAT_ANESTHESIA_RECORD>());
                            unContext.BulkInsert(patient.ASSESSMENT_RECORD??new List<UN_CPAT_ASSESSMENT_RECORD>());
                            unContext.BulkInsert(patient.CONSULT_RECORD??new List<UN_CPAT_CONSULT_RECORD>());
                            unContext.BulkInsert(patient.DIAGNOSIS??new List<UN_CPAT_DIAGNOSIS>());
                            unContext.BulkInsert(patient.INFECTION_RECORD??new List<UN_CPAT_INFECTION_RECORD>());
                            unContext.BulkInsert(patient.MEDICAL_RECORD??new List<UN_CPAT_MEDICAL_RECORD>());
                            unContext.BulkInsert(patient.NURSE_RECORD??new List<UN_CPAT_NURSE_RECORD>());
                            unContext.BulkInsert(patient.OPERATION_RECORD??new List<UN_CPAT_OPERATION_RECORD>());
                            unContext.BulkInsert(patient.TRANS_RECORD??new List<UN_CPAT_TRANS_RECORD>());

                            //unContext.CPAT_IN_PATIENT.Add(patient.IN_PATIENT);
                            //unContext.CPAT_CHECK_RECORD.AddRange(patient.CHECK_RECORD);
                            ////unContext.CPAT_DIAGNOSIS.AddRange(patient.DIAGNOSIS);
                            //unContext.CPAT_EMR_RECORD.AddRange(patient.EMR_RECORD);
                            //unContext.CPAT_IN_ORDERS.AddRange(patient.IN_ORDERS);
                            //unContext.CPAT_OUT_EMR.AddRange(patient.OUT_EMR);
                            //unContext.CPAT_OUT_PATIENT.AddRange(patient.OUT_PATIENT);
                            //unContext.CPAT_OUT_RECIPE.AddRange(patient.OUT_RECIPE);
                            //unContext.CPAT_PATHOLOGY_RECORD.AddRange(patient.PATHOLOGY_RECORD);
                            //unContext.CPAT_TEST_RECORD.AddRange(patient.TEST_RECORD);
                            //unContext.CPAT_TEST_RESULT.AddRange(patient.TEST_RESULT);
                            //unContext.CPAT_TEST_RESULT_GERM.AddRange(patient.TEST_RESULT_GERM);
                        }
                        var _unitResultMaster = new UnitResultMaster();
                        var _unitResultDetail = new UnitResultDetail();
                        cpats.ForEach(r=> {
                            r.SD_FILTER_ID = primaryKey;
                            r.SD_ID = sd_id;
                            r.UPD_USER_ID = user_name;
                            if (_unitResultMaster.isExist(r.SD_ID, r.SD_CPAT_NO))
                            {
                                _unitResultDetail.Delete(x => x.SD_ID == r.SD_ID && x.SD_CPAT_NO == r.SD_CPAT_NO);
                                _unitResultMaster.Delete(x => x.SD_ID == r.SD_ID && x.SD_CPAT_NO == r.SD_CPAT_NO);
                            }
                            _unitResultMaster.Insert(r);
                        });
                        details.ForEach(r=> {
                            r.SD_ID = sd_id;
                            r.UPD_USER_ID = user_name;
                            _unitResultDetail.Insert(r);
                        });

                        unContext.BulkSaveChanges();
                        //提交事务
                        trans.Commit();
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        /// <summary>
        /// 判断是否存在patientNo
        /// </summary>
        /// <param name="pno"></param>
        /// <returns></returns>
        private bool isExistPNO(string pno)
        {
            using (UNContext unContext = _projectService.GetCurrentUnitDbContext())
            {
                var count = unContext.CPAT_IN_PATIENT.Where(r => r.PATIENT_NO == pno).Count();
                return count > 0 ? true : false;
            }
        }

        /// <summary>
        /// 根据pnolist清空CPAT有关的表数据
        /// </summary>
        /// <returns></returns>
        public int clear(List<string> pnolist, int filterId)
        {
            try
            {
                using (UNContext unContext = _projectService.GetCurrentUnitDbContext())
                {
                    using (var trans = unContext.Database.BeginTransaction(IsolationLevel.ReadCommitted))
                    {
                        foreach (var pno in pnolist)
                        {
                            unContext.CPAT_IN_PATIENT.Where(ex => ex.PATIENT_NO == pno).DeleteFromQuery();
                            unContext.CPAT_CHECK_RECORD.Where(ex => ex.PATIENT_NO == pno).DeleteFromQuery();
                            unContext.CPAT_EMR_RECORD.Where(ex => ex.PATIENT_NO == pno).DeleteFromQuery();
                            unContext.CPAT_IN_ORDERS.Where(ex => ex.PATIENT_NO == pno).DeleteFromQuery();
                            unContext.CPAT_OUT_EMR.Where(ex => ex.PATIENT_NO == pno).DeleteFromQuery();
                            unContext.CPAT_OUT_PATIENT.Where(ex => ex.PATIENT_NO == pno).DeleteFromQuery();
                            unContext.CPAT_OUT_RECIPE.Where(ex => ex.PATIENT_NO == pno).DeleteFromQuery();
                            unContext.CPAT_PATHOLOGY_RECORD.Where(ex => ex.PATIENT_NO == pno).DeleteFromQuery();
                            unContext.CPAT_TEST_RECORD.Where(ex => ex.PATIENT_NO == pno).DeleteFromQuery();
                            unContext.CPAT_TEST_RESULT.Where(ex => ex.PATIENT_NO == pno).DeleteFromQuery();
                            unContext.CPAT_TEST_RESULT_GERM.Where(ex => ex.PATIENT_NO == pno).DeleteFromQuery();
                            unContext.CPAT_ANESTHESIA_RECORD.Where(ex => ex.PATIENT_NO == pno).DeleteFromQuery();
                            unContext.CPAT_ASSESSMENT_RECORD.Where(ex => ex.PATIENT_NO == pno).DeleteFromQuery();
                            unContext.CPAT_CONSULT_RECORD.Where(ex => ex.PATIENT_NO == pno).DeleteFromQuery();
                            unContext.CPAT_DIAGNOSIS.Where(ex => ex.PATIENT_NO == pno).DeleteFromQuery();
                            unContext.CPAT_INFECTION_RECORD.Where(ex => ex.PATIENT_NO == pno).DeleteFromQuery();
                            unContext.CPAT_MEDICAL_RECORD.Where(ex => ex.PATIENT_NO == pno).DeleteFromQuery();
                            unContext.CPAT_NURSE_RECORD.Where(ex => ex.PATIENT_NO == pno).DeleteFromQuery();
                            unContext.CPAT_OPERATION_RECORD.Where(ex => ex.PATIENT_NO == pno).DeleteFromQuery();
                            unContext.CPAT_TRANS_RECORD.Where(ex => ex.PATIENT_NO == pno).DeleteFromQuery();

                            //删除样本结果主表和明细表
                            unContext.SD_CPATS.Where(e => e.SD_FILTER_ID == filterId && e.SD_ID == sd_id).ToList().ForEach(r => unContext.SD_CPAT_DETAIL.Where(e => e.SD_ID == r.SD_ID && e.SD_CPAT_NO == r.SD_CPAT_NO).DeleteFromQuery());
                            unContext.SD_CPATS.Where(e => e.SD_FILTER_ID == filterId && e.SD_ID == sd_id).DeleteFromQuery();

                            //var _CPAT_IN_PATIENT = unContext.CPAT_IN_PATIENT.Where(ex => ex.PATIENT_NO == pno).ToList();
                            ////unContext.CPAT_IN_PATIENT.RemoveRange(_CPAT_IN_PATIENT);
                            //unContext.BulkDelete(_CPAT_IN_PATIENT);

                            //var _CPAT_CHECK_RECORD = unContext.CPAT_CHECK_RECORD.Where(ex => ex.PATIENT_NO == pno).ToList();
                            ////unContext.CPAT_CHECK_RECORD.RemoveRange(_CPAT_CHECK_RECORD);
                            //unContext.BulkDelete(_CPAT_CHECK_RECORD);

                            //var _CPAT_EMR_RECORD = unContext.CPAT_EMR_RECORD.Where(ex => ex.PATIENT_NO == pno).ToList();
                            ////unContext.CPAT_EMR_RECORD.RemoveRange(_CPAT_EMR_RECORD);
                            //unContext.BulkDelete(_CPAT_EMR_RECORD);

                            //var _CPAT_IN_ORDERS = unContext.CPAT_IN_ORDERS.Where(ex => ex.PATIENT_NO == pno).ToList();
                            ////unContext.CPAT_IN_ORDERS.RemoveRange(_CPAT_IN_ORDERS);
                            //unContext.BulkDelete(_CPAT_IN_ORDERS);

                            //var _CPAT_OUT_EMR = unContext.CPAT_OUT_EMR.Where(ex => ex.PATIENT_NO == pno).ToList();
                            ////unContext.CPAT_OUT_EMR.RemoveRange(_CPAT_OUT_EMR);
                            //unContext.BulkDelete(_CPAT_OUT_EMR);

                            //var _CPAT_OUT_PATIENT = unContext.CPAT_OUT_PATIENT.Where(ex => ex.PATIENT_NO == pno).ToList();
                            ////unContext.CPAT_OUT_PATIENT.RemoveRange(_CPAT_OUT_PATIENT);
                            //unContext.BulkDelete(_CPAT_OUT_PATIENT);

                            //var _CPAT_OUT_RECIPE = unContext.CPAT_OUT_RECIPE.Where(ex => ex.PATIENT_NO == pno).ToList();
                            ////unContext.CPAT_OUT_RECIPE.RemoveRange(_CPAT_OUT_RECIPE);
                            //unContext.BulkDelete(_CPAT_OUT_RECIPE);

                            //var _CPAT_PATHOLOGY_RECORD = unContext.CPAT_PATHOLOGY_RECORD.Where(ex => ex.PATIENT_NO == pno).ToList();
                            ////unContext.CPAT_PATHOLOGY_RECORD.RemoveRange(_CPAT_PATHOLOGY_RECORD);
                            //unContext.BulkDelete(_CPAT_PATHOLOGY_RECORD);

                            //var _CPAT_TEST_RECORD = unContext.CPAT_TEST_RECORD.Where(ex => ex.PATIENT_NO == pno).ToList();
                            ////unContext.CPAT_TEST_RECORD.RemoveRange(_CPAT_TEST_RECORD);
                            //unContext.BulkDelete(_CPAT_TEST_RECORD);

                            //var _CPAT_TEST_RESULT = unContext.CPAT_TEST_RESULT.Where(ex => ex.PATIENT_NO == pno).ToList();
                            ////unContext.CPAT_TEST_RESULT.RemoveRange(_CPAT_TEST_RESULT);
                            //unContext.BulkDelete(_CPAT_TEST_RESULT);

                            //var _CPAT_TEST_RESULT_GERM = unContext.CPAT_TEST_RESULT_GERM.Where(ex => ex.PATIENT_NO == pno).ToList();
                            ////unContext.CPAT_TEST_RESULT_GERM.RemoveRange(_CPAT_TEST_RESULT_GERM);
                            //unContext.BulkDelete(_CPAT_TEST_RESULT_GERM);
                        }
                        unContext.BulkSaveChanges();
                        //提交事务
                        trans.Commit();
                        return 1;
                    }
                }
            }
            catch (Exception ex)
            {
                return -1;
            }
        }
    }
}

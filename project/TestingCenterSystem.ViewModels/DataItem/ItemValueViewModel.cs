using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestingCenterSystem.ViewModels.DataItem
{
    public class ItemValueViewModel
    {
        ///// <summary>
        ///// 数据项ID
        ///// </summary>
        //public string SD_ITEM_ID { get; set; }
        ///// <summary>
        ///// 数据项代码
        ///// </summary>
        //public string SD_ITEM_CODE { get; set; }
        ///// <summary>
        ///// 数据项名称
        ///// </summary>
        //public string SD_ITEM_NAME { get; set; }
        ///// <summary>
        ///// 病种ID
        ///// </summary>
        //public string SD_ID { get; set; }
        /// <summary>
        /// 病种代码
        /// </summary>
        public string SD_CODE { get; set; }
        /// <summary>
        /// 入组样本ID
        /// </summary>
        public string SD_CPAT_NO { get; set; }
        /// <summary>
        /// 入组样本时间
        /// </summary>
        public string SD_CPAT_DATE { get; set; }
        ///// <summary>
        ///// 入组规则ID
        ///// </summary>
        //public string SD_FILTER_ID { get; set; }
        /// <summary>
        /// 患者ID
        /// </summary>
        public string PATIENT_ID { get; set; }
        /// <summary>
        /// 数据项结果
        /// </summary>
        public string SD_ITEM_VALUE { get; set; }

    }
}

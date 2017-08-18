using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestingCenterSystem.ViewModels.DataItem
{
    public class DataItemViewModel
    {
        ///// <summary>
        ///// 项目ID
        ///// </summary>
        //public int TC_PROJ_ID { get; set; }
        /// <summary>
        /// 病种ID
        /// </summary>
        public int SD_ID { get; set; }
        /// <summary>
        /// 病种代码
        /// </summary>
        public string SD_CODE { get; set; }
        /// <summary>
        /// 数据项ID
        /// </summary>
        public int SD_ITEM_ID { get; set; }
        /// <summary>
        /// 数据项代码
        /// </summary>
        public string SD_ITEM_CODE { get; set; }
        /// <summary>
        /// 数据项名称
        /// </summary>
        public string SD_ITEM_NAME { get; set; }
        /// <summary>
        /// 数据项简称
        /// </summary>
        public string SD_ITEM_ALIAS { get; set; }
        /// <summary>
        /// 数据项类别ID
        /// </summary>
        public int SD_ITEM_CAT_ID { get; set; }
        /// <summary>
        /// 数据项类别名称
        /// </summary>
        public string SD_ITEM_CAT_NAME { get; set; }
        /// <summary>
        /// 数据类型
        /// </summary>
        public string SD_ITEM_DATA_TYPE { get; set; }
        /// <summary>
        /// 结果单位
        /// </summary>
        public string SD_ITEM_UNIT { get; set; }
        /// <summary>
        /// 小数位数
        /// </summary>
        public int NUM_PRECISION { get; set; }
        /// <summary>
        /// 来源
        /// </summary>
        public int SD_ITEM_SRC { get; set; }
        /// <summary>
        /// 顺序号
        /// </summary>
        public int ORDER_NO { get; set; }
        /// <summary>
        /// 是否结果值（1.是，0.不是）
        /// </summary>
        public int IS_RESULT { get; set; }
        /// <summary>
        /// 逻辑描述
        /// </summary>
        public string SD_ITEM_ALGO { get; set; }
        /// <summary>
        /// 有效标识（1.有效，0.失效）
        /// </summary>
        public int VALID_FLAG { get; set; }
        /// <summary>
        /// 依赖项ID
        /// </summary>
        public List<int> DEP_SD_ITEM_ID { get; set; }
        /// <summary>
        /// 依赖项名称
        /// </summary>
        public string DEP_SD_ITEM_NAME { get; set; }
        /// <summary>
        /// 执行状态代码（1 未执行；2 已执行；3 已清空）
        /// </summary>
        public string PROC_STAT_CODE { get; set; }
        /// <summary>
        /// 最后执行人
        /// </summary>
        public string UPD_USER_ID { get; set; }
        /// <summary>
        /// 最后执行时间
        /// </summary>
        public Nullable<System.DateTime> UPD_DATE { get; set; }
    }
}

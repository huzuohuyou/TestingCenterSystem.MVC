using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestingCenterSystem.ViewModels.ComDataItem
{
    public class AddCommonItemViewModel
    {
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
        /// 是否为结果值
        /// </summary>
        public string IS_RESULT { get; set; }

        /// <summary>
        /// 数据项数据类型
        /// </summary>
        public string SD_ITEM_DATA_TYPE { get; set; }

        /// <summary>
        /// 数据项类别
        /// </summary>
        public string SD_IETM_CAT_TYPE { get; set; }

        /// <summary>
        /// 数据项来源
        /// </summary>
        public int SD_ITEM_SRC { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestingCenterSystem.ViewModels.DataItem
{
    public class ItemColletionViewModel
    {
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
        /// 数据项类别ID
        /// </summary>
        public int SD_ITEM_CAT_ID { get; set; }
        /// <summary>
        /// 数据项类别名称
        /// </summary>
        public string SD_ITEM_CAT_NAME { get; set; }
        /// <summary>
        /// 来源
        /// </summary>
        public int SD_ITEM_SRC { get; set; }
    }
}

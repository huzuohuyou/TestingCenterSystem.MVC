using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestingCenterSystem.ViewModels.DataItem
{
    public class ItemDepViewModel
    {
        /// <summary>
        /// 数据项ID
        /// </summary>
        public int SD_ITEM_ID { get; set; }
        /// <summary>
        /// 依赖数据项ID
        /// </summary>
        public int DEP_SD_ITEM_ID { get; set; }
        /// <summary>
        /// 数据项代码
        /// </summary>
        public string DEP_SD_ITEM_CODE { get; set; }
        /// <summary>
        /// 数据项名称
        /// </summary>
        public string DEP_SD_ITEM_NAME { get; set; }
        /// <summary>
        /// 最后更新的用户
        /// </summary>
        public string UPD_USER_ID { get; set; }
        /// <summary>
        /// 最后更新的时间
        /// </summary>
        public Nullable<System.DateTime> UPD_DATE { get; set; }

    }
}

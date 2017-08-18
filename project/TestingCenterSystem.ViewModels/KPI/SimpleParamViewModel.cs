using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TestingCenter.ViewModels
{
    public class SimpleParamViewModel
    {
        /// <summary>
        /// 数据项编码
        /// </summary>
        public string Code { get; set; }
        /// <summary>
        /// 数据项数据类型
        /// </summary>
        public string DataType { get; set; }
        /// <summary>
        /// 数据项值
        /// </summary>
        public string Value { get; set; }
        public dynamic FixValue
        {
            get
            {
                if (DataType == "int")
                {
                    return Convert.ToInt32(Value);
                }
                else if (DataType == "double")
                {
                    return Convert.ToDouble(Value);
                }
                else if (DataType == "datetime")
                {
                    return Convert.ToDateTime(Value);
                }
                else if (DataType == "data")
                {
                    return Convert.ToDouble(Value);
                }
                else if (DataType == "date")
                {
                    return Convert.ToDateTime(Value);
                }
                else if (DataType == "enum")
                {
                    return Value;
                }
                else if (DataType == "bool")
                {
                    return Convert.ToBoolean(Value);
                }
                else
                {
                    return Value;
                }
            }
        }
    }
}
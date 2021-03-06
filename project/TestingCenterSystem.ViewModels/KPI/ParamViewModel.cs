﻿using System;

namespace TestingCenter.ViewModels
{
    public class Param
    {
        public int Id { get; set; }
        public int KPIId { get; set; }
        public int? DataItemId { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
        public string DataType { get; set; }
        public string Value { private get; set; }
        public string Note
        {
            get { return string.Format("字段：{0} 描述：{1} 数据类型：{2}", Code?.Trim(), Name?.Trim(),DataType?.ToString())?.Trim(); }
        }
        private dynamic _fixValue;
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
                else
                {
                    return Value;
                }
            }
        }

        public dynamic DebugValue
        {
            get
            {
                if (DataType == "int")
                {
                    return 1;
                }
                else if (DataType == "double")
                {
                    return 1.2;
                }
                else if (DataType == "datetime")
                {
                    return DateTime.Now;
                }
                else
                {
                    return "测试字符串";
                }
            }
        }
    }
}

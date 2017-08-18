using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Management;
using System.Web.Mvc;
using Elight.Infrastructure;
using TestingCenterSystem.Models.PDP;
using TestingCenterSystem.Service.Comm;
using TestingCenterSystem.Service.Comm.Interface;

namespace Elight.Web.Areas.TestCenterSystem
{
    public class PostWebApi
    {
        private static readonly IErrorLogService ErrorLogService = new ErrorLogService();
        public static Dictionary<string, object> WebApiTest(string url, string content, int sdId, bool isTest)
        {
            try
            {
                var postData = Encoding.UTF8.GetBytes(content); //编码，尤其是汉字，事先要看下抓取网页的编码方式  
                var client = new WebClient();
                client.Headers.Add("Content-Type", "application/json");
                client.Headers.Add("Accept", "application/json, text/javascript, */*; q=0.01");//采取POST方式必须加的header，如果改为GET方式的话就去掉这句话即可  
                var responseData = client.UploadData(url, "POST", postData); //得到返回字符流  
                var value1 = Encoding.UTF8.GetString(responseData).Trim('"');
                var data = new Dictionary<string, object> { { "success", true }, { "data", value1 } };
                return data;
            }
            catch (Exception ex)
            {
                var error = new PDP_ERROR_LOG()
                {
                    SD_ID = sdId,
                    PROC_TYPE = isTest ? 2 : 1,
                    PROC_URL = url,
                    ERR_CONTENT = ex.Message
                };
                ErrorLogService.Insert(error);
                return new Dictionary<string, object> { { "sucess", false }, { "data", "api接口调用失败，url或者参数信息不正确！" } };

            }
        }
    }
}
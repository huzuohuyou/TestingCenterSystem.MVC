using Elight.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestingCenterSystem.ViewModels;

namespace TestingCenterSystem.ViewModels.Project
{
    public class ProjectProvider
    {
        #region 当前项目病种设置
        private const string CURRENT_PROJECT_KEY = "CurrentProject";
        private string Provider = Configs.GetValue("CurrentProject");
        private int Timeout = Convert.ToInt32(Configs.GetValue("KeepProjectTimeout"));
        private ProjectProvider()
        {
            //Instance.Current = new ProjectViewModel() { SD_ID = 10001, TC_PROJECT_NAME = "测试项目", TC_PROJ_ID = 10000, SD_CODE = "YXA", SD_NAME = "胰腺癌" };
        }

        /// <summary>
        /// 请使用 ProjectService.Instance.Current 获取当前项目对象；
        /// </summary>
        /// <returns></returns>
        [Obsolete]
        public ProjectViewModel GetCurrentSD()
        {
            return Instance.Current;
        }

        class Nested
        {
            static Nested() { }
            internal static readonly ProjectProvider instance = new ProjectProvider();
        }

        public static ProjectProvider Instance
        {
            get
            {
                return Nested.instance;
            }
        }

        public ProjectViewModel Current
        {
            get
            {
                ProjectViewModel operatorModel = new ProjectViewModel();
                if (Provider == "Cookie")
                {
                    operatorModel = WebHelper.GetCookie(CURRENT_PROJECT_KEY).DESDecrypt().ToObject<ProjectViewModel>();
                }
                else
                {
                    operatorModel = WebHelper.GetSession(CURRENT_PROJECT_KEY).DESDecrypt().ToObject<ProjectViewModel>();
                }
                if (operatorModel==null)
                {
                    operatorModel = new ProjectViewModel();
                }
                return operatorModel;
            }
            set
            {
                if (Provider == "Cookie")
                {
                    WebHelper.SetCookie(CURRENT_PROJECT_KEY, value.ToJson().DESEncrypt(), Timeout);
                }
                else
                {
                    WebHelper.SetSession(CURRENT_PROJECT_KEY, value.ToJson().DESEncrypt(), Timeout);
                }
            }
        }
        #endregion
    }
}

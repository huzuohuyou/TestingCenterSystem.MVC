using System;

namespace TestingCenterSystem.ViewModels.Project
{
    public class TeamViewModel
    {
        public int ProjectID { get; set; }
        public string ProjectName { get; set; }
        public int? IsCommon { get; set; }
        public int? ProjectType { get; set; }
        public DateTime? CreateTime { get; set; }
        public int SDCount { get; set; }
    }
}
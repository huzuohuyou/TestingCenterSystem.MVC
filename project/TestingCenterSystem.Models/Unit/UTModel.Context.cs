﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace TestingCenterSystem.Models.Unit
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Core.EntityClient;
    using System.Data.Entity.Infrastructure;
    
    public partial class UTEntities : DbContext
    {
        public UTEntities(EntityConnection existingConnection, bool contextOwnsConnection)
            : base(existingConnection, contextOwnsConnection)
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<UN_SD_CPAT_DETAIL> SD_CPAT_DETAIL { get; set; }
        public virtual DbSet<UN_CPAT_CHECK_RECORD> CPAT_CHECK_RECORD { get; set; }
        public virtual DbSet<UN_CPAT_DICT_CHECKTEST> CPAT_DICT_CHECKTEST { get; set; }
        public virtual DbSet<UN_CPAT_DICT_DEPT> CPAT_DICT_DEPT { get; set; }
        public virtual DbSet<UN_CPAT_DICT_DIAG> CPAT_DICT_DIAG { get; set; }
        public virtual DbSet<UN_CPAT_DICT_DRUG> CPAT_DICT_DRUG { get; set; }
        public virtual DbSet<UN_CPAT_DICT_EMPLOYEE> CPAT_DICT_EMPLOYEE { get; set; }
        public virtual DbSet<UN_CPAT_EMR_RECORD> CPAT_EMR_RECORD { get; set; }
        public virtual DbSet<UN_CPAT_IN_ORDERS> CPAT_IN_ORDERS { get; set; }
        public virtual DbSet<UN_CPAT_IN_PATIENT> CPAT_IN_PATIENT { get; set; }
        public virtual DbSet<UN_CPAT_OUT_EMR> CPAT_OUT_EMR { get; set; }
        public virtual DbSet<UN_CPAT_OUT_PATIENT> CPAT_OUT_PATIENT { get; set; }
        public virtual DbSet<UN_CPAT_OUT_RECIPE> CPAT_OUT_RECIPE { get; set; }
        public virtual DbSet<UN_CPAT_PATHOLOGY_RECORD> CPAT_PATHOLOGY_RECORD { get; set; }
        public virtual DbSet<UN_CPAT_TEST_RECORD> CPAT_TEST_RECORD { get; set; }
        public virtual DbSet<UN_CPAT_TEST_RESULT> CPAT_TEST_RESULT { get; set; }
        public virtual DbSet<UN_CPAT_TEST_RESULT_GERM> CPAT_TEST_RESULT_GERM { get; set; }
        public virtual DbSet<UN_SD_EPKI_VALUE> SD_EPKI_VALUE { get; set; }
        public virtual DbSet<UN_SD_CPATS> SD_CPATS { get; set; }
        public virtual DbSet<UN_SD_ITEM_VALUE> SD_ITEM_VALUE { get; set; }
        public virtual DbSet<UN_COM_DICT_DETAIL> COM_DICT_DETAIL { get; set; }
        public virtual DbSet<UN_COM_DICT_MASTER> COM_DICT_MASTER { get; set; }
        public virtual DbSet<UN_CPAT_ANESTHESIA_RECORD> CPAT_ANESTHESIA_RECORD { get; set; }
        public virtual DbSet<UN_CPAT_CONSULT_RECORD> CPAT_CONSULT_RECORD { get; set; }
        public virtual DbSet<UN_CPAT_DIAGNOSIS> CPAT_DIAGNOSIS { get; set; }
        public virtual DbSet<UN_CPAT_INFECTION_RECORD> CPAT_INFECTION_RECORD { get; set; }
        public virtual DbSet<UN_CPAT_OPERATION_RECORD> CPAT_OPERATION_RECORD { get; set; }
        public virtual DbSet<UN_CPAT_TRANS_RECORD> CPAT_TRANS_RECORD { get; set; }
        public virtual DbSet<UN_CPAT_ASSESSMENT_RECORD> CPAT_ASSESSMENT_RECORD { get; set; }
        public virtual DbSet<UN_CPAT_MEDICAL_RECORD> CPAT_MEDICAL_RECORD { get; set; }
        public virtual DbSet<UN_CPAT_NURSE_RECORD> CPAT_NURSE_RECORD { get; set; }
        public virtual DbSet<UN_PDP_PROJECT> PDP_PROJECT { get; set; }
    }
}
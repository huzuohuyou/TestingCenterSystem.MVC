USE [HJ.PDP]
GO
/****** Object:  Table [dbo].[PDP_DB_CONF]    Script Date: 2017/8/18 10:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PDP_DB_CONF](
	[DB_CONF_ID] [int] IDENTITY(10000,1) NOT NULL,
	[TC_PROJ_ID] [int] NULL,
	[DB_CONF_TYPE] [int] NULL,
	[SERVER_NAME] [varchar](60) NULL,
	[DB_NAME] [varchar](20) NULL,
	[DB_USER] [varchar](20) NULL,
	[DB_PWD] [varchar](20) NULL,
	[UPD_USER_ID] [varchar](20) NULL,
	[UPD_DATE] [datetime] NULL,
 CONSTRAINT [PK_TC_DB_CONF] PRIMARY KEY CLUSTERED 
(
	[DB_CONF_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PDP_ERROR_LOG]    Script Date: 2017/8/18 10:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PDP_ERROR_LOG](
	[ERROR_LOG_ID] [int] IDENTITY(10000,1) NOT NULL,
	[SD_ID] [int] NULL,
	[PROC_TYPE] [int] NULL,
	[PROC_URL] [varchar](200) NULL,
	[DLL_NAME] [varchar](200) NULL,
	[CLASS_NAME] [varchar](200) NULL,
	[FUNC_NAME] [varchar](200) NULL,
	[ERR_CONTENT] [varchar](2000) NULL,
	[UPD_USER_ID] [varchar](20) NULL,
	[UPD_DATE] [datetime] NULL,
 CONSTRAINT [PK_TC_SD_ERROR_LOG] PRIMARY KEY CLUSTERED 
(
	[ERROR_LOG_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PDP_PROC_LOG]    Script Date: 2017/8/18 10:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PDP_PROC_LOG](
	[PROC_LOG_ID] [int] IDENTITY(10000,1) NOT NULL,
	[SD_ID] [int] NULL,
	[PROC_CAT_CODE] [varchar](20) NOT NULL,
	[PROC_CONTENT_ID] [varchar](20) NULL,
	[UPD_USER_ID] [varchar](20) NULL,
	[UPD_DATE] [datetime] NULL,
 CONSTRAINT [PK_TC_SD_PROC_LOG] PRIMARY KEY CLUSTERED 
(
	[PROC_LOG_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PDP_PROC_STAT]    Script Date: 2017/8/18 10:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PDP_PROC_STAT](
	[SD_ID] [int] NOT NULL,
	[PROC_CAT_CODE] [varchar](20) NOT NULL,
	[PROC_CONTENT_ID] [varchar](20) NOT NULL,
	[PROC_STAT_CODE] [varchar](20) NULL,
	[UPD_USER_ID] [varchar](50) NULL,
	[UPD_DATE] [datetime] NULL,
 CONSTRAINT [PK_TC_SD_PROC_STAT] PRIMARY KEY CLUSTERED 
(
	[SD_ID] ASC,
	[PROC_CAT_CODE] ASC,
	[PROC_CONTENT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PDP_PROJECT]    Script Date: 2017/8/18 10:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PDP_PROJECT](
	[TC_PROJ_ID] [int] IDENTITY(10000,1) NOT NULL,
	[TC_PROJ_NAME] [varchar](60) NOT NULL,
	[IS_COMMON] [int] NULL,
	[TC_PROJ_TYPE] [int] NULL,
	[UPD_USER_ID] [varchar](20) NULL,
	[UPD_DATE] [datetime] NULL,
	[TC_PROJ_CODE] [varchar](20) NULL,
 CONSTRAINT [PK_TC_PROJECT] PRIMARY KEY CLUSTERED 
(
	[TC_PROJ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SD_CAT_CONF]    Script Date: 2017/8/18 10:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SD_CAT_CONF](
	[CAT_ID] [int] IDENTITY(10000,1) NOT NULL,
	[CAT_CODE] [varchar](20) NULL,
	[CAT_NAME] [varchar](60) NULL,
	[CAT_TYPE_CODE] [varchar](20) NULL,
	[CAT_TYPE_NAME] [varchar](60) NULL,
	[CAT_PA_CODE] [varchar](20) NULL,
	[CAT_PA_NAME] [varchar](60) NULL,
	[CAT_SUB_CODE] [varchar](20) NULL,
	[CAT_SUB_NAME] [varchar](60) NULL,
	[ORDER_NO] [int] NULL,
	[UPD_USER_ID] [varchar](20) NULL,
	[UPD_DATE] [datetime] NULL,
 CONSTRAINT [PK_TC_SD_CAT_CONF] PRIMARY KEY CLUSTERED 
(
	[CAT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SD_CPAT_DETAIL]    Script Date: 2017/8/18 10:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SD_CPAT_DETAIL](
	[DETAIL_ID] [int] IDENTITY(1,1) NOT NULL,
	[SD_ID] [int] NULL,
	[SD_CPAT_NO] [varchar](60) NULL,
	[PATIENT_NO] [varchar](60) NULL,
	[IN_FLAG] [varchar](20) NOT NULL,
	[BASE_FLAG] [int] NOT NULL,
	[PATIENT_ID] [varchar](60) NULL,
	[IN_DATE] [datetime] NULL,
	[OUT_DATE] [datetime] NULL,
	[UPD_USER_ID] [varchar](20) NULL,
	[UPD_DATE] [datetime] NULL,
 CONSTRAINT [PK_TC_SD_CPAT_DETAIL] PRIMARY KEY CLUSTERED 
(
	[DETAIL_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SD_CPATS]    Script Date: 2017/8/18 10:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SD_CPATS](
	[SD_ID] [int] NOT NULL,
	[SD_CPAT_NO] [varchar](60) NOT NULL,
	[SD_FILTER_ID] [int] NOT NULL,
	[SD_CODE] [varchar](20) NOT NULL,
	[SD_CPAT_DATE] [datetime] NOT NULL,
	[PATIENT_ID] [varchar](60) NULL,
	[UPD_USER_ID] [varchar](20) NULL,
	[UPD_DATE] [datetime] NULL,
 CONSTRAINT [PK_SD_CPATS] PRIMARY KEY CLUSTERED 
(
	[SD_ID] ASC,
	[SD_CPAT_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SD_EKPI_FORMULA]    Script Date: 2017/8/18 10:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SD_EKPI_FORMULA](
	[SD_EKPI_ID] [int] NOT NULL,
	[NUM_FORMULA] [varchar](1000) NULL,
	[FRA_FORMULA] [varchar](1000) NULL,
	[UPD_USER_ID] [varchar](20) NULL,
	[UPD_DATE] [datetime] NULL,
 CONSTRAINT [PK_TC_SD_EKPI_FORMULA] PRIMARY KEY CLUSTERED 
(
	[SD_EKPI_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SD_EKPI_INFO]    Script Date: 2017/8/18 10:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SD_EKPI_INFO](
	[SD_EKPI_ID] [int] IDENTITY(10000,1) NOT NULL,
	[SD_ID] [int] NULL,
	[SD_CODE] [varchar](20) NULL,
	[SD_EKPI_CODE] [varchar](20) NULL,
	[SD_EKPI_NAME] [varchar](200) NULL,
	[SD_EKPI_ALIAS] [varchar](200) NULL,
	[ORDER_NO] [int] NULL,
	[SD_EKPI_CAT] [int] NULL,
	[IS_POSITIVE] [int] NULL,
	[SD_EKPI_ALGO] [varchar](max) NULL,
	[IS_RSN] [int] NULL,
	[IS_DISTRIBUTION] [int] NULL,
	[IS_TREND] [int] NULL,
	[VALID_FLAG] [int] NOT NULL,
	[SD_EKPI_DESC] [varchar](500) NULL,
	[UPD_USER_ID] [varchar](20) NULL,
	[UPD_DATE] [datetime] NULL,
 CONSTRAINT [PK_TC_SD_EKPI_INFO] PRIMARY KEY CLUSTERED 
(
	[SD_EKPI_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SD_EKPI_PARAM]    Script Date: 2017/8/18 10:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SD_EKPI_PARAM](
	[SD_EKPI_ID] [int] NOT NULL,
	[SD_ITEM_ID] [int] NOT NULL,
	[SD_EKPI_PARAM_NAME] [varchar](20) NOT NULL,
	[UPD_USER_ID] [varchar](20) NULL,
	[UPD_DATE] [datetime] NULL,
 CONSTRAINT [PK_TC_SD_EKPI_PARAM] PRIMARY KEY CLUSTERED 
(
	[SD_EKPI_ID] ASC,
	[SD_ITEM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SD_EPKI_VALUE]    Script Date: 2017/8/18 10:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SD_EPKI_VALUE](
	[SD_EKPI_ID] [int] NOT NULL,
	[SD_CPAT_NO] [varchar](60) NOT NULL,
	[SD_ID] [int] NOT NULL,
	[SD_CODE] [varchar](20) NOT NULL,
	[INDEX_VALUE] [int] NOT NULL,
	[RSN_FLAG] [int] NULL,
	[UPD_USER_ID] [varchar](20) NULL,
	[UPD_DATE] [datetime] NULL,
 CONSTRAINT [PK_TC_SD_EPKI_VALUE] PRIMARY KEY CLUSTERED 
(
	[SD_EKPI_ID] ASC,
	[SD_CPAT_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SD_FILTER_INFO]    Script Date: 2017/8/18 10:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SD_FILTER_INFO](
	[SD_FILTER_ID] [int] IDENTITY(10000,1) NOT NULL,
	[SD_ID] [int] NOT NULL,
	[SD_CODE] [varchar](20) NOT NULL,
	[SD_FILTER_CODE] [varchar](20) NULL,
	[SD_FILTER_NAME] [varchar](60) NOT NULL,
	[ORDER_NO] [int] NULL,
	[SD_FILTER_ALGO] [varchar](max) NULL,
	[VALID_FLAG] [int] NOT NULL,
	[UPD_USER_ID] [varchar](20) NULL,
	[UPD_DATE] [datetime] NULL,
 CONSTRAINT [PK_TC_SD_FILTER_INFO] PRIMARY KEY CLUSTERED 
(
	[SD_FILTER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SD_INFO]    Script Date: 2017/8/18 10:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SD_INFO](
	[SD_ID] [int] IDENTITY(10000,1) NOT NULL,
	[TC_PROJ_ID] [int] NOT NULL,
	[TC_PROJ_TYPE] [int] NULL,
	[SD_CODE] [varchar](20) NOT NULL,
	[SD_NAME] [varchar](60) NOT NULL,
	[SD_ALIAS] [varchar](20) NULL,
	[ITEM_CAT_PA_CODE] [varchar](20) NULL,
	[CITEM_CAT_PA_CODE] [varchar](20) NULL,
	[EKPI_CAT_PA_CODE] [varchar](20) NULL,
	[ORDER_NO] [int] NULL,
	[VALID_FLAG] [int] NOT NULL,
	[UPD_USER_ID] [varchar](20) NULL,
	[UPD_DATE] [datetime] NULL,
 CONSTRAINT [PK_TC_SD_INFO] PRIMARY KEY CLUSTERED 
(
	[SD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SD_ITEM_DEP]    Script Date: 2017/8/18 10:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SD_ITEM_DEP](
	[SD_ITEM_ID] [int] NOT NULL,
	[DEP_SD_ITEM_ID] [int] NOT NULL,
	[UPD_USER_ID] [varchar](20) NULL,
	[UPD_DATE] [datetime] NULL,
 CONSTRAINT [PK_TC_SD_ITEM_DEP] PRIMARY KEY CLUSTERED 
(
	[SD_ITEM_ID] ASC,
	[DEP_SD_ITEM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SD_ITEM_INFO]    Script Date: 2017/8/18 10:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SD_ITEM_INFO](
	[SD_ITEM_ID] [int] IDENTITY(10000,1) NOT NULL,
	[SD_ID] [int] NULL,
	[SD_CODE] [varchar](20) NOT NULL,
	[SD_ITEM_CODE] [varchar](20) NOT NULL,
	[SD_ITEM_NAME] [varchar](200) NOT NULL,
	[SD_ITEM_ALIAS] [varchar](60) NULL,
	[SD_ITEM_CAT_ID] [int] NOT NULL,
	[SD_ITEM_DATA_TYPE] [varchar](20) NOT NULL,
	[SD_ITEM_UNIT] [varchar](20) NULL,
	[NUM_PRECISION] [int] NULL,
	[SD_ITEM_SRC] [int] NOT NULL,
	[IS_RESULT] [int] NULL,
	[ORDER_NO] [int] NULL,
	[SD_ITEM_ALGO] [varchar](max) NULL,
	[VALID_FLAG] [int] NOT NULL,
	[SD_EKPI_DESC] [varchar](500) NULL,
	[UPD_USER_ID] [varchar](20) NULL,
	[UPD_DATE] [datetime] NULL,
	[COM_SD_ITEM_CODE] [varchar](20) NULL,
	[COM_SD_ID] [int] NULL,
 CONSTRAINT [PK_TC_SD_ITEM_INFO] PRIMARY KEY CLUSTERED 
(
	[SD_ITEM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SD_ITEM_OPTION]    Script Date: 2017/8/18 10:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SD_ITEM_OPTION](
	[ITEM_OPTION_ID] [int] IDENTITY(10000,1) NOT NULL,
	[SD_ITEM_ID] [int] NOT NULL,
	[ITEM_OPTION_NAME] [varchar](60) NOT NULL,
	[ORDER_NO] [int] NULL,
	[UPD_USER_ID] [varchar](20) NULL,
	[UPD_DATE] [datetime] NULL,
 CONSTRAINT [PK_TC_SD_ITEM_OPTION] PRIMARY KEY CLUSTERED 
(
	[ITEM_OPTION_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SD_ITEM_VALUE]    Script Date: 2017/8/18 10:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SD_ITEM_VALUE](
	[SD_ITEM_ID] [int] NOT NULL,
	[SD_CPAT_NO] [varchar](60) NOT NULL,
	[SD_ID] [int] NOT NULL,
	[SD_CODE] [varchar](20) NOT NULL,
	[SD_FILTER_ID] [int] NULL,
	[SD_ITEM_VALUE] [varchar](max) NULL,
	[LAST_VALUE] [varchar](max) NULL,
	[UPD_USER_ID] [varchar](20) NULL,
	[UPD_DATE] [datetime] NULL,
 CONSTRAINT [PK_TC_SD_ITEM_VALUE] PRIMARY KEY CLUSTERED 
(
	[SD_ITEM_ID] ASC,
	[SD_CPAT_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sys_Item]    Script Date: 2017/8/18 10:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_Item](
	[Id] [varchar](50) NOT NULL,
	[EnCode] [varchar](50) NULL,
	[ParentId] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Layer] [int] NULL,
	[SortCode] [int] NULL,
	[IsTree] [bit] NULL,
	[DeleteMark] [bit] NULL,
	[IsEnabled] [bit] NULL,
	[Remark] [varchar](500) NULL,
	[CreateUser] [varchar](50) NULL,
	[CreateTime] [datetime] NULL,
	[ModifyUser] [varchar](50) NULL,
	[ModifyTime] [datetime] NULL,
 CONSTRAINT [PK_Sys_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sys_ItemsDetail]    Script Date: 2017/8/18 10:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_ItemsDetail](
	[Id] [varchar](50) NOT NULL,
	[ItemId] [varchar](50) NULL,
	[EnCode] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[IsDefault] [bit] NULL,
	[SortCode] [int] NULL,
	[DeleteMark] [bit] NULL,
	[IsEnabled] [bit] NULL,
	[CreateUser] [varchar](50) NULL,
	[CreateTime] [datetime] NULL,
	[ModifyUser] [varchar](50) NULL,
	[ModifyTime] [datetime] NULL,
 CONSTRAINT [PK_Sys_ItemsDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sys_Log]    Script Date: 2017/8/18 10:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_Log](
	[Id] [varchar](50) NOT NULL,
	[CreateTime] [datetime] NULL,
	[LogLevel] [varchar](50) NULL,
	[Operation] [varchar](50) NULL,
	[Message] [varchar](500) NULL,
	[Account] [varchar](50) NULL,
	[RealName] [varchar](50) NULL,
	[IP] [varchar](50) NULL,
	[IPAddress] [varchar](50) NULL,
	[Browser] [varchar](50) NULL,
	[StackTrace] [varchar](500) NULL,
 CONSTRAINT [PK_Sys_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sys_Organize]    Script Date: 2017/8/18 10:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_Organize](
	[Id] [varchar](50) NOT NULL,
	[ParentId] [varchar](50) NULL,
	[Layer] [int] NULL,
	[EnCode] [varchar](50) NULL,
	[FullName] [varchar](50) NULL,
	[Type] [smallint] NULL,
	[ManagerId] [varchar](50) NULL,
	[TelePhone] [varchar](50) NULL,
	[WeChat] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[SortCode] [int] NULL,
	[DeleteMark] [bit] NULL,
	[IsEnabled] [bit] NULL,
	[Remark] [varchar](500) NULL,
	[CreateUser] [varchar](50) NULL,
	[CreateTime] [datetime] NULL,
	[ModifyUser] [varchar](50) NULL,
	[ModifyTime] [datetime] NULL,
 CONSTRAINT [PK_Sys_Organize] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sys_Permission]    Script Date: 2017/8/18 10:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_Permission](
	[Id] [varchar](50) NOT NULL,
	[ParentId] [varchar](50) NULL,
	[Layer] [int] NULL,
	[EnCode] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[JsEvent] [varchar](50) NULL,
	[Icon] [varchar](50) NULL,
	[Url] [varchar](300) NULL,
	[Remark] [varchar](500) NULL,
	[Type] [int] NULL,
	[SortCode] [int] NULL,
	[IsPublic] [bit] NULL,
	[IsEnable] [bit] NULL,
	[IsEdit] [bit] NULL,
	[DeleteMark] [bit] NULL,
	[CreateUser] [varchar](50) NULL,
	[CreateTime] [datetime] NULL,
	[ModifyUser] [varchar](50) NULL,
	[ModifyTime] [datetime] NULL,
 CONSTRAINT [PK_Sys_Permission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sys_Role]    Script Date: 2017/8/18 10:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_Role](
	[Id] [varchar](50) NOT NULL,
	[OrganizeId] [varchar](50) NULL,
	[EnCode] [varchar](50) NULL,
	[Type] [smallint] NULL,
	[Name] [varchar](50) NULL,
	[AllowEdit] [bit] NULL,
	[DeleteMark] [bit] NULL,
	[IsEnabled] [bit] NULL,
	[Remark] [varchar](500) NULL,
	[SortCode] [int] NULL,
	[CreateUser] [varchar](50) NULL,
	[CreateTime] [datetime] NULL,
	[ModifyUser] [varchar](50) NULL,
	[ModifyTime] [datetime] NULL,
 CONSTRAINT [PK_Sys_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sys_RoleAuthorize]    Script Date: 2017/8/18 10:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_RoleAuthorize](
	[Id] [varchar](50) NOT NULL,
	[RoleId] [varchar](50) NULL,
	[ModuleId] [varchar](50) NULL,
	[CreateUser] [varchar](50) NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_Sys_RoleAuthorize] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sys_User]    Script Date: 2017/8/18 10:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_User](
	[Id] [varchar](50) NOT NULL,
	[Account] [varchar](50) NULL,
	[RealName] [varchar](50) NULL,
	[NickName] [varchar](50) NULL,
	[Avatar] [varchar](200) NULL,
	[Gender] [bit] NULL,
	[Birthday] [datetime] NULL,
	[MobilePhone] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[Signature] [varchar](500) NULL,
	[Address] [varchar](500) NULL,
	[CompanyId] [varchar](50) NULL,
	[DepartmentId] [varchar](50) NULL,
	[IsEnabled] [bit] NULL,
	[SortCode] [int] NULL,
	[DeleteMark] [bit] NULL,
	[CreateUser] [varchar](50) NULL,
	[CreateTime] [datetime] NULL,
	[ModifyUser] [varchar](50) NULL,
	[ModifyTime] [datetime] NULL,
 CONSTRAINT [PK_Sys_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sys_UserLogOn]    Script Date: 2017/8/18 10:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_UserLogOn](
	[Id] [varchar](50) NOT NULL,
	[UserId] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[SecretKey] [varchar](50) NULL,
	[PrevVisitTime] [datetime] NULL,
	[LastVisitTime] [datetime] NULL,
	[ChangePwdTime] [datetime] NULL,
	[LoginCount] [int] NOT NULL,
	[AllowMultiUserOnline] [bit] NULL,
	[IsOnLine] [bit] NULL,
	[Question] [varchar](100) NULL,
	[AnswerQuestion] [varchar](200) NULL,
	[CheckIPAddress] [bit] NULL,
	[Language] [varchar](50) NULL,
	[Theme] [varchar](50) NULL,
 CONSTRAINT [PK_Sys_UserLogOn] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sys_UserRoleRelation]    Script Date: 2017/8/18 10:28:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_UserRoleRelation](
	[Id] [varchar](50) NOT NULL,
	[UserId] [varchar](50) NULL,
	[RoleId] [varchar](50) NULL,
	[CreateUser] [varchar](50) NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_Sys_UserRoleRelation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[PDP_DB_CONF] ON 

INSERT [dbo].[PDP_DB_CONF] ([DB_CONF_ID], [TC_PROJ_ID], [DB_CONF_TYPE], [SERVER_NAME], [DB_NAME], [DB_USER], [DB_PWD], [UPD_USER_ID], [UPD_DATE]) VALUES (10004, 10002, 1, N'192.168.2.9\hjcdr', N'HJ.CDR.SHRJ.DEV', N'sa', N'rjgcbzy2.9', N'超级管理员', CAST(N'2017-08-17T09:53:54.873' AS DateTime))
INSERT [dbo].[PDP_DB_CONF] ([DB_CONF_ID], [TC_PROJ_ID], [DB_CONF_TYPE], [SERVER_NAME], [DB_NAME], [DB_USER], [DB_PWD], [UPD_USER_ID], [UPD_DATE]) VALUES (10005, 10002, 2, N'192.168.2.9\hjcdr', N'HJ.PDP.SHRJ.UT', N'sa', N'rjgcbzy2.9', N'超级管理员', CAST(N'2017-08-17T09:53:54.887' AS DateTime))
INSERT [dbo].[PDP_DB_CONF] ([DB_CONF_ID], [TC_PROJ_ID], [DB_CONF_TYPE], [SERVER_NAME], [DB_NAME], [DB_USER], [DB_PWD], [UPD_USER_ID], [UPD_DATE]) VALUES (10006, 10001, 1, N'192.168.2.9\hjcdr', N'HJ.CDR.SHRJ.DEV', N'sa', N'rjgcbzy2.9', NULL, NULL)
INSERT [dbo].[PDP_DB_CONF] ([DB_CONF_ID], [TC_PROJ_ID], [DB_CONF_TYPE], [SERVER_NAME], [DB_NAME], [DB_USER], [DB_PWD], [UPD_USER_ID], [UPD_DATE]) VALUES (10007, 10001, 2, N'192.168.2.9\hjcdr', N'HJ.PDP.SHRJ.UT', N'sa', N'rjgcbzy2.9', NULL, NULL)
INSERT [dbo].[PDP_DB_CONF] ([DB_CONF_ID], [TC_PROJ_ID], [DB_CONF_TYPE], [SERVER_NAME], [DB_NAME], [DB_USER], [DB_PWD], [UPD_USER_ID], [UPD_DATE]) VALUES (10008, 10003, 1, N'192.168.2.9\hjcdr', N'HJ.CDR.SHRJ.DEV', N'sa', N'rjgcbzy2.9', N'超级管理员', CAST(N'2017-08-17T10:05:53.000' AS DateTime))
INSERT [dbo].[PDP_DB_CONF] ([DB_CONF_ID], [TC_PROJ_ID], [DB_CONF_TYPE], [SERVER_NAME], [DB_NAME], [DB_USER], [DB_PWD], [UPD_USER_ID], [UPD_DATE]) VALUES (10009, 10003, 2, N'192.168.2.9\hjcdr', N'HJ.PDP.SHRJ.UT', N'sa', N'rjgcbzy2.9', N'超级管理员', CAST(N'2017-08-17T10:05:53.713' AS DateTime))
INSERT [dbo].[PDP_DB_CONF] ([DB_CONF_ID], [TC_PROJ_ID], [DB_CONF_TYPE], [SERVER_NAME], [DB_NAME], [DB_USER], [DB_PWD], [UPD_USER_ID], [UPD_DATE]) VALUES (10012, 10008, 1, N'192.168.2.9\hjcdr', N'CDR_DLYY_20170809', N'sa', N'rjgcbzy2.9', N'超级管理员', CAST(N'2017-08-17T17:28:23.557' AS DateTime))
INSERT [dbo].[PDP_DB_CONF] ([DB_CONF_ID], [TC_PROJ_ID], [DB_CONF_TYPE], [SERVER_NAME], [DB_NAME], [DB_USER], [DB_PWD], [UPD_USER_ID], [UPD_DATE]) VALUES (10013, 10008, 2, N'192.168.2.9\hjcdr', N'CDR.CHECK.RJ', N'sa', N'rjgcbzy2.9', N'超级管理员', CAST(N'2017-08-17T17:28:23.623' AS DateTime))
SET IDENTITY_INSERT [dbo].[PDP_DB_CONF] OFF
SET IDENTITY_INSERT [dbo].[PDP_ERROR_LOG] ON 

INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10000, 10002, 2, NULL, NULL, NULL, NULL, N'System.Exception: ce
   在 TestingCenterSystem.Service.KPI.KPIService.Test(TestViewModel tvm) 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\TestingCenterSystem.Service\KPI\KPIService.cs:行号 145
   在 Elight.Web.Areas.TestCenterSystem.Controllers.KPIController.Test(TestViewModel vm) 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\KPI\KPIController.cs:行号 143', N'超级管理员', CAST(N'2017-08-17T11:07:11.617' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10001, 10003, 2, NULL, NULL, NULL, NULL, N'远程服务器返回错误: (500) 内部服务器错误。', N'超级管理员', CAST(N'2017-08-17T14:07:14.740' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, 10003, 2, NULL, NULL, NULL, NULL, N'无法连接到远程服务器', N'超级管理员', CAST(N'2017-08-17T14:12:32.560' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10003, 10003, 2, NULL, NULL, NULL, NULL, N'无法连接到远程服务器', N'超级管理员', CAST(N'2017-08-17T14:18:42.717' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10004, 10003, 2, NULL, NULL, NULL, NULL, N'远程服务器返回错误: (500) 内部服务器错误。', N'超级管理员', CAST(N'2017-08-17T14:22:19.380' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10005, 10003, 2, NULL, NULL, NULL, NULL, N'远程服务器返回错误: (500) 内部服务器错误。', N'超级管理员', CAST(N'2017-08-17T14:25:45.630' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10006, 10003, 2, NULL, NULL, NULL, NULL, N'远程服务器返回错误: (500) 内部服务器错误。', N'超级管理员', CAST(N'2017-08-17T14:30:17.350' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10007, 10003, 2, NULL, NULL, NULL, NULL, N'远程服务器返回错误: (500) 内部服务器错误。', N'超级管理员', CAST(N'2017-08-17T14:34:46.247' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10008, 10003, 2, NULL, NULL, NULL, NULL, N'未将对象引用设置到对象的实例。', N'超级管理员', CAST(N'2017-08-17T15:03:08.450' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10009, 10002, 0, NULL, NULL, NULL, NULL, N'System.Exception: 数据库中已存在记录，要想插入新纪录请执行清库操作！！！
   在 TestingCenterSystem.Service.KPI.KPIService.Test(TestViewModel tvm) 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\TestingCenterSystem.Service\KPI\KPIService.cs:行号 206
   在 Elight.Web.Areas.TestCenterSystem.Controllers.KPIController.Test(TestViewModel vm) 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\KPI\KPIController.cs:行号 150', N'超级管理员', CAST(N'2017-08-17T15:50:13.517' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10010, 10002, 0, NULL, NULL, NULL, NULL, N'System.Exception: 数据库中已存在记录，要想插入新纪录请执行清库操作！！！
   在 TestingCenterSystem.Service.KPI.KPIService.Test(TestViewModel tvm) 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\TestingCenterSystem.Service\KPI\KPIService.cs:行号 206
   在 Elight.Web.Areas.TestCenterSystem.Controllers.KPIController.Test(TestViewModel vm) 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\KPI\KPIController.cs:行号 150', N'超级管理员', CAST(N'2017-08-17T15:50:32.047' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10011, 10002, 0, NULL, NULL, NULL, NULL, N'System.Exception: 数据库中已存在记录，要想插入新纪录请执行清库操作！！！
   在 TestingCenterSystem.Service.KPI.KPIService.Test(TestViewModel tvm) 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\TestingCenterSystem.Service\KPI\KPIService.cs:行号 206
   在 Elight.Web.Areas.TestCenterSystem.Controllers.KPIController.Test(TestViewModel vm) 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\KPI\KPIController.cs:行号 150', N'超级管理员', CAST(N'2017-08-17T15:50:40.723' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10012, 10002, 0, NULL, NULL, NULL, NULL, N'System.Exception: 数据库中已存在记录，要想插入新纪录请执行清库操作！！！
   在 TestingCenterSystem.Service.KPI.KPIService.Test(TestViewModel tvm) 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\TestingCenterSystem.Service\KPI\KPIService.cs:行号 206
   在 Elight.Web.Areas.TestCenterSystem.Controllers.KPIController.Test(TestViewModel vm) 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\KPI\KPIController.cs:行号 150', N'超级管理员', CAST(N'2017-08-17T15:51:52.670' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10013, 10002, 0, NULL, NULL, NULL, NULL, N'System.Exception: 数据库中已存在记录，要想插入新纪录请执行清库操作！！！
   在 TestingCenterSystem.Service.KPI.KPIService.Test(TestViewModel tvm) 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\TestingCenterSystem.Service\KPI\KPIService.cs:行号 206
   在 Elight.Web.Areas.TestCenterSystem.Controllers.KPIController.Test(TestViewModel vm) 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\KPI\KPIController.cs:行号 150', N'超级管理员', CAST(N'2017-08-17T15:56:33.403' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10014, 10002, 0, NULL, NULL, NULL, NULL, N'System.Exception: 数据锁定成功！！！
   在 TestingCenterSystem.Service.KPI.KPIService.Test(TestViewModel tvm) 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\TestingCenterSystem.Service\KPI\KPIService.cs:行号 205
   在 Elight.Web.Areas.TestCenterSystem.Controllers.KPIController.Test(TestViewModel vm) 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\KPI\KPIController.cs:行号 150', N'超级管理员', CAST(N'2017-08-17T16:04:10.273' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10015, 10002, 2, NULL, NULL, NULL, NULL, N'System.Exception: null kpi script exist!!!
   在 TestingCenter.ViewModels.KPIFormulaViewModel.get_KPIScript() 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\TestingCenterSystem.ViewModels\KPI\KPIFormulaViewModel.cs:行号 62
   在 TestingCenterSystem.Service.KPI.KPIService.Test(TestViewModel tvm) 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\TestingCenterSystem.Service\KPI\KPIService.cs:行号 162
   在 Elight.Web.Areas.TestCenterSystem.Controllers.KPIController.Test(TestViewModel vm) 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\KPI\KPIController.cs:行号 150', N'超级管理员', CAST(N'2017-08-17T16:12:00.483' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10016, 10002, 0, NULL, NULL, NULL, NULL, N'System.Exception: null kpi script exist!!!
   在 TestingCenter.ViewModels.KPIFormulaViewModel.get_KPIScript() 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\TestingCenterSystem.ViewModels\KPI\KPIFormulaViewModel.cs:行号 62
   在 TestingCenterSystem.Service.KPI.KPIService.Test(TestViewModel tvm) 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\TestingCenterSystem.Service\KPI\KPIService.cs:行号 162
   在 Elight.Web.Areas.TestCenterSystem.Controllers.KPIController.Test(TestViewModel vm) 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\KPI\KPIController.cs:行号 150', N'超级管理员', CAST(N'2017-08-17T16:12:02.517' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10017, 10002, 0, NULL, NULL, NULL, NULL, N'System.Exception: null kpi script exist!!!
   在 TestingCenter.ViewModels.KPIFormulaViewModel.get_KPIScript() 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\TestingCenterSystem.ViewModels\KPI\KPIFormulaViewModel.cs:行号 62
   在 TestingCenterSystem.Service.KPI.KPIService.Test(TestViewModel tvm) 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\TestingCenterSystem.Service\KPI\KPIService.cs:行号 162
   在 Elight.Web.Areas.TestCenterSystem.Controllers.KPIController.Test(TestViewModel vm) 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\KPI\KPIController.cs:行号 150', N'超级管理员', CAST(N'2017-08-17T16:12:03.607' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10018, 10002, 0, NULL, NULL, NULL, NULL, N'System.Exception: 数据库中已存在记录，要想插入新纪录请执行清库操作！！！
   在 TestingCenterSystem.Service.KPI.KPIService.Test(TestViewModel tvm) 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\TestingCenterSystem.Service\KPI\KPIService.cs:行号 209
   在 Elight.Web.Areas.TestCenterSystem.Controllers.KPIController.Test(TestViewModel vm) 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\KPI\KPIController.cs:行号 150', N'超级管理员', CAST(N'2017-08-17T16:31:15.460' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, 10002, 0, NULL, NULL, NULL, NULL, N'System.Exception: 数据库中已存在记录，要想插入新纪录请执行清库操作！！！
   在 TestingCenterSystem.Service.KPI.KPIService.Test(TestViewModel tvm) 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\TestingCenterSystem.Service\KPI\KPIService.cs:行号 207
   在 Elight.Web.Areas.TestCenterSystem.Controllers.KPIController.Test(TestViewModel vm) 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\KPI\KPIController.cs:行号 150', N'超级管理员', CAST(N'2017-08-17T16:36:33.110' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10020, 10002, 0, NULL, NULL, NULL, NULL, N'System.Exception: 数据锁定成功！！！
   在 TestingCenterSystem.Service.KPI.KPIService.Test(TestViewModel tvm) 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\TestingCenterSystem.Service\KPI\KPIService.cs:行号 207
   在 Elight.Web.Areas.TestCenterSystem.Controllers.KPIController.Test(TestViewModel vm) 位置 D:\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\KPI\KPIController.cs:行号 150', N'超级管理员', CAST(N'2017-08-17T16:36:47.083' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10021, 10003, 2, NULL, NULL, NULL, NULL, N'System.Net.WebException: 远程服务器返回错误: (404) 未找到。
   在 Elight.Web.Areas.TestCenterSystem.Controllers.InGroupController.ExecuteUrl(String url, DateTime startTime, DateTime endTime, String patientNo) 位置 D:\华据医疗\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\InGroup\InGroupController.cs:行号 334
   在 Elight.Web.Areas.TestCenterSystem.Controllers.InGroupController.Test(String primaryKey, TestParamViewModel model) 位置 D:\华据医疗\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\InGroup\InGroupController.cs:行号 150', N'超级管理员', CAST(N'2017-08-17T16:39:05.110' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, 10003, 2, N'22', NULL, NULL, NULL, N'对路径“C:\Program Files (x86)\IIS Express\22”的访问被拒绝。', N'超级管理员', CAST(N'2017-08-17T17:23:36.897' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10023, 10003, 2, N'22', NULL, NULL, NULL, N'数据项测试失败！异常信息：给定关键字不在字典中。', N'超级管理员', CAST(N'2017-08-17T17:23:36.953' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10024, 10003, 2, NULL, NULL, NULL, NULL, N'System.Net.WebException: 远程服务器返回错误: (500) 内部服务器错误。
   在 Elight.Web.Areas.TestCenterSystem.Controllers.InGroupController.ExecuteUrl(String url, DateTime startTime, DateTime endTime, String patientNo) 位置 D:\华据医疗\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\InGroup\InGroupController.cs:行号 343
   在 Elight.Web.Areas.TestCenterSystem.Controllers.InGroupController.Test(String primaryKey, TestParamViewModel model) 位置 D:\华据医疗\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\InGroup\InGroupController.cs:行号 158', N'超级管理员', CAST(N'2017-08-17T18:07:47.253' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10025, 10003, 2, NULL, NULL, NULL, NULL, N'System.Net.WebException: 远程服务器返回错误: (404) 未找到。
   在 Elight.Web.Areas.TestCenterSystem.Controllers.InGroupController.ExecuteUrl(String url, DateTime startTime, DateTime endTime, String patientNo) 位置 D:\华据医疗\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\InGroup\InGroupController.cs:行号 343
   在 Elight.Web.Areas.TestCenterSystem.Controllers.InGroupController.Test(String primaryKey, TestParamViewModel model) 位置 D:\华据医疗\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\InGroup\InGroupController.cs:行号 158', N'超级管理员', CAST(N'2017-08-17T18:09:10.337' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10026, 10003, 1, NULL, NULL, NULL, NULL, N'System.Net.WebException: 无法连接到远程服务器 ---> System.Net.Sockets.SocketException: 由于目标计算机积极拒绝，无法连接。 127.0.0.1:1588
   在 System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)
   在 System.Net.ServicePoint.ConnectSocketInternal(Boolean connectFailure, Socket s4, Socket s6, Socket& socket, IPAddress& address, ConnectSocketState state, IAsyncResult asyncResult, Exception& exception)
   --- 内部异常堆栈跟踪的结尾 ---
   在 Elight.Web.Areas.TestCenterSystem.Controllers.InGroupController.ExecuteUrl(String url, DateTime startTime, DateTime endTime, String patientNo)
   在 Elight.Web.Areas.TestCenterSystem.Controllers.InGroupController.Do(String url, String primaryKey)', N'超级管理员', CAST(N'2017-08-17T18:24:23.310' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10027, 10003, 1, NULL, NULL, NULL, NULL, N'System.Net.WebException: 无法连接到远程服务器 ---> System.Net.Sockets.SocketException: 由于目标计算机积极拒绝，无法连接。 127.0.0.1:1588
   在 System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)
   在 System.Net.ServicePoint.ConnectSocketInternal(Boolean connectFailure, Socket s4, Socket s6, Socket& socket, IPAddress& address, ConnectSocketState state, IAsyncResult asyncResult, Exception& exception)
   --- 内部异常堆栈跟踪的结尾 ---
   在 Elight.Web.Areas.TestCenterSystem.Controllers.InGroupController.ExecuteUrl(String url, DateTime startTime, DateTime endTime, String patientNo)
   在 Elight.Web.Areas.TestCenterSystem.Controllers.InGroupController.Do(String url, String primaryKey)', N'超级管理员', CAST(N'2017-08-17T18:24:30.580' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10028, 10003, 2, NULL, NULL, NULL, NULL, N'System.UriFormatException: 无效的 URI: URI 方案无效。
   在 Elight.Web.Areas.TestCenterSystem.Controllers.InGroupController.ExecuteUrl(String url, DateTime startTime, DateTime endTime, String patientNo) 位置 D:\华据医疗\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\InGroup\InGroupController.cs:行号 343
   在 Elight.Web.Areas.TestCenterSystem.Controllers.InGroupController.Test(String primaryKey, TestParamViewModel model) 位置 D:\华据医疗\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\InGroup\InGroupController.cs:行号 158', N'超级管理员', CAST(N'2017-08-17T18:53:03.697' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10029, 10003, 2, NULL, NULL, NULL, NULL, N'System.UriFormatException: 无效的 URI: URI 方案无效。
   在 Elight.Web.Areas.TestCenterSystem.Controllers.InGroupController.ExecuteUrl(String url, DateTime startTime, DateTime endTime, String patientNo) 位置 D:\华据医疗\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\InGroup\InGroupController.cs:行号 343
   在 Elight.Web.Areas.TestCenterSystem.Controllers.InGroupController.Test(String primaryKey, TestParamViewModel model) 位置 D:\华据医疗\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\InGroup\InGroupController.cs:行号 158', N'超级管理员', CAST(N'2017-08-17T18:53:08.517' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10030, 10003, 2, NULL, NULL, NULL, NULL, N'System.UriFormatException: 无效的 URI: URI 方案无效。
   在 Elight.Web.Areas.TestCenterSystem.Controllers.InGroupController.ExecuteUrl(String url, DateTime startTime, DateTime endTime, String patientNo) 位置 D:\华据医疗\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\InGroup\InGroupController.cs:行号 343
   在 Elight.Web.Areas.TestCenterSystem.Controllers.InGroupController.Test(String primaryKey, TestParamViewModel model) 位置 D:\华据医疗\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\InGroup\InGroupController.cs:行号 158', N'超级管理员', CAST(N'2017-08-17T18:53:23.760' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10031, 10003, 2, NULL, NULL, NULL, NULL, N'System.UriFormatException: 无效的 URI: URI 方案无效。
   在 Elight.Web.Areas.TestCenterSystem.Controllers.InGroupController.ExecuteUrl(String url, DateTime startTime, DateTime endTime, String patientNo) 位置 D:\华据医疗\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\InGroup\InGroupController.cs:行号 343
   在 Elight.Web.Areas.TestCenterSystem.Controllers.InGroupController.Test(String primaryKey, TestParamViewModel model) 位置 D:\华据医疗\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\InGroup\InGroupController.cs:行号 158', N'超级管理员', CAST(N'2017-08-17T18:54:05.457' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10032, 10003, 2, NULL, NULL, NULL, NULL, N'System.UriFormatException: 无效的 URI: URI 方案无效。
   在 Elight.Web.Areas.TestCenterSystem.Controllers.InGroupController.ExecuteUrl(String url, DateTime startTime, DateTime endTime, String patientNo) 位置 D:\华据医疗\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\InGroup\InGroupController.cs:行号 343
   在 Elight.Web.Areas.TestCenterSystem.Controllers.InGroupController.Test(String primaryKey, TestParamViewModel model) 位置 D:\华据医疗\CDSVN\00.共通框架\02.源代码3.0\TestingCenterSystem.MVC\project\Elight.Web\Areas\TestCenterSystem\Controllers\InGroup\InGroupController.cs:行号 158', N'超级管理员', CAST(N'2017-08-17T18:54:43.340' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10033, 10003, 1, N'http://localhost:18226/api/CRCOP02Api', NULL, NULL, NULL, N'数据项执行失败！异常信息：基础提供程序在 Open 上失败。', N'超级管理员', CAST(N'2017-08-17T18:59:37.643' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10034, 10003, 1, N'http://localhost:18226/api/CRCOP02Api', NULL, NULL, NULL, N'数据项执行失败！异常信息：基础提供程序在 Open 上失败。', N'超级管理员', CAST(N'2017-08-17T19:02:50.957' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10035, 10003, 1, N'http://localhost:18226/api/CRCOP02Api', NULL, NULL, NULL, N'数据项执行失败！异常信息：基础提供程序在 Open 上失败。', N'超级管理员', CAST(N'2017-08-17T19:07:49.070' AS DateTime))
INSERT [dbo].[PDP_ERROR_LOG] ([ERROR_LOG_ID], [SD_ID], [PROC_TYPE], [PROC_URL], [DLL_NAME], [CLASS_NAME], [FUNC_NAME], [ERR_CONTENT], [UPD_USER_ID], [UPD_DATE]) VALUES (10036, 10003, 1, N'http://localhost:18226/api/CRCOP02Api', NULL, NULL, NULL, N'数据项执行失败！异常信息：基础提供程序在 Open 上失败。', N'超级管理员', CAST(N'2017-08-17T19:23:58.217' AS DateTime))
SET IDENTITY_INSERT [dbo].[PDP_ERROR_LOG] OFF
SET IDENTITY_INSERT [dbo].[PDP_PROC_LOG] ON 

INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10000, 10002, N'3', N'10005', N'超级管理员', CAST(N'2017-08-17T11:07:00.680' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10001, 10002, N'3', N'10005', N'超级管理员', CAST(N'2017-08-17T15:49:59.430' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, 10002, N'3', N'10005', N'超级管理员', CAST(N'2017-08-17T15:50:08.587' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10003, 10002, N'3', N'10005', N'超级管理员', CAST(N'2017-08-17T15:50:30.367' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10004, 10002, N'3', N'10005', N'超级管理员', CAST(N'2017-08-17T15:50:39.077' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10005, 10002, N'3', N'10005', N'超级管理员', CAST(N'2017-08-17T15:51:02.660' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10006, 10003, N'2', N'10022', N'超级管理员', CAST(N'2017-08-17T15:53:54.877' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10007, 10002, N'3', N'10005', N'超级管理员', CAST(N'2017-08-17T15:54:03.190' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10008, 10002, N'3', N'10005', N'超级管理员', CAST(N'2017-08-17T15:56:35.710' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10009, 10002, N'3', N'10005', N'超级管理员', CAST(N'2017-08-17T16:00:23.153' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10010, 10002, N'3', N'10005', N'超级管理员', CAST(N'2017-08-17T16:03:38.537' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10011, 10002, N'3', N'10005', N'超级管理员', CAST(N'2017-08-17T16:03:56.247' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10012, 10002, N'3', N'10005', N'超级管理员', CAST(N'2017-08-17T16:04:09.030' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10013, 10002, N'3', N'10037', N'超级管理员', CAST(N'2017-08-17T16:12:00.297' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10014, 10002, N'3', N'10037', N'超级管理员', CAST(N'2017-08-17T16:12:02.347' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10015, 10002, N'3', N'10037', N'超级管理员', CAST(N'2017-08-17T16:12:03.470' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10016, 10002, N'3', N'10005', N'超级管理员', CAST(N'2017-08-17T16:31:11.467' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10017, 10002, N'3', N'10005', N'超级管理员', CAST(N'2017-08-17T16:31:14.823' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10018, 10002, N'3', N'10005', N'超级管理员', CAST(N'2017-08-17T16:31:18.723' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, 10002, N'3', N'10005', N'超级管理员', CAST(N'2017-08-17T16:36:24.363' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10020, 10002, N'3', N'10005', N'超级管理员', CAST(N'2017-08-17T16:36:30.497' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10021, 10002, N'3', N'10005', N'超级管理员', CAST(N'2017-08-17T16:36:38.310' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, 10002, N'3', N'10005', N'超级管理员', CAST(N'2017-08-17T16:36:42.730' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10023, 10003, N'1', N'10018', N'超级管理员', CAST(N'2017-08-17T17:15:33.647' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10024, 10003, N'2', N'10022', N'超级管理员', CAST(N'2017-08-17T17:46:54.313' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10025, 10003, N'2', N'10022', N'超级管理员', CAST(N'2017-08-17T17:50:18.583' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10026, 10003, N'2', N'10022', N'超级管理员', CAST(N'2017-08-17T17:56:47.090' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10027, 10003, N'3', N'10044', N'超级管理员', CAST(N'2017-08-17T18:10:50.117' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10028, 10003, N'1', N'10018', N'超级管理员', CAST(N'2017-08-17T18:35:00.740' AS DateTime))
INSERT [dbo].[PDP_PROC_LOG] ([PROC_LOG_ID], [SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10029, 10003, N'2', N'10022', N'超级管理员', CAST(N'2017-08-17T18:52:35.837' AS DateTime))
SET IDENTITY_INSERT [dbo].[PDP_PROC_LOG] OFF
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10001, N'1', N'10012', N'1', N'小高', CAST(N'2017-08-01T15:12:01.623' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10001, N'2', N'0', N'1', N'小高', CAST(N'2017-08-01T11:01:00.770' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10001, N'2', N'10024', N'1', N'小高', CAST(N'2017-08-01T11:29:52.997' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10001, N'2', N'10025', N'1', N'小高', CAST(N'2017-08-01T12:49:12.227' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10001, N'3', N'0', N'1', N'D1EF3DCD-2C7D-4E8F-8F29-9F73625DD5DF', CAST(N'2017-07-31T18:08:40.790' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10001, N'3', N'10002', N'3', NULL, NULL)
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10001, N'3', N'10011', N'3', NULL, NULL)
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10001, N'3', N'10012', N'3', NULL, NULL)
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10001, N'3', N'10013', N'3', NULL, NULL)
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10001, N'3', N'10032', N'1', N'D1EF3DCD-2C7D-4E8F-8F29-9F73625DD5DF', CAST(N'2017-07-31T18:12:09.330' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10001, N'3', N'10033', N'1', N'admin', CAST(N'2017-07-31T18:36:20.090' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10001, N'3', N'10034', N'1', N'小高', CAST(N'2017-08-01T09:30:50.383' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10001, N'3', N'10036', N'1', N'小高', CAST(N'2017-08-01T10:38:03.330' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'1', N'10009', N'1', N'小高', CAST(N'2017-08-01T08:53:35.967' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'1', N'10013', N'1', N'小高', CAST(N'2017-08-01T15:44:25.673' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'1', N'10014', N'3', N'超级管理员', CAST(N'2017-08-11T11:57:34.367' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'1', N'10015', N'1', N'小高', CAST(N'2017-08-01T16:35:39.300' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'1', N'10016', N'3', N'超级管理员', CAST(N'2017-08-11T17:18:58.840' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'1', N'10017', N'1', N'小高', CAST(N'2017-08-01T16:43:17.063' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'1', N'10019', N'1', N'超级管理员', CAST(N'2017-08-17T10:32:07.030' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'1', N'10020', N'1', N'超级管理员', CAST(N'2017-08-17T10:32:23.160' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'2', N'10001', N'1', N'超级管理员', CAST(N'2017-08-09T17:26:29.573' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'2', N'10002', N'1', N'超级管理员', CAST(N'2017-08-09T17:26:29.573' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'2', N'10003', N'1', N'超级管理员', CAST(N'2017-08-09T17:26:29.573' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'2', N'10004', N'1', N'超级管理员', CAST(N'2017-08-09T17:26:29.573' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'2', N'10005', N'4', N'超级管理员', CAST(N'2017-08-17T16:36:47.017' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'2', N'10006', N'1', N'超级管理员', CAST(N'2017-08-09T17:26:29.573' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'2', N'10007', N'1', N'超级管理员', CAST(N'2017-08-09T17:26:29.573' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'2', N'10008', N'1', N'超级管理员', CAST(N'2017-08-09T17:26:29.573' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'2', N'10009', N'1', N'超级管理员', CAST(N'2017-08-09T17:26:29.573' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'2', N'10010', N'1', N'超级管理员', CAST(N'2017-08-09T17:26:29.573' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'2', N'10011', N'1', N'超级管理员', CAST(N'2017-08-09T17:26:29.573' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'2', N'10012', N'1', N'超级管理员', CAST(N'2017-08-09T17:26:29.573' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'2', N'10013', N'1', N'超级管理员', CAST(N'2017-08-09T17:26:29.573' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'2', N'10014', N'1', N'超级管理员', CAST(N'2017-08-09T17:26:29.573' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'2', N'10015', N'1', N'超级管理员', CAST(N'2017-08-09T17:26:29.573' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'2', N'10016', N'1', N'超级管理员', CAST(N'2017-08-09T17:26:29.573' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'2', N'10017', N'1', N'超级管理员', CAST(N'2017-08-09T17:26:29.573' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'3', N'10037', N'3', N'超级管理员', CAST(N'2017-08-17T16:22:22.350' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'3', N'10038', N'1', N'超级管理员', CAST(N'2017-08-10T09:26:11.107' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'3', N'10039', N'1', N'超级管理员', CAST(N'2017-08-11T15:37:59.053' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'3', N'10040', N'1', N'超级管理员', CAST(N'2017-08-11T15:38:33.040' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'3', N'10041', N'1', N'超级管理员', CAST(N'2017-08-11T15:39:00.853' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'3', N'10042', N'1', N'超级管理员', CAST(N'2017-08-14T18:00:25.813' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'3', N'10043', N'1', N'超级管理员', CAST(N'2017-08-14T18:14:36.837' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'3', N'10045', N'1', N'超级管理员', CAST(N'2017-08-17T10:42:28.370' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'3', N'10046', N'3', N'超级管理员', CAST(N'2017-08-17T16:11:13.080' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10003, N'1', N'10018', N'2', N'超级管理员', CAST(N'2017-08-17T18:35:00.717' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10003, N'2', N'10018', N'1', N'超级管理员', CAST(N'2017-08-09T17:26:29.573' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10003, N'2', N'10019', N'1', N'超级管理员', CAST(N'2017-08-14T19:11:20.383' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10003, N'2', N'10020', N'1', N'超级管理员', CAST(N'2017-08-09T17:23:24.707' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10003, N'2', N'10021', N'1', N'超级管理员', CAST(N'2017-08-15T18:19:39.937' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10003, N'2', N'10022', N'4', N'超级管理员', CAST(N'2017-08-17T18:55:18.177' AS DateTime))
INSERT [dbo].[PDP_PROC_STAT] ([SD_ID], [PROC_CAT_CODE], [PROC_CONTENT_ID], [PROC_STAT_CODE], [UPD_USER_ID], [UPD_DATE]) VALUES (10003, N'3', N'10044', N'1', N'超级管理员', CAST(N'2017-08-16T15:53:57.903' AS DateTime))
SET IDENTITY_INSERT [dbo].[PDP_PROJECT] ON 

INSERT [dbo].[PDP_PROJECT] ([TC_PROJ_ID], [TC_PROJ_NAME], [IS_COMMON], [TC_PROJ_TYPE], [UPD_USER_ID], [UPD_DATE], [TC_PROJ_CODE]) VALUES (10001, N'上海瑞金', 0, 1, NULL, NULL, N'SHRJ')
INSERT [dbo].[PDP_PROJECT] ([TC_PROJ_ID], [TC_PROJ_NAME], [IS_COMMON], [TC_PROJ_TYPE], [UPD_USER_ID], [UPD_DATE], [TC_PROJ_CODE]) VALUES (10002, N'测试', 0, 1, N'超级管理员', CAST(N'2017-08-17T09:53:54.860' AS DateTime), N'TEST')
INSERT [dbo].[PDP_PROJECT] ([TC_PROJ_ID], [TC_PROJ_NAME], [IS_COMMON], [TC_PROJ_TYPE], [UPD_USER_ID], [UPD_DATE], [TC_PROJ_CODE]) VALUES (10003, N'质控-公共项目', 0, 1, N'超级管理员', CAST(N'2017-08-17T10:05:52.940' AS DateTime), N'COMMON')
SET IDENTITY_INSERT [dbo].[PDP_PROJECT] OFF
SET IDENTITY_INSERT [dbo].[SD_CAT_CONF] ON 

INSERT [dbo].[SD_CAT_CONF] ([CAT_ID], [CAT_CODE], [CAT_NAME], [CAT_TYPE_CODE], [CAT_TYPE_NAME], [CAT_PA_CODE], [CAT_PA_NAME], [CAT_SUB_CODE], [CAT_SUB_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10000, NULL, N'基本信息', N'1', N'数据项类别', N'SD_ITEM_COMMON', N'通用', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SD_CAT_CONF] ([CAT_ID], [CAT_CODE], [CAT_NAME], [CAT_TYPE_CODE], [CAT_TYPE_NAME], [CAT_PA_CODE], [CAT_PA_NAME], [CAT_SUB_CODE], [CAT_SUB_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10001, NULL, N'检查', N'1', N'数据项类别', N'SD_ITEM_COMMON', N'通用', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SD_CAT_CONF] ([CAT_ID], [CAT_CODE], [CAT_NAME], [CAT_TYPE_CODE], [CAT_TYPE_NAME], [CAT_PA_CODE], [CAT_PA_NAME], [CAT_SUB_CODE], [CAT_SUB_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, NULL, N'检验', N'1', N'数据项类别', N'SD_ITEM_COMMON', N'通用', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SD_CAT_CONF] ([CAT_ID], [CAT_CODE], [CAT_NAME], [CAT_TYPE_CODE], [CAT_TYPE_NAME], [CAT_PA_CODE], [CAT_PA_NAME], [CAT_SUB_CODE], [CAT_SUB_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10003, NULL, N'医嘱', N'1', N'数据项类别', N'SD_ITEM_COMMON', N'通用', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SD_CAT_CONF] ([CAT_ID], [CAT_CODE], [CAT_NAME], [CAT_TYPE_CODE], [CAT_TYPE_NAME], [CAT_PA_CODE], [CAT_PA_NAME], [CAT_SUB_CODE], [CAT_SUB_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10004, NULL, N'病理', N'1', N'数据项类别', N'SD_ITEM_COMMON', N'通用', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SD_CAT_CONF] ([CAT_ID], [CAT_CODE], [CAT_NAME], [CAT_TYPE_CODE], [CAT_TYPE_NAME], [CAT_PA_CODE], [CAT_PA_NAME], [CAT_SUB_CODE], [CAT_SUB_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10005, NULL, N'基本资料', N'1', N'数据项类别', N'SD_ITEM_COMMON', N'通用', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SD_CAT_CONF] ([CAT_ID], [CAT_CODE], [CAT_NAME], [CAT_TYPE_CODE], [CAT_TYPE_NAME], [CAT_PA_CODE], [CAT_PA_NAME], [CAT_SUB_CODE], [CAT_SUB_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10006, NULL, N'患者病史', N'1', N'数据项类别', N'SD_ITEM_COMMON', N'通用', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SD_CAT_CONF] ([CAT_ID], [CAT_CODE], [CAT_NAME], [CAT_TYPE_CODE], [CAT_TYPE_NAME], [CAT_PA_CODE], [CAT_PA_NAME], [CAT_SUB_CODE], [CAT_SUB_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10007, NULL, N'临床表现', N'1', N'数据项类别', N'SD_ITEM_COMMON', N'通用', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SD_CAT_CONF] ([CAT_ID], [CAT_CODE], [CAT_NAME], [CAT_TYPE_CODE], [CAT_TYPE_NAME], [CAT_PA_CODE], [CAT_PA_NAME], [CAT_SUB_CODE], [CAT_SUB_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10008, NULL, N'查体', N'1', N'数据项类别', N'SD_ITEM_COMMON', N'通用', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SD_CAT_CONF] ([CAT_ID], [CAT_CODE], [CAT_NAME], [CAT_TYPE_CODE], [CAT_TYPE_NAME], [CAT_PA_CODE], [CAT_PA_NAME], [CAT_SUB_CODE], [CAT_SUB_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10009, NULL, N'血便常规检查', N'1', N'数据项类别', N'SD_ITEM_COMMON', N'通用', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SD_CAT_CONF] ([CAT_ID], [CAT_CODE], [CAT_NAME], [CAT_TYPE_CODE], [CAT_TYPE_NAME], [CAT_PA_CODE], [CAT_PA_NAME], [CAT_SUB_CODE], [CAT_SUB_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10010, NULL, N'肝肾功能检查', N'1', N'数据项类别', N'SD_ITEM_COMMON', N'通用', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SD_CAT_CONF] ([CAT_ID], [CAT_CODE], [CAT_NAME], [CAT_TYPE_CODE], [CAT_TYPE_NAME], [CAT_PA_CODE], [CAT_PA_NAME], [CAT_SUB_CODE], [CAT_SUB_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10011, NULL, N'肝肾功能检查', N'2', N'数据项类别', N'SELF_DATAITME1', N'自定义数据项类别1', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SD_CAT_CONF] ([CAT_ID], [CAT_CODE], [CAT_NAME], [CAT_TYPE_CODE], [CAT_TYPE_NAME], [CAT_PA_CODE], [CAT_PA_NAME], [CAT_SUB_CODE], [CAT_SUB_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10012, NULL, N'肝肾功能检查', N'2', N'数据项类别', N'SELF_DATAITME2', N'自定义数据项类别2', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SD_CAT_CONF] ([CAT_ID], [CAT_CODE], [CAT_NAME], [CAT_TYPE_CODE], [CAT_TYPE_NAME], [CAT_PA_CODE], [CAT_PA_NAME], [CAT_SUB_CODE], [CAT_SUB_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10013, NULL, N'肝肾功能检查', N'3', N'数据项类别', N'KPI_DIC1', N'评价指标分类1', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SD_CAT_CONF] ([CAT_ID], [CAT_CODE], [CAT_NAME], [CAT_TYPE_CODE], [CAT_TYPE_NAME], [CAT_PA_CODE], [CAT_PA_NAME], [CAT_SUB_CODE], [CAT_SUB_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10014, NULL, N'肝肾功能检查', N'3', N'数据项类别', N'KPI_DIC2', N'评价指标分类2', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SD_CAT_CONF] ([CAT_ID], [CAT_CODE], [CAT_NAME], [CAT_TYPE_CODE], [CAT_TYPE_NAME], [CAT_PA_CODE], [CAT_PA_NAME], [CAT_SUB_CODE], [CAT_SUB_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10015, NULL, N'肝肾功能检查', N'1', N'数据项类别', N'SD_ITEM_COMMON3', N'通用', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SD_CAT_CONF] OFF
SET IDENTITY_INSERT [dbo].[SD_CPAT_DETAIL] ON 

INSERT [dbo].[SD_CPAT_DETAIL] ([DETAIL_ID], [SD_ID], [SD_CPAT_NO], [PATIENT_NO], [IN_FLAG], [BASE_FLAG], [PATIENT_ID], [IN_DATE], [OUT_DATE], [UPD_USER_ID], [UPD_DATE]) VALUES (765, 10002, N'CRC_1_13010800000024', N'13010800000024', N'1', 0, N'N01136863         ', CAST(N'2013-01-08T14:58:51.000' AS DateTime), CAST(N'2017-05-29T09:00:00.000' AS DateTime), N'超级管理员', CAST(N'2017-08-17T10:34:48.000' AS DateTime))
INSERT [dbo].[SD_CPAT_DETAIL] ([DETAIL_ID], [SD_ID], [SD_CPAT_NO], [PATIENT_NO], [IN_FLAG], [BASE_FLAG], [PATIENT_ID], [IN_DATE], [OUT_DATE], [UPD_USER_ID], [UPD_DATE]) VALUES (766, 10002, N'CRC_1_13011600000003', N'13011600000003', N'1', 0, N'6006722789        ', CAST(N'2013-01-16T08:29:05.000' AS DateTime), CAST(N'2017-07-24T09:00:00.000' AS DateTime), N'超级管理员', CAST(N'2017-08-17T10:34:56.000' AS DateTime))
INSERT [dbo].[SD_CPAT_DETAIL] ([DETAIL_ID], [SD_ID], [SD_CPAT_NO], [PATIENT_NO], [IN_FLAG], [BASE_FLAG], [PATIENT_ID], [IN_DATE], [OUT_DATE], [UPD_USER_ID], [UPD_DATE]) VALUES (767, 10002, N'CRC_1_13012400000013', N'13012400000013', N'1', 0, N'5001711962        ', CAST(N'2013-01-24T11:05:14.000' AS DateTime), CAST(N'2017-07-24T09:00:00.000' AS DateTime), N'超级管理员', CAST(N'2017-08-17T10:34:56.000' AS DateTime))
INSERT [dbo].[SD_CPAT_DETAIL] ([DETAIL_ID], [SD_ID], [SD_CPAT_NO], [PATIENT_NO], [IN_FLAG], [BASE_FLAG], [PATIENT_ID], [IN_DATE], [OUT_DATE], [UPD_USER_ID], [UPD_DATE]) VALUES (768, 10002, N'CRC_1_13012800000015', N'13012800000015', N'1', 0, N'N00122654         ', CAST(N'2013-01-28T15:06:28.000' AS DateTime), CAST(N'2017-07-24T09:00:00.000' AS DateTime), N'超级管理员', CAST(N'2017-08-17T10:34:56.000' AS DateTime))
INSERT [dbo].[SD_CPAT_DETAIL] ([DETAIL_ID], [SD_ID], [SD_CPAT_NO], [PATIENT_NO], [IN_FLAG], [BASE_FLAG], [PATIENT_ID], [IN_DATE], [OUT_DATE], [UPD_USER_ID], [UPD_DATE]) VALUES (773, 10003, N'CRC_1_13010800000024', N'13010800000024', N'1', 0, N'N01136863         ', CAST(N'2013-01-08T14:58:51.000' AS DateTime), CAST(N'2017-05-29T09:00:00.000' AS DateTime), N'超级管理员', CAST(N'2017-08-17T17:15:27.000' AS DateTime))
INSERT [dbo].[SD_CPAT_DETAIL] ([DETAIL_ID], [SD_ID], [SD_CPAT_NO], [PATIENT_NO], [IN_FLAG], [BASE_FLAG], [PATIENT_ID], [IN_DATE], [OUT_DATE], [UPD_USER_ID], [UPD_DATE]) VALUES (774, 10003, N'CRC_1_13011600000003', N'13011600000003', N'1', 0, N'6006722789        ', CAST(N'2013-01-16T08:29:05.000' AS DateTime), CAST(N'2017-07-24T09:00:00.000' AS DateTime), N'超级管理员', CAST(N'2017-08-17T17:15:33.000' AS DateTime))
INSERT [dbo].[SD_CPAT_DETAIL] ([DETAIL_ID], [SD_ID], [SD_CPAT_NO], [PATIENT_NO], [IN_FLAG], [BASE_FLAG], [PATIENT_ID], [IN_DATE], [OUT_DATE], [UPD_USER_ID], [UPD_DATE]) VALUES (775, 10003, N'CRC_1_13012400000013', N'13012400000013', N'1', 0, N'5001711962        ', CAST(N'2013-01-24T11:05:14.000' AS DateTime), CAST(N'2017-07-24T09:00:00.000' AS DateTime), N'超级管理员', CAST(N'2017-08-17T17:15:33.000' AS DateTime))
INSERT [dbo].[SD_CPAT_DETAIL] ([DETAIL_ID], [SD_ID], [SD_CPAT_NO], [PATIENT_NO], [IN_FLAG], [BASE_FLAG], [PATIENT_ID], [IN_DATE], [OUT_DATE], [UPD_USER_ID], [UPD_DATE]) VALUES (776, 10003, N'CRC_1_13012800000015', N'13012800000015', N'1', 0, N'N00122654         ', CAST(N'2013-01-28T15:06:28.000' AS DateTime), CAST(N'2017-07-24T09:00:00.000' AS DateTime), N'超级管理员', CAST(N'2017-08-17T17:15:33.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[SD_CPAT_DETAIL] OFF
INSERT [dbo].[SD_CPATS] ([SD_ID], [SD_CPAT_NO], [SD_FILTER_ID], [SD_CODE], [SD_CPAT_DATE], [PATIENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10001, N'10001', 123, N'YXA', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'PAT_001', NULL, NULL)
INSERT [dbo].[SD_CPATS] ([SD_ID], [SD_CPAT_NO], [SD_FILTER_ID], [SD_CODE], [SD_CPAT_DATE], [PATIENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10001, N'10002', 123, N'YXA', CAST(N'2017-01-05T00:00:00.000' AS DateTime), N'PAT_001', NULL, NULL)
INSERT [dbo].[SD_CPATS] ([SD_ID], [SD_CPAT_NO], [SD_FILTER_ID], [SD_CODE], [SD_CPAT_DATE], [PATIENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10001, N'10003', 123, N'YXA', CAST(N'2017-01-04T00:00:00.000' AS DateTime), N'PAT_001', NULL, NULL)
INSERT [dbo].[SD_CPATS] ([SD_ID], [SD_CPAT_NO], [SD_FILTER_ID], [SD_CODE], [SD_CPAT_DATE], [PATIENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'10004', 123, N'YXA', CAST(N'2017-01-03T00:00:00.000' AS DateTime), N'13011500000003', NULL, NULL)
INSERT [dbo].[SD_CPATS] ([SD_ID], [SD_CPAT_NO], [SD_FILTER_ID], [SD_CODE], [SD_CPAT_DATE], [PATIENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'10005', 123, N'YXA', CAST(N'2017-01-02T00:00:00.000' AS DateTime), N'13011600000003', NULL, NULL)
INSERT [dbo].[SD_CPATS] ([SD_ID], [SD_CPAT_NO], [SD_FILTER_ID], [SD_CODE], [SD_CPAT_DATE], [PATIENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'10006', 123, N'YXA', CAST(N'2017-01-11T00:00:00.000' AS DateTime), N'13011700000002', NULL, NULL)
INSERT [dbo].[SD_CPATS] ([SD_ID], [SD_CPAT_NO], [SD_FILTER_ID], [SD_CODE], [SD_CPAT_DATE], [PATIENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'CRC_1_13010800000024', 10018, N'CRC', CAST(N'2017-08-17T10:34:38.000' AS DateTime), N'N01136863         ', N'超级管理员', CAST(N'2017-08-17T10:34:48.000' AS DateTime))
INSERT [dbo].[SD_CPATS] ([SD_ID], [SD_CPAT_NO], [SD_FILTER_ID], [SD_CODE], [SD_CPAT_DATE], [PATIENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'CRC_1_13011600000003', 10018, N'CRC', CAST(N'2017-08-17T10:34:50.000' AS DateTime), N'6006722789        ', N'超级管理员', CAST(N'2017-08-17T10:34:55.000' AS DateTime))
INSERT [dbo].[SD_CPATS] ([SD_ID], [SD_CPAT_NO], [SD_FILTER_ID], [SD_CODE], [SD_CPAT_DATE], [PATIENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'CRC_1_13012400000013', 10018, N'CRC', CAST(N'2017-08-17T10:34:50.000' AS DateTime), N'5001711962        ', N'超级管理员', CAST(N'2017-08-17T10:34:55.000' AS DateTime))
INSERT [dbo].[SD_CPATS] ([SD_ID], [SD_CPAT_NO], [SD_FILTER_ID], [SD_CODE], [SD_CPAT_DATE], [PATIENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'CRC_1_13012800000015', 10018, N'CRC', CAST(N'2017-08-17T10:34:50.000' AS DateTime), N'N00122654         ', N'超级管理员', CAST(N'2017-08-17T10:34:55.000' AS DateTime))
INSERT [dbo].[SD_CPATS] ([SD_ID], [SD_CPAT_NO], [SD_FILTER_ID], [SD_CODE], [SD_CPAT_DATE], [PATIENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10003, N'CRC_1_13010800000024', 10018, N'CRC', CAST(N'2017-08-17T17:15:23.000' AS DateTime), N'N01136863         ', N'超级管理员', CAST(N'2017-08-17T17:15:27.000' AS DateTime))
INSERT [dbo].[SD_CPATS] ([SD_ID], [SD_CPAT_NO], [SD_FILTER_ID], [SD_CODE], [SD_CPAT_DATE], [PATIENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10003, N'CRC_1_13011600000003', 10018, N'CRC', CAST(N'2017-08-17T17:15:29.000' AS DateTime), N'6006722789        ', N'超级管理员', CAST(N'2017-08-17T17:15:33.000' AS DateTime))
INSERT [dbo].[SD_CPATS] ([SD_ID], [SD_CPAT_NO], [SD_FILTER_ID], [SD_CODE], [SD_CPAT_DATE], [PATIENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10003, N'CRC_1_13012400000013', 10018, N'CRC', CAST(N'2017-08-17T17:15:29.000' AS DateTime), N'5001711962        ', N'超级管理员', CAST(N'2017-08-17T17:15:33.000' AS DateTime))
INSERT [dbo].[SD_CPATS] ([SD_ID], [SD_CPAT_NO], [SD_FILTER_ID], [SD_CODE], [SD_CPAT_DATE], [PATIENT_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10003, N'CRC_1_13012800000015', 10018, N'CRC', CAST(N'2017-08-17T17:15:29.000' AS DateTime), N'N00122654         ', N'超级管理员', CAST(N'2017-08-17T17:15:33.000' AS DateTime))
INSERT [dbo].[SD_EKPI_FORMULA] ([SD_EKPI_ID], [NUM_FORMULA], [FRA_FORMULA], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'P2', N'P2', NULL, NULL)
INSERT [dbo].[SD_EKPI_FORMULA] ([SD_EKPI_ID], [NUM_FORMULA], [FRA_FORMULA], [UPD_USER_ID], [UPD_DATE]) VALUES (10005, N'1', N'1 if ((P2-P3).TotalHours<=48) or ((P2-P4).TotalHours<=48)  else 0', N'小高', CAST(N'2017-08-02T14:09:06.707' AS DateTime))
INSERT [dbo].[SD_EKPI_FORMULA] ([SD_EKPI_ID], [NUM_FORMULA], [FRA_FORMULA], [UPD_USER_ID], [UPD_DATE]) VALUES (10044, N'P2', N'P1', N'超级管理员', CAST(N'2017-08-17T18:10:45.117' AS DateTime))
SET IDENTITY_INSERT [dbo].[SD_EKPI_INFO] ON 

INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10000, NULL, NULL, N'YXA_001', N'评价指标1', N'qwe', 12, 10000, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10001, NULL, NULL, N'YXA_002', N'评价指标2', N'123', 1, 10002, 1, N'123', NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, NULL, NULL, N'YXA_003', N'评价指标3', N'asdf', 23, 10001, 1, N'sdfasd', NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10003, NULL, NULL, N'YXA_004', N'评价指标4', N'qwe', 123, 10001, 1, N'4', NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10004, NULL, NULL, N'YXA_005', N'评价指标5', N'56', 56, 10001, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10005, 10002, N'YXA', N'YXA_006', N'评价指标6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10006, NULL, NULL, N'YXA_007', N'评价指标7', N'666', 123, 10001, 1, N'123', NULL, NULL, NULL, 0, NULL, N'小高', CAST(N'2017-08-02T15:19:50.500' AS DateTime))
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10007, NULL, NULL, N'YXA_008', N'评价指标8', N'asdf', 2, 10001, 1, NULL, 1, 1, 1, 0, NULL, N'超级管理员', CAST(N'2017-08-04T18:46:21.483' AS DateTime))
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10008, NULL, NULL, N'YXA_009', N'评价指标9', N'12', 12, 10001, 1, NULL, 1, 1, 1, 0, NULL, N'超级管理员', CAST(N'2017-08-04T19:10:00.920' AS DateTime))
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10009, NULL, NULL, N'YXA_0010', N'评价指标10', N'qwe', 123, 10002, 1, NULL, 0, 0, 0, 0, NULL, N'超级管理员', CAST(N'2017-08-04T18:58:06.540' AS DateTime))
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10010, NULL, NULL, N'YXA_0011', N'评价指标11', N'123', 123, 10001, 1, NULL, 1, 1, 1, 0, NULL, N'超级管理员', CAST(N'2017-08-04T19:14:55.050' AS DateTime))
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10011, NULL, NULL, N'YXA_0012', N'评价指标12', N'123', 123, 10001, 1, NULL, 1, 1, 0, 0, NULL, N'超级管理员', CAST(N'2017-08-04T19:31:59.843' AS DateTime))
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10012, NULL, NULL, N'YXA_0013', N'评价指标13', N'123', 123, 10001, 0, N'说到函数式编程，大家可能第一印象都是学院派的那些晦涩难懂的代码，充满了一大堆抽象的不知所云的符号，似乎只有大学里的计算机教授才会使用这些东西。在曾经的某个时代可能确实如此，但是近年来随着技术的发展，函数式编程已经在实际生产中发挥巨大的作用了，越来越多的语言开始加入闭包，匿名函数等非常典型的函数式编程的特性，从某种程度上来讲，函数式编程正在逐步“同化”命令式编程。', 1, 0, 0, 0, NULL, N'超级管理员', CAST(N'2017-08-08T15:35:06.910' AS DateTime))
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10013, NULL, NULL, N'YXA_0014', N'评价指标14', N'YXA_0014', 0, 10001, 0, N'YXA_0014', 0, 0, 1, 0, NULL, N'超级管理员', CAST(N'2017-08-10T14:59:44.583' AS DateTime))
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10014, 10001, N'YXA', N'YXA_0015', N'评价指标15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10015, 10001, N'YXA', N'YXA_0016', N'评价指标16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10016, 10001, N'YXA', N'YXA_0017', N'评价指标17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10017, 10001, N'YXA', N'YXA_0018', N'评价指标18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10018, 10001, N'YXA', N'YXA_0019', N'评价指标19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, 10001, N'YXA', N'YXA_0020', N'评价指标20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10020, 10001, N'YXA', N'YXA_0021', N'评价指标21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10021, 10001, N'YXA', N'YXA_0022', N'评价指标22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10023, 10001, N'YXA', N'YXA_0024', N'评价指标24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10024, 10001, N'YXA', N'YXA_0025', N'评价指标25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10025, 10001, N'YXA', N'YXA_0026', N'评价指标26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10026, 10002, N'YXA', N'YXA_0027', N'评价指标27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10027, 10002, N'YXA', N'YXA_0028', N'评价指标28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10028, 10002, N'YXA', N'YXA_0029', N'评价指标29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10029, 10002, N'YXA', N'YXA_0030', N'评价指标30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10030, NULL, NULL, N'YXA_0123', N'CESHI', N'CESHI', 123, 10004, 0, N'123', NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10031, NULL, NULL, N'asdf', N'asdf', N'asdf', 213, 10000, 1, N'说到函数式编程，大家可能第一印象都是学院派的那些晦涩难懂的代码，充满了一大堆抽象的不知所云的符号，似乎只有大学里的计算机教授才会使用这些东西。在曾经的某个时代可能确实如此，但是近年来随着技术的发展，函数式编程已经在实际生产中发挥巨大的作用了，越来越多的语言开始加入闭包，匿名函数等非常典型的函数式编程的特性，从某种程度上来讲，函数式编程正在逐步“同化”命令式编程。', NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10032, NULL, NULL, N'asdf', N'asdf', N'asdf', 324, 10002, 1, N'zxcvzxcv', NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10033, NULL, NULL, N'qq', N'q', N'qq', 34, 10001, 1, N'qq', NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10034, 10001, N'YXA', N'66', N'66', N'66', 66, 10000, 1, N'66', NULL, NULL, NULL, 0, NULL, N'小高', CAST(N'2017-08-01T09:30:45.873' AS DateTime))
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10035, 10001, N'YXA', N'23333', N'23333', N'23333', 34, 10001, 1, N'23333', NULL, NULL, NULL, 0, NULL, N'小高', CAST(N'2017-08-01T10:09:34.120' AS DateTime))
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10036, 10001, N'YXA', N'555', N'55', N'55', 55, 10001, 1, NULL, NULL, NULL, NULL, 0, NULL, N'小高', CAST(N'2017-08-01T10:37:56.697' AS DateTime))
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10037, 10002, N'YXA', N'asd', N'asd', N'asd', 213, 10000, 1, N'qwerwqer', 0, 1, 0, 0, NULL, N'超级管理员', CAST(N'2017-08-11T15:36:26.163' AS DateTime))
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10038, NULL, NULL, N'asd', N'asd', N'asd', 213, 10000, 0, N'qwerwqer', 0, 1, 0, 0, NULL, N'超级管理员', CAST(N'2017-08-17T10:42:53.013' AS DateTime))
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10039, 10002, N'YXA', N'123123', N'123', N'123', 123, 10000, 1, N'123', 0, 1, 0, 0, NULL, N'超级管理员', CAST(N'2017-08-11T15:37:57.447' AS DateTime))
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10040, 10002, N'YXA', N'er', N'er', N'er', 123, 10002, 1, N'er', 0, 1, 0, 0, NULL, N'超级管理员', CAST(N'2017-08-11T15:38:32.960' AS DateTime))
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10041, 10002, N'YXA', N'we', N'we', N'we', 23, 10001, 1, N'we', 0, 1, 0, 0, NULL, N'超级管理员', CAST(N'2017-08-11T15:39:00.827' AS DateTime))
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10043, 10002, N'YXA', N'qwe', N'qwe', N'qwe', 21, 10000, 1, N'fsdsdf', 0, 1, 0, 0, NULL, N'超级管理员', CAST(N'2017-08-14T18:14:36.800' AS DateTime))
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10044, 10003, N'CRC', N'123', N'123', N'123', 123, 10000, 1, N'123', 1, 0, 1, 0, NULL, N'超级管理员', CAST(N'2017-08-16T15:53:57.853' AS DateTime))
INSERT [dbo].[SD_EKPI_INFO] ([SD_EKPI_ID], [SD_ID], [SD_CODE], [SD_EKPI_CODE], [SD_EKPI_NAME], [SD_EKPI_ALIAS], [ORDER_NO], [SD_EKPI_CAT], [IS_POSITIVE], [SD_EKPI_ALGO], [IS_RSN], [IS_DISTRIBUTION], [IS_TREND], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE]) VALUES (10045, NULL, NULL, N'11111', N'11111', N'11111', 11111, 10001, 0, NULL, 1, 1, 1, 0, NULL, N'超级管理员', CAST(N'2017-08-17T10:42:45.120' AS DateTime))
SET IDENTITY_INSERT [dbo].[SD_EKPI_INFO] OFF
INSERT [dbo].[SD_EKPI_PARAM] ([SD_EKPI_ID], [SD_ITEM_ID], [SD_EKPI_PARAM_NAME], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, 10004, N'P2', NULL, NULL)
INSERT [dbo].[SD_EKPI_PARAM] ([SD_EKPI_ID], [SD_ITEM_ID], [SD_EKPI_PARAM_NAME], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, 10005, N'P3', NULL, NULL)
INSERT [dbo].[SD_EKPI_PARAM] ([SD_EKPI_ID], [SD_ITEM_ID], [SD_EKPI_PARAM_NAME], [UPD_USER_ID], [UPD_DATE]) VALUES (10005, 10004, N'P2', N'小高', CAST(N'2017-08-02T09:05:38.057' AS DateTime))
INSERT [dbo].[SD_EKPI_PARAM] ([SD_EKPI_ID], [SD_ITEM_ID], [SD_EKPI_PARAM_NAME], [UPD_USER_ID], [UPD_DATE]) VALUES (10005, 10005, N'P3', N'小高', CAST(N'2017-08-02T09:16:41.577' AS DateTime))
INSERT [dbo].[SD_EKPI_PARAM] ([SD_EKPI_ID], [SD_ITEM_ID], [SD_EKPI_PARAM_NAME], [UPD_USER_ID], [UPD_DATE]) VALUES (10005, 10006, N'P4', N'小高', CAST(N'2017-08-02T09:16:43.253' AS DateTime))
INSERT [dbo].[SD_EKPI_PARAM] ([SD_EKPI_ID], [SD_ITEM_ID], [SD_EKPI_PARAM_NAME], [UPD_USER_ID], [UPD_DATE]) VALUES (10014, 10007, N'P1', N'超级管理员', CAST(N'2017-08-14T18:16:52.303' AS DateTime))
INSERT [dbo].[SD_EKPI_PARAM] ([SD_EKPI_ID], [SD_ITEM_ID], [SD_EKPI_PARAM_NAME], [UPD_USER_ID], [UPD_DATE]) VALUES (10014, 10008, N'P2', N'超级管理员', CAST(N'2017-08-14T18:16:53.647' AS DateTime))
INSERT [dbo].[SD_EKPI_PARAM] ([SD_EKPI_ID], [SD_ITEM_ID], [SD_EKPI_PARAM_NAME], [UPD_USER_ID], [UPD_DATE]) VALUES (10030, 10003, N'P1', N'超级管理员', CAST(N'2017-08-10T09:26:41.953' AS DateTime))
INSERT [dbo].[SD_EKPI_PARAM] ([SD_EKPI_ID], [SD_ITEM_ID], [SD_EKPI_PARAM_NAME], [UPD_USER_ID], [UPD_DATE]) VALUES (10030, 10004, N'P2', N'超级管理员', CAST(N'2017-08-10T09:26:42.697' AS DateTime))
INSERT [dbo].[SD_EKPI_PARAM] ([SD_EKPI_ID], [SD_ITEM_ID], [SD_EKPI_PARAM_NAME], [UPD_USER_ID], [UPD_DATE]) VALUES (10030, 10005, N'P3', N'超级管理员', CAST(N'2017-08-10T09:26:43.350' AS DateTime))
INSERT [dbo].[SD_EKPI_PARAM] ([SD_EKPI_ID], [SD_ITEM_ID], [SD_EKPI_PARAM_NAME], [UPD_USER_ID], [UPD_DATE]) VALUES (10030, 10007, N'P4', N'超级管理员', CAST(N'2017-08-10T09:26:51.077' AS DateTime))
INSERT [dbo].[SD_EKPI_PARAM] ([SD_EKPI_ID], [SD_ITEM_ID], [SD_EKPI_PARAM_NAME], [UPD_USER_ID], [UPD_DATE]) VALUES (10044, 10019, N'P3', N'超级管理员', CAST(N'2017-08-17T18:02:36.247' AS DateTime))
INSERT [dbo].[SD_EKPI_PARAM] ([SD_EKPI_ID], [SD_ITEM_ID], [SD_EKPI_PARAM_NAME], [UPD_USER_ID], [UPD_DATE]) VALUES (10044, 10021, N'P1', N'超级管理员', CAST(N'2017-08-17T18:02:52.037' AS DateTime))
INSERT [dbo].[SD_EKPI_PARAM] ([SD_EKPI_ID], [SD_ITEM_ID], [SD_EKPI_PARAM_NAME], [UPD_USER_ID], [UPD_DATE]) VALUES (10044, 10027, N'P2', N'超级管理员', CAST(N'2017-08-16T15:54:17.943' AS DateTime))
INSERT [dbo].[SD_EPKI_VALUE] ([SD_EKPI_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [INDEX_VALUE], [RSN_FLAG], [UPD_USER_ID], [UPD_DATE]) VALUES (10005, N'10004', 10002, N'YXA', 1, NULL, N'超级管理员', CAST(N'2017-08-17T16:36:46.753' AS DateTime))
INSERT [dbo].[SD_EPKI_VALUE] ([SD_EKPI_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [INDEX_VALUE], [RSN_FLAG], [UPD_USER_ID], [UPD_DATE]) VALUES (10005, N'10005', 10002, N'YXA', 1, NULL, N'超级管理员', CAST(N'2017-08-17T16:36:46.803' AS DateTime))
INSERT [dbo].[SD_EPKI_VALUE] ([SD_EKPI_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [INDEX_VALUE], [RSN_FLAG], [UPD_USER_ID], [UPD_DATE]) VALUES (10005, N'10006', 10002, N'YXA', 1, NULL, N'超级管理员', CAST(N'2017-08-17T16:36:46.827' AS DateTime))
INSERT [dbo].[SD_EPKI_VALUE] ([SD_EKPI_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [INDEX_VALUE], [RSN_FLAG], [UPD_USER_ID], [UPD_DATE]) VALUES (10005, N'CRC_1_13010800000024', 10002, N'YXA', 1, NULL, N'超级管理员', CAST(N'2017-08-17T16:36:46.883' AS DateTime))
INSERT [dbo].[SD_EPKI_VALUE] ([SD_EKPI_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [INDEX_VALUE], [RSN_FLAG], [UPD_USER_ID], [UPD_DATE]) VALUES (10005, N'CRC_1_13011600000003', 10002, N'YXA', 1, NULL, N'超级管理员', CAST(N'2017-08-17T16:36:46.907' AS DateTime))
INSERT [dbo].[SD_EPKI_VALUE] ([SD_EKPI_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [INDEX_VALUE], [RSN_FLAG], [UPD_USER_ID], [UPD_DATE]) VALUES (10005, N'CRC_1_13012400000013', 10002, N'YXA', 1, NULL, N'超级管理员', CAST(N'2017-08-17T16:36:46.930' AS DateTime))
INSERT [dbo].[SD_EPKI_VALUE] ([SD_EKPI_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [INDEX_VALUE], [RSN_FLAG], [UPD_USER_ID], [UPD_DATE]) VALUES (10005, N'CRC_1_13012800000015', 10002, N'YXA', 1, NULL, N'超级管理员', CAST(N'2017-08-17T16:36:46.967' AS DateTime))
SET IDENTITY_INSERT [dbo].[SD_FILTER_INFO] ON 

INSERT [dbo].[SD_FILTER_INFO] ([SD_FILTER_ID], [SD_ID], [SD_CODE], [SD_FILTER_CODE], [SD_FILTER_NAME], [ORDER_NO], [SD_FILTER_ALGO], [VALID_FLAG], [UPD_USER_ID], [UPD_DATE]) VALUES (10009, 10002, N'ACT', N'规则代码33333333', N'规则名称3333', 2, N'2222222222222222222代收款扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩', 0, N'小高', CAST(N'2017-08-01T11:10:46.777' AS DateTime))
INSERT [dbo].[SD_FILTER_INFO] ([SD_FILTER_ID], [SD_ID], [SD_CODE], [SD_FILTER_CODE], [SD_FILTER_NAME], [ORDER_NO], [SD_FILTER_ALGO], [VALID_FLAG], [UPD_USER_ID], [UPD_DATE]) VALUES (10010, 10002, N'ACT', N'规则代码02', N'规则名称02', 2, N'vvvvvvvvvvvvvvvvddsssssssssssssss得问无无   ', 1, N'小高', CAST(N'2017-08-01T09:08:32.120' AS DateTime))
INSERT [dbo].[SD_FILTER_INFO] ([SD_FILTER_ID], [SD_ID], [SD_CODE], [SD_FILTER_CODE], [SD_FILTER_NAME], [ORDER_NO], [SD_FILTER_ALGO], [VALID_FLAG], [UPD_USER_ID], [UPD_DATE]) VALUES (10012, 10001, N'YXA', N'skskksk', N'sssss', 1, N'ssssss', 0, N'小高', CAST(N'2017-08-01T15:12:01.563' AS DateTime))
INSERT [dbo].[SD_FILTER_INFO] ([SD_FILTER_ID], [SD_ID], [SD_CODE], [SD_FILTER_CODE], [SD_FILTER_NAME], [ORDER_NO], [SD_FILTER_ALGO], [VALID_FLAG], [UPD_USER_ID], [UPD_DATE]) VALUES (10013, 10002, N'YXA', N'规则代码', N'规则名称', 2, N'入组规则很抽象', 0, N'小高', CAST(N'2017-08-01T15:44:25.573' AS DateTime))
INSERT [dbo].[SD_FILTER_INFO] ([SD_FILTER_ID], [SD_ID], [SD_CODE], [SD_FILTER_CODE], [SD_FILTER_NAME], [ORDER_NO], [SD_FILTER_ALGO], [VALID_FLAG], [UPD_USER_ID], [UPD_DATE]) VALUES (10014, 10002, N'YXA', N'的发生的故事地方', N'过的方式告诉对方', 2, N'给对手犯规得分的方式', 1, N'小高', CAST(N'2017-08-01T15:58:12.770' AS DateTime))
INSERT [dbo].[SD_FILTER_INFO] ([SD_FILTER_ID], [SD_ID], [SD_CODE], [SD_FILTER_CODE], [SD_FILTER_NAME], [ORDER_NO], [SD_FILTER_ALGO], [VALID_FLAG], [UPD_USER_ID], [UPD_DATE]) VALUES (10015, 10002, N'YXA', N'wode', N'deee', 2, N'eeee', 0, N'小高', CAST(N'2017-08-01T16:35:35.687' AS DateTime))
INSERT [dbo].[SD_FILTER_INFO] ([SD_FILTER_ID], [SD_ID], [SD_CODE], [SD_FILTER_CODE], [SD_FILTER_NAME], [ORDER_NO], [SD_FILTER_ALGO], [VALID_FLAG], [UPD_USER_ID], [UPD_DATE]) VALUES (10016, 10002, N'YXA', N'wode23', N'wpde2345', 2, N'dddd', 1, N'超级管理员', CAST(N'2017-08-16T13:56:10.103' AS DateTime))
INSERT [dbo].[SD_FILTER_INFO] ([SD_FILTER_ID], [SD_ID], [SD_CODE], [SD_FILTER_CODE], [SD_FILTER_NAME], [ORDER_NO], [SD_FILTER_ALGO], [VALID_FLAG], [UPD_USER_ID], [UPD_DATE]) VALUES (10017, 10002, N'YXA', N'sdddddddddd', N'dddddddd', 2, N'ssssssss', 0, N'小高', CAST(N'2017-08-01T16:43:17.033' AS DateTime))
INSERT [dbo].[SD_FILTER_INFO] ([SD_FILTER_ID], [SD_ID], [SD_CODE], [SD_FILTER_CODE], [SD_FILTER_NAME], [ORDER_NO], [SD_FILTER_ALGO], [VALID_FLAG], [UPD_USER_ID], [UPD_DATE]) VALUES (10018, 10003, N'CRC', N'QM_SHRJ_CRC', N'CRC入组规则', 1, N'①明确诊断为结直肠癌；②本次住院期间行结直肠癌根治术；③年龄≥18岁', 1, N'超级管理员', CAST(N'2017-08-11T10:03:11.137' AS DateTime))
INSERT [dbo].[SD_FILTER_INFO] ([SD_FILTER_ID], [SD_ID], [SD_CODE], [SD_FILTER_CODE], [SD_FILTER_NAME], [ORDER_NO], [SD_FILTER_ALGO], [VALID_FLAG], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, 10002, N'YXA', N'123', N'111', 2, N'123', 1, N'超级管理员', CAST(N'2017-08-17T11:34:48.907' AS DateTime))
INSERT [dbo].[SD_FILTER_INFO] ([SD_FILTER_ID], [SD_ID], [SD_CODE], [SD_FILTER_CODE], [SD_FILTER_NAME], [ORDER_NO], [SD_FILTER_ALGO], [VALID_FLAG], [UPD_USER_ID], [UPD_DATE]) VALUES (10020, 10002, N'YXA', N'1231', N'111', 1, N'123', 1, N'超级管理员', CAST(N'2017-08-17T11:34:50.043' AS DateTime))
SET IDENTITY_INSERT [dbo].[SD_FILTER_INFO] OFF
SET IDENTITY_INSERT [dbo].[SD_INFO] ON 

INSERT [dbo].[SD_INFO] ([SD_ID], [TC_PROJ_ID], [TC_PROJ_TYPE], [SD_CODE], [SD_NAME], [SD_ALIAS], [ITEM_CAT_PA_CODE], [CITEM_CAT_PA_CODE], [EKPI_CAT_PA_CODE], [ORDER_NO], [VALID_FLAG], [UPD_USER_ID], [UPD_DATE]) VALUES (1, 10001, 1, N'ACT', N'病种名称', N'别名', N'SD_ITEM_COMMON', NULL, NULL, 1, 1, N'zlt', CAST(N'2017-07-31T11:16:50.347' AS DateTime))
INSERT [dbo].[SD_INFO] ([SD_ID], [TC_PROJ_ID], [TC_PROJ_TYPE], [SD_CODE], [SD_NAME], [SD_ALIAS], [ITEM_CAT_PA_CODE], [CITEM_CAT_PA_CODE], [EKPI_CAT_PA_CODE], [ORDER_NO], [VALID_FLAG], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, 10001, NULL, N'YXA', N'胰腺癌', N'345', N'SD_ITEM_COMMON', N'SELF_DATAITME1', N'KPI_DIC1', 345, 0, N'超级管理员', CAST(N'2017-08-15T17:53:47.140' AS DateTime))
INSERT [dbo].[SD_INFO] ([SD_ID], [TC_PROJ_ID], [TC_PROJ_TYPE], [SD_CODE], [SD_NAME], [SD_ALIAS], [ITEM_CAT_PA_CODE], [CITEM_CAT_PA_CODE], [EKPI_CAT_PA_CODE], [ORDER_NO], [VALID_FLAG], [UPD_USER_ID], [UPD_DATE]) VALUES (10003, 10001, 1, N'CRC', N'结直肠癌', N'结直肠', N'SD_ITEM_COMMON', NULL, NULL, 1, 1, N'hjq', CAST(N'2017-08-02T16:06:00.000' AS DateTime))
INSERT [dbo].[SD_INFO] ([SD_ID], [TC_PROJ_ID], [TC_PROJ_TYPE], [SD_CODE], [SD_NAME], [SD_ALIAS], [ITEM_CAT_PA_CODE], [CITEM_CAT_PA_CODE], [EKPI_CAT_PA_CODE], [ORDER_NO], [VALID_FLAG], [UPD_USER_ID], [UPD_DATE]) VALUES (10004, 0, NULL, N'qwe', N'qwe', N'qwe', NULL, NULL, NULL, 1, 0, N'超级管理员', CAST(N'2017-08-15T15:37:50.083' AS DateTime))
INSERT [dbo].[SD_INFO] ([SD_ID], [TC_PROJ_ID], [TC_PROJ_TYPE], [SD_CODE], [SD_NAME], [SD_ALIAS], [ITEM_CAT_PA_CODE], [CITEM_CAT_PA_CODE], [EKPI_CAT_PA_CODE], [ORDER_NO], [VALID_FLAG], [UPD_USER_ID], [UPD_DATE]) VALUES (10007, 10001, NULL, N'sdf', N'234', N'234', N'SD_ITEM_COMMON', N'SELF_DATAITME1', N'KPI_DIC1', 234, 0, NULL, NULL)
INSERT [dbo].[SD_INFO] ([SD_ID], [TC_PROJ_ID], [TC_PROJ_TYPE], [SD_CODE], [SD_NAME], [SD_ALIAS], [ITEM_CAT_PA_CODE], [CITEM_CAT_PA_CODE], [EKPI_CAT_PA_CODE], [ORDER_NO], [VALID_FLAG], [UPD_USER_ID], [UPD_DATE]) VALUES (10008, 10001, NULL, N'asdf', N'asdf', N'asdf', N'SD_ITEM_COMMON', N'SELF_DATAITME1', N'KPI_DIC2', 123, 0, N'超级管理员', CAST(N'2017-08-15T18:30:25.190' AS DateTime))
INSERT [dbo].[SD_INFO] ([SD_ID], [TC_PROJ_ID], [TC_PROJ_TYPE], [SD_CODE], [SD_NAME], [SD_ALIAS], [ITEM_CAT_PA_CODE], [CITEM_CAT_PA_CODE], [EKPI_CAT_PA_CODE], [ORDER_NO], [VALID_FLAG], [UPD_USER_ID], [UPD_DATE]) VALUES (10009, 10001, NULL, N'er', N'er', N'er', N'SD_ITEM_COMMON', N'SELF_DATAITME1', N'KPI_DIC2', 23, 0, N'超级管理员', CAST(N'2017-08-15T18:35:26.000' AS DateTime))
INSERT [dbo].[SD_INFO] ([SD_ID], [TC_PROJ_ID], [TC_PROJ_TYPE], [SD_CODE], [SD_NAME], [SD_ALIAS], [ITEM_CAT_PA_CODE], [CITEM_CAT_PA_CODE], [EKPI_CAT_PA_CODE], [ORDER_NO], [VALID_FLAG], [UPD_USER_ID], [UPD_DATE]) VALUES (10010, 0, NULL, N'123123', N'123', N'123', N'SD_ITEM_COMMON', N'SELF_DATAITME2', N'KPI_DIC1', 123, 0, N'超级管理员', CAST(N'2017-08-15T18:42:23.580' AS DateTime))
INSERT [dbo].[SD_INFO] ([SD_ID], [TC_PROJ_ID], [TC_PROJ_TYPE], [SD_CODE], [SD_NAME], [SD_ALIAS], [ITEM_CAT_PA_CODE], [CITEM_CAT_PA_CODE], [EKPI_CAT_PA_CODE], [ORDER_NO], [VALID_FLAG], [UPD_USER_ID], [UPD_DATE]) VALUES (10012, 10002, NULL, N'123', N'123', N'123', N'SD_ITEM_COMMON', N'SELF_DATAITME2', N'KPI_DIC1', 123, 0, N'超级管理员', CAST(N'2017-08-16T15:26:55.490' AS DateTime))
SET IDENTITY_INSERT [dbo].[SD_INFO] OFF
INSERT [dbo].[SD_ITEM_DEP] ([SD_ITEM_ID], [DEP_SD_ITEM_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10003, 10004, N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[SD_ITEM_DEP] ([SD_ITEM_ID], [DEP_SD_ITEM_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10003, 10005, N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[SD_ITEM_DEP] ([SD_ITEM_ID], [DEP_SD_ITEM_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10010, 10009, N'小高', CAST(N'2017-08-04T14:28:11.423' AS DateTime))
INSERT [dbo].[SD_ITEM_DEP] ([SD_ITEM_ID], [DEP_SD_ITEM_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10010, 10011, N'小高', CAST(N'2017-08-04T14:28:11.363' AS DateTime))
INSERT [dbo].[SD_ITEM_DEP] ([SD_ITEM_ID], [DEP_SD_ITEM_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10010, 10012, N'小高', CAST(N'2017-08-04T14:28:11.413' AS DateTime))
INSERT [dbo].[SD_ITEM_DEP] ([SD_ITEM_ID], [DEP_SD_ITEM_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10011, 10007, N'小高', CAST(N'2017-08-03T09:20:09.833' AS DateTime))
INSERT [dbo].[SD_ITEM_DEP] ([SD_ITEM_ID], [DEP_SD_ITEM_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10011, 10008, N'小高', CAST(N'2017-08-03T09:20:10.123' AS DateTime))
INSERT [dbo].[SD_ITEM_DEP] ([SD_ITEM_ID], [DEP_SD_ITEM_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10011, 10009, N'小高', CAST(N'2017-08-03T09:20:08.947' AS DateTime))
INSERT [dbo].[SD_ITEM_DEP] ([SD_ITEM_ID], [DEP_SD_ITEM_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10011, 10010, N'小高', CAST(N'2017-08-04T09:30:29.560' AS DateTime))
INSERT [dbo].[SD_ITEM_DEP] ([SD_ITEM_ID], [DEP_SD_ITEM_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10011, 10012, N'小高', CAST(N'2017-08-03T09:20:10.207' AS DateTime))
INSERT [dbo].[SD_ITEM_DEP] ([SD_ITEM_ID], [DEP_SD_ITEM_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10011, 10020, N'小高', CAST(N'2017-08-02T19:15:12.187' AS DateTime))
INSERT [dbo].[SD_ITEM_DEP] ([SD_ITEM_ID], [DEP_SD_ITEM_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10018, 10019, N'超级管理员', CAST(N'2017-08-08T15:02:49.783' AS DateTime))
INSERT [dbo].[SD_ITEM_DEP] ([SD_ITEM_ID], [DEP_SD_ITEM_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10018, 10020, N'超级管理员', CAST(N'2017-08-08T15:02:49.777' AS DateTime))
INSERT [dbo].[SD_ITEM_DEP] ([SD_ITEM_ID], [DEP_SD_ITEM_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10020, 10021, N'超级管理员', CAST(N'2017-08-09T10:33:17.443' AS DateTime))
INSERT [dbo].[SD_ITEM_DEP] ([SD_ITEM_ID], [DEP_SD_ITEM_ID], [UPD_USER_ID], [UPD_DATE]) VALUES (10021, 10022, N'超级管理员', CAST(N'2017-08-09T11:11:46.910' AS DateTime))
SET IDENTITY_INSERT [dbo].[SD_ITEM_INFO] ON 

INSERT [dbo].[SD_ITEM_INFO] ([SD_ITEM_ID], [SD_ID], [SD_CODE], [SD_ITEM_CODE], [SD_ITEM_NAME], [SD_ITEM_ALIAS], [SD_ITEM_CAT_ID], [SD_ITEM_DATA_TYPE], [SD_ITEM_UNIT], [NUM_PRECISION], [SD_ITEM_SRC], [IS_RESULT], [ORDER_NO], [SD_ITEM_ALGO], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE], [COM_SD_ITEM_CODE], [COM_SD_ID]) VALUES (10003, 10002, N'YXA', N'ITEM_001', N'吴海龙专用数据项请勿修改1', N'数据项1', 10005, N'datetime', N'g', NULL, 2, 1, 2, NULL, 0, NULL, N'超级管理员', CAST(N'2017-08-08T18:05:35.320' AS DateTime), NULL, NULL)
INSERT [dbo].[SD_ITEM_INFO] ([SD_ITEM_ID], [SD_ID], [SD_CODE], [SD_ITEM_CODE], [SD_ITEM_NAME], [SD_ITEM_ALIAS], [SD_ITEM_CAT_ID], [SD_ITEM_DATA_TYPE], [SD_ITEM_UNIT], [NUM_PRECISION], [SD_ITEM_SRC], [IS_RESULT], [ORDER_NO], [SD_ITEM_ALGO], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE], [COM_SD_ITEM_CODE], [COM_SD_ID]) VALUES (10004, 10002, N'YXA', N'ITEM_002', N'吴海龙专用数据项请勿修改2', N'数据项2', 10005, N'datetime', N's', 0, 2, 0, 3, NULL, 1, NULL, N'小高', CAST(N'2017-08-08T11:18:52.330' AS DateTime), NULL, NULL)
INSERT [dbo].[SD_ITEM_INFO] ([SD_ITEM_ID], [SD_ID], [SD_CODE], [SD_ITEM_CODE], [SD_ITEM_NAME], [SD_ITEM_ALIAS], [SD_ITEM_CAT_ID], [SD_ITEM_DATA_TYPE], [SD_ITEM_UNIT], [NUM_PRECISION], [SD_ITEM_SRC], [IS_RESULT], [ORDER_NO], [SD_ITEM_ALGO], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE], [COM_SD_ITEM_CODE], [COM_SD_ID]) VALUES (10005, 10002, N'YXA', N'ITEM_003', N'吴海龙专用数据项请勿修改3', N'数据项3', 10005, N'datetime', N'个', NULL, 2, 1, 4, NULL, 0, NULL, N'超级管理员', CAST(N'2017-08-14T08:48:18.203' AS DateTime), NULL, NULL)
INSERT [dbo].[SD_ITEM_INFO] ([SD_ITEM_ID], [SD_ID], [SD_CODE], [SD_ITEM_CODE], [SD_ITEM_NAME], [SD_ITEM_ALIAS], [SD_ITEM_CAT_ID], [SD_ITEM_DATA_TYPE], [SD_ITEM_UNIT], [NUM_PRECISION], [SD_ITEM_SRC], [IS_RESULT], [ORDER_NO], [SD_ITEM_ALGO], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE], [COM_SD_ITEM_CODE], [COM_SD_ID]) VALUES (10006, 10002, N'YXA', N'ITEM_004', N'吴海龙专用数据项请勿修改4', N'数据项4', 10005, N'datetime', N's', NULL, 2, 1, NULL, NULL, 0, NULL, N'超级管理员', CAST(N'2017-08-17T17:48:30.947' AS DateTime), NULL, NULL)
INSERT [dbo].[SD_ITEM_INFO] ([SD_ITEM_ID], [SD_ID], [SD_CODE], [SD_ITEM_CODE], [SD_ITEM_NAME], [SD_ITEM_ALIAS], [SD_ITEM_CAT_ID], [SD_ITEM_DATA_TYPE], [SD_ITEM_UNIT], [NUM_PRECISION], [SD_ITEM_SRC], [IS_RESULT], [ORDER_NO], [SD_ITEM_ALGO], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE], [COM_SD_ITEM_CODE], [COM_SD_ID]) VALUES (10007, 10002, N'YXA', N'ITEM_005', N'数据项5', N'数据项5', 10002, N'enum', N's', NULL, 1, 1, 6, N'除了逻辑描述我还能编辑什么？', 1, NULL, N'小高', CAST(N'2017-08-08T11:18:52.333' AS DateTime), NULL, NULL)
INSERT [dbo].[SD_ITEM_INFO] ([SD_ITEM_ID], [SD_ID], [SD_CODE], [SD_ITEM_CODE], [SD_ITEM_NAME], [SD_ITEM_ALIAS], [SD_ITEM_CAT_ID], [SD_ITEM_DATA_TYPE], [SD_ITEM_UNIT], [NUM_PRECISION], [SD_ITEM_SRC], [IS_RESULT], [ORDER_NO], [SD_ITEM_ALGO], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE], [COM_SD_ITEM_CODE], [COM_SD_ID]) VALUES (10008, 10002, N'YXA', N'ITEM_006', N'数据项6', N'数据项6', 10006, N'enum', N's', NULL, 1, 1, 7, NULL, 0, NULL, N'小高', CAST(N'2017-08-08T11:18:52.333' AS DateTime), NULL, NULL)
INSERT [dbo].[SD_ITEM_INFO] ([SD_ITEM_ID], [SD_ID], [SD_CODE], [SD_ITEM_CODE], [SD_ITEM_NAME], [SD_ITEM_ALIAS], [SD_ITEM_CAT_ID], [SD_ITEM_DATA_TYPE], [SD_ITEM_UNIT], [NUM_PRECISION], [SD_ITEM_SRC], [IS_RESULT], [ORDER_NO], [SD_ITEM_ALGO], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE], [COM_SD_ITEM_CODE], [COM_SD_ID]) VALUES (10009, 10002, N'YXA', N'ITEM_007', N'数据项7', N'数据项7', 10006, N'data', N's', NULL, 2, 1, 8, NULL, 0, NULL, N'小高', CAST(N'2017-08-08T11:18:52.333' AS DateTime), NULL, NULL)
INSERT [dbo].[SD_ITEM_INFO] ([SD_ITEM_ID], [SD_ID], [SD_CODE], [SD_ITEM_CODE], [SD_ITEM_NAME], [SD_ITEM_ALIAS], [SD_ITEM_CAT_ID], [SD_ITEM_DATA_TYPE], [SD_ITEM_UNIT], [NUM_PRECISION], [SD_ITEM_SRC], [IS_RESULT], [ORDER_NO], [SD_ITEM_ALGO], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE], [COM_SD_ITEM_CODE], [COM_SD_ID]) VALUES (10010, 10002, N'YXA', N'ITEM_008', N'数据项8', N'数据项8', 10006, N'string', N's', 0, 2, 1, 9, NULL, 1, NULL, N'小高', CAST(N'2017-08-08T11:18:52.333' AS DateTime), NULL, NULL)
INSERT [dbo].[SD_ITEM_INFO] ([SD_ITEM_ID], [SD_ID], [SD_CODE], [SD_ITEM_CODE], [SD_ITEM_NAME], [SD_ITEM_ALIAS], [SD_ITEM_CAT_ID], [SD_ITEM_DATA_TYPE], [SD_ITEM_UNIT], [NUM_PRECISION], [SD_ITEM_SRC], [IS_RESULT], [ORDER_NO], [SD_ITEM_ALGO], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE], [COM_SD_ITEM_CODE], [COM_SD_ID]) VALUES (10011, 10002, N'YXA', N'ITEM_009', N'数据项9', N'数据项9', 10007, N'string', N's', NULL, 2, 0, 10, NULL, 0, NULL, N'小高', CAST(N'2017-08-08T11:18:52.333' AS DateTime), NULL, NULL)
INSERT [dbo].[SD_ITEM_INFO] ([SD_ITEM_ID], [SD_ID], [SD_CODE], [SD_ITEM_CODE], [SD_ITEM_NAME], [SD_ITEM_ALIAS], [SD_ITEM_CAT_ID], [SD_ITEM_DATA_TYPE], [SD_ITEM_UNIT], [NUM_PRECISION], [SD_ITEM_SRC], [IS_RESULT], [ORDER_NO], [SD_ITEM_ALGO], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE], [COM_SD_ITEM_CODE], [COM_SD_ID]) VALUES (10012, 10002, N'YXA', N'ITEM_0010', N'数据项10', N'数据项10', 10007, N'string', N's', NULL, 2, 0, 11, NULL, 0, NULL, N'小高', CAST(N'2017-08-08T11:18:52.333' AS DateTime), NULL, NULL)
INSERT [dbo].[SD_ITEM_INFO] ([SD_ITEM_ID], [SD_ID], [SD_CODE], [SD_ITEM_CODE], [SD_ITEM_NAME], [SD_ITEM_ALIAS], [SD_ITEM_CAT_ID], [SD_ITEM_DATA_TYPE], [SD_ITEM_UNIT], [NUM_PRECISION], [SD_ITEM_SRC], [IS_RESULT], [ORDER_NO], [SD_ITEM_ALGO], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE], [COM_SD_ITEM_CODE], [COM_SD_ID]) VALUES (10013, 10002, N'YXA', N'ITEM_0011', N'数据项11', N'数据项11', 10007, N'datetime', N's', NULL, 2, 0, 12, NULL, 0, NULL, N'小高', CAST(N'2017-08-08T11:18:52.333' AS DateTime), NULL, NULL)
INSERT [dbo].[SD_ITEM_INFO] ([SD_ITEM_ID], [SD_ID], [SD_CODE], [SD_ITEM_CODE], [SD_ITEM_NAME], [SD_ITEM_ALIAS], [SD_ITEM_CAT_ID], [SD_ITEM_DATA_TYPE], [SD_ITEM_UNIT], [NUM_PRECISION], [SD_ITEM_SRC], [IS_RESULT], [ORDER_NO], [SD_ITEM_ALGO], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE], [COM_SD_ITEM_CODE], [COM_SD_ID]) VALUES (10014, 10002, N'YXA', N'ITEM_0012', N'数据项12', N'数据项12', 10007, N'datetime', N's', NULL, 2, 0, 13, NULL, 0, NULL, N'小高', CAST(N'2017-08-08T11:18:52.333' AS DateTime), NULL, NULL)
INSERT [dbo].[SD_ITEM_INFO] ([SD_ITEM_ID], [SD_ID], [SD_CODE], [SD_ITEM_CODE], [SD_ITEM_NAME], [SD_ITEM_ALIAS], [SD_ITEM_CAT_ID], [SD_ITEM_DATA_TYPE], [SD_ITEM_UNIT], [NUM_PRECISION], [SD_ITEM_SRC], [IS_RESULT], [ORDER_NO], [SD_ITEM_ALGO], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE], [COM_SD_ITEM_CODE], [COM_SD_ID]) VALUES (10015, 10002, N'YXA', N'ITEM_0013', N'数据项13', N'数据项13', 10008, N'datetime', N's', NULL, 2, 0, 14, NULL, 1, NULL, N'超级管理员', CAST(N'2017-08-17T18:17:23.883' AS DateTime), NULL, NULL)
INSERT [dbo].[SD_ITEM_INFO] ([SD_ITEM_ID], [SD_ID], [SD_CODE], [SD_ITEM_CODE], [SD_ITEM_NAME], [SD_ITEM_ALIAS], [SD_ITEM_CAT_ID], [SD_ITEM_DATA_TYPE], [SD_ITEM_UNIT], [NUM_PRECISION], [SD_ITEM_SRC], [IS_RESULT], [ORDER_NO], [SD_ITEM_ALGO], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE], [COM_SD_ITEM_CODE], [COM_SD_ID]) VALUES (10016, 10002, N'YXA', N'ITEM_0014', N'数据项14', N'数据项14', 10008, N'datetime', N's', NULL, 2, 0, 15, NULL, 1, NULL, N'超级管理员', CAST(N'2017-08-17T18:17:32.190' AS DateTime), NULL, NULL)
INSERT [dbo].[SD_ITEM_INFO] ([SD_ITEM_ID], [SD_ID], [SD_CODE], [SD_ITEM_CODE], [SD_ITEM_NAME], [SD_ITEM_ALIAS], [SD_ITEM_CAT_ID], [SD_ITEM_DATA_TYPE], [SD_ITEM_UNIT], [NUM_PRECISION], [SD_ITEM_SRC], [IS_RESULT], [ORDER_NO], [SD_ITEM_ALGO], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE], [COM_SD_ITEM_CODE], [COM_SD_ID]) VALUES (10017, 10002, N'YXA', N'ITEM_0015', N'数据项15', N'数据项15', 10009, N'datetime', N's', NULL, 2, 0, 16, NULL, 0, NULL, N'超级管理员', CAST(N'2017-08-15T17:31:26.020' AS DateTime), NULL, NULL)
INSERT [dbo].[SD_ITEM_INFO] ([SD_ITEM_ID], [SD_ID], [SD_CODE], [SD_ITEM_CODE], [SD_ITEM_NAME], [SD_ITEM_ALIAS], [SD_ITEM_CAT_ID], [SD_ITEM_DATA_TYPE], [SD_ITEM_UNIT], [NUM_PRECISION], [SD_ITEM_SRC], [IS_RESULT], [ORDER_NO], [SD_ITEM_ALGO], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE], [COM_SD_ITEM_CODE], [COM_SD_ID]) VALUES (10018, 10003, N'CRC', N'CRC_EN_036', N'拔管时间不明确', N'拔管时间不明确', 10007, N'string', N's', NULL, 2, 1, 17, NULL, 1, NULL, N'超级管理员', CAST(N'2017-08-17T10:03:36.613' AS DateTime), NULL, NULL)
INSERT [dbo].[SD_ITEM_INFO] ([SD_ITEM_ID], [SD_ID], [SD_CODE], [SD_ITEM_CODE], [SD_ITEM_NAME], [SD_ITEM_ALIAS], [SD_ITEM_CAT_ID], [SD_ITEM_DATA_TYPE], [SD_ITEM_UNIT], [NUM_PRECISION], [SD_ITEM_SRC], [IS_RESULT], [ORDER_NO], [SD_ITEM_ALGO], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE], [COM_SD_ITEM_CODE], [COM_SD_ID]) VALUES (10019, 10003, N'CRC', N'CRC_EN_035', N'带管出院', N'带管出院', 10007, N'string', N's', NULL, 2, 1, 5, N'数据项带管出院数据项带管出院数据项带管出院数据项带管出院数据项带管出院数据。', 1, NULL, N'超级管理员', CAST(N'2017-08-17T17:48:31.087' AS DateTime), NULL, NULL)
INSERT [dbo].[SD_ITEM_INFO] ([SD_ITEM_ID], [SD_ID], [SD_CODE], [SD_ITEM_CODE], [SD_ITEM_NAME], [SD_ITEM_ALIAS], [SD_ITEM_CAT_ID], [SD_ITEM_DATA_TYPE], [SD_ITEM_UNIT], [NUM_PRECISION], [SD_ITEM_SRC], [IS_RESULT], [ORDER_NO], [SD_ITEM_ALGO], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE], [COM_SD_ITEM_CODE], [COM_SD_ID]) VALUES (10020, 10003, N'CRC', N'CRC_EN_034', N'拔管时间', N'拔管时间', 10007, N'datetime', N's', NULL, 2, 1, 19, NULL, 1, NULL, N'超级管理员', CAST(N'2017-08-17T10:03:37.730' AS DateTime), NULL, NULL)
INSERT [dbo].[SD_ITEM_INFO] ([SD_ITEM_ID], [SD_ID], [SD_CODE], [SD_ITEM_CODE], [SD_ITEM_NAME], [SD_ITEM_ALIAS], [SD_ITEM_CAT_ID], [SD_ITEM_DATA_TYPE], [SD_ITEM_UNIT], [NUM_PRECISION], [SD_ITEM_SRC], [IS_RESULT], [ORDER_NO], [SD_ITEM_ALGO], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE], [COM_SD_ITEM_CODE], [COM_SD_ID]) VALUES (10021, 10003, N'CRC', N'CRC_OP02', N'结直肠癌根治术手术时间', N'结直肠癌根治术手术时间', 10007, N'datetime', N's', NULL, 2, 1, 20, NULL, 1, NULL, N'超级管理员', CAST(N'2017-08-15T18:21:23.283' AS DateTime), NULL, NULL)
INSERT [dbo].[SD_ITEM_INFO] ([SD_ITEM_ID], [SD_ID], [SD_CODE], [SD_ITEM_CODE], [SD_ITEM_NAME], [SD_ITEM_ALIAS], [SD_ITEM_CAT_ID], [SD_ITEM_DATA_TYPE], [SD_ITEM_UNIT], [NUM_PRECISION], [SD_ITEM_SRC], [IS_RESULT], [ORDER_NO], [SD_ITEM_ALGO], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE], [COM_SD_ITEM_CODE], [COM_SD_ID]) VALUES (10022, 10003, N'CRC', N'CRC_OP01', N'结直肠根治术', N'结直肠根治术', 10007, N'string', N's', NULL, 2, 1, 21, NULL, 1, NULL, N'超级管理员', CAST(N'2017-08-17T18:52:36.680' AS DateTime), NULL, NULL)
INSERT [dbo].[SD_ITEM_INFO] ([SD_ITEM_ID], [SD_ID], [SD_CODE], [SD_ITEM_CODE], [SD_ITEM_NAME], [SD_ITEM_ALIAS], [SD_ITEM_CAT_ID], [SD_ITEM_DATA_TYPE], [SD_ITEM_UNIT], [NUM_PRECISION], [SD_ITEM_SRC], [IS_RESULT], [ORDER_NO], [SD_ITEM_ALGO], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE], [COM_SD_ITEM_CODE], [COM_SD_ID]) VALUES (10024, 10001, N'YXA', N'ITEM_0022', N'数据项22', N'数据项22', 10002, N'datetime', N'g', 0, 1, 1, 23, NULL, 0, NULL, N'小高', CAST(N'2017-08-08T11:18:52.340' AS DateTime), NULL, NULL)
INSERT [dbo].[SD_ITEM_INFO] ([SD_ITEM_ID], [SD_ID], [SD_CODE], [SD_ITEM_CODE], [SD_ITEM_NAME], [SD_ITEM_ALIAS], [SD_ITEM_CAT_ID], [SD_ITEM_DATA_TYPE], [SD_ITEM_UNIT], [NUM_PRECISION], [SD_ITEM_SRC], [IS_RESULT], [ORDER_NO], [SD_ITEM_ALGO], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE], [COM_SD_ITEM_CODE], [COM_SD_ID]) VALUES (10025, 10001, N'YXA', N'ITEM_0021', N'数据项21', N'数据项21', 10005, N'datetime', N'g', 1, 1, 1, 22, NULL, 0, NULL, N'小高', CAST(N'2017-08-08T11:18:52.337' AS DateTime), NULL, NULL)
INSERT [dbo].[SD_ITEM_INFO] ([SD_ITEM_ID], [SD_ID], [SD_CODE], [SD_ITEM_CODE], [SD_ITEM_NAME], [SD_ITEM_ALIAS], [SD_ITEM_CAT_ID], [SD_ITEM_DATA_TYPE], [SD_ITEM_UNIT], [NUM_PRECISION], [SD_ITEM_SRC], [IS_RESULT], [ORDER_NO], [SD_ITEM_ALGO], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE], [COM_SD_ITEM_CODE], [COM_SD_ID]) VALUES (10026, 10003, N'CRC', N'CRC_EN_001', N'术前完成直肠指诊1', N'术前完整直肠指诊1', 10010, N'bool', NULL, NULL, 1, 0, 24, N'很复杂', 1, NULL, N'小高', CAST(N'2017-08-08T11:18:52.340' AS DateTime), NULL, NULL)
INSERT [dbo].[SD_ITEM_INFO] ([SD_ITEM_ID], [SD_ID], [SD_CODE], [SD_ITEM_CODE], [SD_ITEM_NAME], [SD_ITEM_ALIAS], [SD_ITEM_CAT_ID], [SD_ITEM_DATA_TYPE], [SD_ITEM_UNIT], [NUM_PRECISION], [SD_ITEM_SRC], [IS_RESULT], [ORDER_NO], [SD_ITEM_ALGO], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE], [COM_SD_ITEM_CODE], [COM_SD_ID]) VALUES (10027, 10003, N'CRC', N'CRC_EN_002', N'术前完成直肠指诊2', N'术前完成直肠指诊2', 10010, N'bool', NULL, NULL, 1, 0, 25, N'也很复杂', 1, NULL, N'小高', CAST(N'2017-08-08T11:18:52.340' AS DateTime), NULL, NULL)
INSERT [dbo].[SD_ITEM_INFO] ([SD_ITEM_ID], [SD_ID], [SD_CODE], [SD_ITEM_CODE], [SD_ITEM_NAME], [SD_ITEM_ALIAS], [SD_ITEM_CAT_ID], [SD_ITEM_DATA_TYPE], [SD_ITEM_UNIT], [NUM_PRECISION], [SD_ITEM_SRC], [IS_RESULT], [ORDER_NO], [SD_ITEM_ALGO], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE], [COM_SD_ITEM_CODE], [COM_SD_ID]) VALUES (10033, 10002, N'YXA', N'CRC_EN_002', N'术前完成直肠指诊2', N'术前完成直肠指诊2', 10010, N'bool', NULL, NULL, 0, 0, 25, N'也很复杂', 1, NULL, N'超级管理员', CAST(N'2017-08-17T18:17:29.230' AS DateTime), NULL, NULL)
INSERT [dbo].[SD_ITEM_INFO] ([SD_ITEM_ID], [SD_ID], [SD_CODE], [SD_ITEM_CODE], [SD_ITEM_NAME], [SD_ITEM_ALIAS], [SD_ITEM_CAT_ID], [SD_ITEM_DATA_TYPE], [SD_ITEM_UNIT], [NUM_PRECISION], [SD_ITEM_SRC], [IS_RESULT], [ORDER_NO], [SD_ITEM_ALGO], [VALID_FLAG], [SD_EKPI_DESC], [UPD_USER_ID], [UPD_DATE], [COM_SD_ITEM_CODE], [COM_SD_ID]) VALUES (10034, 10002, N'YXA', N'CRC_EN_001', N'术前完成直肠指诊1', N'术前完整直肠指诊1', 10010, N'bool', NULL, NULL, 0, 0, 25, N'很复杂', 1, NULL, N'超级管理员', CAST(N'2017-08-17T18:17:30.767' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[SD_ITEM_INFO] OFF
SET IDENTITY_INSERT [dbo].[SD_ITEM_OPTION] ON 

INSERT [dbo].[SD_ITEM_OPTION] ([ITEM_OPTION_ID], [SD_ITEM_ID], [ITEM_OPTION_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10020, 10004, N'3', 1, N'小高', CAST(N'2017-08-02T11:38:21.740' AS DateTime))
INSERT [dbo].[SD_ITEM_OPTION] ([ITEM_OPTION_ID], [SD_ITEM_ID], [ITEM_OPTION_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10021, 10004, N'2', 2, N'小高', CAST(N'2017-08-02T11:38:21.763' AS DateTime))
INSERT [dbo].[SD_ITEM_OPTION] ([ITEM_OPTION_ID], [SD_ITEM_ID], [ITEM_OPTION_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, 10004, N'4', 3, N'小高', CAST(N'2017-08-02T11:38:21.770' AS DateTime))
INSERT [dbo].[SD_ITEM_OPTION] ([ITEM_OPTION_ID], [SD_ITEM_ID], [ITEM_OPTION_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10023, 10004, N'5', 4, N'小高', CAST(N'2017-08-02T11:38:21.777' AS DateTime))
INSERT [dbo].[SD_ITEM_OPTION] ([ITEM_OPTION_ID], [SD_ITEM_ID], [ITEM_OPTION_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10024, 10004, N'1', 5, N'小高', CAST(N'2017-08-02T11:38:21.780' AS DateTime))
INSERT [dbo].[SD_ITEM_OPTION] ([ITEM_OPTION_ID], [SD_ITEM_ID], [ITEM_OPTION_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10042, 10012, N'test1', 1, N'小高', CAST(N'2017-08-02T13:59:57.060' AS DateTime))
INSERT [dbo].[SD_ITEM_OPTION] ([ITEM_OPTION_ID], [SD_ITEM_ID], [ITEM_OPTION_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10043, 10012, N'test3', 2, N'小高', CAST(N'2017-08-02T13:59:57.083' AS DateTime))
INSERT [dbo].[SD_ITEM_OPTION] ([ITEM_OPTION_ID], [SD_ITEM_ID], [ITEM_OPTION_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10044, 10012, N'test4', 3, N'小高', CAST(N'2017-08-02T13:59:57.090' AS DateTime))
INSERT [dbo].[SD_ITEM_OPTION] ([ITEM_OPTION_ID], [SD_ITEM_ID], [ITEM_OPTION_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10068, 10007, N'3', 1, N'小高', CAST(N'2017-08-04T14:34:26.000' AS DateTime))
INSERT [dbo].[SD_ITEM_OPTION] ([ITEM_OPTION_ID], [SD_ITEM_ID], [ITEM_OPTION_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10069, 10007, N'4', 2, N'小高', CAST(N'2017-08-04T14:34:26.000' AS DateTime))
INSERT [dbo].[SD_ITEM_OPTION] ([ITEM_OPTION_ID], [SD_ITEM_ID], [ITEM_OPTION_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10070, 10007, N'2', 3, N'小高', CAST(N'2017-08-04T14:34:26.000' AS DateTime))
INSERT [dbo].[SD_ITEM_OPTION] ([ITEM_OPTION_ID], [SD_ITEM_ID], [ITEM_OPTION_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10071, 10007, N'1', 4, N'小高', CAST(N'2017-08-04T14:34:26.000' AS DateTime))
INSERT [dbo].[SD_ITEM_OPTION] ([ITEM_OPTION_ID], [SD_ITEM_ID], [ITEM_OPTION_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10072, 0, N's', 1, N'小高', CAST(N'2017-08-08T11:18:51.863' AS DateTime))
INSERT [dbo].[SD_ITEM_OPTION] ([ITEM_OPTION_ID], [SD_ITEM_ID], [ITEM_OPTION_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10073, 0, N'd', 2, N'小高', CAST(N'2017-08-08T11:18:52.173' AS DateTime))
INSERT [dbo].[SD_ITEM_OPTION] ([ITEM_OPTION_ID], [SD_ITEM_ID], [ITEM_OPTION_NAME], [ORDER_NO], [UPD_USER_ID], [UPD_DATE]) VALUES (10074, 0, N'sd', 3, N'小高', CAST(N'2017-08-08T11:18:52.187' AS DateTime))
SET IDENTITY_INSERT [dbo].[SD_ITEM_OPTION] OFF
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10001, N'10001', 10002, N'YXA', 123, N'2017-01-01 12:30:31', NULL, NULL, NULL)
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10002, N'10001', 10002, N'YXA', 123, N'2017-01-02 12:30:31', NULL, NULL, NULL)
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10003, N'10001', 10002, N'YXA', 123, N'2017-01-03 12:30:31', NULL, NULL, NULL)
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10004, N'10001', 10002, N'YXA', 123, N'2017-01-04 12:30:31', NULL, NULL, NULL)
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10004, N'10002', 10002, N'YXA', 123, N'2017-01-05 12:30:31', NULL, NULL, NULL)
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10004, N'10003', 10002, N'YXA', 123, N'2017-01-06 12:30:31', NULL, NULL, NULL)
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10005, N'10001', 10002, N'YXA', 123, N'2017-01-07 12:30:31', NULL, NULL, NULL)
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10005, N'10002', 10002, N'YXA', 123, N'2017-01-08 12:30:31', NULL, NULL, NULL)
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10005, N'10003', 10002, N'YXA', 123, N'2017-01-08 18:30:31', NULL, NULL, NULL)
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10006, N'10001', 10002, N'YXA', 123, N'2017-01-08 19:30:31', NULL, NULL, NULL)
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10006, N'10003', 10002, N'YXA', 123, N'2017-01-08 20:30:31', NULL, NULL, NULL)
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10012, N'10001', 10002, N'YXA', 123, N'2017-01-08 21:30:31', NULL, NULL, NULL)
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10013, N'10001', 10002, N'YXA', 123, N'1', NULL, NULL, NULL)
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10014, N'10001', 10002, N'YXA', 123, N'1', NULL, NULL, NULL)
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10015, N'10001', 10002, N'YXA', 123, N'1', NULL, NULL, NULL)
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10016, N'10001', 10002, N'YXA', 123, N'1', NULL, NULL, NULL)
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10017, N'10001', 10002, N'YXA', 123, N'1', NULL, NULL, NULL)
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10018, N'10004', 10002, N'YXA', 123, N'0', NULL, N'超级管理员', CAST(N'2017-08-09T17:27:05.420' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10018, N'10005', 10002, N'YXA', 123, N'0', NULL, N'超级管理员', CAST(N'2017-08-09T17:27:05.443' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10018, N'10006', 10002, N'YXA', 123, N'0', NULL, N'超级管理员', CAST(N'2017-08-09T17:27:05.460' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, N'10004', 10002, N'YXA', 123, N'0', NULL, N'超级管理员', CAST(N'2017-08-14T19:11:23.527' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, N'10005', 10002, N'YXA', 123, N'0', NULL, N'超级管理员', CAST(N'2017-08-14T19:11:23.537' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, N'10006', 10002, N'YXA', 123, N'0', NULL, N'超级管理员', CAST(N'2017-08-14T19:11:23.547' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, N'CRC_1_13011500000003', 10002, N'YXA', 10018, N'0', NULL, N'超级管理员', CAST(N'2017-08-14T19:11:23.557' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, N'CRC_1_13011700000002', 10002, N'YXA', 10018, N'0', NULL, N'超级管理员', CAST(N'2017-08-14T19:11:23.567' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, N'CRC_1_13012100000004', 10002, N'YXA', 10018, N'0', NULL, N'超级管理员', CAST(N'2017-08-14T19:11:23.577' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, N'CRC_1_13012200000004', 10002, N'YXA', 10018, N'0', NULL, N'超级管理员', CAST(N'2017-08-14T19:11:23.587' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, N'CRC_1_13013000000006', 10002, N'YXA', 10018, N'0', NULL, N'超级管理员', CAST(N'2017-08-14T19:11:23.593' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, N'CRC_1_13020500000004', 10002, N'YXA', 10018, N'0', NULL, N'超级管理员', CAST(N'2017-08-14T19:11:23.603' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, N'CRC_1_13021700000003', 10002, N'YXA', 10018, N'0', NULL, N'超级管理员', CAST(N'2017-08-14T19:11:23.613' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, N'CRC_1_13022100000002', 10002, N'YXA', 10018, N'0', NULL, N'超级管理员', CAST(N'2017-08-14T19:11:23.623' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, N'CRC_1_13022500000002', 10002, N'YXA', 10018, N'0', NULL, N'超级管理员', CAST(N'2017-08-14T19:11:23.633' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, N'CRC_1_13022500000013', 10002, N'YXA', 10018, N'0', NULL, N'超级管理员', CAST(N'2017-08-14T19:11:23.643' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, N'CRC_1_13022500000020', 10002, N'YXA', 10018, N'0', NULL, N'超级管理员', CAST(N'2017-08-14T19:11:23.657' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, N'CRC_1_13022500000026', 10002, N'YXA', 10018, N'0', NULL, N'超级管理员', CAST(N'2017-08-14T19:11:23.667' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, N'CRC_1_13022500000032', 10002, N'YXA', 10018, N'0', NULL, N'超级管理员', CAST(N'2017-08-14T19:11:23.673' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, N'CRC_1_13030400000008', 10002, N'YXA', 10018, N'0', NULL, N'超级管理员', CAST(N'2017-08-14T19:11:23.683' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, N'CRC_1_13030400000031', 10002, N'YXA', 10018, N'0', NULL, N'超级管理员', CAST(N'2017-08-14T19:11:23.697' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, N'CRC_1_13030600000001', 10002, N'YXA', 10018, N'0', NULL, N'超级管理员', CAST(N'2017-08-14T19:11:23.707' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, N'CRC_1_13031300000018', 10002, N'YXA', 10018, N'0', NULL, N'超级管理员', CAST(N'2017-08-14T19:11:23.717' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, N'CRC_1_13031500000012', 10002, N'YXA', 10018, N'0', NULL, N'超级管理员', CAST(N'2017-08-14T19:11:23.727' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, N'CRC_1_13032900000001', 10002, N'YXA', 10018, N'0', NULL, N'超级管理员', CAST(N'2017-08-14T19:11:23.737' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, N'CRC_1_13040200000014', 10002, N'YXA', 10018, N'0', NULL, N'超级管理员', CAST(N'2017-08-14T19:11:23.747' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10019, N'CRC_1_13040700000006', 10002, N'YXA', 10018, N'0', NULL, N'超级管理员', CAST(N'2017-08-14T19:11:23.757' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10020, N'10004', 10002, N'YXA', 123, N'2013-01-28T14:34:31', NULL, N'超级管理员', CAST(N'2017-08-09T10:21:10.890' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10020, N'10005', 10002, N'YXA', 123, N'2013-02-04T09:31:47', NULL, N'超级管理员', CAST(N'2017-08-09T10:21:10.903' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10020, N'10006', 10002, N'YXA', 123, N'2013-02-01T09:57:56', NULL, N'超级管理员', CAST(N'2017-08-09T10:21:10.953' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10021, N'10004', 10002, N'YXA', 123, N'0001-01-01T00:00:00', NULL, N'超级管理员', CAST(N'2017-08-09T10:20:45.967' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10021, N'10005', 10002, N'YXA', 123, N'0001-01-01T00:00:00', NULL, N'超级管理员', CAST(N'2017-08-09T10:20:45.980' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10021, N'10006', 10002, N'YXA', 123, N'0001-01-01T00:00:00', NULL, N'超级管理员', CAST(N'2017-08-09T10:20:45.993' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10021, N'CRC_1_13011500000003', 10002, N'YXA', 10018, N'0001-01-01T00:00:00', NULL, N'超级管理员', CAST(N'2017-08-15T18:20:03.190' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10021, N'CRC_1_13011700000002', 10002, N'YXA', 10018, N'0001-01-01T00:00:00', NULL, N'超级管理员', CAST(N'2017-08-15T18:20:03.217' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10021, N'CRC_1_13012100000004', 10002, N'YXA', 10018, N'0001-01-01T00:00:00', NULL, N'超级管理员', CAST(N'2017-08-15T18:20:03.227' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10021, N'CRC_1_13012200000004', 10002, N'YXA', 10018, N'0001-01-01T00:00:00', NULL, N'超级管理员', CAST(N'2017-08-15T18:20:03.233' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10021, N'CRC_1_13013000000006', 10002, N'YXA', 10018, N'0001-01-01T00:00:00', NULL, N'超级管理员', CAST(N'2017-08-15T18:20:03.237' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10021, N'CRC_1_13020500000004', 10002, N'YXA', 10018, N'0001-01-01T00:00:00', NULL, N'超级管理员', CAST(N'2017-08-15T18:20:03.243' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10021, N'CRC_1_13022100000002', 10002, N'YXA', 10018, N'0001-01-01T00:00:00', NULL, N'超级管理员', CAST(N'2017-08-15T18:20:03.247' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10021, N'CRC_1_13022500000002', 10002, N'YXA', 10018, N'0001-01-01T00:00:00', NULL, N'超级管理员', CAST(N'2017-08-15T18:20:03.253' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10021, N'CRC_1_13022500000013', 10002, N'YXA', 10018, N'0001-01-01T00:00:00', NULL, N'超级管理员', CAST(N'2017-08-15T18:20:03.260' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10021, N'CRC_1_13022500000020', 10002, N'YXA', 10018, N'0001-01-01T00:00:00', NULL, N'超级管理员', CAST(N'2017-08-15T18:20:03.267' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10021, N'CRC_1_13022500000026', 10002, N'YXA', 10018, N'0001-01-01T00:00:00', NULL, N'超级管理员', CAST(N'2017-08-15T18:20:03.270' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10021, N'CRC_1_13022500000032', 10002, N'YXA', 10018, N'0001-01-01T00:00:00', NULL, N'超级管理员', CAST(N'2017-08-15T18:20:03.277' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10021, N'CRC_1_13030400000031', 10002, N'YXA', 10018, N'0001-01-01T00:00:00', NULL, N'超级管理员', CAST(N'2017-08-15T18:20:03.283' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10021, N'CRC_1_13030600000001', 10002, N'YXA', 10018, N'0001-01-01T00:00:00', NULL, N'超级管理员', CAST(N'2017-08-15T18:20:03.307' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10021, N'CRC_1_13031300000018', 10002, N'YXA', 10018, N'0001-01-01T00:00:00', NULL, N'超级管理员', CAST(N'2017-08-15T18:20:03.310' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'10004', 10002, N'YXA', 123, N'1', NULL, N'超级管理员', CAST(N'2017-08-10T15:14:56.143' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'10005', 10002, N'YXA', 123, N'1', NULL, N'超级管理员', CAST(N'2017-08-10T15:14:56.167' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'10006', 10002, N'YXA', 123, N'1', NULL, N'超级管理员', CAST(N'2017-08-10T15:14:56.183' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13010800000024', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.127' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13011500000003', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.140' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13011600000003', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.150' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13011700000002', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.160' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13012100000004', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.170' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13012200000004', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.180' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13012400000013', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.217' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13012800000015', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.227' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13013000000006', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.237' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13020500000004', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.250' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13021700000003', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.260' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13022100000002', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.267' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13022500000002', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.277' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13022500000013', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.287' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13022500000020', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.297' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13022500000026', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.307' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13022500000032', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.327' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13030400000008', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.340' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13030400000031', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.347' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13030600000001', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.357' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13031300000018', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.370' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13031500000012', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.380' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13032900000001', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.387' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13040200000014', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.397' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13040700000006', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.417' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13041000000018', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.427' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13041600000013', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.433' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13042200000006', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.440' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13042700000007', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.450' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13050600000038', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.460' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13050700000023', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.467' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13050700000024', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.480' AS DateTime))
GO
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13050900000023', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.490' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13051300000007', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.497' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13051400000027', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.503' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13051700000011', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.510' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13052800000009', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.523' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13052900000008', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.533' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13060300000033', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.543' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13060300000054', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.550' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13060400000008', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.557' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13060700000004', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.567' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13060700000009', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.573' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13061500000001', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.580' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13062100000022', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.590' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13062400000039', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.597' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13062600000010', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.607' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13070200000012', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.617' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13070600000002', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.627' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13070900000030', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.637' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13071100000002', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.647' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13071100000015', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.653' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13071500000019', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.663' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13071500000029', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.670' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13071600000032', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.680' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13071900000004', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.690' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13071900000015', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.703' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13072500000002', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.713' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13072700000003', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.723' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13080100000021', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.737' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13080500000007', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.743' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13080700000018', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.760' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13080700000034', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.773' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13080800000035', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.783' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13081300000030', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.793' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13081600000001', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.803' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13082000000041', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.810' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13082200000026', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.820' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13082600000004', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.830' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13083000000030', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.837' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13090200000016', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.847' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13090600000004', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.860' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13090900000066', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.867' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13091000000007', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.877' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13091000000021', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.887' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13091100000034', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.897' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13091600000062', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.907' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13091600000076', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.920' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13092300000035', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.930' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13092300000051', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.943' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13092400000035', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.953' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13092500000018', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.963' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13101100000011', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.977' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13101500000014', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.987' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13101500000032', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:07.997' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13101600000002', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.007' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13101600000040', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.017' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13101700000018', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.027' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13101800000008', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.040' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13101800000020', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.050' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13102100000042', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.060' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13102300000002', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.070' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13102500000025', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.080' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13102800000021', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.093' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13102900000021', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.107' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13102900000037', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.120' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13102900000048', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.133' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13110400000064', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.147' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13110500000050', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.157' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13110600000043', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.170' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13110700000032', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.183' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13110800000025', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.197' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13111100000026', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.207' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13111600000006', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.217' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13111600000010', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.230' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13111800000043', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.240' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13111900000034', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.250' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13112000000002', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.260' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13112500000014', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.270' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13112500000066', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.280' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13112600000045', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.290' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13112700000009', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.300' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13112800000046', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.310' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13120300000024', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.327' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13121200000018', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.337' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13121300000028', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.350' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13121700000017', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.363' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_13122000000006', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.373' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14010400000003', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.383' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14010600000006', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.397' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14010600000021', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.407' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14010700000026', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.420' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14010800000022', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.433' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14010800000041', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.443' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14011300000044', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.453' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14011300000053', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.463' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14011300000056', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.473' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14011700000028', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.487' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14012300000032', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.497' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14012600000014', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.507' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14020400000002', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.517' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14020800000049', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.530' AS DateTime))
GO
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14021200000006', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.540' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14021400000001', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.553' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14021700000024', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.567' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14021900000037', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.577' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14022000000005', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.587' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14022400000056', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.600' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14022500000024', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.610' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14022500000046', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.623' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14022700000013', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.637' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14022700000022', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.647' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14022700000025', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.660' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14022800000033', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.670' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14030300000029', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.683' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14030700000031', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.693' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14031000000004', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.707' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14031800000035', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.717' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14032100000020', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.727' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14032400000017', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.737' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14032800000024', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.747' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14033100000024', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.760' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14040400000019', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.770' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14040800000031', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.783' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14040900000017', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.797' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14041500000012', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.807' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14041600000017', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.820' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14041800000004', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.830' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14041800000007', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.850' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14041800000014', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.867' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14042100000050', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.877' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14042200000033', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.887' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14042200000039', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.900' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14042500000028', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.910' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14042600000003', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.923' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14042800000046', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.937' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14050400000039', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.947' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14050800000019', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.960' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14050900000038', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.973' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14051200000087', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:08.987' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14051200000089', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.003' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14051400000013', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.013' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14051900000009', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.023' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14051900000084', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.040' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14051900000086', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.053' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14052000000024', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.060' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14052200000018', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.077' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14052700000054', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.087' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14052800000012', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.097' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14052900000024', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.103' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14060300000056', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.117' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14061100000015', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.127' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14061600000010', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.133' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14061600000035', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.143' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14061600000055', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.153' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14061600000074', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.160' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14061900000020', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.170' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14062400000001', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.183' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14062400000025', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.197' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14062400000040', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.207' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14062500000041', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.217' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14063000000049', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.227' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14070200000006', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.240' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14070300000036', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.253' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14070800000062', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.277' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14070900000018', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.287' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14071000000048', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.297' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14071500000027', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.310' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14071600000016', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.320' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14071600000052', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.333' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14071700000033', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.340' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14072100000004', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.350' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14072200000007', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.360' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14072800000081', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.370' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14072900000019', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.380' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14080400000078', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.390' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14080500000031', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.400' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14080600000003', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.417' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14080700000030', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.427' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14080900000001', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.437' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14081800000005', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.447' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14082000000016', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.457' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14082400000004', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.467' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14082500000018', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.477' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14082600000024', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.490' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14082600000040', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.500' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14082800000019', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.510' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14090300000043', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.523' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14090900000015', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.540' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14091300000002', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.550' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14091800000043', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.557' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14092300000036', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.567' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14092600000011', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.577' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14092600000030', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.587' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14100600000002', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.597' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14100800000002', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.607' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14100800000029', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.623' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14101400000027', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.637' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14101600000015', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.647' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14101700000019', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.657' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14101700000034', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.670' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14102000000063', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.680' AS DateTime))
GO
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14103100000044', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.693' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14110500000013', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.707' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14111000000066', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.723' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14111700000008', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.733' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14111900000060', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.747' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14112100000003', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.757' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14112400000047', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.770' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14112500000036', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.783' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14112600000044', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.797' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14112800000021', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.807' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14120400000016', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.823' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14121100000042', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.837' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14121200000047', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.853' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14121300000006', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.867' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14121500000032', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.880' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14121500000068', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.890' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14121600000067', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.903' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14122300000046', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.917' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14122300000048', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.930' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14122300000052', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.943' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14122500000052', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.957' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14122500000056', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.967' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_14122900000032', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.980' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15010400000031', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:09.993' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15010800000042', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.007' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15011500000013', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.020' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15011500000026', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.033' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15012600000079', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.047' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15012700000059', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.060' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15012900000033', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.073' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15020200000089', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.087' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15020400000031', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.100' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15020500000046', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.113' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15020800000001', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.123' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15021200000020', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.137' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15022500000054', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.153' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15022600000014', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.167' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15022800000005', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.177' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15030500000018', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.187' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15031400000003', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.197' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15031600000090', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.207' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15031700000035', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.217' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15031800000016', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.230' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15031800000028', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.250' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15032600000025', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.263' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15032600000047', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.280' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15032700000011', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.293' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15032700000038', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.303' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15040700000049', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.317' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15040700000095', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.327' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15040800000021', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.337' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15041300000117', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.350' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15041600000013', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.367' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15041700000006', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.377' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15041800000001', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.387' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15042000000040', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.400' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15042100000024', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.410' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15042100000060', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.420' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15042300000016', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.430' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15042300000042', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.440' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15042700000018', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.453' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15042700000026', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.467' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15042900000041', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.480' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15043000000001', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.493' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15050700000024', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.507' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15051200000002', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.517' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15051300000057', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.527' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15051400000021', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.537' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15051500000030', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.547' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15051600000006', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.557' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15051900000037', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.570' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15052200000010', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.583' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15052700000051', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.597' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15052900000042', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.613' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15060400000013', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.627' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15060400000030', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.637' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15060800000016', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.650' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15060900000047', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.660' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15061500000038', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.677' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15061900000001', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.687' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15062300000089', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.703' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15062500000002', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.717' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15062500000012', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.730' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15063000000032', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.740' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15063000000043', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.757' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15063000000046', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.770' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15063000000059', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.783' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15063000000066', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.797' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15070100000018', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.810' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15070100000050', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.823' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15070400000005', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.833' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15070600000080', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.850' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15070700000041', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.860' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15070900000016', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.873' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15071300000020', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.887' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15071400000054', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.900' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15071600000038', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.917' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15072000000024', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.930' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15072200000035', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.943' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15072400000004', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.957' AS DateTime))
GO
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15072400000017', 10003, N'CRC', 10018, N'0', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.967' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15072800000009', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.980' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15072900000012', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:10.993' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15072900000017', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.007' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15072900000039', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.023' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15073100000011', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.037' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15080300000054', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.050' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15080300000101', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.063' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15080500000041', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.077' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15080600000033', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.087' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15080600000069', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.100' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15081100000040', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.117' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15081300000033', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.130' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15081800000051', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.147' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15081900000022', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.163' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15082000000033', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.177' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15082400000018', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.190' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15082400000068', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.210' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15090100000033', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.227' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15090100000038', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.243' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15090200000019', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.257' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15090600000042', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.270' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15090700000069', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.290' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15090800000018', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.303' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15090800000043', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.317' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15091000000015', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.327' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15091500000021', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.347' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15091700000025', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.360' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15091800000036', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.377' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15091800000048', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.390' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15092100000004', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.403' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15092100000033', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.417' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15092200000012', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.427' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15092200000053', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.443' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15092500000044', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.457' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15100500000009', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.470' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15100800000022', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.483' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15100800000095', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.497' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15100900000005', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.507' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15101200000070', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.520' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15101300000005', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.530' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15101400000017', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.540' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15101400000031', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.557' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15101500000025', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.570' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15102000000016', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.583' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15102100000014', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.593' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15102300000054', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.607' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15102600000076', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.633' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15102900000048', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.657' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15110200000040', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.670' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15110600000034', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.683' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15110900000024', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.697' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15110900000111', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.710' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15111000000017', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.727' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15111000000061', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.737' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15111100000024', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.750' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15111300000030', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.763' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15111700000006', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.777' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15111700000020', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.793' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15111700000055', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.810' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15111800000041', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.823' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15112300000029', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.837' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15112300000125', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.847' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15112400000015', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.863' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15112500000061', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.877' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15112600000032', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.893' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15112700000011', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.907' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15113000000100', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.920' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15120300000023', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.933' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15120400000035', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.947' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15120700000031', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.960' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15121000000021', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.973' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15121100000058', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:11.987' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15121400000029', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.003' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15121500000066', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.017' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15122100000005', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.030' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15122100000015', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.043' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15122300000076', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.057' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_15122500000030', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.070' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16010400000011', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.087' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16010400000017', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.103' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16010400000098', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.117' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16010500000016', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.130' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16010700000019', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.143' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16010800000029', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.157' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16010800000038', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.170' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16011100000039', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.187' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16011400000005', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.200' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16011400000053', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.217' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16011800000074', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.233' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16011900000018', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.247' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16011900000033', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.260' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16011900000062', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.277' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16011900000066', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.293' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16012100000024', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.307' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16012100000053', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.327' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16012200000039', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.340' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16012400000008', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.353' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16012500000074', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.367' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16012500000084', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.380' AS DateTime))
GO
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16012600000008', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.397' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16020100000046', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.417' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16020300000017', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.433' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16021100000017', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.447' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16021400000063', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.463' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16021400000070', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.477' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16021400000079', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.490' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16021400000089', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.503' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16021500000086', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.523' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16021500000102', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.543' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16021500000103', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.557' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16021600000023', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.570' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16021700000022', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.583' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16021800000037', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.597' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16021800000043', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.613' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16021900000035', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.630' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16022200000103', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.647' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16022200000104', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.660' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16022200000105', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.677' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16022300000081', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.690' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16022400000037', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.703' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16022500000050', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.717' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16022500000054', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.737' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16022600000038', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.753' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16022900000096', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.770' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16022900000097', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.783' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16030100000023', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.797' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16030100000026', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.813' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16030400000021', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.830' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16030400000041', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.847' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16030700000071', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.860' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16030800000025', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.873' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16031000000049', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.887' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16031100000040', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.903' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16031400000077', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.917' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16031400000099', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.930' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16031400000100', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.947' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16031400000101', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.963' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16031500000043', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.980' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16031500000064', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:12.997' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16031500000067', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.010' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16031500000074', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.027' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16031600000050', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.040' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16031700000016', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.060' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16031800000036', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.077' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16032200000036', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.090' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16032200000041', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.110' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16032200000066', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.123' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16032300000037', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.137' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16032500000037', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.153' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16032600000007', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.167' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16032800000104', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.187' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16032900000024', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.203' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16032900000034', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.217' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16032900000041', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.230' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16040500000040', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.247' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16040500000069', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.260' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16040500000076', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.277' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16040600000035', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.290' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16040800000022', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.307' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16040800000032', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.327' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16040800000044', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.340' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16041100000065', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.353' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16041100000078', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.367' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16041200000031', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.383' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16041300000050', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.400' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16041300000055', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.417' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16041800000004', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.433' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16041800000066', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.447' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16042000000007', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.460' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16042000000037', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.477' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16042100000054', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.493' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16042500000077', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.507' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16042600000009', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.520' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16042600000020', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.533' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16042800000039', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.547' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16042800000055', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.557' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16042900000026', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.570' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16043000000006', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.583' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16050300000052', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.597' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16050500000020', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.613' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16050600000042', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.627' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16050900000020', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.643' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16050900000048', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.657' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16050900000068', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.670' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16050900000091', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.683' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16051000000041', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.703' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16051000000047', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.717' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16051000000053', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.727' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16051300000047', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.740' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16051700000001', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.757' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16051700000068', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.770' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16051700000079', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.783' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16051800000013', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.800' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16051900000028', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.817' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16051900000048', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.833' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16052000000022', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.850' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16052300000116', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.867' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16052400000033', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.883' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16052500000052', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.900' AS DateTime))
GO
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16052600000048', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.920' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16052600000049', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.933' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16052600000052', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.947' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16052700000043', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.960' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16052700000051', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.973' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16053000000065', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:13.987' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16060300000039', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.000' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16060300000050', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.013' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16060500000005', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.030' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16060600000046', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.050' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16060700000033', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.067' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16061200000010', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.080' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16061200000058', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.090' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16061300000106', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.107' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16061400000046', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.120' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16061700000018', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.137' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16061700000063', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.150' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16062100000018', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.163' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16062100000045', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.183' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16062200000005', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.197' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16062200000037', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.210' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16062400000034', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.227' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16062800000020', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.243' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16062800000051', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.267' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16062800000053', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.283' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16070100000039', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.297' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16070300000003', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.313' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16070300000007', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.330' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16070400000014', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.347' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16070400000104', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.367' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16070400000105', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.380' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16070500000023', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.397' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16070500000028', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.410' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16070500000039', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.427' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16070700000030', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.443' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16070800000061', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.460' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16071100000097', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.477' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16071100000110', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.493' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16071200000075', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.510' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16071300000009', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.527' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16071300000027', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.540' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16071400000053', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.560' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16071400000060', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.577' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16071400000063', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.590' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16071800000026', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.607' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16071800000081', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.620' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16071800000096', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.637' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16071800000118', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.650' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16071900000030', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.667' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16071900000071', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.683' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16072100000037', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.703' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16072100000059', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.723' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16072200000042', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.740' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16072500000106', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.757' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16072600000048', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.773' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16072600000051', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.790' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16072600000063', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.803' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16072900000022', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.820' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16080100000027', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.837' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16080100000048', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.853' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16080400000030', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.870' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16080400000052', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.887' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16080400000054', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.900' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16080900000036', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.917' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16080900000040', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.937' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16080900000080', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.950' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16081100000050', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.967' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16081500000026', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:14.987' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16081500000033', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.003' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16081500000100', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.020' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16081500000101', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.037' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16081600000040', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.050' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16081600000054', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.067' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16081600000066', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.083' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16081700000033', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.097' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16082200000022', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.113' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16082200000026', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.137' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16082200000098', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.153' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16082200000110', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.167' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16082300000052', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.187' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16082600000019', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.207' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16082900000012', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.220' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16083000000048', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.237' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16090500000105', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.253' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16090600000043', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.270' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16090600000082', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.283' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16090700000077', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.300' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16090900000034', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.317' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16090900000055', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.337' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16091200000081', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.353' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16091400000043', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.370' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16091800000075', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.387' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16091800000076', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.407' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16091900000063', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.420' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16092000000051', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.440' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16092100000026', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.457' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16092100000057', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.470' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16092200000036', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.487' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16092200000055', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.503' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16092200000068', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.520' AS DateTime))
GO
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16092300000033', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.537' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16092600000139', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.553' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16092700000039', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.570' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16092800000040', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.587' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16092800000044', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.607' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16092800000048', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.623' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16100300000004', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.640' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16100800000003', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.657' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16100800000004', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.673' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16100800000121', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.690' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16101000000090', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.707' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16101100000008', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.720' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16101100000042', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.737' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16101200000083', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.753' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16101400000013', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.770' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16101800000022', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.787' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16102000000007', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.810' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16102000000068', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.827' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16102100000039', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.850' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16102300000010', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.867' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16102500000013', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.887' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16102500000049', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.910' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16102500000066', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.927' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16103100000052', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.943' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16103100000101', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.960' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16110100000053', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.980' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16110300000050', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:15.997' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16110300000061', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.017' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16110400000025', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.040' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16110400000026', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.057' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16110400000045', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.070' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16110400000052', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.087' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16110700000127', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.100' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16110800000056', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.113' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16111000000046', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.127' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16111100000036', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.143' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16111100000040', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.157' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16111400000056', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.170' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16112200000042', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.187' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16112200000084', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.200' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16112400000053', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.223' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16112400000059', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.237' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16112600000009', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.257' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16120200000039', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.273' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16120600000072', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.300' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16120700000047', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.320' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16120700000086', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.373' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16120800000004', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.403' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16120800000020', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.420' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16120900000009', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.437' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16120900000014', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.453' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16120900000058', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.473' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16121200000125', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.487' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16121300000003', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.540' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16121300000051', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.567' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16121400000017', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.597' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16121400000032', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.637' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16121500000041', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.657' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16121500000058', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.677' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16121600000022', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.693' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16121900000116', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.710' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16122000000036', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.723' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16122100000057', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.747' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16122200000058', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:16.980' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16122600000023', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.007' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16122600000118', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.060' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16122700000058', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.083' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16122700000062', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.103' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16122700000063', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.123' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16122800000025', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.140' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_16122800000040', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.157' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17010300000091', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.173' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17010500000073', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.223' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17011000000085', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.290' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17011000000092', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.330' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17011200000008', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.363' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17011200000045', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.407' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17011300000021', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.437' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17011600000108', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.450' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17011700000036', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.467' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17012000000050', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.483' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17012400000014', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.500' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17012400000032', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.513' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17012500000005', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.530' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17020400000080', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.553' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17020600000056', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.580' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17020700000006', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.597' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17020700000038', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.617' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17020800000007', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.630' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17020800000036', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.643' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17021300000099', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.660' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17021300000130', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.677' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17021300000131', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.690' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17021300000134', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.703' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17021400000042', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.720' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17021600000006', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.733' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17021600000026', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.747' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17021600000032', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.770' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17021600000035', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.793' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17022000000096', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.810' AS DateTime))
GO
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17022000000119', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.830' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17022400000026', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.847' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17022400000039', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.860' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17022700000115', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.877' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17022700000133', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.890' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17022800000025', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.907' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17030300000034', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.923' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17030600000045', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.950' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17030600000058', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.967' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17030600000084', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:17.990' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17030600000106', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:18.013' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17030700000064', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:18.033' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17030800000037', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:18.050' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17030900000003', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:18.067' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17031000000055', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:18.080' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17031300000129', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:18.097' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17031400000045', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:18.113' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17031500000025', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:18.143' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10022, N'CRC_1_17031600000004', 10003, N'CRC', 10018, N'1', NULL, N'超级管理员', CAST(N'2017-08-17T18:55:18.167' AS DateTime))
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10023, N'10001', 10002, N'YXA', 123, N'1', NULL, NULL, NULL)
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10024, N'10001', 10002, N'YXA', 123, N'1', NULL, NULL, NULL)
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10025, N'10001', 10002, N'YXA', 123, N'1', NULL, NULL, NULL)
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10026, N'10001', 10002, N'YXA', 123, N'1', NULL, NULL, NULL)
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10027, N'10001', 10002, N'YXA', 123, N'1', NULL, NULL, NULL)
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10028, N'10001', 10002, N'YXA', 123, N'1', NULL, NULL, NULL)
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10029, N'10001', 10002, N'YXA', 123, N'1', NULL, NULL, NULL)
INSERT [dbo].[SD_ITEM_VALUE] ([SD_ITEM_ID], [SD_CPAT_NO], [SD_ID], [SD_CODE], [SD_FILTER_ID], [SD_ITEM_VALUE], [LAST_VALUE], [UPD_USER_ID], [UPD_DATE]) VALUES (10030, N'10001', 10002, N'YXA', 123, N'1', NULL, NULL, NULL)
INSERT [dbo].[Sys_Item] ([Id], [EnCode], [ParentId], [Name], [Layer], [SortCode], [IsTree], [DeleteMark], [IsEnabled], [Remark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'0e9a3b52-1cfc-41a4-8f6d-3ed8b321aecf', N'xueli', N'8238c495-8376-4004-9a34-56d0dcbd11ea', N'学历', 1, 3, NULL, 0, 1, NULL, NULL, NULL, N'admin', CAST(N'2017-05-13T19:14:25.013' AS DateTime))
INSERT [dbo].[Sys_Item] ([Id], [EnCode], [ParentId], [Name], [Layer], [SortCode], [IsTree], [DeleteMark], [IsEnabled], [Remark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'7b247f60-4095-4ffe-96e0-1935a25852de', N'hunyin', N'8238c495-8376-4004-9a34-56d0dcbd11ea', N'婚姻', 1, 4, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_Item] ([Id], [EnCode], [ParentId], [Name], [Layer], [SortCode], [IsTree], [DeleteMark], [IsEnabled], [Remark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'8238c495-8376-4004-9a34-56d0dcbd11ea', N'all_items', N'0', N'数据字典', 0, 0, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_Item] ([Id], [EnCode], [ParentId], [Name], [Layer], [SortCode], [IsTree], [DeleteMark], [IsEnabled], [Remark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'9c51a17c-7afd-4986-bfc9-94f9dd818ecf', N'role_type', N'8238c495-8376-4004-9a34-56d0dcbd11ea', N'角色类型', 1, 1, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_Item] ([Id], [EnCode], [ParentId], [Name], [Layer], [SortCode], [IsTree], [DeleteMark], [IsEnabled], [Remark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'd2f966ba-d541-4ac9-8837-b5303d5c3502', N'org_type', N'8238c495-8376-4004-9a34-56d0dcbd11ea', N'机构类型', 1, 2, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_ItemsDetail] ([Id], [ItemId], [EnCode], [Name], [IsDefault], [SortCode], [DeleteMark], [IsEnabled], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'14f0c64a-f3d8-439d-bc0a-d9a5a41a2d46', N'd2f966ba-d541-4ac9-8837-b5303d5c3502', N'org-team', N'小组', 0, 4, 0, 1, NULL, NULL, N'admin', CAST(N'2017-07-12T11:00:47.137' AS DateTime))
INSERT [dbo].[Sys_ItemsDetail] ([Id], [ItemId], [EnCode], [Name], [IsDefault], [SortCode], [DeleteMark], [IsEnabled], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'16c3d367-d63e-4426-9745-ed6824e8454d', N'0e9a3b52-1cfc-41a4-8f6d-3ed8b321aecf', N'shuoshi', N'硕士', 0, 7, 0, 1, N'admin', CAST(N'2017-04-29T16:49:54.183' AS DateTime), N'admin', CAST(N'2017-04-29T16:49:54.183' AS DateTime))
INSERT [dbo].[Sys_ItemsDetail] ([Id], [ItemId], [EnCode], [Name], [IsDefault], [SortCode], [DeleteMark], [IsEnabled], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'557427ff-8bb7-4e8b-ba3d-91f31ab02b59', N'0e9a3b52-1cfc-41a4-8f6d-3ed8b321aecf', N'xiaoxue', N'小学及以下', 0, 1, 0, 1, N'admin', CAST(N'2017-04-29T16:44:34.410' AS DateTime), N'admin', CAST(N'2017-04-29T16:50:15.873' AS DateTime))
INSERT [dbo].[Sys_ItemsDetail] ([Id], [ItemId], [EnCode], [Name], [IsDefault], [SortCode], [DeleteMark], [IsEnabled], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'738aee95-3597-412e-9a0a-e7e3161c86cf', N'9c51a17c-7afd-4986-bfc9-94f9dd818ecf', N'role-business', N'业务角色', 1, 2, 0, 1, NULL, NULL, N'admin', CAST(N'2017-06-03T17:38:50.330' AS DateTime))
INSERT [dbo].[Sys_ItemsDetail] ([Id], [ItemId], [EnCode], [Name], [IsDefault], [SortCode], [DeleteMark], [IsEnabled], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'7c51742f-fed3-48c4-8c5b-7f8b8c64cff0', N'0e9a3b52-1cfc-41a4-8f6d-3ed8b321aecf', N'benke', N'本科', 1, 5, 0, 1, N'admin', CAST(N'2017-04-29T16:46:24.133' AS DateTime), N'admin', CAST(N'2017-04-29T16:50:25.883' AS DateTime))
INSERT [dbo].[Sys_ItemsDetail] ([Id], [ItemId], [EnCode], [Name], [IsDefault], [SortCode], [DeleteMark], [IsEnabled], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'85d02da8-06f2-4fba-9dcf-7e3b971f9028', N'd2f966ba-d541-4ac9-8837-b5303d5c3502', N'org-company', N'公司', 1, 1, 0, 1, NULL, NULL, N'admin', CAST(N'2017-06-03T17:40:04.350' AS DateTime))
INSERT [dbo].[Sys_ItemsDetail] ([Id], [ItemId], [EnCode], [Name], [IsDefault], [SortCode], [DeleteMark], [IsEnabled], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'85e46a33-b065-4ba2-99da-c02947bfc5e6', N'd2f966ba-d541-4ac9-8837-b5303d5c3502', N'org-department', N'部门', 0, 2, 0, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_ItemsDetail] ([Id], [ItemId], [EnCode], [Name], [IsDefault], [SortCode], [DeleteMark], [IsEnabled], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'ac53424f-adbb-4477-b534-b0bc72ea5f41', N'0e9a3b52-1cfc-41a4-8f6d-3ed8b321aecf', N'chuzhong', N'初中', 0, 2, 0, 1, N'admin', CAST(N'2017-04-29T16:44:56.470' AS DateTime), N'admin', CAST(N'2017-04-29T16:44:56.470' AS DateTime))
INSERT [dbo].[Sys_ItemsDetail] ([Id], [ItemId], [EnCode], [Name], [IsDefault], [SortCode], [DeleteMark], [IsEnabled], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'C52CBE29-CB92-465F-9697-2AAB7C214FFD', N'd2f966ba-d541-4ac9-8837-b5303d5c3502', N'org-child-dept', N'子部门', 0, 3, 0, 1, N'admin', CAST(N'2017-07-12T11:00:40.667' AS DateTime), N'admin', CAST(N'2017-07-12T11:00:40.667' AS DateTime))
INSERT [dbo].[Sys_ItemsDetail] ([Id], [ItemId], [EnCode], [Name], [IsDefault], [SortCode], [DeleteMark], [IsEnabled], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'cb579de4-b816-435f-aaa5-f666a6838ca5', N'9c51a17c-7afd-4986-bfc9-94f9dd818ecf', N'role-system', N'系统角色', 0, 1, 0, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_ItemsDetail] ([Id], [ItemId], [EnCode], [Name], [IsDefault], [SortCode], [DeleteMark], [IsEnabled], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'cf5d4197-678f-47b9-8f35-ffc23ba68cee', N'9c51a17c-7afd-4986-bfc9-94f9dd818ecf', N'role-other', N'其他角色', 0, 3, 0, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sys_ItemsDetail] ([Id], [ItemId], [EnCode], [Name], [IsDefault], [SortCode], [DeleteMark], [IsEnabled], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'd327c3ca-a557-4f95-8bbf-659fcf09782d', N'0e9a3b52-1cfc-41a4-8f6d-3ed8b321aecf', N'dazhuan', N'大专', 0, 4, 0, 1, N'admin', CAST(N'2017-04-29T16:45:27.437' AS DateTime), N'admin', CAST(N'2017-04-29T16:45:27.437' AS DateTime))
INSERT [dbo].[Sys_ItemsDetail] ([Id], [ItemId], [EnCode], [Name], [IsDefault], [SortCode], [DeleteMark], [IsEnabled], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'f500ed63-e91a-40a5-8e80-6b58895007d3', N'0e9a3b52-1cfc-41a4-8f6d-3ed8b321aecf', N'yanjiusheng', N'研究生', 0, 6, 0, 1, N'admin', CAST(N'2017-04-29T16:46:45.813' AS DateTime), N'admin', CAST(N'2017-04-29T16:46:45.813' AS DateTime))
INSERT [dbo].[Sys_ItemsDetail] ([Id], [ItemId], [EnCode], [Name], [IsDefault], [SortCode], [DeleteMark], [IsEnabled], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'f51b746e-476a-4e39-839f-abed4be676cf', N'0e9a3b52-1cfc-41a4-8f6d-3ed8b321aecf', N'gaozhong', N'高中', 0, 3, 0, 1, N'admin', CAST(N'2017-04-29T16:45:06.660' AS DateTime), N'admin', CAST(N'2017-04-29T16:45:06.660' AS DateTime))
INSERT [dbo].[Sys_ItemsDetail] ([Id], [ItemId], [EnCode], [Name], [IsDefault], [SortCode], [DeleteMark], [IsEnabled], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'fff309f2-9baa-4283-84a8-74c97fcd83e2', N'0e9a3b52-1cfc-41a4-8f6d-3ed8b321aecf', N'boshi', N'博士', 0, 8, 0, 0, N'admin', CAST(N'2017-04-29T16:50:10.027' AS DateTime), N'admin', CAST(N'2017-06-05T18:30:48.030' AS DateTime))
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'04c3bca8-94d9-4642-958b-46d2747c3572', CAST(N'2017-07-11T09:40:46.390' AS DateTime), N'INFO', N'系统登录', N'密码错误', N'admin', N'高阳', N'172.16.6.3', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'068ea9bb-3d27-4686-a5e7-fb7ff9450807', CAST(N'2017-07-10T15:07:47.547' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'192.168.1.107', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'0d6bd0e5-9b89-442f-898e-7e35b7571642', CAST(N'2017-07-06T15:02:37.133' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'172.16.6.3', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'10e589aa-c174-442a-8516-66383f23bb3a', CAST(N'2017-07-06T14:36:46.177' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'172.16.6.3', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'11b9d998-6fef-43db-bdc2-f7b2446c8865', CAST(N'2017-07-11T14:55:06.817' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'192.168.2.139', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'1714eae6-2751-40aa-a0ad-be9cd957d131', CAST(N'2017-07-10T11:36:18.527' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'192.168.1.107', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'1ce18b3e-eae8-4dd2-955d-d8dc7267ed16', CAST(N'2017-07-11T14:31:40.140' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'192.168.2.139', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'20c36cb4-b4fc-4717-b063-d6defa804dfa', CAST(N'2017-07-10T14:57:53.870' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'192.168.1.107', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'27a870af-29c8-4112-9818-2d4c358453da', CAST(N'2017-07-11T14:48:19.903' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'192.168.2.139', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'2d327ecf-85e1-482e-87a7-725cb5ae0fc0', CAST(N'2017-07-06T13:32:44.027' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'172.16.6.3', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'36df8f00-8072-4078-89d3-52f8c5f5c446', CAST(N'2017-07-11T14:48:10.860' AS DateTime), N'INFO', N'系统登录', N'密码错误', N'admin', N'高阳', N'192.168.2.139', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'38432deb-0c93-42a6-b567-062e1925e1d9', CAST(N'2017-07-06T14:27:03.173' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'172.16.6.3', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'3e58f8d5-4305-4eb7-9a7c-dd06e8a22b88', CAST(N'2017-07-11T14:38:43.037' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'192.168.2.139', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'4e13ae02-4b3a-4a61-81c5-d12115abc712', CAST(N'2017-07-06T14:28:28.183' AS DateTime), N'INFO', N'系统登录', N'密码错误', N'admin', N'高阳', N'172.16.6.3', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'53c6528b-4d19-4f46-a433-a1daddd07dfa', CAST(N'2017-07-11T09:40:40.047' AS DateTime), N'INFO', N'系统登录', N'密码错误', N'admin', N'高阳', N'172.16.6.3', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'545d4b72-62be-4653-a490-1175a5a855b6', CAST(N'2017-07-10T14:35:55.530' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'192.168.1.107', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'5689bbcd-cfa1-4190-96ba-67d11f27bf60', CAST(N'2017-07-06T14:04:35.833' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'172.16.6.3', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'5e31d86e-ad93-4671-960f-29c6a108b419', CAST(N'2017-07-11T09:02:29.977' AS DateTime), N'INFO', N'系统登录', N'密码错误', N'admin', N'高阳', N'172.16.6.3', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'5fd6b3c5-3e03-4ffd-bfb6-c1b18e086d67', CAST(N'2017-07-10T15:03:49.150' AS DateTime), N'INFO', N'系统登录', N'密码错误', N'admin', N'高阳', N'192.168.1.107', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'62036607-81ab-4d36-a38a-110e91ccd496', CAST(N'2017-07-10T10:37:41.760' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'192.168.1.107', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'629cf4e9-6924-4576-aacf-6f460d64133c', CAST(N'2017-07-11T13:47:49.797' AS DateTime), N'INFO', N'系统登录', N'密码错误', N'admin', N'高阳', N'192.168.2.139', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'64488cea-f897-403f-b246-cdbabbe93599', CAST(N'2017-07-12T10:31:01.927' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'小高', N'192.168.2.139', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'69e9dd18-6cdc-4fe2-8567-8034c0bf8e27', CAST(N'2017-07-12T10:14:07.237' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'192.168.2.139', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'6d2b916c-397d-48a1-aeb0-46e4db09904f', CAST(N'2017-07-12T10:35:21.517' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'小高', N'192.168.2.139', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'6e7c116a-ce0e-4232-89c1-2781748cf585', CAST(N'2017-07-11T10:04:08.383' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'172.16.6.3', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'771612ed-2bac-4342-bc26-b265f1e544fd', CAST(N'2017-07-06T11:27:03.720' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'172.16.6.3', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'839d128f-08d7-448d-b4f6-7ac9f9c0dd69', CAST(N'2017-07-06T14:01:00.360' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'172.16.6.3', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'86a95080-97dc-4440-bc0f-f9aa73514f23', CAST(N'2017-07-10T11:05:17.047' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'192.168.1.107', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'874599c9-6b67-4dd0-8a92-c0d53dae0f96', CAST(N'2017-07-11T14:50:56.317' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'192.168.2.139', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'900e5431-aeea-4265-9e84-dc801f021eb1', CAST(N'2017-07-06T14:30:29.730' AS DateTime), N'INFO', N'系统登录', N'密码错误', N'admin', N'高阳', N'172.16.6.3', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'9ed92039-b602-445e-a3f3-eeba93258955', CAST(N'2017-07-06T13:52:23.207' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'172.16.6.3', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'a34bc6ad-c34f-42c0-af21-7f9cee3144e4', CAST(N'2017-07-11T14:33:29.237' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'192.168.2.139', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'a4fec460-e39f-4e43-8f41-679e9038808c', CAST(N'2017-07-06T15:44:25.437' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'172.16.6.3', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'ad6d3e4b-521c-4e9e-90b1-477fc3dba7b8', CAST(N'2017-07-10T15:01:33.443' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'192.168.1.107', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'b0b8e289-cc91-424b-b6dd-1c0c4ed2dbc3', CAST(N'2017-07-11T09:40:56.847' AS DateTime), N'INFO', N'系统登录', N'密码错误', N'admin', N'高阳', N'172.16.6.3', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'b1cc0c3a-9e90-4161-8fc9-a722807b5f6a', CAST(N'2017-07-06T14:03:07.803' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'172.16.6.3', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'b6072b0a-5191-4e64-b0a1-9f24552cb695', CAST(N'2017-07-11T13:47:58.807' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'192.168.2.139', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'c1f7fa39-fb66-4e5d-91ff-d6ada01a52f2', CAST(N'2017-07-10T16:16:27.370' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'192.168.1.107', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'c32109f8-3f27-483a-9dc5-4040c98d959c', CAST(N'2017-07-06T15:56:02.843' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'172.16.6.3', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'd7ec4270-b10e-4ea7-9290-54f051201d9a', CAST(N'2017-07-11T13:47:42.607' AS DateTime), N'INFO', N'系统登录', N'密码错误', N'admin', N'高阳', N'192.168.2.139', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'dadfd2a1-a138-410d-b07f-3b753f7fcd3b', CAST(N'2017-07-06T14:45:55.177' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'172.16.6.3', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'dd40b895-bcf4-457d-8796-379b144fc0f5', CAST(N'2017-07-06T14:29:14.923' AS DateTime), N'INFO', N'系统登录', N'密码错误', N'admin', N'高阳', N'172.16.6.3', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'eada4081-c859-4980-ab75-093df70c8765', CAST(N'2017-07-11T15:40:28.940' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'192.168.2.139', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'f2c0b49d-57cb-4ad7-be36-93e29518cc3d', CAST(N'2017-07-11T14:27:15.887' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'192.168.2.139', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'fba23cf9-950d-449b-a514-5b57b5e118fd', CAST(N'2017-07-11T09:02:42.553' AS DateTime), N'INFO', N'系统登录', N'登录成功', N'admin', N'高阳', N'172.16.6.3', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Log] ([Id], [CreateTime], [LogLevel], [Operation], [Message], [Account], [RealName], [IP], [IPAddress], [Browser], [StackTrace]) VALUES (N'ffbdc165-cb6f-43b4-874b-913e58adc29e', CAST(N'2017-07-11T14:38:34.817' AS DateTime), N'INFO', N'系统登录', N'密码错误', N'admin', N'高阳', N'192.168.2.139', N'未分配或者内网IP', N'Chrome 58.0', N'<no type>.lambda_method => AccountController.Login => LogHelper.Write')
INSERT [dbo].[Sys_Organize] ([Id], [ParentId], [Layer], [EnCode], [FullName], [Type], [ManagerId], [TelePhone], [WeChat], [Fax], [Email], [Address], [SortCode], [DeleteMark], [IsEnabled], [Remark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'25fa48f8-00d3-4b5d-bee9-b49324410906', N'771b628b-e43c-4592-b1ef-70ea23b0e3f2', 0, N'market', N'市场部', 1, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0, 1, NULL, NULL, NULL, N'admin', CAST(N'2017-04-04T17:59:32.370' AS DateTime))
INSERT [dbo].[Sys_Organize] ([Id], [ParentId], [Layer], [EnCode], [FullName], [Type], [ManagerId], [TelePhone], [WeChat], [Fax], [Email], [Address], [SortCode], [DeleteMark], [IsEnabled], [Remark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'2a871804-5c78-481f-a167-7874b56a54d7', N'771b628b-e43c-4592-b1ef-70ea23b0e3f2', 0, N'afterSale', N'售后部', 1, NULL, NULL, NULL, NULL, NULL, NULL, 70, 0, 1, NULL, NULL, NULL, N'admin', CAST(N'2017-07-12T10:49:09.703' AS DateTime))
INSERT [dbo].[Sys_Organize] ([Id], [ParentId], [Layer], [EnCode], [FullName], [Type], [ManagerId], [TelePhone], [WeChat], [Fax], [Email], [Address], [SortCode], [DeleteMark], [IsEnabled], [Remark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'339a409a-a5a6-49b4-9071-86d7699a9ddd', N'771b628b-e43c-4592-b1ef-70ea23b0e3f2', 0, N'administration', N'行政人事部', 1, NULL, NULL, NULL, NULL, NULL, NULL, 40, 0, 1, NULL, NULL, NULL, N'admin', CAST(N'2017-07-12T10:48:56.980' AS DateTime))
INSERT [dbo].[Sys_Organize] ([Id], [ParentId], [Layer], [EnCode], [FullName], [Type], [ManagerId], [TelePhone], [WeChat], [Fax], [Email], [Address], [SortCode], [DeleteMark], [IsEnabled], [Remark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'3894D0BD-744A-40C6-AD98-EC759B163DA4', N'a93c66e2-b8dc-4d00-84ed-e6071b5f5318', NULL, N'df', N'dfd', 0, N'df', N'df', N'df', N'df', N'df', N'df', 1, 0, 1, N'df', N'admin', CAST(N'2017-07-20T16:47:43.223' AS DateTime), N'admin', CAST(N'2017-07-20T16:47:43.223' AS DateTime))
INSERT [dbo].[Sys_Organize] ([Id], [ParentId], [Layer], [EnCode], [FullName], [Type], [ManagerId], [TelePhone], [WeChat], [Fax], [Email], [Address], [SortCode], [DeleteMark], [IsEnabled], [Remark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'5fc64d6e-d790-4f53-ab51-99c369860965', N'771b628b-e43c-4592-b1ef-70ea23b0e3f2', 0, N'financial', N'财务部', 1, NULL, NULL, NULL, NULL, NULL, NULL, 50, 0, 0, NULL, NULL, NULL, N'admin', CAST(N'2017-07-12T10:49:03.823' AS DateTime))
INSERT [dbo].[Sys_Organize] ([Id], [ParentId], [Layer], [EnCode], [FullName], [Type], [ManagerId], [TelePhone], [WeChat], [Fax], [Email], [Address], [SortCode], [DeleteMark], [IsEnabled], [Remark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'67ccf447-0f20-4cf8-9159-a5552cf7dc10', N'771b628b-e43c-4592-b1ef-70ea23b0e3f2', 0, N'project', N'项目部', 1, NULL, NULL, NULL, NULL, NULL, NULL, 80, 0, 1, NULL, NULL, NULL, N'admin', CAST(N'2017-04-04T18:00:44.433' AS DateTime))
INSERT [dbo].[Sys_Organize] ([Id], [ParentId], [Layer], [EnCode], [FullName], [Type], [ManagerId], [TelePhone], [WeChat], [Fax], [Email], [Address], [SortCode], [DeleteMark], [IsEnabled], [Remark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'771b628b-e43c-4592-b1ef-70ea23b0e3f2', N'0', NULL, N'company', N'XX科技股份有限公司', 0, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 1, NULL, NULL, NULL, N'admin', CAST(N'2017-07-12T10:48:45.380' AS DateTime))
INSERT [dbo].[Sys_Organize] ([Id], [ParentId], [Layer], [EnCode], [FullName], [Type], [ManagerId], [TelePhone], [WeChat], [Fax], [Email], [Address], [SortCode], [DeleteMark], [IsEnabled], [Remark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'a93c66e2-b8dc-4d00-84ed-e6071b5f5318', N'771b628b-e43c-4592-b1ef-70ea23b0e3f2', NULL, N'product', N'产品事业部', 1, NULL, NULL, NULL, NULL, NULL, NULL, 30, 0, 1, NULL, NULL, NULL, N'admin', CAST(N'2017-04-04T17:59:39.780' AS DateTime))
INSERT [dbo].[Sys_Organize] ([Id], [ParentId], [Layer], [EnCode], [FullName], [Type], [ManagerId], [TelePhone], [WeChat], [Fax], [Email], [Address], [SortCode], [DeleteMark], [IsEnabled], [Remark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'E621A829-9767-4A2B-A15F-C38D350B09AA', N'25fa48f8-00d3-4b5d-bee9-b49324410906', 1, N'sfs', N'sdfs', 1, N'fds', N'sdfs', N'sdfsd', N'sfs', N'sdfs', N'sdfs', 1, 0, 1, N'fsd', N'admin', CAST(N'2017-07-20T16:45:42.440' AS DateTime), N'admin', CAST(N'2017-07-20T16:45:42.440' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'026550fd-2578-42ae-a041-625cda12325f', N'855f3590-b233-4224-aaff-47fb95c8353d', 2, N'role-add', N'新增角色', N'btn_add()', N'
fa fa-plus-square-o', N'/System/Role/Form', NULL, 1, 10301, 0, 1, 1, 0, N'admin', CAST(N'2017-03-28T16:30:21.277' AS DateTime), N'admin', CAST(N'2017-03-28T16:30:21.277' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'069f00f6-2a82-4bbe-90d6-418f37d5ef1f', N'3c69e3fb-e1fe-4911-8417-6f6d55a1ce72', 2, N'item-detail', N'查看选项', N'btn_detail()', N'fa fa-eye', N'/System/ItemsDetail/Detail', NULL, 1, 10505, 0, 1, 1, 0, N'admin', CAST(N'2017-04-04T20:16:02.347' AS DateTime), N'admin', CAST(N'2017-04-04T20:18:13.513' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'086ee328-5a15-40b0-8e15-291093e2e8b1', N'09157352-1252-4964-8fee-479759a95db8', 2, N'org-edit', N'修改机构', N'btn_edit()', N'fa fa-pencil-square-o', N'/System/Organize/Form', NULL, 1, 10402, 0, 1, 1, 0, N'admin', CAST(N'2017-04-02T09:38:32.333' AS DateTime), N'admin', CAST(N'2017-04-02T09:38:32.333' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'09157352-1252-4964-8fee-479759a95db8', N'2d0b02db-09f7-4404-bbdd-c8a516f48288', 1, N'sys-organize', N'组织机构', NULL, N'fa fa-building', N'/System/Organize/Index', NULL, 0, 10400, 0, 0, 0, 0, N'admin', CAST(N'2017-04-02T09:31:00.937' AS DateTime), N'admin', CAST(N'2017-08-18T09:19:12.660' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'0d2ea3c9-5b29-4bb6-9f91-0322419ded8e', N'e5346fa2-76ec-498f-8f54-3b443959335a', 2, N'per-delete', N'删除权限', N'btn_delete()', N'fa fa-trash-o', N'/System/Permission/Delete', NULL, 1, 10203, 0, 1, 1, 0, N'admin', CAST(N'2017-02-20T09:51:18.693' AS DateTime), N'admin', NULL)
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'169DF1EA-E3FD-4E97-9AB2-D1C4465C9BA1', N'336F8206-EB11-4C12-851B-20B21354532A', 2, N'project-add', N'添加', N'btn_add()', N'fa fa-plus-square-o', N'/TestCenterSystem/AddForm', NULL, 1, 20002, 0, 1, 1, 0, N'admin', CAST(N'2017-07-21T16:41:04.013' AS DateTime), N'admin', CAST(N'2017-08-18T09:42:14.553' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'1C96AD3E-A4A9-4843-A826-AE50863C7184', N'0', 0, N'project-setting', N'系统设置', NULL, N'fa fa-product-hunt', NULL, NULL, 0, 2000, 0, 1, 1, 0, N'admin', CAST(N'2017-07-21T16:31:29.687' AS DateTime), N'admin', CAST(N'2017-07-21T16:31:29.687' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'216d09a8-575f-43d1-85f6-acc025fa94b3', N'6d90439c-eb6b-4521-ab4d-5e481406a861', 2, N'user-detail', N'查看用户', N'btn_detail()', N'fa fa-eye', N'/System/User/Detail', NULL, 1, 10104, 0, 1, 1, 0, N'admin', CAST(N'2017-03-28T16:20:17.830' AS DateTime), N'admin', CAST(N'2017-03-28T16:20:17.830' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'233e50fd-4860-42f9-aa7a-93853ac0434b', N'277c8647-ea81-42cf-8f7b-db353da95bbe', 1, N'data-backup', N'数据备份', NULL, N'fa fa-list', N'/System/Data/Index', NULL, 0, 20100, 0, 1, 1, 0, N'admin', NULL, N'admin', CAST(N'2017-07-12T10:50:53.657' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'2626147F-0341-4529-84C2-181CA763CDE0', N'2D0D3AB9-FF60-4886-A9A9-4F1F59E4F224', 2, N'dataItem-delete', N'删除', N'btn_delete()', N'fa fa-trash-o', N'/TestCenterSystem/DataItem/Form', NULL, 1, 6, 0, 1, 1, 0, N'admin', CAST(N'2017-07-26T09:29:20.680' AS DateTime), N'admin', CAST(N'2017-08-17T15:15:25.120' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'277c8647-ea81-42cf-8f7b-db353da95bbe', N'0', 0, NULL, N'系统安全', NULL, N'fa fa-desktop', NULL, NULL, 0, 20000, 0, 1, 1, 0, N'admin', NULL, N'admin', NULL)
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'28a045a6-61f4-4784-8578-837ad307e4e3', N'e5346fa2-76ec-498f-8f54-3b443959335a', 2, N'per-add', N'新增权限', N'btn_add()', N'
fa fa-plus-square-o', N'/System/Permission/Form', NULL, 1, 10201, 0, 1, 1, 0, N'admin', CAST(N'2017-02-13T14:28:21.813' AS DateTime), N'admin', NULL)
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'2B3FA265-CB5B-4451-9C12-68EA878FA9D3', N'B87C00BF-1812-4B06-9C42-C8CD5D0BD587', 2, N'Ingroup-modify', N'修改', N'btn_edit()', N'fa fa-edit', N'/TestCenterSystem/InGroup/Form', NULL, 1, 3, 0, 1, 1, 0, N'admin', CAST(N'2017-07-20T13:48:22.497' AS DateTime), N'admin', CAST(N'2017-08-17T18:32:36.380' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'2c24cdfc-8f26-4947-bcb2-0cb4d9111e80', N'e5346fa2-76ec-498f-8f54-3b443959335a', 2, N'per-detail', N'查看权限', N'btn_detail()', N'fa fa-eye', N'/System/Permission/Detail', NULL, 1, 10204, 0, 1, 1, 0, N'admin', CAST(N'2017-03-28T16:22:05.590' AS DateTime), N'admin', CAST(N'2017-03-28T16:22:05.590' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'2d0b02db-09f7-4404-bbdd-c8a516f48288', N'0', 0, NULL, N'系统管理', NULL, N'fa fa-cubes', NULL, NULL, 0, 10000, 0, 1, 1, 0, N'admin', NULL, N'admin', NULL)
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'2D0D3AB9-FF60-4886-A9A9-4F1F59E4F224', N'9151AEE2-FA6E-4F80-847E-23746DD50DC2', 1, N'dataItem', N'数据项管理', NULL, N'fa fa-database', N'/TestCenterSystem/DataItem/Index', NULL, 0, 2, 0, 1, 1, 0, N'admin', CAST(N'2017-07-20T09:39:24.013' AS DateTime), N'admin', CAST(N'2017-07-31T18:51:21.897' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'328b5383-79be-4b34-b57a-49fa3ebc7803', N'855f3590-b233-4224-aaff-47fb95c8353d', 2, N'role-delete', N'删除角色', N'btn_delete()', N'fa fa-trash-o', N'/System/Role/Delete', NULL, 1, 10303, 0, 1, 1, 0, N'admin', CAST(N'2017-03-28T16:32:43.533' AS DateTime), N'admin', CAST(N'2017-03-28T16:32:43.533' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'336F8206-EB11-4C12-851B-20B21354532A', N'1C96AD3E-A4A9-4843-A826-AE50863C7184', 1, N'project-manage', N'项目管理', NULL, N'fa fa-shopping-bag', N'/TestCenterSystem/Project/Index', NULL, 0, 20001, 0, 1, 1, 0, N'admin', CAST(N'2017-07-21T16:33:00.953' AS DateTime), N'admin', CAST(N'2017-07-21T16:38:49.543' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'3c69e3fb-e1fe-4911-8417-6f6d55a1ce72', N'2d0b02db-09f7-4404-bbdd-c8a516f48288', 1, N'lay-item', N'数据字典', NULL, N'fa fa-sitemap', N'/System/ItemsDetail/Index', NULL, 0, 10500, 0, 0, 0, 0, N'admin', CAST(N'2017-04-03T15:33:02.587' AS DateTime), N'admin', CAST(N'2017-08-18T09:19:32.850' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'3de13971-a51f-40f7-be40-eb035b7f0fae', N'6d90439c-eb6b-4521-ab4d-5e481406a861', 2, N'user-edit', N'修改用户', N'btn_edit()', N'fa fa-edit', N'/System/User/Edit', NULL, 1, 10102, 0, 1, 1, 0, N'admin', CAST(N'2017-04-14T17:21:43.573' AS DateTime), N'admin', CAST(N'2017-06-05T10:48:07.950' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'3E2BDE02-066B-4FFA-AA6D-7F088AABFE92', N'74FD1A86-0CBE-4967-B878-F6E7F9C26BA8', 2, N'kpi-config', N'配置', N'btn_configure()', N'fa fa-cog', N'/TestCenterSystem/KPI/Configure', NULL, 1, 501, 0, 1, 1, 0, N'admin', CAST(N'2017-07-26T10:17:28.973' AS DateTime), N'admin', CAST(N'2017-08-17T18:36:07.103' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'439B1855-4646-4E5C-B0E0-F7383FA4BDB4', N'2D0D3AB9-FF60-4886-A9A9-4F1F59E4F224', 2, N'dataItem-commonadd', N'公共添加', N'btn_common_add()', N'fa fa-plus-square-o', N'/TestCenterSystem/CommonItem/AddCommonItem', NULL, 1, 2, 0, 1, 1, 0, N'admin', CAST(N'2017-07-26T09:24:11.133' AS DateTime), N'admin', CAST(N'2017-08-17T18:34:23.940' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'47F1A0E1-8848-4E15-891F-D910257C962B', N'9151AEE2-FA6E-4F80-847E-23746DD50DC2', 1, N'qq', N's', NULL, N'fa fa-fort-awesome', N'w', NULL, 1, 999999, 0, 1, 0, 0, N'admin', CAST(N'2017-07-25T11:05:50.573' AS DateTime), N'admin', CAST(N'2017-07-26T16:22:10.880' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'4826688E-BE54-4E94-A6ED-3148EC0AEF1E', N'74FD1A86-0CBE-4967-B878-F6E7F9C26BA8', 2, N'kpi-del', N'删除', N'btn_delete()', N'fa fa-trash-o', NULL, NULL, 1, 8, 0, 1, 1, 0, N'admin', CAST(N'2017-07-19T17:48:40.090' AS DateTime), N'admin', CAST(N'2017-08-17T18:31:58.210' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'4DE348C4-FB1E-42B6-BD1E-96554ED5D4EF', N'B87C00BF-1812-4B06-9C42-C8CD5D0BD587', 2, N'Ingroup-add', N'添加', N'btn_add()', N'fa fa-plus-square-o', N'/TestCenterSystem/InGroup/Form', NULL, 1, 1, 0, 1, 1, 0, N'admin', CAST(N'2017-07-20T13:31:01.453' AS DateTime), N'admin', CAST(N'2017-07-20T16:47:29.783' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'4FC03E6D-1458-4523-80F9-4C9A6E343F02', N'74FD1A86-0CBE-4967-B878-F6E7F9C26BA8', 2, N'kpi-add', N'添加', N'btn_add()', N'fa fa-plus-square-o', N'/TestCenterSystem/KPI/Form', NULL, 1, 4, 0, 1, 1, 0, N'admin', CAST(N'2017-07-19T17:35:44.700' AS DateTime), N'admin', CAST(N'2017-08-17T18:34:27.927' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'50C7E86E-52E2-474F-AB7F-590C704A3D5D', N'74FD1A86-0CBE-4967-B878-F6E7F9C26BA8', 2, N'kpi-manage', N'公式', N'btn_manage()', N'fa fa-archive', N'/TestCenterSystem/KPI/Manage', NULL, 1, 7, 0, 0, 1, 0, N'admin', CAST(N'2017-07-19T17:47:11.653' AS DateTime), N'admin', CAST(N'2017-07-28T18:31:06.610' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'50FB79D1-C549-420E-BA5E-09D10AB2F63F', N'2D0D3AB9-FF60-4886-A9A9-4F1F59E4F224', 2, N'dataItem-customadd', N'自定义添加', N'btn_customset_add()', N'fa fa-plus-square-o', N'//TestCenterSystem/DataItem/Form', NULL, 1, 1, 0, 1, 1, 0, N'admin', CAST(N'2017-07-25T19:01:37.753' AS DateTime), N'admin', CAST(N'2017-08-17T18:34:19.697' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'52F37EF6-18B7-4C44-80A7-91A0628D831B', N'336F8206-EB11-4C12-851B-20B21354532A', 2, N'sd-manage', N'病种管理', N'btn_sd()', N'fa fa-reddit-alien', N'/TestCenterSystem/SD/Index', NULL, 1, 20006, 0, 1, 1, 0, N'admin', CAST(N'2017-07-21T16:50:14.283' AS DateTime), N'admin', CAST(N'2017-08-15T14:40:59.360' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'53A0198A-21E8-4AA9-B0BA-02DB039878BC', N'B87C00BF-1812-4B06-9C42-C8CD5D0BD587', 2, N'Ingroup-look', N'查看', N'btn_detail()', N'fa fa-eye', N'/TestCenterSystem/InGroup/Form', NULL, 1, 2, 0, 1, 1, 0, N'admin', CAST(N'2017-07-20T13:49:56.987' AS DateTime), N'admin', CAST(N'2017-08-18T09:23:23.347' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'5fe0cee6-0452-493d-9b55-ff23a5da5e2d', N'e5346fa2-76ec-498f-8f54-3b443959335a', 2, N'per-edit', N'修改权限', N'btn_edit()', N'fa fa-pencil-square-o', N'/System/Permission/Form', NULL, 1, 10202, 0, 1, 1, 0, N'admin', CAST(N'2017-02-20T09:47:19.040' AS DateTime), N'admin', NULL)
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'625cf550-4aad-4158-aff4-2a63d4f25819', N'855f3590-b233-4224-aaff-47fb95c8353d', 2, N'role-detail', N'查看角色', N'btn_detail()', N'fa fa-eye', N'/System/Role/Detail', NULL, 1, 10304, 0, 1, 1, 0, N'admin', CAST(N'2017-03-28T16:34:05.080' AS DateTime), N'admin', CAST(N'2017-03-28T16:34:05.080' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'6ADC1BD0-2888-4783-B720-1AF5191A5495', N'2D0D3AB9-FF60-4886-A9A9-4F1F59E4F224', 2, N'dataItem-set', N'管理', N'btn_manage()', N'fa fa-cog', N'/TestCenterSystem/CustomItem/Index', NULL, 1, 7, 0, 1, 1, 0, N'admin', CAST(N'2017-07-20T19:26:48.160' AS DateTime), N'admin', CAST(N'2017-08-17T15:15:16.920' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'6d90439c-eb6b-4521-ab4d-5e481406a861', N'2d0b02db-09f7-4404-bbdd-c8a516f48288', 1, N'sys-user', N'系统用户', NULL, N'fa fa-user-circle', N'/System/User/Index', NULL, 0, 10100, 0, 1, 1, 0, N'admin', NULL, N'admin', CAST(N'2017-07-19T13:46:46.190' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'74FD1A86-0CBE-4967-B878-F6E7F9C26BA8', N'9151AEE2-FA6E-4F80-847E-23746DD50DC2', 1, N'kpi-manage', N'指标管理', NULL, N'fa fa-fort-awesome', N'/TestCenterSystem/KPI/Index', NULL, 0, 3, 0, 1, 1, 0, N'admin', CAST(N'2017-07-19T15:52:57.467' AS DateTime), N'admin', CAST(N'2017-07-26T16:22:54.617' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'752c9d3f-a744-42ba-87a2-79849fc3fc66', N'6d90439c-eb6b-4521-ab4d-5e481406a861', 2, N'user-delete', N'删除用户', N'btn_delete()', N'fa fa-trash-o', N'/System/User/Delete', NULL, 1, 10103, 0, 1, 1, 0, N'admin', CAST(N'2017-03-28T16:18:25.347' AS DateTime), N'admin', CAST(N'2017-03-28T16:18:25.347' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'7635B6EA-4061-4BBF-A5DC-B8FFE2D78197', N'2D0D3AB9-FF60-4886-A9A9-4F1F59E4F224', 2, N'dataItem-see', N'查看', N'btn_select()', N'fa fa-eye', N'/TestCenterSystem/DataItem/Form', NULL, 1, 4, 0, 1, 1, 0, N'admin', CAST(N'2017-07-26T09:26:58.897' AS DateTime), N'admin', CAST(N'2017-07-31T18:51:52.797' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'7ae2e6aa-0433-4eaa-9357-1adec2507345', N'aeeb56d1-5f27-42df-9d34-97ac18078390', 2, N'log-delete', N'删除日志', N'btn_delete()', N'fa fa-trash-o', N'/System/Log/Delete', NULL, 1, 10601, 0, 1, 0, 0, N'admin', CAST(N'2017-04-19T13:21:33.503' AS DateTime), N'admin', CAST(N'2017-04-19T13:22:35.420' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'7F99D6F7-7A6B-4654-BA3E-F4311536E597', N'B87C00BF-1812-4B06-9C42-C8CD5D0BD587', 2, N'Ingroup-manage', N'配置', N'btn_configure()', N'fa fa-cog', N'/TestCenterSystem/InGroup/Test', NULL, 1, 5, 0, 1, 1, 0, N'admin', CAST(N'2017-07-20T13:51:15.860' AS DateTime), N'admin', CAST(N'2017-08-18T09:24:00.067' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'80D99231-59EC-49E5-A3BD-9DE70287950E', N'-1', 0, N'2', N's', NULL, N'a', NULL, NULL, 0, 999999, 0, 1, 0, 0, N'admin', CAST(N'2017-07-25T11:14:01.007' AS DateTime), N'admin', CAST(N'2017-07-26T16:22:21.623' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'81d1cbf0-3cff-4cde-8128-7d0d844450de', N'855f3590-b233-4224-aaff-47fb95c8353d', 2, N'role-authorize', N'角色授权', N'btn_authorize()', N'fa fa-hand-pointer-o', N'/System/RoleAuthorize/Index', NULL, 1, 10305, 0, 1, 1, 0, N'admin', CAST(N'2017-03-28T16:36:42.613' AS DateTime), N'admin', CAST(N'2017-03-28T16:36:42.613' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'82b06e80-103e-4a38-b171-740d2b0e194b', N'09157352-1252-4964-8fee-479759a95db8', 2, N'org-add', N'新增机构', N'btn_add()', N'fa fa-plus-square-o', N'/System/Organize/Form', NULL, 1, 10401, 0, 1, 1, 0, N'admin', CAST(N'2017-04-02T09:37:47.900' AS DateTime), N'admin', CAST(N'2017-04-02T09:37:47.900' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'85438f3b-0634-4b17-b778-aee3a5819669', N'855f3590-b233-4224-aaff-47fb95c8353d', 2, N'role-edit', N'修改角色', N'btn_edit()', N'fa fa-pencil-square-o', N'/System/Role/Form', NULL, 1, 10302, 0, 1, 1, 0, N'admin', CAST(N'2017-03-28T16:31:10.750' AS DateTime), N'admin', CAST(N'2017-03-28T16:31:10.750' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'855f3590-b233-4224-aaff-47fb95c8353d', N'2d0b02db-09f7-4404-bbdd-c8a516f48288', 1, N'sys-role', N'角色管理', NULL, N'fa fa-users', N'/System/Role/Index', NULL, 0, 10300, 0, 1, 1, 0, N'admin', CAST(N'2017-03-28T16:27:50.183' AS DateTime), N'admin', CAST(N'2017-03-28T16:54:58.910' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'87f0aa68-fa57-43cb-84d0-e979fc4af24c', N'3c69e3fb-e1fe-4911-8417-6f6d55a1ce72', 2, N'item-delete', N'删除选项', N'btn_delete()', N'fa fa-trash-o', N'/System/ItemsDetail/Delete', NULL, 1, 10504, 0, 1, 1, 0, N'admin', CAST(N'2017-04-04T20:06:34.753' AS DateTime), N'admin', CAST(N'2017-04-04T20:17:29.043' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'8DE07A5A-5026-40EF-B4F7-CF4EB00952F6', N'336F8206-EB11-4C12-851B-20B21354532A', 2, N'project-edit', N'修改', N'btn_edit()', N'fa fa-edit', NULL, NULL, 1, 20003, 0, 1, 1, 0, N'admin', CAST(N'2017-07-21T17:39:50.077' AS DateTime), N'admin', CAST(N'2017-08-18T09:43:37.320' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'9151AEE2-FA6E-4F80-847E-23746DD50DC2', N'-1', 0, N'project-manage', N'项目管理', NULL, N'fa fa-briefcase', NULL, NULL, 0, 1, 0, 1, 1, 0, N'admin', CAST(N'2017-07-19T15:51:10.570' AS DateTime), N'admin', CAST(N'2017-07-19T16:13:28.687' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'943CD7FB-5D3A-4A70-B4BC-4068E6AA3004', N'74FD1A86-0CBE-4967-B878-F6E7F9C26BA8', 2, N'kpi-update', N'修改', N'btn_edit()', N'fa fa-edit', N'/TestCenterSystem/KPI/Form', NULL, 1, 6, 0, 1, 1, 0, N'admin', CAST(N'2017-07-19T17:45:56.140' AS DateTime), N'admin', CAST(N'2017-08-17T18:32:40.747' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'A7DF239B-D473-415F-A030-FA8553EE5E17', N'52F37EF6-18B7-4C44-80A7-91A0628D831B', 3, N'sd-add', N'添加病种', N'btn_add()', N'fa fa-plus-square-o', N'/TestCenterSystem/Project/EditForm', NULL, 1, 22001, 0, 1, 1, 0, N'admin', CAST(N'2017-07-21T18:12:31.600' AS DateTime), N'admin', CAST(N'2017-08-17T18:34:36.900' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'aeeb56d1-5f27-42df-9d34-97ac18078390', N'2d0b02db-09f7-4404-bbdd-c8a516f48288', 1, N'sys-log', N'操作日志', NULL, N'fa fa-folder-open', N'/System/Log/Index', NULL, 0, 10600, 0, 0, 0, 0, N'admin', CAST(N'2017-04-18T13:25:49.407' AS DateTime), N'admin', CAST(N'2017-08-18T09:18:42.297' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'B3DF49DF-3F7A-431C-9DAB-9A620255AAC2', N'336F8206-EB11-4C12-851B-20B21354532A', 2, N'project-delete', N'删除', N'btn_del()', N'fa fa-trash-o', NULL, NULL, 1, 20004, 0, 1, 1, 0, N'admin', CAST(N'2017-07-21T17:13:39.130' AS DateTime), N'admin', CAST(N'2017-08-18T09:42:52.957' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'B87C00BF-1812-4B06-9C42-C8CD5D0BD587', N'9151AEE2-FA6E-4F80-847E-23746DD50DC2', 1, N'Ingroup', N'入组管理', NULL, N'fa fa-stop-circle', N'/TestCenterSystem/InGroup/Index', NULL, 0, 1, 0, 1, 1, 0, N'admin', CAST(N'2017-07-19T18:07:04.690' AS DateTime), N'admin', CAST(N'2017-07-20T11:05:25.070' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'BF0DE9EB-84D7-4D7A-95BF-847B429384C8', N'-1', 0, N'w', N'w', NULL, N'w', N'w', NULL, 0, 999999, 0, 1, 0, 0, N'admin', CAST(N'2017-07-25T18:39:57.497' AS DateTime), N'admin', CAST(N'2017-07-26T16:22:16.587' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'c04bfd8f-7e2e-4312-9148-a2e14007fa46', N'3c69e3fb-e1fe-4911-8417-6f6d55a1ce72', 2, N'item-edit', N'修改选项', N'btn_edit()', N'fa fa-pencil-square-o', N'/System/ItemsDetail/Form', NULL, 0, 10503, 0, 1, 1, 0, N'admin', CAST(N'2017-04-04T20:05:36.310' AS DateTime), N'admin', CAST(N'2017-04-04T20:05:36.310' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'cd4e9f8b-f56a-42dc-94e1-b76f3d0b38fc', N'09157352-1252-4964-8fee-479759a95db8', 2, N'org-detail', N'查看机构', N'btn_detail()', N'fa fa-eye', N'/System/Organize/Detail', NULL, 1, 10404, 0, 1, 1, 0, N'admin', CAST(N'2017-04-02T09:47:18.190' AS DateTime), N'admin', CAST(N'2017-04-02T09:47:18.190' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'D2C474D7-A89C-488B-96D4-F955AD832C8E', N'2D0D3AB9-FF60-4886-A9A9-4F1F59E4F224', 2, N'dataItem-update', N'修改', N'btn_update()', N'fa fa-edit', N'/TestCenterSystem/DataItem/Form', NULL, 1, 5, 0, 1, 1, 0, N'admin', CAST(N'2017-07-26T09:27:53.403' AS DateTime), N'admin', CAST(N'2017-08-17T18:32:28.887' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'D307D592-44C7-498A-9E1D-D77DDD3211F9', N'B87C00BF-1812-4B06-9C42-C8CD5D0BD587', 2, N'Ingroup-delete', N'删除', N'btn_delete()', N'fa fa-trash-o', N'/TestCenterSystem/InGroup/Delete', NULL, 1, 4, 0, 1, 1, 0, N'admin', CAST(N'2017-07-20T13:46:29.747' AS DateTime), N'admin', CAST(N'2017-08-18T09:23:39.470' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'D6F83B1F-CE8F-4D51-BBC4-0BA6F27F0028', N'74FD1A86-0CBE-4967-B878-F6E7F9C26BA8', 2, N'kpi-export', N'导出', N'btn_exportsql()', N'fa fa-check', N'/TestCenterSystem/KPI/Form', NULL, 1, 506, 0, 0, 1, 0, N'admin', CAST(N'2017-07-19T17:37:28.497' AS DateTime), N'admin', CAST(N'2017-08-16T17:07:37.813' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'd9cfc79d-55f6-4890-b604-49f1d2a0d971', N'6d90439c-eb6b-4521-ab4d-5e481406a861', 2, N'user-add', N'新增用户', N'btn_add()', N'
fa fa-plus-square-o', N'/System/User/Form', NULL, 1, 10101, 0, 1, 1, 0, N'admin', CAST(N'2017-03-28T16:14:58.087' AS DateTime), N'admin', CAST(N'2017-03-28T16:14:58.087' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'e32b7507-aaf0-42dc-8008-139250c352ee', N'3c69e3fb-e1fe-4911-8417-6f6d55a1ce72', 2, N'item-manage', N'字典管理', N'btn_manage()', N'fa fa-folder-open-o', N'/System/Item/Index', NULL, 1, 10501, 0, 1, 1, 0, N'admin', CAST(N'2017-04-03T21:30:55.433' AS DateTime), N'admin', CAST(N'2017-04-04T10:48:52.763' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'E4ACE6D6-F9BE-4223-AD31-489CD337B4DC', N'52F37EF6-18B7-4C44-80A7-91A0628D831B', 3, N'sd-edit', N'病种修改', N'btn_edit()', N'fa fa-edit', N'/TestCenterSystem/Project', NULL, 1, 22002, 0, 1, 1, 0, N'admin', CAST(N'2017-07-21T18:16:15.063' AS DateTime), N'admin', CAST(N'2017-08-17T18:32:51.687' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'e5346fa2-76ec-498f-8f54-3b443959335a', N'2d0b02db-09f7-4404-bbdd-c8a516f48288', 1, N'sys-permission', N'权限管理', NULL, N'fa fa-suitcase', N'/System/Permission/Index', NULL, 0, 10200, 0, 1, 1, 0, N'admin', NULL, N'admin', CAST(N'2017-03-28T16:58:50.730' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'E6D3A980-FFB3-4E45-B9F8-5A81A9387848', N'74FD1A86-0CBE-4967-B878-F6E7F9C26BA8', 2, N'kpi-see', N'查看', N'btn_detail()', N'fa fa-eye', N'/TestCenterSystem/KPI/Form', NULL, 1, 5, 0, 1, 1, 0, N'admin', CAST(N'2017-07-19T18:44:38.063' AS DateTime), N'admin', CAST(N'2017-08-17T18:33:19.363' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'e9478f45-0c00-435f-9a7a-35c7af1f86f7', N'09157352-1252-4964-8fee-479759a95db8', 2, N'org-delete', N'删除机构', N'btn_delete()', N'fa fa-trash-o', N'/System/Organize/Delete', NULL, 1, 10403, 0, 1, 1, 0, N'admin', CAST(N'2017-04-02T09:45:55.757' AS DateTime), N'admin', CAST(N'2017-04-02T09:45:55.757' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'F857F429-5117-476D-8284-C3928739CBE9', N'2D0D3AB9-FF60-4886-A9A9-4F1F59E4F224', 2, N'dataItem-exportscript', N'导出脚本', N'btn_export()', N'fa fa-sign-out', N'/TestCenterSystem/DataItem/Form', NULL, 1, 3, 0, 1, 1, 0, N'admin', CAST(N'2017-07-26T09:26:00.310' AS DateTime), N'admin', CAST(N'2017-07-31T18:51:42.050' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'fbee5749-8694-495f-b140-b5b3399df7ee', N'3c69e3fb-e1fe-4911-8417-6f6d55a1ce72', 2, N'item-add', N'新增选项', N'btn_add()', N'fa fa-plus-square-o', N'/System/ItemsDetail/Form', NULL, 1, 10502, 0, 1, 1, 0, N'admin', CAST(N'2017-04-04T19:46:18.233' AS DateTime), N'admin', CAST(N'2017-04-04T19:46:50.650' AS DateTime))
INSERT [dbo].[Sys_Permission] ([Id], [ParentId], [Layer], [EnCode], [Name], [JsEvent], [Icon], [Url], [Remark], [Type], [SortCode], [IsPublic], [IsEnable], [IsEdit], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'FFA48422-1AB5-4D72-8636-121F16F46885', N'74FD1A86-0CBE-4967-B878-F6E7F9C26BA8', 2, N'kpi-test', N'测试', N'btn_test()', N'fa fa-reddit-alien', N'/TestCenterSystem/KPI/Test', NULL, 1, 10, 0, 0, 1, 0, N'admin', CAST(N'2017-07-20T17:21:00.980' AS DateTime), N'admin', CAST(N'2017-07-28T18:31:22.433' AS DateTime))
INSERT [dbo].[Sys_Role] ([Id], [OrganizeId], [EnCode], [Type], [Name], [AllowEdit], [DeleteMark], [IsEnabled], [Remark], [SortCode], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', N'771b628b-e43c-4592-b1ef-70ea23b0e3f2', N'developer', 0, N'系统开发人员', 0, 0, 1, NULL, 4, N'admin', NULL, N'admin', CAST(N'2017-07-28T15:06:25.403' AS DateTime))
INSERT [dbo].[Sys_Role] ([Id], [OrganizeId], [EnCode], [Type], [Name], [AllowEdit], [DeleteMark], [IsEnabled], [Remark], [SortCode], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'771b628b-e43c-4592-b1ef-70ea23b0e3f2', N'lord', 0, N'超级管理员', 0, 0, 1, NULL, 2, N'admin', CAST(N'2017-07-28T15:05:43.743' AS DateTime), N'admin', CAST(N'2017-07-28T15:05:43.743' AS DateTime))
INSERT [dbo].[Sys_Role] ([Id], [OrganizeId], [EnCode], [Type], [Name], [AllowEdit], [DeleteMark], [IsEnabled], [Remark], [SortCode], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'771b628b-e43c-4592-b1ef-70ea23b0e3f2', N'administrators', 0, N'超级管理员', 1, 0, 1, NULL, 1, N'admin', NULL, N'admin', CAST(N'2017-05-15T13:40:50.187' AS DateTime))
INSERT [dbo].[Sys_Role] ([Id], [OrganizeId], [EnCode], [Type], [Name], [AllowEdit], [DeleteMark], [IsEnabled], [Remark], [SortCode], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'771b628b-e43c-4592-b1ef-70ea23b0e3f2', N'leader', 0, N'部门领导', 0, 0, 1, NULL, 3, N'admin', CAST(N'2017-07-28T15:06:18.267' AS DateTime), N'admin', CAST(N'2017-07-28T15:06:18.267' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'015CE27A-608D-4AAD-AC51-314C8AC8F126', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'026550fd-2578-42ae-a041-625cda12325f', N'admin', CAST(N'2017-07-28T15:06:54.767' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'021DE95F-F094-4311-83E7-8D8C4B9003A3', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'50FB79D1-C549-420E-BA5E-09D10AB2F63F', N'admin', CAST(N'2017-07-28T15:07:18.407' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'0456EBF2-C5B7-44CC-9041-A03329E1A21F', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'3E2BDE02-066B-4FFA-AA6D-7F088AABFE92', N'admin', CAST(N'2017-07-26T10:17:42.137' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'045AB2A0-7324-4B95-946D-1298E0FE6D51', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'336F8206-EB11-4C12-851B-20B21354532A', N'admin', CAST(N'2017-07-28T15:06:54.727' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'04a8f35b-e43b-4f06-aa08-2bfc272fe2a1', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'85438f3b-0634-4b17-b778-aee3a5819669', N'admin', CAST(N'2017-03-28T16:47:59.850' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'06EB788B-BEE7-43E3-869E-32B465B098E7', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'E4ACE6D6-F9BE-4223-AD31-489CD337B4DC', N'admin', CAST(N'2017-07-21T18:18:29.647' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'083f6bd4-c086-486c-b25a-1f2e8a3a9563', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'216d09a8-575f-43d1-85f6-acc025fa94b3', N'admin', CAST(N'2017-03-28T16:47:59.803' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'0852C495-7AE5-4D99-981F-48CF02CE1743', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'752c9d3f-a744-42ba-87a2-79849fc3fc66', N'admin', CAST(N'2017-07-28T15:06:54.750' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'090DA0A1-551C-4F7A-B80B-AD7A811D4436', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'7F99D6F7-7A6B-4654-BA3E-F4311536E597', N'admin', CAST(N'2017-07-20T14:00:18.703' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'0913AFE3-6D62-42BE-A685-6DAFB70E357B', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'0d2ea3c9-5b29-4bb6-9f91-0322419ded8e', N'admin', CAST(N'2017-07-28T15:06:54.763' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'09302F9D-EE06-4F0D-B214-4D2D4554C7EC', N'78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', N'E6D3A980-FFB3-4E45-B9F8-5A81A9387848', N'admin', CAST(N'2017-07-28T15:07:30.270' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'093AFB63-9ABD-4DE0-9C41-CA74976E114E', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'9151AEE2-FA6E-4F80-847E-23746DD50DC2', N'admin', CAST(N'2017-07-28T15:06:54.677' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'09ac4a11-2d50-48e6-b1ae-d9c18384fa5c', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'6d90439c-eb6b-4521-ab4d-5e481406a861', N'admin', CAST(N'2017-03-28T16:47:59.727' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'09d88a4f-ef46-4ca0-a95a-a1ce15aa91c0', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'82b06e80-103e-4a38-b171-740d2b0e194b', N'admin', CAST(N'2017-04-02T09:48:32.997' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'0A594269-E689-4FE4-8497-DAE3F761D0A4', N'78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', N'7635B6EA-4061-4BBF-A5DC-B8FFE2D78197', N'admin', CAST(N'2017-07-28T15:07:30.260' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'0B52B91E-925E-4033-88A1-7F5E3E5D7F38', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'4DE348C4-FB1E-42B6-BD1E-96554ED5D4EF', N'admin', CAST(N'2017-07-28T15:07:18.397' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'0B54B6EB-7D75-4D93-A7DA-A27FD6AF01C3', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'E6D3A980-FFB3-4E45-B9F8-5A81A9387848', N'admin', CAST(N'2017-07-28T15:06:54.710' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'0DAE88A0-E15B-4704-B70B-37555B7631F6', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'943CD7FB-5D3A-4A70-B4BC-4068E6AA3004', N'admin', CAST(N'2017-07-28T15:07:18.423' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'0DB253E2-7B31-4B4D-A38B-6B9D0F168FC1', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'6ADC1BD0-2888-4783-B720-1AF5191A5495', N'admin', CAST(N'2017-07-27T17:19:04.250' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'10CD041D-BA7A-4DB1-85A2-9FF5B13084E0', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'e5346fa2-76ec-498f-8f54-3b443959335a', N'admin', CAST(N'2017-07-28T15:06:54.757' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'14AE3BEF-976D-4CC2-9FFC-F04A9348001A', N'78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', N'3E2BDE02-066B-4FFA-AA6D-7F088AABFE92', N'admin', CAST(N'2017-07-28T15:07:30.280' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'164ad154-21e5-48ab-8e27-1c0ea38d066d', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'e9478f45-0c00-435f-9a7a-35c7af1f86f7', N'admin', CAST(N'2017-04-02T09:48:33.027' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'16E7602E-C8C7-4967-AEFB-C0998EA9405E', N'78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', N'FFA48422-1AB5-4D72-8636-121F16F46885', N'admin', CAST(N'2017-07-28T15:07:30.277' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'1B196A67-3DB6-4B74-A6C0-1E1E1F6425D5', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'B3DF49DF-3F7A-431C-9DAB-9A620255AAC2', N'admin', CAST(N'2017-07-21T17:14:48.607' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'1CF78654-4995-4A8F-9C53-13D5AA685C66', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'3de13971-a51f-40f7-be40-eb035b7f0fae', N'admin', CAST(N'2017-07-28T15:06:54.750' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'1D33B273-5C6A-4060-93D1-CC6D8A53323C', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'169DF1EA-E3FD-4E97-9AB2-D1C4465C9BA1', N'admin', CAST(N'2017-07-28T15:06:54.730' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'1f5af2cf-3d4a-4af6-b4e2-4c3dd76627ea', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'09157352-1252-4964-8fee-479759a95db8', N'admin', CAST(N'2017-04-02T09:48:32.977' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'1F73314E-F70F-4C56-86D2-495CEE8CDC77', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'328b5383-79be-4b34-b57a-49fa3ebc7803', N'admin', CAST(N'2017-07-28T15:06:54.770' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'2660F8F4-5E33-4C54-B37B-CEBFE014BD0D', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'50C7E86E-52E2-474F-AB7F-590C704A3D5D', N'admin', CAST(N'2017-07-28T15:07:18.423' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'26639B2A-DA37-4FC0-9219-DE31AB4FBC5B', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'E6D3A980-FFB3-4E45-B9F8-5A81A9387848', N'admin', CAST(N'2017-07-28T15:07:18.420' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'2772E7A5-00F7-4D42-9373-861C4A7D4DDD', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'4FC03E6D-1458-4523-80F9-4C9A6E343F02', N'admin', CAST(N'2017-07-28T15:06:54.710' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'2BF28F0A-7F78-40DB-9F6D-C4DA83246EE0', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'52F37EF6-18B7-4C44-80A7-91A0628D831B', N'admin', CAST(N'2017-07-21T16:50:55.177' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'2EBC403A-81E2-461F-BBD8-9809EDB7CC4C', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'3c69e3fb-e1fe-4911-8417-6f6d55a1ce72', N'admin', CAST(N'2017-07-20T11:14:54.410' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'2EE1ED3D-EF5C-472A-8944-F009072D0E32', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'7635B6EA-4061-4BBF-A5DC-B8FFE2D78197', N'admin', CAST(N'2017-07-27T17:19:04.243' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'30131CFA-2774-433E-91DA-86221215DBA2', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'6d90439c-eb6b-4521-ab4d-5e481406a861', N'admin', CAST(N'2017-07-28T15:06:54.743' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'33C24C32-B8E8-4381-A1D7-46A6E58F75B7', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'D307D592-44C7-498A-9E1D-D77DDD3211F9', N'admin', CAST(N'2017-07-28T15:06:54.683' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'36311EA2-0F44-4EA0-B134-6EB1BC63ED77', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'4FC03E6D-1458-4523-80F9-4C9A6E343F02', N'admin', CAST(N'2017-07-28T15:07:18.420' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'37406DF5-5B13-45C0-9E79-AEA1AB392277', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'87f0aa68-fa57-43cb-84d0-e979fc4af24c', N'admin', CAST(N'2017-07-20T11:14:54.423' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'3C3F236E-97BC-4A28-B1B0-83E22EBFE1E0', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'74FD1A86-0CBE-4967-B878-F6E7F9C26BA8', N'admin', CAST(N'2017-07-19T15:53:11.497' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'3C6E7E80-B1C2-48C3-94E9-803EDDCD4C12', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'D2C474D7-A89C-488B-96D4-F955AD832C8E', N'admin', CAST(N'2017-07-28T15:07:18.413' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'3C93BCB3-1740-403C-A19A-9CE9EE5A503A', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'E4ACE6D6-F9BE-4223-AD31-489CD337B4DC', N'admin', CAST(N'2017-07-28T15:07:18.443' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'3E9BF36C-AFD0-4EB1-9F70-C6A45D34A5A1', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'7F99D6F7-7A6B-4654-BA3E-F4311536E597', N'admin', CAST(N'2017-07-28T15:07:18.400' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'3f5cf11a-4b6a-4e2f-94e5-dcc390374f75', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'086ee328-5a15-40b0-8e15-291093e2e8b1', N'admin', CAST(N'2017-04-02T09:48:33.013' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'4539A973-E25A-4329-AF1D-1BDC0D4741AA', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'28a045a6-61f4-4784-8578-837ad307e4e3', N'admin', CAST(N'2017-07-28T15:06:54.757' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'45e1cd76-8c78-4158-a689-87c8d24ba024', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'752c9d3f-a744-42ba-87a2-79849fc3fc66', N'admin', CAST(N'2017-03-28T16:47:59.787' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'467CCC00-D1CF-4ACF-81AA-6B9AEA7A6414', N'78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', N'D307D592-44C7-498A-9E1D-D77DDD3211F9', N'admin', CAST(N'2017-07-28T15:07:30.247' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'46F61032-F2EF-4982-82CA-D7F4869BC466', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'85438f3b-0634-4b17-b778-aee3a5819669', N'admin', CAST(N'2017-07-28T15:06:54.770' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'473F8327-E48C-4DC4-844F-A0E8B364668E', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'7ae2e6aa-0433-4eaa-9357-1adec2507345', N'admin', CAST(N'2017-08-17T10:39:21.117' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'498BBD80-8097-471E-BFC4-0C1A13C12043', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'd9cfc79d-55f6-4890-b604-49f1d2a0d971', N'admin', CAST(N'2017-07-28T15:06:54.747' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'49901663-8AD9-4FB9-9991-5DD1D598B9D9', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'169DF1EA-E3FD-4E97-9AB2-D1C4465C9BA1', N'admin', CAST(N'2017-07-21T16:41:16.307' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'4A6499A9-1365-4251-8584-DA59FAEA43A2', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'c04bfd8f-7e2e-4312-9148-a2e14007fa46', N'admin', CAST(N'2017-07-20T11:14:54.420' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'4AD062E0-E149-49A2-9A5C-F53D2C772A77', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'216d09a8-575f-43d1-85f6-acc025fa94b3', N'admin', CAST(N'2017-07-28T15:06:54.753' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'4C316F13-48F6-49FF-9431-622977809AD0', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'53A0198A-21E8-4AA9-B0BA-02DB039878BC', N'admin', CAST(N'2017-07-28T15:06:54.690' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'4E1F6AB1-84B0-4678-BA78-2A9F1A2976F3', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'4DE348C4-FB1E-42B6-BD1E-96554ED5D4EF', N'admin', CAST(N'2017-07-20T13:39:38.763' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'4f5bd239-c484-4518-85c3-2c8f65aebe52', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'cd4e9f8b-f56a-42dc-94e1-b76f3d0b38fc', N'admin', CAST(N'2017-04-02T09:48:33.043' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'516023CB-5693-44CC-ADC5-87251F71CEB3', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'4826688E-BE54-4E94-A6ED-3148EC0AEF1E', N'admin', CAST(N'2017-07-19T18:40:12.207' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'59C42B36-86EC-4FB4-8BFC-B2803A716A25', N'78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', N'50FB79D1-C549-420E-BA5E-09D10AB2F63F', N'admin', CAST(N'2017-07-28T15:07:30.257' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'5B725FAC-6CB2-4596-B19F-0B28A01177A9', N'78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', N'7F99D6F7-7A6B-4654-BA3E-F4311536E597', N'admin', CAST(N'2017-07-28T15:07:30.250' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'5FA58874-A0F5-4431-A594-696D063E077C', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'F857F429-5117-476D-8284-C3928739CBE9', N'admin', CAST(N'2017-07-28T15:06:54.700' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'6071FBB5-709C-4F1C-B405-11173F5D141A', N'78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', N'47F1A0E1-8848-4E15-891F-D910257C962B', N'admin', CAST(N'2017-07-28T15:07:30.283' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'63D0E0B3-C921-4E66-A306-4B76CA8AC6D6', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'439B1855-4646-4E5C-B0E0-F7383FA4BDB4', N'admin', CAST(N'2017-07-28T15:06:54.697' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'64894F17-56C8-4326-86C1-D134F3DC70DA', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'5fe0cee6-0452-493d-9b55-ff23a5da5e2d', N'admin', CAST(N'2017-07-28T15:06:54.760' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'651BEA06-31F3-4BA3-876C-31A3C062C52C', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'A7DF239B-D473-415F-A030-FA8553EE5E17', N'admin', CAST(N'2017-07-28T15:07:18.443' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'6521337E-BE08-4CA6-84D7-F7D0EC8F7603', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'47F1A0E1-8848-4E15-891F-D910257C962B', N'admin', CAST(N'2017-07-28T15:06:54.723' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'68339933-C143-4332-82C9-443424FF19C0', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'aeeb56d1-5f27-42df-9d34-97ac18078390', N'admin', CAST(N'2017-08-17T10:39:20.910' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'68347622-7DBC-48C5-AE15-32DEE29F54C4', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'B87C00BF-1812-4B06-9C42-C8CD5D0BD587', N'admin', CAST(N'2017-07-28T15:07:18.393' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'68e36f44-9a77-4377-bb71-9af61adc7b11', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'2c24cdfc-8f26-4947-bcb2-0cb4d9111e80', N'admin', CAST(N'2017-03-28T16:47:59.817' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'6A7074C1-FCF6-4050-9FB2-7B245DB468F0', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'A7DF239B-D473-415F-A030-FA8553EE5E17', N'admin', CAST(N'2017-07-28T15:06:54.740' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'6a8d7415-d228-4316-abdc-6465dd8baf60', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'3de13971-a51f-40f7-be40-eb035b7f0fae', N'admin', CAST(N'2017-04-14T17:28:14.800' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'6B0DFB35-9E49-4A12-9C09-62994909B4B5', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'fbee5749-8694-495f-b140-b5b3399df7ee', N'admin', CAST(N'2017-07-20T11:14:54.420' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'6bd7028f-00d1-4fd9-89d9-6ddc7ce822ce', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'2d0b02db-09f7-4404-bbdd-c8a516f48288', NULL, NULL)
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'6D14F04A-235E-4310-8BA5-168365C1E4F8', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'1C96AD3E-A4A9-4843-A826-AE50863C7184', N'admin', CAST(N'2017-07-21T16:31:44.327' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'6E70643F-70AF-49DD-B8FC-7512E6FEE4EF', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'4DE348C4-FB1E-42B6-BD1E-96554ED5D4EF', N'admin', CAST(N'2017-07-28T15:06:54.683' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'6E8554E5-722D-4591-B146-D20C44D68943', N'78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', N'F857F429-5117-476D-8284-C3928739CBE9', N'admin', CAST(N'2017-07-28T15:07:30.260' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'717B061F-E4C9-4495-889D-355528D479B1', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'FFA48422-1AB5-4D72-8636-121F16F46885', N'admin', CAST(N'2017-07-28T15:07:18.427' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'732430CA-EE54-46B0-82C6-189AA43CAD71', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'169DF1EA-E3FD-4E97-9AB2-D1C4465C9BA1', N'admin', CAST(N'2017-07-28T15:07:18.437' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'73441D99-133E-4DF5-BBD5-AA12B9F72C6A', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'1C96AD3E-A4A9-4843-A826-AE50863C7184', N'admin', CAST(N'2017-07-28T15:06:54.727' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'73AA4068-E4B7-47C4-9D5C-877D4251987A', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'81d1cbf0-3cff-4cde-8128-7d0d844450de', N'admin', CAST(N'2017-07-28T15:06:54.777' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'74E8C809-B00E-4F82-AEE4-1CF5A28F552E', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'2B3FA265-CB5B-4451-9C12-68EA878FA9D3', N'admin', CAST(N'2017-07-28T15:06:54.687' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'768015FF-F71B-4E81-81E9-05C782D0C641', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'7F99D6F7-7A6B-4654-BA3E-F4311536E597', N'admin', CAST(N'2017-07-28T15:06:54.687' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'76e9aef6-8030-4588-9a63-551a4a0b376e', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'0d2ea3c9-5b29-4bb6-9f91-0322419ded8e', NULL, NULL)
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'77EF4A07-01DC-4EDC-A570-A920FC36344A', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'D307D592-44C7-498A-9E1D-D77DDD3211F9', N'admin', CAST(N'2017-07-28T15:07:18.397' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'78709ABA-4164-4218-9605-6DEB11478315', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'069f00f6-2a82-4bbe-90d6-418f37d5ef1f', N'admin', CAST(N'2017-07-20T11:14:54.427' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'78919e4f-e65d-461a-9af6-f8b5e13232e0', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'28a045a6-61f4-4784-8578-837ad307e4e3', NULL, NULL)
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'7b3577cf-11d2-46a0-a859-9b17a07328c7', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'328b5383-79be-4b34-b57a-49fa3ebc7803', N'admin', CAST(N'2017-03-28T16:47:59.863' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'7B854CD5-F850-4E75-9C46-4E94C2F622C5', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'FFA48422-1AB5-4D72-8636-121F16F46885', N'admin', CAST(N'2017-07-20T17:21:27.103' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'7C21F7A9-8426-4EE6-BB8D-3252C3588C4C', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'7635B6EA-4061-4BBF-A5DC-B8FFE2D78197', N'admin', CAST(N'2017-07-28T15:07:18.410' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'7CB17492-44BC-41E3-82CC-ADB54A0BAD52', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'943CD7FB-5D3A-4A70-B4BC-4068E6AA3004', N'admin', CAST(N'2017-07-28T15:06:54.717' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'7CE6FD47-F1FE-44E3-B66F-32A7FADEE7BD', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'52F37EF6-18B7-4C44-80A7-91A0628D831B', N'admin', CAST(N'2017-07-28T15:06:54.740' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'7D01B86C-28F5-4318-AA3F-077F9D678C6A', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'e32b7507-aaf0-42dc-8008-139250c352ee', N'admin', CAST(N'2017-07-20T11:14:54.417' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'80F786CD-A8A3-40F8-98A5-9B19C838838F', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'8DE07A5A-5026-40EF-B4F7-CF4EB00952F6', N'admin', CAST(N'2017-07-21T17:40:19.900' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'810dddfa-870b-482f-a419-6326eea29c84', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'625cf550-4aad-4158-aff4-2a63d4f25819', N'admin', CAST(N'2017-03-28T16:47:59.880' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'813C64DF-CE68-441C-96A9-F475A1CE3116', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'D2C474D7-A89C-488B-96D4-F955AD832C8E', N'admin', CAST(N'2017-07-28T15:06:54.703' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'835A4DCE-B890-4F07-A68A-6962C983D85E', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'943CD7FB-5D3A-4A70-B4BC-4068E6AA3004', N'admin', CAST(N'2017-07-19T18:40:12.183' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'83918403-D144-49F8-BFCC-9E191F4E531B', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'336F8206-EB11-4C12-851B-20B21354532A', N'admin', CAST(N'2017-07-21T16:33:12.710' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'83c14f08-2046-4ea4-b01c-a7420a264b2b', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'e5346fa2-76ec-498f-8f54-3b443959335a', NULL, NULL)
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'898A31D0-6E60-4CBF-94E3-E13F7F91C80A', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'53A0198A-21E8-4AA9-B0BA-02DB039878BC', N'admin', CAST(N'2017-07-28T15:07:18.400' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'89C0D7B6-8673-4239-89FE-7A93D01D6D31', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'A7DF239B-D473-415F-A030-FA8553EE5E17', N'admin', CAST(N'2017-07-21T18:18:29.637' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'8AF48211-7671-4974-86E2-949823403689', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'53A0198A-21E8-4AA9-B0BA-02DB039878BC', N'admin', CAST(N'2017-07-20T14:00:18.693' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'8C5167F9-D8E1-4EB4-AA8B-02D419E84D7D', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'2c24cdfc-8f26-4947-bcb2-0cb4d9111e80', N'admin', CAST(N'2017-07-28T15:06:54.763' AS DateTime))
GO
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'8CC06B9F-7E80-4483-A8C7-0850B4FF99B8', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'625cf550-4aad-4158-aff4-2a63d4f25819', N'admin', CAST(N'2017-07-28T15:06:54.773' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'8E0182C8-6014-4430-83BB-959BA404D11C', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'74FD1A86-0CBE-4967-B878-F6E7F9C26BA8', N'admin', CAST(N'2017-07-28T15:07:18.417' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'8EFC2D77-7E3D-491B-8DD3-8038F6865BCC', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'B3DF49DF-3F7A-431C-9DAB-9A620255AAC2', N'admin', CAST(N'2017-07-28T15:07:18.440' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'8F91E912-5ED2-415A-9DA3-382E72CBB203', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'2D0D3AB9-FF60-4886-A9A9-4F1F59E4F224', N'admin', CAST(N'2017-07-20T09:57:16.757' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'9079BAF9-3DA9-4654-8B3D-9ECE92DD13C4', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'3E2BDE02-066B-4FFA-AA6D-7F088AABFE92', N'admin', CAST(N'2017-07-28T15:06:54.720' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'9434C0E8-35EB-4153-8C38-FA9CCBF39D87', N'78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', N'2D0D3AB9-FF60-4886-A9A9-4F1F59E4F224', N'admin', CAST(N'2017-07-28T15:07:30.253' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'98885c60-d3bc-49df-8eaa-f8ccb7eafaa3', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'5fe0cee6-0452-493d-9b55-ff23a5da5e2d', NULL, NULL)
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'98FF8C0E-1298-43FD-9805-0D941DF64EB9', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'8DE07A5A-5026-40EF-B4F7-CF4EB00952F6', N'admin', CAST(N'2017-07-28T15:06:54.737' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'9F816120-7633-452C-A3FC-D8B6FCAF9E6E', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'FFA48422-1AB5-4D72-8636-121F16F46885', N'admin', CAST(N'2017-07-28T15:06:54.720' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'A0CAA7EF-FA61-43D0-A7AF-F159C297E118', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'439B1855-4646-4E5C-B0E0-F7383FA4BDB4', N'admin', CAST(N'2017-07-28T15:07:18.410' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'A2DA026A-C4B4-4954-8EF6-0A3F31A57695', N'78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', N'6ADC1BD0-2888-4783-B720-1AF5191A5495', N'admin', CAST(N'2017-07-28T15:07:30.263' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'A3837179-C96C-4CB6-8B75-C8AD5D5534CB', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'50FB79D1-C549-420E-BA5E-09D10AB2F63F', N'admin', CAST(N'2017-07-27T17:19:04.203' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'A39D94A0-5731-4172-BB54-F2AD74FF0EDB', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'52F37EF6-18B7-4C44-80A7-91A0628D831B', N'admin', CAST(N'2017-07-28T15:07:18.443' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'A3F175B0-4805-4ACF-9BBD-82E24AC6D6F6', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'2D0D3AB9-FF60-4886-A9A9-4F1F59E4F224', N'admin', CAST(N'2017-07-28T15:07:18.403' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'A58E01E9-4F2A-4E5D-AE31-3D8CA9069820', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'50C7E86E-52E2-474F-AB7F-590C704A3D5D', N'admin', CAST(N'2017-07-28T15:06:54.717' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'A9EC01B7-0378-41E8-A1C5-17380AE9D24B', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'D6F83B1F-CE8F-4D51-BBC4-0BA6F27F0028', N'admin', CAST(N'2017-07-19T18:40:12.170' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'A9FFCCE1-FD95-4A6C-B10B-BB3C58CDE052', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'2d0b02db-09f7-4404-bbdd-c8a516f48288', N'admin', CAST(N'2017-07-28T15:06:54.743' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'AB5A0C4D-AFF3-465F-8A4A-14331354507D', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'6ADC1BD0-2888-4783-B720-1AF5191A5495', N'admin', CAST(N'2017-07-28T15:07:18.413' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'AC018C9E-2167-4B02-8130-5658866CC7F6', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'1C96AD3E-A4A9-4843-A826-AE50863C7184', N'admin', CAST(N'2017-07-28T15:07:18.433' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'AC1F9CCB-96D0-43C0-87B9-F87427F2BC80', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'9151AEE2-FA6E-4F80-847E-23746DD50DC2', N'admin', CAST(N'2017-07-28T15:07:18.393' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'AC467D81-DD3A-4B2F-9B89-C717800E4ECA', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'74FD1A86-0CBE-4967-B878-F6E7F9C26BA8', N'admin', CAST(N'2017-07-28T15:06:54.707' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'ad17561c-4aea-4eb3-8933-23670a0ee8bd', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'026550fd-2578-42ae-a041-625cda12325f', N'admin', CAST(N'2017-03-28T16:47:59.833' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'B33EE09F-C0B7-42DF-A873-505BE89C5AC4', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'4826688E-BE54-4E94-A6ED-3148EC0AEF1E', N'admin', CAST(N'2017-07-28T15:06:54.720' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'B34D756E-AB39-4D73-9213-22300511EFD1', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'D6F83B1F-CE8F-4D51-BBC4-0BA6F27F0028', N'admin', CAST(N'2017-07-28T15:06:54.723' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'B35E2F2C-AACF-45A9-B3A6-F5BA5898E6B4', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'D307D592-44C7-498A-9E1D-D77DDD3211F9', N'admin', CAST(N'2017-07-20T13:46:49.430' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'B39440A8-CF10-4385-A17C-2CC4A458C698', N'78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', N'4DE348C4-FB1E-42B6-BD1E-96554ED5D4EF', N'admin', CAST(N'2017-07-28T15:07:30.243' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'B3E084DF-E405-4163-A6F1-332F71058C5D', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'2626147F-0341-4529-84C2-181CA763CDE0', N'admin', CAST(N'2017-07-28T15:07:18.417' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'B52C8461-E1A7-42AE-9EC3-70A64D7CCB77', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'E4ACE6D6-F9BE-4223-AD31-489CD337B4DC', N'admin', CAST(N'2017-07-28T15:06:54.743' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'B8EA6208-2B71-42B0-AB71-F8E67668724C', N'78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', N'B87C00BF-1812-4B06-9C42-C8CD5D0BD587', N'admin', CAST(N'2017-07-28T15:07:30.243' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'B90BC656-D3C7-4DFE-8E24-03F1D1035387', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'E6D3A980-FFB3-4E45-B9F8-5A81A9387848', N'admin', CAST(N'2017-07-24T17:45:24.430' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'B95D3D42-F5D0-4164-962B-1353FD6839D3', N'78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', N'2626147F-0341-4529-84C2-181CA763CDE0', N'admin', CAST(N'2017-07-28T15:07:30.267' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'B965D0DD-9AB1-4D01-A2FB-03BFCBA8636F', N'78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', N'2B3FA265-CB5B-4451-9C12-68EA878FA9D3', N'admin', CAST(N'2017-07-28T15:07:30.247' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'B9B02796-740C-4FC6-A37D-5993C2CAC450', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'2626147F-0341-4529-84C2-181CA763CDE0', N'admin', CAST(N'2017-07-26T09:36:17.590' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'BC1581B5-245C-426C-A212-802D073F64D4', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'2B3FA265-CB5B-4451-9C12-68EA878FA9D3', N'admin', CAST(N'2017-07-28T15:07:18.400' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'BE4F35BB-0020-4500-9C95-A4BD8C314CF3', N'78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', N'943CD7FB-5D3A-4A70-B4BC-4068E6AA3004', N'admin', CAST(N'2017-07-28T15:07:30.273' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'BEF317AA-C14E-44DA-A840-354BD98100FA', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'B87C00BF-1812-4B06-9C42-C8CD5D0BD587', N'admin', CAST(N'2017-07-28T15:06:54.680' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'C1F89A88-B032-4A11-9D32-504AD268939D', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'B87C00BF-1812-4B06-9C42-C8CD5D0BD587', N'admin', CAST(N'2017-07-19T18:08:24.430' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'C243250D-F686-432B-8B22-272838E90813', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'B3DF49DF-3F7A-431C-9DAB-9A620255AAC2', N'admin', CAST(N'2017-07-28T15:06:54.737' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'C3F2CA32-9075-435C-9617-99D166AEC708', N'78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', N'D6F83B1F-CE8F-4D51-BBC4-0BA6F27F0028', N'admin', CAST(N'2017-07-28T15:07:30.280' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'C6908E41-1E4C-4E6C-889D-0D9489158B4A', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'50C7E86E-52E2-474F-AB7F-590C704A3D5D', N'admin', CAST(N'2017-07-19T18:40:12.193' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'D4B566B4-4994-4246-8274-33A891BB75AE', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'4826688E-BE54-4E94-A6ED-3148EC0AEF1E', N'admin', CAST(N'2017-07-28T15:07:18.427' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'D517AD22-48E4-4E39-BA85-A4AD0F23CC56', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'6ADC1BD0-2888-4783-B720-1AF5191A5495', N'admin', CAST(N'2017-07-28T15:06:54.703' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'D76CB9A1-EEDA-4EB5-8824-158018358C17', N'78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', N'53A0198A-21E8-4AA9-B0BA-02DB039878BC', N'admin', CAST(N'2017-07-28T15:07:30.250' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'D7D8AAFD-3DFA-498B-BA6F-1278126143D2', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'F857F429-5117-476D-8284-C3928739CBE9', N'admin', CAST(N'2017-07-28T15:07:18.410' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'D901755E-8C16-4C2D-86EF-2B96A972D0A6', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'855f3590-b233-4224-aaff-47fb95c8353d', N'admin', CAST(N'2017-07-28T15:06:54.767' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'D906F03E-90C3-499B-A3B1-FA7617AAB34E', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'9151AEE2-FA6E-4F80-847E-23746DD50DC2', N'admin', CAST(N'2017-07-19T15:51:38.670' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'DB00840E-CD11-4F12-8CAF-08B50113F053', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'2626147F-0341-4529-84C2-181CA763CDE0', N'admin', CAST(N'2017-07-28T15:06:54.707' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'DC1E37C7-16CD-4DB0-9055-76AA3D8B95A6', N'78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', N'439B1855-4646-4E5C-B0E0-F7383FA4BDB4', N'admin', CAST(N'2017-07-28T15:07:30.257' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'DC305076-D41B-4117-821E-F2FE396D520B', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'8DE07A5A-5026-40EF-B4F7-CF4EB00952F6', N'admin', CAST(N'2017-07-28T15:07:18.440' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'DD66F7FE-556B-43A2-A60A-F8B35AC8EEC3', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'50FB79D1-C549-420E-BA5E-09D10AB2F63F', N'admin', CAST(N'2017-07-28T15:06:54.697' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'DE9EE5E5-E3D1-47E9-83C2-F0EFFADEF095', N'78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', N'D2C474D7-A89C-488B-96D4-F955AD832C8E', N'admin', CAST(N'2017-07-28T15:07:30.263' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'E2A4E9EE-6C3C-46B5-91F0-BF42E8494541', N'78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', N'4826688E-BE54-4E94-A6ED-3148EC0AEF1E', N'admin', CAST(N'2017-07-28T15:07:30.277' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'E3913467-D8C9-403D-B3BC-4DD4A456918D', N'78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', N'74FD1A86-0CBE-4967-B878-F6E7F9C26BA8', N'admin', CAST(N'2017-07-28T15:07:30.267' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'E3F80601-C01D-494B-8612-147F290BC3C2', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'4FC03E6D-1458-4523-80F9-4C9A6E343F02', N'admin', CAST(N'2017-07-19T18:40:12.113' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'E4E88633-EEDE-4894-8B8F-1E07595A2277', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'D2C474D7-A89C-488B-96D4-F955AD832C8E', N'admin', CAST(N'2017-07-27T17:19:04.247' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'E5596408-FECD-4771-8C2D-2C5C5354CBF3', NULL, N'3c69e3fb-e1fe-4911-8417-6f6d55a1ce72', NULL, NULL)
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'e5d6408b-c397-4895-bd00-ac5caffe3c4a', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'd9cfc79d-55f6-4890-b604-49f1d2a0d971', N'admin', CAST(N'2017-03-28T16:47:59.757' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'E64243EF-DA2F-462E-AD35-AFA3BCC60475', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'2D0D3AB9-FF60-4886-A9A9-4F1F59E4F224', N'admin', CAST(N'2017-07-28T15:06:54.693' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'E6F7C275-7016-4641-B039-DCA79F18D0AA', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'2B3FA265-CB5B-4451-9C12-68EA878FA9D3', N'admin', CAST(N'2017-07-20T14:00:18.683' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'E9058B42-419B-401B-844D-2F9A561D5AFB', N'9F29438D-FE3A-4BE1-9D41-4D32FF7A0FAD', N'7635B6EA-4061-4BBF-A5DC-B8FFE2D78197', N'admin', CAST(N'2017-07-28T15:06:54.700' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'EA82B756-69DF-4343-B554-0D8DFEFB8BF5', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'D6F83B1F-CE8F-4D51-BBC4-0BA6F27F0028', N'admin', CAST(N'2017-07-28T15:07:18.430' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'EACE6356-83AD-4193-9A32-A88E6D7A99E7', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'47F1A0E1-8848-4E15-891F-D910257C962B', N'admin', CAST(N'2017-07-28T15:07:18.433' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'EDA9B6B4-847A-4988-94AB-907C36E30E58', N'78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', N'4FC03E6D-1458-4523-80F9-4C9A6E343F02', N'admin', CAST(N'2017-07-28T15:07:30.270' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'F13D97BE-364F-4724-AD53-6F7A5741ED22', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'3E2BDE02-066B-4FFA-AA6D-7F088AABFE92', N'admin', CAST(N'2017-07-28T15:07:18.430' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'f44cc7d8-4495-42bb-91a0-f56b539b6fc4', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'81d1cbf0-3cff-4cde-8128-7d0d844450de', NULL, NULL)
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'F5CC5F2B-BC50-4A90-A6EF-AF2C5428A908', N'78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', N'9151AEE2-FA6E-4F80-847E-23746DD50DC2', N'admin', CAST(N'2017-07-28T15:07:30.240' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'F7F2C69B-3096-4131-ADB3-C4C031DC2431', N'E56FD05B-E1B6-4595-A544-D6A31F22EB21', N'336F8206-EB11-4C12-851B-20B21354532A', N'admin', CAST(N'2017-07-28T15:07:18.437' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'FFD068BB-E55A-410E-A20B-D7747469595E', N'78516ecc-e0ad-4f7a-a107-6a4a4ebe64a7', N'50C7E86E-52E2-474F-AB7F-590C704A3D5D', N'admin', CAST(N'2017-07-28T15:07:30.273' AS DateTime))
INSERT [dbo].[Sys_RoleAuthorize] ([Id], [RoleId], [ModuleId], [CreateUser], [CreateTime]) VALUES (N'NULL3e7e6244-080b-49a6-9fb5-654af2e0fd33', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'855f3590-b233-4224-aaff-47fb95c8353d', NULL, NULL)
INSERT [dbo].[Sys_User] ([Id], [Account], [RealName], [NickName], [Avatar], [Gender], [Birthday], [MobilePhone], [Email], [Signature], [Address], [CompanyId], [DepartmentId], [IsEnabled], [SortCode], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'897C3C01-ACAF-4169-AD2F-B3E101AAE3EA', N'xiaofei', N'王菲', N'菲菲菲菲菲', N'/Content/framework/images/avatar.png', 0, CAST(N'2017-05-02T00:00:00.000' AS DateTime), N'15622684596', N'jakhf@163.com', N'努力工作', N'山东济南', NULL, NULL, 1, 5, 0, N'admin', CAST(N'2017-03-22T10:58:43.107' AS DateTime), N'admin', CAST(N'2017-07-25T13:57:40.847' AS DateTime))
INSERT [dbo].[Sys_User] ([Id], [Account], [RealName], [NickName], [Avatar], [Gender], [Birthday], [MobilePhone], [Email], [Signature], [Address], [CompanyId], [DepartmentId], [IsEnabled], [SortCode], [DeleteMark], [CreateUser], [CreateTime], [ModifyUser], [ModifyTime]) VALUES (N'D1EF3DCD-2C7D-4E8F-8F29-9F73625DD5DF', N'admin', N'超级管理员', N'My Lord', N'/Uploads/Avatar/d1ef3dcd-2c7d-4e8f-8f29-9f73625dd5df.jpg', 1, CAST(N'2017-07-12T00:00:00.000' AS DateTime), N'13688888888', N'973095739@qq.com', N'啦啦啦啦啦啦啦啦啦咯！', N'山东济宁', NULL, N'a93c66e2-b8dc-4d00-84ed-e6071b5f5318', 1, 1, 0, N'admin', CAST(N'2017-03-22T10:58:43.107' AS DateTime), N'admin', CAST(N'2017-07-12T11:01:50.053' AS DateTime))
INSERT [dbo].[Sys_UserLogOn] ([Id], [UserId], [Password], [SecretKey], [PrevVisitTime], [LastVisitTime], [ChangePwdTime], [LoginCount], [AllowMultiUserOnline], [IsOnLine], [Question], [AnswerQuestion], [CheckIPAddress], [Language], [Theme]) VALUES (N'6bde15b3-88a9-4522-817e-3d5877130a05', N'd1ef3dcd-2c7d-4e8f-8f29-9f73625dd5df', N'670b14728ad9902aecba32e22fa4f6bd', N'juhgtdjc', CAST(N'2017-08-18T09:45:35.060' AS DateTime), CAST(N'2017-08-18T09:45:35.060' AS DateTime), CAST(N'2017-07-11T09:38:40.070' AS DateTime), 2155, 1, 1, N'lovecoding?', N'no', 1, NULL, NULL)
INSERT [dbo].[Sys_UserLogOn] ([Id], [UserId], [Password], [SecretKey], [PrevVisitTime], [LastVisitTime], [ChangePwdTime], [LoginCount], [AllowMultiUserOnline], [IsOnLine], [Question], [AnswerQuestion], [CheckIPAddress], [Language], [Theme]) VALUES (N'e86c5360-b710-475a-8f80-6f7e0d0b0a1a', N'897c3c01-acaf-4169-ad2f-b3e101aae3ea', N'670b14728ad9902aecba32e22fa4f6bd', N'juhgtdjc', CAST(N'2017-03-30T14:14:37.153' AS DateTime), CAST(N'2017-03-30T14:14:37.153' AS DateTime), NULL, 3, 0, 1, N'我是谁？', N'王菲', 0, NULL, NULL)
INSERT [dbo].[Sys_UserRoleRelation] ([Id], [UserId], [RoleId], [CreateUser], [CreateTime]) VALUES (N'45e0a953-fd82-42f4-afe5-cbbbd2a263b0', N'd1ef3dcd-2c7d-4e8f-8f29-9f73625dd5df', N'a3a3857c-51fb-43a6-a7b5-3a612e887b3a', N'admin', CAST(N'2017-01-20T09:37:08.343' AS DateTime))
INSERT [dbo].[Sys_UserRoleRelation] ([Id], [UserId], [RoleId], [CreateUser], [CreateTime]) VALUES (N'5c7b0e32-9dd5-40d8-82ec-e26a331d6059', N'897c3c01-acaf-4169-ad2f-b3e101aae3ea', N'ed66f99c-d1bd-4fe3-948a-6520a5d6b7d9', N'admin', CAST(N'2017-03-25T16:23:57.783' AS DateTime))
INSERT [dbo].[Sys_UserRoleRelation] ([Id], [UserId], [RoleId], [CreateUser], [CreateTime]) VALUES (N'b37e496a-918b-4876-a09e-22449aac1bb7', N'897c3c01-acaf-4169-ad2f-b3e101aae3ea', N'97223b06-6b7a-47fb-b74c-173f52c519c4', N'admin', CAST(N'2017-03-25T16:23:57.810' AS DateTime))
ALTER TABLE [dbo].[SD_EKPI_INFO] ADD  CONSTRAINT [DF__TC_SD_EKP__VALID__3EDC53F0]  DEFAULT ((0)) FOR [VALID_FLAG]
GO
ALTER TABLE [dbo].[SD_FILTER_INFO] ADD  CONSTRAINT [DF__TC_SD_FIL__VALID__477199F1]  DEFAULT ((0)) FOR [VALID_FLAG]
GO
ALTER TABLE [dbo].[SD_INFO] ADD  CONSTRAINT [DF__TC_SD_INF__VALID__4A4E069C]  DEFAULT ((0)) FOR [VALID_FLAG]
GO
ALTER TABLE [dbo].[SD_ITEM_INFO] ADD  CONSTRAINT [DF__TC_SD_ITE__SD_IT__4F12BBB9]  DEFAULT ((0)) FOR [SD_ITEM_SRC]
GO
ALTER TABLE [dbo].[SD_ITEM_INFO] ADD  CONSTRAINT [DF__TC_SD_ITE__VALID__5006DFF2]  DEFAULT ((0)) FOR [VALID_FLAG]
GO
ALTER TABLE [dbo].[Sys_Item] ADD  CONSTRAINT [DF_Sys_Item_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Sys_ItemsDetail] ADD  CONSTRAINT [DF_Sys_ItemsDetail_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Sys_Organize] ADD  CONSTRAINT [DF_Sys_Organize_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Sys_Permission] ADD  CONSTRAINT [DF_Sys_Permission_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Sys_Permission] ADD  CONSTRAINT [DF_Sys_Permission_IsPublic]  DEFAULT ((0)) FOR [IsPublic]
GO
ALTER TABLE [dbo].[Sys_Permission] ADD  CONSTRAINT [DF_Sys_Permission_IsEnable]  DEFAULT ((1)) FOR [IsEnable]
GO
ALTER TABLE [dbo].[Sys_Permission] ADD  CONSTRAINT [DF_Sys_Permission_IsEdit]  DEFAULT ((1)) FOR [IsEdit]
GO
ALTER TABLE [dbo].[Sys_Permission] ADD  CONSTRAINT [DF_Sys_Permission_DeleteMark]  DEFAULT ((0)) FOR [DeleteMark]
GO
ALTER TABLE [dbo].[Sys_Role] ADD  CONSTRAINT [DF_Sys_Role_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Sys_RoleAuthorize] ADD  CONSTRAINT [DF_Sys_RoleAuthorize_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Sys_User] ADD  CONSTRAINT [DF_Sys_User_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Sys_UserLogOn] ADD  CONSTRAINT [DF_Sys_UserLogOn_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Sys_UserLogOn] ADD  CONSTRAINT [DF_Sys_UserLogin_LoginCount]  DEFAULT ((0)) FOR [LoginCount]
GO
ALTER TABLE [dbo].[Sys_UserRoleRelation] ADD  CONSTRAINT [DF_Sys_UserRoleRelation_Id]  DEFAULT (newid()) FOR [Id]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PDP_DB_CONF', @level2type=N'COLUMN',@level2name=N'TC_PROJ_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 项目CDR
   2 项目开发EDR
   3 集成环境' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PDP_DB_CONF', @level2type=N'COLUMN',@level2name=N'DB_CONF_TYPE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PDP_DB_CONF', @level2type=N'COLUMN',@level2name=N'UPD_USER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PDP_DB_CONF', @level2type=N'COLUMN',@level2name=N'UPD_DATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 执行
   2 测试
   3 导出' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PDP_ERROR_LOG', @level2type=N'COLUMN',@level2name=N'PROC_TYPE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'执行类型
   1 入组规则执行
   2 数据项执行
   3 评价指标执行' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PDP_PROC_LOG', @level2type=N'COLUMN',@level2name=N'PROC_CAT_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'根据执行日志分类不同，分别存放：入组规则ID，数据项ID，评价指标ID等。' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PDP_PROC_LOG', @level2type=N'COLUMN',@level2name=N'PROC_CONTENT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'执行类型
   1 入组规则执行
   2 数据项执行
   3 评价指标执行' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PDP_PROC_STAT', @level2type=N'COLUMN',@level2name=N'PROC_CAT_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'根据执行类型不同，分别存放：入组规则ID，数据项ID，评价指标ID等。' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PDP_PROC_STAT', @level2type=N'COLUMN',@level2name=N'PROC_CONTENT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 未执行
   2 已执行
   3 已清空' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PDP_PROC_STAT', @level2type=N'COLUMN',@level2name=N'PROC_STAT_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PDP_PROJECT', @level2type=N'COLUMN',@level2name=N'TC_PROJ_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PDP_PROJECT', @level2type=N'COLUMN',@level2name=N'TC_PROJ_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 非公共
   1 公共 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PDP_PROJECT', @level2type=N'COLUMN',@level2name=N'IS_COMMON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 质控
   2 科研
   见通用字典表。' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PDP_PROJECT', @level2type=N'COLUMN',@level2name=N'TC_PROJ_TYPE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PDP_PROJECT', @level2type=N'COLUMN',@level2name=N'UPD_USER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PDP_PROJECT', @level2type=N'COLUMN',@level2name=N'UPD_DATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'定义测试平台的各个项目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PDP_PROJECT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 数据项类别
   2 自定义数据项类别
   3 评价指标类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_CAT_CONF', @level2type=N'COLUMN',@level2name=N'CAT_TYPE_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'多级分类预留' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_CAT_CONF', @level2type=N'COLUMN',@level2name=N'CAT_SUB_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_CAT_CONF', @level2type=N'COLUMN',@level2name=N'UPD_USER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评价样本ID
   编码规则：SD_CODE+''_''+IN_FLAG+''_''+主记录PATIENT_NO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_CPAT_DETAIL', @level2type=N'COLUMN',@level2name=N'SD_CPAT_NO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'住院门急诊标识
   I 住院
   E 急诊
   O 门诊
   9 未知' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_CPAT_DETAIL', @level2type=N'COLUMN',@level2name=N'IN_FLAG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否评价主记录
   1 是
   0 否' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_CPAT_DETAIL', @level2type=N'COLUMN',@level2name=N'BASE_FLAG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_CPAT_DETAIL', @level2type=N'COLUMN',@level2name=N'UPD_USER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评价样本ID
   编码规则：SD_CODE+''_''+IN_FLAG+''_''+主记录PATIENT_NO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_CPATS', @level2type=N'COLUMN',@level2name=N'SD_CPAT_NO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评价样本ID
   编码规则：SD_CODE+''_''+IN_FLAG+''_''+主记录PATIENT_NO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_CPATS', @level2type=N'COLUMN',@level2name=N'SD_FILTER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'病种编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_CPATS', @level2type=N'COLUMN',@level2name=N'SD_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入组样本时间
   入组主记录的出院时间或者门诊就诊时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_CPATS', @level2type=N'COLUMN',@level2name=N'SD_CPAT_DATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_CPATS', @level2type=N'COLUMN',@level2name=N'UPD_USER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_EKPI_FORMULA', @level2type=N'COLUMN',@level2name=N'UPD_USER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_EKPI_FORMULA', @level2type=N'COLUMN',@level2name=N'UPD_DATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'指标类别代码
   取自字典明细，字典类别代码取值见SD_INFO的DICT_MASTER_CODE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_EKPI_INFO', @level2type=N'COLUMN',@level2name=N'SD_EKPI_CAT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 正向（分子为1正常，0可疑）
   0 负向（分子为0正常，1可疑）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_EKPI_INFO', @level2type=N'COLUMN',@level2name=N'IS_POSITIVE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效标识
   1：有效 0：失效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_EKPI_INFO', @level2type=N'COLUMN',@level2name=N'VALID_FLAG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_EKPI_INFO', @level2type=N'COLUMN',@level2name=N'UPD_USER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_EKPI_INFO', @level2type=N'COLUMN',@level2name=N'UPD_DATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据项ID
   自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_EKPI_PARAM', @level2type=N'COLUMN',@level2name=N'SD_ITEM_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_EKPI_PARAM', @level2type=N'COLUMN',@level2name=N'UPD_USER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_EKPI_PARAM', @level2type=N'COLUMN',@level2name=N'UPD_DATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评价样本ID
   编码规则：SD_CODE+''_''+IN_FLAG+''_''+主记录PATIENT_NO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_EPKI_VALUE', @level2type=N'COLUMN',@level2name=N'SD_CPAT_NO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'病种编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_EPKI_VALUE', @level2type=N'COLUMN',@level2name=N'SD_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'指标值
   记录分子的值，达标为1，不达标为0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_EPKI_VALUE', @level2type=N'COLUMN',@level2name=N'INDEX_VALUE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否析因
   1 已析因
   0 未析因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_EPKI_VALUE', @level2type=N'COLUMN',@level2name=N'RSN_FLAG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_EPKI_VALUE', @level2type=N'COLUMN',@level2name=N'UPD_USER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单病种评价指标值
   分母为0不存记录，分子为1写1，分子为0写0
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_EPKI_VALUE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评价样本ID
   编码规则：SD_CODE+''_''+IN_FLAG+''_''+主记录PATIENT_NO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_FILTER_INFO', @level2type=N'COLUMN',@level2name=N'SD_FILTER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入组规则代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_FILTER_INFO', @level2type=N'COLUMN',@level2name=N'SD_FILTER_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入组规则代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_FILTER_INFO', @level2type=N'COLUMN',@level2name=N'SD_FILTER_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效标识
   1：有效 0：失效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_FILTER_INFO', @level2type=N'COLUMN',@level2name=N'VALID_FLAG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_FILTER_INFO', @level2type=N'COLUMN',@level2name=N'UPD_USER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_FILTER_INFO', @level2type=N'COLUMN',@level2name=N'UPD_DATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_INFO', @level2type=N'COLUMN',@level2name=N'TC_PROJ_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 质控
   2 科研
   见通用字典表。' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_INFO', @level2type=N'COLUMN',@level2name=N'TC_PROJ_TYPE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'取TC_SD_CAT_DICT中CAT_TYPE_CODE=1的CAT_L1_CODE列表
   比如：SD_ITEM_IS,SD_ITEM_COMMON' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_INFO', @level2type=N'COLUMN',@level2name=N'ITEM_CAT_PA_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'取TC_SD_CAT_DICT中CAT_TYPE_CODE=2的CAT_L1_CODE列表
   比如：自定义数据项SD_CITEM_CAT1
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_INFO', @level2type=N'COLUMN',@level2name=N'CITEM_CAT_PA_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'取TC_SD_CAT_DICT中CAT_TYPE_CODE=3的CAT_L1_CODE列表
   比如：手术类SD_EKPI_OP,SD_EKPI_NOP
   
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_INFO', @level2type=N'COLUMN',@level2name=N'EKPI_CAT_PA_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效标识
   1：有效 0：失效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_INFO', @level2type=N'COLUMN',@level2name=N'VALID_FLAG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_INFO', @level2type=N'COLUMN',@level2name=N'UPD_USER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据项ID
   自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_ITEM_DEP', @level2type=N'COLUMN',@level2name=N'SD_ITEM_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据项ID
   自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_ITEM_DEP', @level2type=N'COLUMN',@level2name=N'DEP_SD_ITEM_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_ITEM_DEP', @level2type=N'COLUMN',@level2name=N'UPD_USER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_ITEM_DEP', @level2type=N'COLUMN',@level2name=N'UPD_DATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据项ID
   自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_ITEM_INFO', @level2type=N'COLUMN',@level2name=N'SD_ITEM_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码要求：预定义：病种代码_001 自定义：D_病种代码_001' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_ITEM_INFO', @level2type=N'COLUMN',@level2name=N'SD_ITEM_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据项类别代码
   类型取值见通用字典表，类型代码为：SD_ITEM_CAT
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_ITEM_INFO', @level2type=N'COLUMN',@level2name=N'SD_ITEM_CAT_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据项结果数据类型：1、数值 2、字符串 3、日期 4、日期时间 5、枚举 6、布尔 7 对象
   类型取值见通用字典表，类型代码为：SD_ITEM_DATA_TYPE
   类型为枚举的时候，取值见option子表
   类型为布尔的时候，取值见通用字典表，类型代码为：BOOL_VALUE
   
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_ITEM_INFO', @level2type=N'COLUMN',@level2name=N'SD_ITEM_DATA_TYPE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小数位数
   数据类型为数值的时候，定义小数位数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_ITEM_INFO', @level2type=N'COLUMN',@level2name=N'NUM_PRECISION'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1:公共
   2:自定义' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_ITEM_INFO', @level2type=N'COLUMN',@level2name=N'SD_ITEM_SRC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效标识
   1：有效 0：失效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_ITEM_INFO', @level2type=N'COLUMN',@level2name=N'VALID_FLAG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_ITEM_INFO', @level2type=N'COLUMN',@level2name=N'UPD_USER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_ITEM_INFO', @level2type=N'COLUMN',@level2name=N'UPD_DATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据项ID
   自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_ITEM_OPTION', @level2type=N'COLUMN',@level2name=N'SD_ITEM_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_ITEM_OPTION', @level2type=N'COLUMN',@level2name=N'UPD_USER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_ITEM_OPTION', @level2type=N'COLUMN',@level2name=N'UPD_DATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据项ID
   自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_ITEM_VALUE', @level2type=N'COLUMN',@level2name=N'SD_ITEM_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评价样本ID
   编码规则：SD_CODE+''_''+IN_FLAG+''_''+主记录PATIENT_NO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_ITEM_VALUE', @level2type=N'COLUMN',@level2name=N'SD_CPAT_NO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'病种编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_ITEM_VALUE', @level2type=N'COLUMN',@level2name=N'SD_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评价样本ID
   编码规则：SD_CODE+''_''+IN_FLAG+''_''+主记录PATIENT_NO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_ITEM_VALUE', @level2type=N'COLUMN',@level2name=N'SD_FILTER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SD_ITEM_VALUE', @level2type=N'COLUMN',@level2name=N'UPD_USER_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Item', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Item', @level2type=N'COLUMN',@level2name=N'EnCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Item', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'层次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Item', @level2type=N'COLUMN',@level2name=N'Layer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Item', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否树形菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Item', @level2type=N'COLUMN',@level2name=N'IsTree'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Item', @level2type=N'COLUMN',@level2name=N'DeleteMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Item', @level2type=N'COLUMN',@level2name=N'IsEnabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Item', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Item', @level2type=N'COLUMN',@level2name=N'CreateUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Item', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Item', @level2type=N'COLUMN',@level2name=N'ModifyUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Item', @level2type=N'COLUMN',@level2name=N'ModifyTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_ItemsDetail', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_ItemsDetail', @level2type=N'COLUMN',@level2name=N'ItemId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_ItemsDetail', @level2type=N'COLUMN',@level2name=N'EnCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'选项名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_ItemsDetail', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否默认' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_ItemsDetail', @level2type=N'COLUMN',@level2name=N'IsDefault'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_ItemsDetail', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_ItemsDetail', @level2type=N'COLUMN',@level2name=N'DeleteMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_ItemsDetail', @level2type=N'COLUMN',@level2name=N'IsEnabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_ItemsDetail', @level2type=N'COLUMN',@level2name=N'CreateUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_ItemsDetail', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_ItemsDetail', @level2type=N'COLUMN',@level2name=N'ModifyUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_ItemsDetail', @level2type=N'COLUMN',@level2name=N'ModifyTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Log', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发生时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Log', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Log', @level2type=N'COLUMN',@level2name=N'LogLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作模块' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Log', @level2type=N'COLUMN',@level2name=N'Operation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志消息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Log', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作账户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Log', @level2type=N'COLUMN',@level2name=N'Account'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'真实姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Log', @level2type=N'COLUMN',@level2name=N'RealName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作人IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Log', @level2type=N'COLUMN',@level2name=N'IP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作人IP归属地' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Log', @level2type=N'COLUMN',@level2name=N'IPAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'堆栈信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Log', @level2type=N'COLUMN',@level2name=N'StackTrace'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Organize', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Organize', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'层次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Organize', @level2type=N'COLUMN',@level2name=N'Layer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Organize', @level2type=N'COLUMN',@level2name=N'EnCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'全称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Organize', @level2type=N'COLUMN',@level2name=N'FullName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Organize', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'负责人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Organize', @level2type=N'COLUMN',@level2name=N'ManagerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'固话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Organize', @level2type=N'COLUMN',@level2name=N'TelePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'微信' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Organize', @level2type=N'COLUMN',@level2name=N'WeChat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'传真' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Organize', @level2type=N'COLUMN',@level2name=N'Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Organize', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Organize', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Organize', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Organize', @level2type=N'COLUMN',@level2name=N'DeleteMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Organize', @level2type=N'COLUMN',@level2name=N'IsEnabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Organize', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Organize', @level2type=N'COLUMN',@level2name=N'CreateUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Organize', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Organize', @level2type=N'COLUMN',@level2name=N'ModifyUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Organize', @level2type=N'COLUMN',@level2name=N'ModifyTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Permission', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Permission', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'层次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Permission', @level2type=N'COLUMN',@level2name=N'Layer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Permission', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Permission', @level2type=N'COLUMN',@level2name=N'JsEvent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Permission', @level2type=N'COLUMN',@level2name=N'Icon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Permission', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Permission', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块类型：1-菜单 2-按钮' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Permission', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Permission', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否公开' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Permission', @level2type=N'COLUMN',@level2name=N'IsPublic'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Permission', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许编辑' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Permission', @level2type=N'COLUMN',@level2name=N'IsEdit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Permission', @level2type=N'COLUMN',@level2name=N'CreateUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Permission', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Permission', @level2type=N'COLUMN',@level2name=N'ModifyUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Permission', @level2type=N'COLUMN',@level2name=N'ModifyTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Role', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Role', @level2type=N'COLUMN',@level2name=N'OrganizeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Role', @level2type=N'COLUMN',@level2name=N'EnCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类：1-角色2-岗位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Role', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Role', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可编辑' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Role', @level2type=N'COLUMN',@level2name=N'AllowEdit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Role', @level2type=N'COLUMN',@level2name=N'DeleteMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Role', @level2type=N'COLUMN',@level2name=N'IsEnabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Role', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Role', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Role', @level2type=N'COLUMN',@level2name=N'CreateUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Role', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Role', @level2type=N'COLUMN',@level2name=N'ModifyUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Role', @level2type=N'COLUMN',@level2name=N'ModifyTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_RoleAuthorize', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_RoleAuthorize', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_RoleAuthorize', @level2type=N'COLUMN',@level2name=N'ModuleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_RoleAuthorize', @level2type=N'COLUMN',@level2name=N'CreateUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_RoleAuthorize', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'Account'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'真实姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'RealName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'NickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'Avatar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'Gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生日' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'Birthday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'MobilePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'签名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'Signature'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领导ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'CompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'DepartmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'IsEnabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'SortCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'DeleteMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'CreateUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'ModifyUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'ModifyTime'
GO

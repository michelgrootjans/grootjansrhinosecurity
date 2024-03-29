USE [Security_Test]
GO
/****** Object:  ForeignKey [FKBBE4029387CC6C80]    Script Date: 03/12/2009 15:45:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FKBBE4029387CC6C80]') AND parent_object_id = OBJECT_ID(N'[security_EntityReferences]'))
ALTER TABLE [security_EntityReferences] DROP CONSTRAINT [FKBBE4029387CC6C80]
GO
/****** Object:  ForeignKey [FK17A323D6DDB11ADF]    Script Date: 03/12/2009 15:45:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK17A323D6DDB11ADF]') AND parent_object_id = OBJECT_ID(N'[security_EntityReferencesToEntitiesGroups]'))
ALTER TABLE [security_EntityReferencesToEntitiesGroups] DROP CONSTRAINT [FK17A323D6DDB11ADF]
GO
/****** Object:  ForeignKey [FK17A323D6DE03A26A]    Script Date: 03/12/2009 15:45:25 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK17A323D6DE03A26A]') AND parent_object_id = OBJECT_ID(N'[security_EntityReferencesToEntitiesGroups]'))
ALTER TABLE [security_EntityReferencesToEntitiesGroups] DROP CONSTRAINT [FK17A323D6DE03A26A]
GO
/****** Object:  ForeignKey [FKE58BBFF82B7CDCD3]    Script Date: 03/12/2009 15:45:27 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FKE58BBFF82B7CDCD3]') AND parent_object_id = OBJECT_ID(N'[security_Operations]'))
ALTER TABLE [security_Operations] DROP CONSTRAINT [FKE58BBFF82B7CDCD3]
GO
/****** Object:  ForeignKey [FKEA223C4C2EE8F612]    Script Date: 03/12/2009 15:45:29 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FKEA223C4C2EE8F612]') AND parent_object_id = OBJECT_ID(N'[security_Permissions]'))
ALTER TABLE [security_Permissions] DROP CONSTRAINT [FKEA223C4C2EE8F612]
GO
/****** Object:  ForeignKey [FKEA223C4C6C8EC3A5]    Script Date: 03/12/2009 15:45:29 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FKEA223C4C6C8EC3A5]') AND parent_object_id = OBJECT_ID(N'[security_Permissions]'))
ALTER TABLE [security_Permissions] DROP CONSTRAINT [FKEA223C4C6C8EC3A5]
GO
/****** Object:  ForeignKey [FKEA223C4C71C937C7]    Script Date: 03/12/2009 15:45:29 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FKEA223C4C71C937C7]') AND parent_object_id = OBJECT_ID(N'[security_Permissions]'))
ALTER TABLE [security_Permissions] DROP CONSTRAINT [FKEA223C4C71C937C7]
GO
/****** Object:  ForeignKey [FKEA223C4CFC8C2B95]    Script Date: 03/12/2009 15:45:29 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FKEA223C4CFC8C2B95]') AND parent_object_id = OBJECT_ID(N'[security_Permissions]'))
ALTER TABLE [security_Permissions] DROP CONSTRAINT [FKEA223C4CFC8C2B95]
GO
/****** Object:  ForeignKey [FKEC3AF233D0CB87D0]    Script Date: 03/12/2009 15:45:30 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FKEC3AF233D0CB87D0]') AND parent_object_id = OBJECT_ID(N'[security_UsersGroups]'))
ALTER TABLE [security_UsersGroups] DROP CONSTRAINT [FKEC3AF233D0CB87D0]
GO
/****** Object:  ForeignKey [FK69A3B61FA860AB70]    Script Date: 03/12/2009 15:45:30 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK69A3B61FA860AB70]') AND parent_object_id = OBJECT_ID(N'[security_UsersGroupsHierarchy]'))
ALTER TABLE [security_UsersGroupsHierarchy] DROP CONSTRAINT [FK69A3B61FA860AB70]
GO
/****** Object:  ForeignKey [FK69A3B61FA87BAE50]    Script Date: 03/12/2009 15:45:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK69A3B61FA87BAE50]') AND parent_object_id = OBJECT_ID(N'[security_UsersGroupsHierarchy]'))
ALTER TABLE [security_UsersGroupsHierarchy] DROP CONSTRAINT [FK69A3B61FA87BAE50]
GO
/****** Object:  ForeignKey [FK7817F27A1238D4D4]    Script Date: 03/12/2009 15:45:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK7817F27A1238D4D4]') AND parent_object_id = OBJECT_ID(N'[security_UsersToUsersGroups]'))
ALTER TABLE [security_UsersToUsersGroups] DROP CONSTRAINT [FK7817F27A1238D4D4]
GO
/****** Object:  ForeignKey [FK7817F27AA6C99102]    Script Date: 03/12/2009 15:45:31 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK7817F27AA6C99102]') AND parent_object_id = OBJECT_ID(N'[security_UsersToUsersGroups]'))
ALTER TABLE [security_UsersToUsersGroups] DROP CONSTRAINT [FK7817F27AA6C99102]
GO
/****** Object:  Table [dbo].[security_EntityReferencesToEntitiesGroups]    Script Date: 03/12/2009 15:45:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[security_EntityReferencesToEntitiesGroups]') AND type in (N'U'))
DROP TABLE [security_EntityReferencesToEntitiesGroups]
GO
/****** Object:  Table [dbo].[security_Permissions]    Script Date: 03/12/2009 15:45:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[security_Permissions]') AND type in (N'U'))
DROP TABLE [security_Permissions]
GO
/****** Object:  Table [dbo].[security_UsersToUsersGroups]    Script Date: 03/12/2009 15:45:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[security_UsersToUsersGroups]') AND type in (N'U'))
DROP TABLE [security_UsersToUsersGroups]
GO
/****** Object:  Table [dbo].[security_UsersGroupsHierarchy]    Script Date: 03/12/2009 15:45:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[security_UsersGroupsHierarchy]') AND type in (N'U'))
DROP TABLE [security_UsersGroupsHierarchy]
GO
/****** Object:  Table [dbo].[security_EntitiesGroups]    Script Date: 03/12/2009 15:45:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[security_EntitiesGroups]') AND type in (N'U'))
DROP TABLE [security_EntitiesGroups]
GO
/****** Object:  Table [dbo].[security_EntityReferences]    Script Date: 03/12/2009 15:45:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[security_EntityReferences]') AND type in (N'U'))
DROP TABLE [security_EntityReferences]
GO
/****** Object:  Table [dbo].[security_EntityTypes]    Script Date: 03/12/2009 15:45:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[security_EntityTypes]') AND type in (N'U'))
DROP TABLE [security_EntityTypes]
GO
/****** Object:  Table [dbo].[security_Operations]    Script Date: 03/12/2009 15:45:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[security_Operations]') AND type in (N'U'))
DROP TABLE [security_Operations]
GO
/****** Object:  Table [dbo].[security_UsersGroups]    Script Date: 03/12/2009 15:45:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[security_UsersGroups]') AND type in (N'U'))
DROP TABLE [security_UsersGroups]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 03/12/2009 15:45:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Users]') AND type in (N'U'))
DROP TABLE [Users]
GO
/****** Object:  Table [dbo].[security_EntitiesGroups]    Script Date: 03/12/2009 15:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[security_EntitiesGroups]') AND type in (N'U'))
BEGIN
CREATE TABLE [security_EntitiesGroups](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[security_EntityTypes]    Script Date: 03/12/2009 15:45:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[security_EntityTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [security_EntityTypes](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[security_Operations]    Script Date: 03/12/2009 15:45:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[security_Operations]') AND type in (N'U'))
BEGIN
CREATE TABLE [security_Operations](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Comment] [nvarchar](255) NULL,
	[Parent] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[security_UsersGroups]    Script Date: 03/12/2009 15:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[security_UsersGroups]') AND type in (N'U'))
BEGIN
CREATE TABLE [security_UsersGroups](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Parent] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Users]    Script Date: 03/12/2009 15:45:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[security_Permissions]    Script Date: 03/12/2009 15:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[security_Permissions]') AND type in (N'U'))
BEGIN
CREATE TABLE [security_Permissions](
	[Id] [uniqueidentifier] NOT NULL,
	[EntitySecurityKey] [uniqueidentifier] NULL,
	[Allow] [bit] NOT NULL,
	[Level] [int] NOT NULL,
	[EntityTypeName] [nvarchar](255) NULL,
	[Operation] [uniqueidentifier] NOT NULL,
	[User] [bigint] NULL,
	[UsersGroup] [uniqueidentifier] NULL,
	[EntitiesGroup] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[security_EntityReferencesToEntitiesGroups]    Script Date: 03/12/2009 15:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[security_EntityReferencesToEntitiesGroups]') AND type in (N'U'))
BEGIN
CREATE TABLE [security_EntityReferencesToEntitiesGroups](
	[GroupId] [uniqueidentifier] NOT NULL,
	[EntityReferenceId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC,
	[EntityReferenceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[security_EntityReferences]    Script Date: 03/12/2009 15:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[security_EntityReferences]') AND type in (N'U'))
BEGIN
CREATE TABLE [security_EntityReferences](
	[Id] [uniqueidentifier] NOT NULL,
	[EntitySecurityKey] [uniqueidentifier] NOT NULL,
	[Type] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[EntitySecurityKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[security_UsersGroupsHierarchy]    Script Date: 03/12/2009 15:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[security_UsersGroupsHierarchy]') AND type in (N'U'))
BEGIN
CREATE TABLE [security_UsersGroupsHierarchy](
	[ParentGroup] [uniqueidentifier] NOT NULL,
	[ChildGroup] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ChildGroup] ASC,
	[ParentGroup] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[security_UsersToUsersGroups]    Script Date: 03/12/2009 15:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[security_UsersToUsersGroups]') AND type in (N'U'))
BEGIN
CREATE TABLE [security_UsersToUsersGroups](
	[GroupId] [uniqueidentifier] NOT NULL,
	[UserId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  ForeignKey [FKBBE4029387CC6C80]    Script Date: 03/12/2009 15:45:24 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FKBBE4029387CC6C80]') AND parent_object_id = OBJECT_ID(N'[security_EntityReferences]'))
ALTER TABLE [security_EntityReferences]  WITH CHECK ADD  CONSTRAINT [FKBBE4029387CC6C80] FOREIGN KEY([Type])
REFERENCES [security_EntityTypes] ([Id])
GO
ALTER TABLE [security_EntityReferences] CHECK CONSTRAINT [FKBBE4029387CC6C80]
GO
/****** Object:  ForeignKey [FK17A323D6DDB11ADF]    Script Date: 03/12/2009 15:45:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK17A323D6DDB11ADF]') AND parent_object_id = OBJECT_ID(N'[security_EntityReferencesToEntitiesGroups]'))
ALTER TABLE [security_EntityReferencesToEntitiesGroups]  WITH CHECK ADD  CONSTRAINT [FK17A323D6DDB11ADF] FOREIGN KEY([EntityReferenceId])
REFERENCES [security_EntityReferences] ([Id])
GO
ALTER TABLE [security_EntityReferencesToEntitiesGroups] CHECK CONSTRAINT [FK17A323D6DDB11ADF]
GO
/****** Object:  ForeignKey [FK17A323D6DE03A26A]    Script Date: 03/12/2009 15:45:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK17A323D6DE03A26A]') AND parent_object_id = OBJECT_ID(N'[security_EntityReferencesToEntitiesGroups]'))
ALTER TABLE [security_EntityReferencesToEntitiesGroups]  WITH CHECK ADD  CONSTRAINT [FK17A323D6DE03A26A] FOREIGN KEY([GroupId])
REFERENCES [security_EntitiesGroups] ([Id])
GO
ALTER TABLE [security_EntityReferencesToEntitiesGroups] CHECK CONSTRAINT [FK17A323D6DE03A26A]
GO
/****** Object:  ForeignKey [FKE58BBFF82B7CDCD3]    Script Date: 03/12/2009 15:45:27 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FKE58BBFF82B7CDCD3]') AND parent_object_id = OBJECT_ID(N'[security_Operations]'))
ALTER TABLE [security_Operations]  WITH CHECK ADD  CONSTRAINT [FKE58BBFF82B7CDCD3] FOREIGN KEY([Parent])
REFERENCES [security_Operations] ([Id])
GO
ALTER TABLE [security_Operations] CHECK CONSTRAINT [FKE58BBFF82B7CDCD3]
GO
/****** Object:  ForeignKey [FKEA223C4C2EE8F612]    Script Date: 03/12/2009 15:45:29 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FKEA223C4C2EE8F612]') AND parent_object_id = OBJECT_ID(N'[security_Permissions]'))
ALTER TABLE [security_Permissions]  WITH CHECK ADD  CONSTRAINT [FKEA223C4C2EE8F612] FOREIGN KEY([UsersGroup])
REFERENCES [security_UsersGroups] ([Id])
GO
ALTER TABLE [security_Permissions] CHECK CONSTRAINT [FKEA223C4C2EE8F612]
GO
/****** Object:  ForeignKey [FKEA223C4C6C8EC3A5]    Script Date: 03/12/2009 15:45:29 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FKEA223C4C6C8EC3A5]') AND parent_object_id = OBJECT_ID(N'[security_Permissions]'))
ALTER TABLE [security_Permissions]  WITH CHECK ADD  CONSTRAINT [FKEA223C4C6C8EC3A5] FOREIGN KEY([EntitiesGroup])
REFERENCES [security_EntitiesGroups] ([Id])
GO
ALTER TABLE [security_Permissions] CHECK CONSTRAINT [FKEA223C4C6C8EC3A5]
GO
/****** Object:  ForeignKey [FKEA223C4C71C937C7]    Script Date: 03/12/2009 15:45:29 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FKEA223C4C71C937C7]') AND parent_object_id = OBJECT_ID(N'[security_Permissions]'))
ALTER TABLE [security_Permissions]  WITH CHECK ADD  CONSTRAINT [FKEA223C4C71C937C7] FOREIGN KEY([Operation])
REFERENCES [security_Operations] ([Id])
GO
ALTER TABLE [security_Permissions] CHECK CONSTRAINT [FKEA223C4C71C937C7]
GO
/****** Object:  ForeignKey [FKEA223C4CFC8C2B95]    Script Date: 03/12/2009 15:45:29 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FKEA223C4CFC8C2B95]') AND parent_object_id = OBJECT_ID(N'[security_Permissions]'))
ALTER TABLE [security_Permissions]  WITH CHECK ADD  CONSTRAINT [FKEA223C4CFC8C2B95] FOREIGN KEY([User])
REFERENCES [Users] ([Id])
GO
ALTER TABLE [security_Permissions] CHECK CONSTRAINT [FKEA223C4CFC8C2B95]
GO
/****** Object:  ForeignKey [FKEC3AF233D0CB87D0]    Script Date: 03/12/2009 15:45:30 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FKEC3AF233D0CB87D0]') AND parent_object_id = OBJECT_ID(N'[security_UsersGroups]'))
ALTER TABLE [security_UsersGroups]  WITH CHECK ADD  CONSTRAINT [FKEC3AF233D0CB87D0] FOREIGN KEY([Parent])
REFERENCES [security_UsersGroups] ([Id])
GO
ALTER TABLE [security_UsersGroups] CHECK CONSTRAINT [FKEC3AF233D0CB87D0]
GO
/****** Object:  ForeignKey [FK69A3B61FA860AB70]    Script Date: 03/12/2009 15:45:30 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK69A3B61FA860AB70]') AND parent_object_id = OBJECT_ID(N'[security_UsersGroupsHierarchy]'))
ALTER TABLE [security_UsersGroupsHierarchy]  WITH CHECK ADD  CONSTRAINT [FK69A3B61FA860AB70] FOREIGN KEY([ChildGroup])
REFERENCES [security_UsersGroups] ([Id])
GO
ALTER TABLE [security_UsersGroupsHierarchy] CHECK CONSTRAINT [FK69A3B61FA860AB70]
GO
/****** Object:  ForeignKey [FK69A3B61FA87BAE50]    Script Date: 03/12/2009 15:45:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK69A3B61FA87BAE50]') AND parent_object_id = OBJECT_ID(N'[security_UsersGroupsHierarchy]'))
ALTER TABLE [security_UsersGroupsHierarchy]  WITH CHECK ADD  CONSTRAINT [FK69A3B61FA87BAE50] FOREIGN KEY([ParentGroup])
REFERENCES [security_UsersGroups] ([Id])
GO
ALTER TABLE [security_UsersGroupsHierarchy] CHECK CONSTRAINT [FK69A3B61FA87BAE50]
GO
/****** Object:  ForeignKey [FK7817F27A1238D4D4]    Script Date: 03/12/2009 15:45:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK7817F27A1238D4D4]') AND parent_object_id = OBJECT_ID(N'[security_UsersToUsersGroups]'))
ALTER TABLE [security_UsersToUsersGroups]  WITH CHECK ADD  CONSTRAINT [FK7817F27A1238D4D4] FOREIGN KEY([GroupId])
REFERENCES [security_UsersGroups] ([Id])
GO
ALTER TABLE [security_UsersToUsersGroups] CHECK CONSTRAINT [FK7817F27A1238D4D4]
GO
/****** Object:  ForeignKey [FK7817F27AA6C99102]    Script Date: 03/12/2009 15:45:31 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK7817F27AA6C99102]') AND parent_object_id = OBJECT_ID(N'[security_UsersToUsersGroups]'))
ALTER TABLE [security_UsersToUsersGroups]  WITH CHECK ADD  CONSTRAINT [FK7817F27AA6C99102] FOREIGN KEY([UserId])
REFERENCES [Users] ([Id])
GO
ALTER TABLE [security_UsersToUsersGroups] CHECK CONSTRAINT [FK7817F27AA6C99102]
GO

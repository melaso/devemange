if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[pt_ClearFileContextErrorRow]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[pt_ClearFileContextErrorRow]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[pt_MaintoByBug]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[pt_MaintoByBug]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[pt_MaintoByDemand]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[pt_MaintoByDemand]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[pt_MaintoByRelease]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[pt_MaintoByRelease]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[pt_MaintoByTask]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[pt_MaintoByTask]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[pt_MaintoByTest]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[pt_MaintoByTest]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[pt_SplitPage]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[pt_SplitPage]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[pt_StatBugProjectTaskCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[pt_StatBugProjectTaskCount]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[pt_StatBugTaskCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[pt_StatBugTaskCount]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[pt_ToDayResult]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[pt_ToDayResult]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[pt_UserDayWork]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[pt_UserDayWork]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

/*
创建: 2008-8-14  mrlong
目的: --检查多余的行
修改：
编号   时间         修改人             修改内容
*/

CREATE PROCEDURE pt_ClearFileContextErrorRow 
@mailtitle int output   --返回=1 succend 
As

declare @filemaxID int
declare @fineContextID int

begin
  select @filemaxID= max(ZID) from TB_FILE_ITEM
  select  @fineContextID=max(ZFILE_ID) from TB_FILE_CONTEXT
 
  if  @fineContextID > @filemaxID  
  begin
     delete  TB_FILE_CONTEXT where ZFILE_ID=@fineContextID
  end

end;
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

/*
创建: 2008-5-21  mrlong
目的: 取出问题的邮件内容
修改：
编号   时间         修改人             修改内容
  1      2009-6-27   龙仕云            .改为多个一起发送 

*/

CREATE   PROCEDURE pt_MaintoByBug 
@BugID int, --BugID号
@mailtitle varchar(200) output, --返回的标题
@mailtext varchar(4000) output --返回的内容
as
declare @TreePath  varchar(200)
declare @Title varchar(200)
declare @Auathor varchar(20)  
declare @BugMaxID int
declare @BugContext varchar(4000)
declare @BugReplay  varchar(20)
declare @Bugdata varchar(20)    --回复时间
begin


--取出标题及作者
declare my_cursor cursor 
for
select a.ZTREEPATH,a.ZTITLE,b.ZNAME from TB_BUG_ITEM as a, TB_USER_ITEM as b where a.ZID=@BugID and
a.ZOPENEDBY=b.ZID

open my_cursor
fetch next from my_cursor into @TreePath,@Title,@Auathor
close   my_cursor  
deallocate my_cursor

--取现回复最大值

--取出回复内容
--格式
set @mailtitle = '(错误管理) ' + @Title
set @mailtext  ='项   目:'  + @TreePath  + char(13) +char(10)  +
                         '标   题:'  + @Title + char(13) + char(10) + 
                         '创建人:' + @Auathor + char(13)+char(10)

declare my_cursor cursor
for
select a.ZCONTEXT,b.ZNAME,convert(varchar(20),a.ZACTIONDATE,120)  as mydate from TB_BUG_HISTORY as a , TB_USER_ITEM as b where a.ZUSER_ID=b.ZID and 
   a.ZBUG_ID=@BugID  order by a.ZID
open my_cursor
	
--取出多个
fetch next from my_cursor into @BugContext,@BugReplay,@Bugdata
while( @@fetch_status = 0)
begin
    set @mailtext = @mailtext +
          '-------------------------------------------------------------------------------------------' + char(13) + char(10)+
           @BugContext + char(13) +char(10)+
             '   回复人:' + @BugReplay  + '  时间:' + @Bugdata  + char(13) +char(10)

      fetch next from my_cursor into @BugContext,@BugReplay,@Bugdata
end
             	
close my_cursor
deallocate my_cursor


--格式
--set @mailtitle = '(错误管理) ' + @Title
set @mailtext  = @mailtext + char(13) + char(10) +
'         此邮件由开发管理系统发出，请勿直接回复！' 


--set @mailtitle = "国家"
--set @mailtext  = "bbbbbbbbbbbbb"

end
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

/*需用管理器的发布邮件*/
/*
创建: 2009-7-4  mrlong
目的: 取出发布管理的邮件内容
修改：
编号   时间         修改人             修改内容
*/

CREATE   PROCEDURE pt_MaintoByDemand
@ZID int, --TestID号
@mailtitle varchar(200) output, --返回的标题
@mailtext varchar(4000) output --返回的内容
as
declare @Title varchar(200)
declare @ProName varchar(200) --项目名称
declare @Auathor varchar(20)  
declare @ReleaseContext varchar(2000) --内容
declare @Status int --状态 0 创建  1 关闭
declare @Customer varchar(200) --客户信息
declare @Remark varchar(200) --备注
declare @StatusName varchar(20) --状态名称
declare @ISReSet bit --需求是否变更了
declare @FileName varchar(100)  --附件名

begin

--取出标题及作者
declare my_cursor cursor 
for
select a.ZNAME,b.ZNAME,a.ZSTATUS,a.ZCONTENT,a.ZCUSTOMER,a.ZREMARK,ZISRESET,
a.ZANNEXFILENAME
 from TB_DEMAND as a, TB_USER_ITEM as b where a.ZID=@ZID and a.ZUSER_ID=b.ZID

open my_cursor
fetch next from my_cursor into @Title,@Auathor,@Status,@ReleaseContext,@Customer,@Remark,@ISReSet,@FileName
close   my_cursor  
deallocate my_cursor



--取出项目名称
declare my_cursor cursor 
for
select b.ZNAME from TB_DEMAND as a, TB_PRO_ITEM as b where a.ZID=@ZID and
a.ZPRO_ID=b.ZID

open my_cursor
fetch next from my_cursor into @ProName
close   my_cursor  
deallocate my_cursor

--发布方向
set @StatusName = ''
if @Status = 0
   set @StatusName = '制单'
if @Status = 1 
   set @StatusName = '接受'
if @Status = 2 
   set @StatusName = '拒绝' 

if @ISReSet = 1 
   set @StatusName = @StatusName  + '  需求已变更了'

--格式
set @mailtitle  = '(需求管理) ' + @Title
set @mailtext  =
'--------------------------------基本信息-------------------------------------------------------' + char(13) + char(10)+
'需求名称:' + @Title + char(13) + char(10)  +
'立项项目:' +  isnull(@ProName,'') + char(13) +char(10) +
'状态: ' + @StatusName + char(13) + char(10) +
@Customer + char(13) + char(10) +
'接受或拒绝因原:' +  @Remark + char(13) + char(10) +
'--------------------------------需求描述-------------------------------------------------------' + char(13) + char(10)+
@ReleaseContext + char(13) +char(10)+ 
'附件:' + @FileName + char(13)+char(10) +
'创建人:' +  @Auathor + char(13) + char(10) +

'此邮件由开发管理系统发出，请勿直接回复！' 


end
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

/*发布管理器的发布邮件*/
/*
创建: 2008-12-20  mrlong
目的: 取出发布管理的邮件内容
修改：
编号   时间         修改人             修改内容
*/

CREATE   PROCEDURE pt_MaintoByRelease
@ReleaseID int, --TestID号
@mailtitle varchar(200) output, --返回的标题
@mailtext varchar(4000) output --返回的内容
as
declare @Title varchar(200)
declare @ProName varchar(200) --项目名称
declare @Auathor varchar(20)  
declare @ReleaseContext varchar(2000) --内容
declare @Status int --状态 0 创建  1 关闭
declare @UrlType int --发布方式 0 网站 , 1 FTP 2 传给他人
declare @Url varchar(200) --发布到哪了
declare @UrlTypeName varchar(30)

begin


--取出标题及作者
declare my_cursor cursor 
for
select a.ZNAME,b.ZNAME,a.ZSTATUS,a.ZPROCONTENT,a.ZURLTYPE,a.ZURL
 from TB_RELEASE_ITEM as a, TB_USER_ITEM as b where a.ZID=@ReleaseID and
a.ZOPENEDBY=b.ZID

open my_cursor
fetch next from my_cursor into @Title,@Auathor,@Status,@ReleaseContext,@UrlType,@Url
close   my_cursor  
deallocate my_cursor

--取出项目名称
declare my_cursor cursor 
for
select b.ZNAME from TB_RELEASE_ITEM as a, TB_PRO_ITEM as b where a.ZID=@ReleaseID and
a.ZPRO_ID=b.ZID

open my_cursor
fetch next from my_cursor into @ProName
close   my_cursor  
deallocate my_cursor

--发布方向
if @UrlType = 0
   set @UrlTypeName = '公司网站'
if @UrlType = 1 
   set @UrlTypeName = '公司FTP'
if @UrlType = 2 
   set @UrlTypeName = '传给他人' 
if @UrlType = 3 
   set @UrlTypeName = '公司QQ群共享'

--内容
if @Status =0
begin
 set @ReleaseContext  = '等待发布，内容已修改完毕已提交到发布管理。'  + char(13)+char(10)  +
   '发布方向：' +  @UrlTypeName + char(13) + char(10) + 
   '发布路径：' +  @Url + char(13) + char(10) + 
   '-------------------------------------------------------------------------------------------------' + char(13) + char(10) 
   +@ReleaseContext
end

if @Status =1
begin
 set @ReleaseContext  = '项目已布。' +  char(13)+char(10)+
   '发布方向：' +  @UrlTypeName + char(13) + char(10) + 
   '发布路径：' +  @Url + char(13) + char(10) + 
    '-------------------------------------------------------------------------------------------------' + char(13) + char(10) 
  + @ReleaseContext
end



--格式
set @mailtitle = '(发布管理) ' + @Title
set @mailtext  = @ProName + char(13) +char(10)+
'-------------------------------------------------------------------------------------------' + char(13) + char(10)+
@ReleaseContext + char(13) +char(10)+char(13)+char(10) +
'创建人:' +  @Auathor + char(13) + char(10) +
'此邮件由开发管理系统发出，请勿直接回复！' 



end
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


/*
创建: 2008-6-28  作者:龙仕云
目的: 准备任务单的邮件内容
修改：
编号   时间         修改人             修改内容
 1     2008-8-4    龙仕云      增加审核人的邮件发送

*/

CREATE    PROCEDURE pt_MaintoByTask
@TaskCode  varchar(30), --任务号,是唯一号
@mailtitle varchar(200) output,   --返回的标题
@mailtext varchar(4000) output, --返回的内容
@mailto   varchar(1000) output --返回的发送邮件的人,多个采用;分开

as
declare @ProName  varchar(200) --项目的名称
declare @Prover varchar(50) --项目的版本号
declare @Title varchar(200)
declare @Auathor varchar(20)   --创建任务的人
declare @TaskContext varchar(4000) --任务的内容
declare @TaskStatus varchar(20) --任务单状态
declare @myMail varchar(50)
declare @CheckMail varchar(50) --审核人的邮箱


begin


--取出标题及作者
declare my_cursor cursor 
for
select  a.ZName as TaskName,b.ZNAME as UserName,c.ZNAME as ProName , d.ZVER , e.ZName as STATUS ,a.ZDESIGN ,b.ZEMAIL,f.ZEMAIL as CheckMail  
from TB_TASK as a
left join  TB_USER_ITEM as b  on a.ZUSER_ID=b.ZID 
left join  TB_PRO_ITEM   as c  on a.ZPRO_ID=c.ZID
left join  TB_PRO_VERSION as d on d.ZID=a.ZPRO_VERSION_ID
left join  TB_TASK_PARAMS as e on e.ZTYPE=1 and e.ZID=a.ZSTATUS 
left join  TB_USER_ITEM as f on a.ZCHECKNAME=f.ZID
where a.ZCODE=@TaskCode 

open my_cursor
fetch next from my_cursor into @mailtitle,@Auathor,@ProName,@Prover,@TaskStatus,@TaskContext,@mailto,@CheckMail
close   my_cursor  
deallocate my_cursor

set @mailto =isnull(@mailto,'')+';' + isnull(@CheckMail,'')

--取出任务的执行人,注意取消执行人
declare my_cursor cursor
for
select b.ZEMAIL  from TB_TASK_USER as a
left join TB_USER_ITEM as b on a.ZUSER_ID=b.ZID
where a.ZTASK_CODE=@TaskCode and a.ZCANCEL=1 

open my_cursor
fetch next from my_cursor into @myMail
while( @@fetch_status = 0)
begin
  --print @myMail
  set @mailto =isnull(@mailto,'')+';'+@myMail
  fetch next from my_cursor into @myMail
end

close   my_cursor  
deallocate my_cursor

--格式

set @mailtext  = '项目:' + @ProName + '  版本:' + @Prover + char(13) + char(10) + 
'任务:' + @mailtitle  + char(13) +char(10)+
'状态:' + @TaskStatus + char(13)+char(10)+
'-------------------------------------------------------------------------------------------' + char(13) + char(10)+
@TaskContext + char(13) +char(10)+char(13)+char(10)+
'任务创建人:' +  @Auathor  +  char(13) +char(10)+char(13)+char(10)+
'此邮件由开发管理系统发出，请勿直接回复！' 


set @mailtitle =  '【' + @TaskStatus+' 】'+ @mailtitle


end
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



/*测试管理器的发布邮件*/
/*
创建: 2008-10-6  mrlong
目的: 取出测试的邮件内容
修改：
编号   时间         修改人             修改内容
*/

CREATE   PROCEDURE pt_MaintoByTest
@TestID int, --TestID号
@mailtitle varchar(200) output, --返回的标题
@mailtext varchar(4000) output --返回的内容
as
declare @Title varchar(200)
declare @ProName varchar(200) --项目名称
declare @Auathor varchar(20)  
declare @TestContext varchar(2000) --内容
declare @Status int --状态 1 完成 2 激活 3 关闭 4提交测试

begin


--取出标题及作者
declare my_cursor cursor 
for
select a.ZNAME,b.ZNAME,a.ZSTATUS  from TB_TEST_ITEM as a, TB_USER_ITEM as b where a.ZID=@TestID and
a.ZOPENEDBY=b.ZID

open my_cursor
fetch next from my_cursor into @Title,@Auathor,@Status
close   my_cursor  
deallocate my_cursor

--取出项目名称与版本号
declare my_cursor cursor 
for
select b.ZNAME from TB_TEST_ITEM as a, TB_PRO_ITEM as b where a.ZID=@TestID and
a.ZPRO_ID=b.ZID

open my_cursor
fetch next from my_cursor into @ProName
close   my_cursor  
deallocate my_cursor

--内容
if @Status =2
begin
 set @TestContext  = '测试被激活'
end

if @Status =3
begin
 set @TestContext  = '测试关闭'
end

if @Status =4
begin
 set @TestContext  = '提交测试'
end



--格式
set @mailtitle = '(测试管理) ' + @Title
set @mailtext  = @ProName + char(13) +char(10)+
'-------------------------------------------------------------------------------------------' + char(13) + char(10)+
@TestContext + char(13) +char(10)+char(13)+char(10) +
'此邮件由开发管理系统发出，请勿直接回复！' +
'创建人:' +  @Auathor 


end
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/**********************************************************
 *
 * 创建存储过程
 *
 * 作者: 龙仕云 时间: 2007-11-22
 *
 *
 *********************************************************/


/*分页通用处理*/
CREATE PROCEDURE pt_SplitPage 
	@tblName      varchar(255),            -- 表名
	@strGetFields varchar(1000) = '*',     -- 需要返回的列 
	@fldName      varchar(255)='',         -- 排序的字段名
	@PageSize     int = 20,                -- 页尺寸
	@PageIndex    int = 1,                 -- 页码
	@doCount      bit = 0,                 -- 返回记录总数, 非 0 值则返回
	@OrderType    bit = 0,                 -- 设置排序类型, 非 0 值则降序
	@strWhere     varchar(1500) = ''       -- 查询条件 (注意: 不要加 where)
AS

declare @strSQL   varchar(5000)       -- 主语句
declare @strTmp   varchar(110)        -- 临时变量
declare @strOrder varchar(400)        -- 排序类型

if @doCount != 0
begin
	if @strWhere !=''
		set @strSQL = 'select count(*) as Total from [' + @tblName + '] where '+@strWhere
	else
		set @strSQL = 'select count(*) as Total from [' + @tblName + ']'
end  

--以上代码的意思是如果@doCount传递过来的不是0，就执行总数统计。以下的所有代码都是@doCount为0的情况

else begin

if @fldName !=''
begin
	if @OrderType != 0  --如果@OrderType不是0，就执行降序，这句很重要！
	begin
		set @strTmp = '<(select min'
		set @strOrder = ' order by [' + @fldName +'] desc'
	end
	else begin
		set @strTmp = '>(select max'
    		set @strOrder = ' order by [' + @fldName +'] asc'
	end
end
else begin
	set @strTmp = ''
	set @strOrder = ''
end

--如果是第一页就执行以上代码，这样会加快执行速度
if @PageIndex = 1
begin
	if @strWhere != ''   
		set @strSQL = 'select top ' + str(@PageSize) +' '+@strGetFields+ '  from [' + @tblName 
                               + '] where ' + @strWhere + ' ' + @strOrder
     	else
     		set @strSQL = 'select top ' + str(@PageSize) +' '+@strGetFields+ '  from ['+ @tblName 
                               + '] '+ @strOrder

end
else begin
--以下代码赋予了@strSQL以真正执行的SQL代码
	set @strSQL = 'select top ' + str(@PageSize) +' '+@strGetFields+ '  from ['
		+ @tblName + '] where [' + @fldName + ']' + @strTmp + '(['+ @fldName + ']) from (select top ' 
                + str((@PageIndex-1)*@PageSize) + ' ['+ @fldName + '] from [' + @tblName + ']' + @strOrder + ') as tblTmp)'+ @strOrder

	if @strWhere != ''
    		set @strSQL = 'select top ' + str(@PageSize) +' '+@strGetFields+ '  from ['
	        + @tblName + '] where [' + @fldName + ']' + @strTmp + '(['
	        + @fldName + ']) from (select top ' + str((@PageIndex-1)*@PageSize) + ' ['
	        + @fldName + '] from [' + @tblName + '] where ' + @strWhere + ' '
	        + @strOrder + ') as tblTmp) and ' + @strWhere + ' ' + @strOrder
	end 
end   
exec (@strSQL)
--print @strSQL


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

/*
创建: 2008-7-11  作者:龙仕云
目的: 统计项目的处理情况
修改：
编号   时间         修改人             修改内容

*/

CREATE    PROCEDURE pt_StatBugProjectTaskCount
@StatbeginDate datetime,
@StatendDate datetime

as

declare @myProName varchar(200)
declare @myPro_ID int --treeid
declare @myPROID int --priid 
declare @c1 int
declare @c2 int
declare @c3 int
declare @c4 int
declare @c5 int
declare @c6 int
declare @c7 int


set @c1=0
set @c2=0
set @c3=0
set @c4=0
set @c5=0
set @c6=0
set @c7=0

--建表
if exists(select 1 from sysobjects where id=object_id('temp_prostat')and type = 'u')
  drop table temp_prostat
  
create table temp_prostat
  (
  ZPRONAME varchar(200) ,  --项目名称
  ZSubmitBugCount  int,  --提交的问题数 c1
  ZAnswerBugCount int , --处理问题数 c2
  ZNoAnswerBugCount int,  --没有处理的问题数 c3
  ZActionBugCount int, --c4


  ZSubmitTestCount int ,   --提交多少个测试用例 c5
  ZAnswerTestCount int , --关闭测试用例 c6
  ZNoAnserTestCount int  --没有处理数 c7

)



--先按表进行遍历
declare my_cursor cursor
for
select a.ZNAME,a.ZID,a.ZPRO_ID  from TB_BUG_TREE as a order by a.ZSORT --a.ZID

open my_cursor
fetch next from my_cursor into @myProName,@myPro_ID,@myPROID
while( @@fetch_status = 0)
begin
 
-----------------------------------bug----------------------------------------

        
   /*创建问题*/
  select @c1= count(a.ZID)   from TB_BUG_ITEM as a   
  where  a.ZTREE_ID=@myPro_ID and
             (a.ZOPENEDDATE between  @StatbeginDate and  @StatendDate)

  /*解决问题*/
  select @c2= count(a.ZID)   from TB_BUG_ITEM as a 
  where  a.ZTREE_ID=@myPro_ID and a.ZSTATUS=1 and  --1表示修改完成
              (a.ZRESOLVEDDATE between  @StatbeginDate and  @StatendDate)

  
  /*没有和理问题数*/
  select @c3= count(a.ZID)   from TB_BUG_ITEM as a 
  where  a.ZTREE_ID=@myPro_ID and a.ZSTATUS<>1 and  
              (a.ZOPENEDDATE between  @StatbeginDate and  @StatendDate)


  select @c4= count(a.ZID)   from TB_BUG_ITEM as a 
  where  a.ZTREE_ID=@myPro_ID and a.ZSTATUS<>1 
  
------------------------------测试用例-------------------------

 /*创建用例*/
  select @c5= count(a.ZID)   from TB_TEST_ITEM as a   
  where  a.ZPRO_ID=@myPROID and
             (a.ZOPENEDDATE between  @StatbeginDate and  @StatendDate)

  /*解决用例*/
  select @c6= count(a.ZID)   from TB_TEST_ITEM as a 
  where  a.ZPRO_ID=@myPROID and a.ZSTATUS=3 and  --3表示关闭
              (a.ZRESULTDATE between  @StatbeginDate and  @StatendDate)

  
  /*没有和理测试数*/
  select @c7= count(a.ZID)   from TB_TEST_ITEM as a 
  where  a.ZPRO_ID=@myPROID and a.ZSTATUS<>3 and  
              (a.ZOPENEDDATE between  @StatbeginDate and  @StatendDate)
	
  insert into temp_prostat(
      ZPRONAME ,
      ZSubmitBugCount,
      ZAnswerBugCount,
      ZNoAnswerBugCount ,
      ZActionBugCount,


     ZSubmitTestCount  ,   --提交多少个测试用例 c5
    ZAnswerTestCount  , --关闭测试用例 c6
    ZNoAnserTestCount   --没有处理数 c7

     ) 
  values(
       @myProName,
       @c1,
       @c2,
       @c3,
       @c4 ,

       @c5,
       @c6,
       @c7); 

  fetch next from my_cursor into @myProName, @myPro_ID,@myPROID
end

close   my_cursor  
deallocate my_cursor

select 
      ZPRONAME ,
      ZSubmitBugCount,
      ZAnswerBugCount,
      ZNoAnswerBugCount ,
      ZActionBugCount  as '累计没有处理问题数'  ,

     ZSubmitTestCount  as '提交测试用例数',
     ZAnswerTestCount as '关闭测试用例数',
    ZNoAnserTestCount as  '没有关闭测试用例数'
from temp_prostat
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



/*
创建: 2008-6-28  作者:龙仕云
目的: 统计
修改：
编号   时间         修改人             修改内容
 1    2008-12-31  龙仕云     去掉问题的分值,目前统计的是测试用例分值+任务分值
 2    2009-10-3    龙仕云     增加svn提交的数
 3    2009-12-13  龙仕云   增加删除，修改，增加的svn文件提交数,去掉总得分
 4    2011-10-19  龙仕云   增加bug得分

*/

CREATE    PROCEDURE pt_StatBugTaskCount
@StatbeginDate datetime,
@StatendDate datetime

as

declare @myUserName varchar(20)
declare @myUser_ID int
declare @myUser_Type int --人员的类型 0=Admin  1=开发人员 2=测试人员,3=其他人员
declare @mySvnName varchar(20)  --svn的账号

declare @c1 int
declare @c2 int
declare @c3 int
declare @c4 int
declare @c5 int
declare @c6 int
declare @c7 int
declare @c8 int  --创建测试用例数
declare @c9 int  --解决测试用例数
declare @c10 int 
declare @c11 int
declare @c12 int --svn提交总数
declare @c13 int --svn的文件修改数
declare @c14 int --svn的文件删除数
declare @c15 int --svn的文件增加数
declare @c16 float --bug的得分


set @c1=0
set @c2=0
set @c3=0
set @c4=0
set @c5=0
set @c6=0
set @c7=0
set @c8=0
set @c9=0
set @c10=0
set @c11=0
set @c12=0
set @c13=0;
set @c14=0;
set @c15=0;
set @c16=0;

--建表
if exists(select 1 from sysobjects where id=object_id('temp_stat')and type = 'u')
  drop table temp_stat
  
create table temp_stat
  (
  ZUSERNAME varchar(20) ,
  ZAnswerBugCount int , --处理问题数 c1
  ZSubmitBugCount  int, --提交的问题数 c2
  ZReplyBugCount int,    --回复问题数 c3
  ZReActionBug int,       --问题被激活数 c4
  ZBugFraction int,          --问题分数
  ZbugSorce float, --bug c16

  ZTaskCount int,            --完成的任务数
  ZTaskFraction int,         --任务分数
  ZWorkOverTime int,    --加班分钟 C11
  ZSvnSubimtCount int, --svn接交总数
  ZSvnSubimt_M_Count int, --svn修改总数 -c13
  ZSvnSubimt_D_Count int, --svn删除总数 -c14
  ZSvnSubimt_A_Count int, --svn增加总数 -c15
   

  ZBuildTestCount  int,  --C8
  ZAnswerTestCount int , --C9
  ZSOCRE int  --C10 

  --ZTotal int                       --总分
)



--先按人员表进行遍历
declare my_cursor cursor
for
select a.ZNAME,a.ZID,a.ZTYPE,a.ZSVNNAME  from TB_USER_ITEM as a
where a.ZSTOP=0

open my_cursor
fetch next from my_cursor into @myUserName,@myUser_ID,@myUser_Type,@mySvnName
while( @@fetch_status = 0)
begin
 
-- 0=Admin  1=开发人员 2=测试人员,3=其他人员
-----------------------------------bug----------------------------------------

  /*解决问题*/
  select @c1= count(a.ZID)   from TB_BUG_ITEM as a 
  where  a.ZRESOLVEDBY=@myUser_ID and a.ZSTATUS=1 and  --1表示修改完成
              (a.ZRESOLVEDDATE between  @StatbeginDate and  @StatendDate)
         
   /*创建问题*/
  select @c2= count(a.ZID)   from TB_BUG_ITEM as a   
  where  a.ZOPENEDBY=@myUser_ID and
             (a.ZOPENEDDATE between  @StatbeginDate and  @StatendDate)
  
  /*回复问题*/
  select @c3= count(a.ZID)   from TB_BUG_HISTORY as a 
  where  a.ZUSER_ID=@myUser_ID and ( ZSTATUS=0)  and --0表示活动的
    (a.ZACTIONDATE between @StatbeginDate and  @StatendDate )
 
   /*被激活数*/
  select @c4=count(a.ZID) from  TB_BUG_ITEM as a 
  where  a.ZSTATUS=2 and (a.ZOVERFRACTION=1) and   --  ZOVERFRACTION =1表示已记分
  exists(select * from TB_BUG_HISTORY as b where b.ZSTATUS=2 and b.ZBUG_ID=a.ZID 
          and b.ZUSER_ID= @myUser_ID
           and b.ZACTIONDATE between @StatbeginDate and  @StatendDate)

  /*计算分数（个数）*/  
  select @c5= count(a.ZID)   from TB_BUG_ITEM as a 
  where  a.ZRESOLVEDBY=@myUser_ID and a.ZSTATUS=1 and  --1表示修改完成
             (a.ZOVERFRACTION=0) and
              (a.ZRESOLVEDDATE between  @StatbeginDate and  @StatendDate)

 /*计算得分*/
  select @c16= sum(a.ZWORKSCORE)   from TB_BUG_ITEM as a 
  where  a.ZRESOLVEDBY=@myUser_ID and a.ZSTATUS=1 and  --1表示修改完成
             (a.ZVERIFYED=1) and   --审核过的
             (a.ZOVERFRACTION=0) and
              (a.ZRESOLVEDDATE between  @StatbeginDate and  @StatendDate)
 
-------------------------------Task--------------------------------------------
  /*计算任务单个数*/
 select @c6=count(a.ZTASK_CODE) from  TB_TASK_USER as a
 where (a.ZUSER_ID=@myUser_ID)  and
  ( a.ZSCOREDATE between @StatbeginDate and  @StatendDate)

  /*任务得分*/
   select @c7=sum(a.ZSCORE) from  TB_TASK_USER as a , TB_TASK as b
 where (a.ZUSER_ID=@myUser_ID)  and (a.ZTASK_CODE=b.ZCODE) and (b.ZSTATUS=4) and
  ( a.ZSCOREDATE between @StatbeginDate and  @StatendDate)

----------------------------Test--------------------------------------------------
  /*创建测试用例数*/
   select @c8= count(a.ZID)   from TB_TEST_ITEM as a 
   where  a.ZOPENEDBY=@myUser_ID and
              (a.ZOPENEDDATE between  @StatbeginDate and  @StatendDate)

 /*解决测试用例数*/
    select @c9= count(a.ZID)   from TB_TEST_ITEM as a 
    where  a.ZTESTRESULTBY=@myUser_ID and
              (a.ZSTATUS = 3) and --3=关闭
              (a.ZRESULTDATE between  @StatbeginDate and  @StatendDate)

/*测试用例得分*/
   if (@myUser_Type =1) or (@myUser_Type=0)
   begin
      select @c10= sum(a.ZCLOSESOCRE)   from TB_TEST_ITEM as a 
       where  a.ZSUBMISBY=@myUser_ID and  --开发人员改为提交的用例
              (a.ZSTATUS = 3) and --3=关闭
              (a.ZRESULTDATE between  @StatbeginDate and  @StatendDate)
   end
   else begin
      select @c10 = @c9
   end

/*加班分钟*/
 select @c11= sum(a.ZMINUTE*a.ZRATE)   from TB_WORKOVERTIME as a 
       where  a.ZUSER_ID=@myUser_ID and  --开发人员改为提交的用例
              (a.ZSTATUS = 1) and --1=关闭
              (a.ZDATETIME between  @StatbeginDate and  @StatendDate)

/* Svn接交总数*/
  set @c12=0;
  select @c12=count(*) from dbo.TB_SVN_COMMITS as a  where  (a.ZAUTHOR = @mySvnName)
      and (a.ZDATE between @StatbeginDate and @StatendDate)  --group by  a.ZSVN_GUID

/*svn的文件修改，增加，删除数 */
  set @c13=0; set @c14=0; set @c15=0;


  select @c13=count(*) from dbo.TB_SVN_COMMITS as a , dbo.TB_SVN_CHANGES as b 
  where 
     (b.ZACTION='M') and
     (a.ZSVN_GUID=b.ZSVN_GUID) and (a.ZVERSION=b.ZVERSION) and 
     (a.ZAUTHOR = @mySvnName)  and 
     (a.ZDATE between @StatbeginDate and @StatendDate) 
 
   select @c14=count(*) from dbo.TB_SVN_COMMITS as a , dbo.TB_SVN_CHANGES as b 
   where 
     (b.ZACTION='D') and
     (a.ZSVN_GUID=b.ZSVN_GUID) and (a.ZVERSION=b.ZVERSION) and 
     (a.ZAUTHOR = @mySvnName)  and 
     (a.ZDATE between @StatbeginDate and @StatendDate) 

   select @c15=count(*) from dbo.TB_SVN_COMMITS as a , dbo.TB_SVN_CHANGES as b 
   where 
     (b.ZACTION='A') and
     (a.ZSVN_GUID=b.ZSVN_GUID) and (a.ZVERSION=b.ZVERSION) and 
     (a.ZAUTHOR = @mySvnName)  and 
     (a.ZDATE between @StatbeginDate and @StatendDate) 

  	
  insert into temp_stat(
       ZUSERNAME,
       ZAnswerBugCount,
       ZSubmitBugCount,
        ZReplyBugCount,
       ZReActionBug,
       ZBugFraction,
      ZbugSorce,

      ZTaskCount,
      ZTaskFraction,
     ZWorkOverTime,
     ZSvnSubimtCount,
     ZSvnSubimt_M_Count,
     ZSvnSubimt_D_Count,
     ZSvnSubimt_A_Count,

     ZBuildTestCount  ,  
     ZAnswerTestCount  , 
     ZSOCRE

  --    ZTotal
     ) 
  values(
       @myUserName,
        @c1,
       @c2,
        @c3,
       @c4,
       @c5,
      @c16,
 
       @c6,
       @c7,
       @c11,
      @c12,
     @c13,
    @c14,
   @c15,

       @c8,
       @c9,
       @c10

--       isnull(@c7,0)+isnull(@c10,0) 

);   --isnull(@c5,0)+ 问题分是不加的
 
  fetch next from my_cursor into @myUserName, @myUser_ID,@myUser_Type,@mySvnName
end

close   my_cursor  
deallocate my_cursor

select * from temp_stat
GO

 
/******************************************************************************
创建: 2009-11-8  作者:龙仕云
目的: 今日贡献力量
修改：
编号   时间         修改人             修改内容
  1    2009-1-15   龙仕云   增加创建时间

参数:
   USERID ,USERTYPE ,  ToDay 
   当前用户  类型              今日
 
开发人员 0 , 1  

返回: 表

********************************************************************************/

CREATE    PROCEDURE pt_ToDayResult
@USERID int,
@TYPE int,  -- =0 表示全部 =1 表示指定用户
@ToDay datetime

as

declare @myTYPE int
declare @myID int
declare @mycontent varchar(200)
declare @mynote varchar(1000)
declare @myaction int
declare @myopenuserid int
declare @mycloseuserid int

declare @svncode varchar(50) ---svn的账号
declare @myauthor varchar(50)
declare @myusrid int 
declare @myusertype int --用户类型 0, 1 为开发人员


--建表
if exists(select 1 from sysobjects where id=object_id('temp_usr_todayresult')and type = 'u')
  drop table temp_usr_todayresult
  
create table temp_usr_todayresult
  (
  ZTYPE int , --= 类型 0=测试用例 1=bug 2=svn 3=报功 4=举报
  ZCONTENTID int , --内容id
  ZCONTENT varchar(200),  --内容标题
  ZNOTE text,  --备注
  ZACTION int, --0 表示是激活的 1=另外加分的
  ZOPEN_USER_ID int, ---创建的账号
  ZCLOSE_USER_ID int, --关闭的账号
)

--取出svn账号
select @svncode=isnull(ZSVNNAME,'') , @myusertype=ZTYPE from TB_USER_ITEM where ZID=@USERID


-------------------------------------我创建Bug-----------------------------------------------------------------------------------------------------------------------------
declare my_cursor cursor
for 
select   ZID,ZTITLE,ZOPENEDBY,ZRESOLVEDBY from TB_BUG_ITEM 
where ( (ZOPENEDBY=@USERID) or (@TYPE=0)) and (DateDiff(day,ZOPENEDDATE,@today)=0) order by ZID

open my_cursor
fetch next from my_cursor into  @myID,@mycontent,@myopenuserid,@mycloseuserid

while( @@fetch_status = 0)
begin
    insert into   temp_usr_todayresult
      (ZTYPE,ZCONTENTID,  ZCONTENT,  ZNOTE,   ZACTION,ZOPEN_USER_ID,ZCLOSE_USER_ID)
      values  (1, @myID,   @mycontent, '',1,@myopenuserid,@mycloseuserid)
  
  fetch next from my_cursor into @myID,@mycontent,@myopenuserid,@mycloseuserid
end

close   my_cursor  
deallocate my_cursor


-------------------------------------我解决的Bug-----------------------------------------------------------------------------------------------------------------------------
declare my_cursor cursor
for 
select   ZID,ZTITLE,ZOPENEDBY,ZRESOLVEDBY from TB_BUG_ITEM 
where (  (ZRESOLVEDBY=@USERID) or (@TYPE=0)) and (DateDiff(day,ZRESOLVEDDATE,@today)=0) order by ZID

open my_cursor
fetch next from my_cursor into  @myID,@mycontent,@myopenuserid,@mycloseuserid

while( @@fetch_status = 0)
begin
    insert into   temp_usr_todayresult
      (ZTYPE,ZCONTENTID,  ZCONTENT,  ZNOTE,   ZACTION,ZOPEN_USER_ID,ZCLOSE_USER_ID)
      values  (1, @myID,   @mycontent, '',1,@myopenuserid,@mycloseuserid)
  
  fetch next from my_cursor into @myID,@mycontent,@myopenuserid,@mycloseuserid
end

close   my_cursor  
deallocate my_cursor


---------------------------------我创建的用例或我关闭的测试用例----------------------------------------------------------------------------------------------------------------------------
declare my_cursor cursor
for 
select  ZID,ZNAME,ZOPENEDBY,ZTESTRESULTBY  from TB_TEST_ITEM 
where  (( ZOPENEDBY=@USERID) or (ZTESTRESULTBY=@USERID) or (@TYPE=0)) and (DateDiff(day,ZOPENEDDATE,@today)=0)  order by ZID

open my_cursor
fetch next from my_cursor into  @myID,@mycontent,@myopenuserid,@mycloseuserid

while( @@fetch_status = 0)
begin
   insert into   temp_usr_todayresult
  (ZTYPE,ZCONTENTID,  ZCONTENT,  ZNOTE,   ZACTION,ZOPEN_USER_ID,ZCLOSE_USER_ID)
  values  (0,@myID,   @mycontent, '',1,@myopenuserid,@mycloseuserid)
  
  fetch next from my_cursor into @myID,@mycontent,@myopenuserid,@mycloseuserid
end

close   my_cursor  
deallocate my_cursor


-------------------------------------我提交的Svn-----------------------------------------------------------------------------------------------------------------------------
declare my_cursor cursor
for 
select   ZID,ZMESSAGE,ZAUTHOR  from TB_SVN_COMMITS 
where  ((ZAUTHOR=@svncode) or (@TYPE=0)) and (DateDiff(day,ZDATE,@today)=0) order by ZID

open my_cursor
fetch next from my_cursor into  @myID,@mycontent,@myauthor

while( @@fetch_status = 0)
begin
   if @TYPE= 0  --是全部时
  begin
      select @myusrid =isnull(ZID,-1) from TB_USER_ITEM where ZSVNNAME=@myauthor
      insert into   temp_usr_todayresult
       (ZTYPE,ZCONTENTID,  ZCONTENT,  ZNOTE,   ZACTION,ZOPEN_USER_ID,ZCLOSE_USER_ID)
       values  (2, @myID,   @mycontent, '',1,@myusrid,@myusrid)
  end
  else begin  --指定用户时
      insert into   temp_usr_todayresult
       (ZTYPE,ZCONTENTID,  ZCONTENT,  ZNOTE,   ZACTION,ZOPEN_USER_ID,ZCLOSE_USER_ID)
       values  (2, @myID,   @mycontent, '',1,@USERID,@USERID)
  end
  
  fetch next from my_cursor into @myID,@mycontent,@myauthor
end

close   my_cursor  
deallocate my_cursor


-----------------------------other-------------------------------------------------------------

select * from temp_usr_todayresult
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

/******************************************************************************
创建: 2008-12-20  作者:龙仕云
目的: 工作台, 
修改：
编号   时间         修改人             修改内容
  1    2009-1-15   龙仕云   增加创建时间
  2    2009-2-1     龙仕云   增加状态
  3.   2009-2-9     龙仕云   要我测试的用例，增加了只有提交测试才显示.
参数:
   USERID ,USERTYPE , 

返回: 表

********************************************************************************/

CREATE    PROCEDURE pt_UserDayWork
@USERID int,
@USERTYPE int

as

declare @RowName varchar(255)
declare @RowType int
declare @RowContentID int --内容id 用于关联
declare @RowState int --是否已关闭了
declare @RowTagName varchar(100)
declare @RowClose int
declare @RowDate datetime --创建时间 
declare @myc int
declare @myid int
declare @myStatus int

set @RowState = 0


--建表
if exists(select 1 from sysobjects where id=object_id('temp_usr_daywork')and type = 'u')
  drop table temp_usr_daywork
  
create table temp_usr_daywork
  (
  ZROWID int,      --序号
  ZROWPART bit , --=True 为分部行
  ZROWNAME varchar(255), --名称,可能是bug，测试用例的名称
  ZROWTYPE int , --行类型 0 bug 1 cbug  2 test   3 ctest   4 plan  5 Release 6 CRelease 7 other
  ZROWLEVE int , --等级  	
  ZCONTENTID int,  --内容ID,如是bug则是bug的id    
  ZCLOSE bit , --是否已关闭的了
  ZTAGNAME varchar(100), --标签
  ZBUILDDATE datetime,  --创建时间
  ZSTATUS int , --状态
)

set @myc = 1

-------------------------------------指派给我的bug(0)-----------------------------------------------------------------------------------------------------------------------------
set @RowType = 0
 insert into   temp_usr_daywork
  (ZROWPART,  ZROWNAME,  ZROWTYPE)
  values  ( 1,  '指派给我的BUG',  @RowType)
set @myc = @myc+1
set @myid = 0
declare my_cursor cursor
for 
select top 10  ZTITLE,ZID,ZTAGNAME,ZOPENEDDATE,ZSTATUS  from TB_BUG_ITEM 
where ( ZSTATUS<>1) and ZASSIGNEDTO=@USERID order by ZOPENEDDATE desc , ZTERM

open my_cursor
fetch next from my_cursor into  @RowName,@RowContentID,@RowTagName,@RowDate,@myStatus

while( @@fetch_status = 0)
begin
  set @myid = @myid+1
   insert into   temp_usr_daywork
  (ZROWID,ZROWPART,  ZROWNAME,  ZROWTYPE,   ZROWLEVE, ZCONTENTID,ZCLOSE,ZTAGNAME,ZBUILDDATE,
	ZSTATUS)
  values  ( @myid,  0,   @RowName,  @RowType,@myc,@RowContentID,0,ltrim(rtrim(@RowTagName)),@RowDate,
     @myStatus)
  set @myc =  @myc+1

  fetch next from my_cursor into @RowName,@RowContentID,@RowTagName,@RowDate,@myStatus
end


if @myid = 0 
  delete  from temp_usr_daywork where  ZROWTYPE=@RowType

close   my_cursor  
deallocate my_cursor

---------------------------------由我创建的bug(1)----------------------------------------------------------------
set @RowType = 1
 insert into   temp_usr_daywork
  (ZROWPART,  ZROWNAME,  ZROWTYPE)
  values  ( 1,  '由我创建的BUG',  @RowType)
set @myc = @myc+1
set @myid = 0

declare my_cursor cursor
for 
select top 10  ZTITLE,ZID,ZSTATUS,ZTAGNAME,ZOPENEDDATE  from TB_BUG_ITEM 
where  ZOPENEDBY=@USERID order by ZOPENEDDATE desc , ZTERM

open my_cursor
fetch next from my_cursor into  @RowName,@RowContentID,@RowState,@RowTagName,@RowDate

while( @@fetch_status = 0)
begin
  set @myid = @myid+1
  print @RowState 
  if @RowState = 1 
     set @RowClose = 1
  else
    set  @RowClose = 0
  insert into   temp_usr_daywork
  (ZROWID,ZROWPART,  ZROWNAME,  ZROWTYPE,   ZROWLEVE, ZCONTENTID,ZCLOSE,ZTAGNAME,ZBUILDDATE,
	ZSTATUS)
  values  ( @myid,  0,   @RowName,  @RowType,@myc,@RowContentID,@RowClose,ltrim(rtrim(@RowTagName)),@RowDate,
	@RowState)
  set @myc =  @myc+1

  fetch next from my_cursor into @RowName,@RowContentID,@RowState,@RowTagName,@RowDate
end

if @myid = 0 
  delete  from temp_usr_daywork where  ZROWTYPE=@RowType

close   my_cursor  
deallocate my_cursor


--------------------------------------------我要测试的用例test(2)-------------------------------------------------------------------------------------------------------------------------------------
set @RowType = 2
 insert into   temp_usr_daywork
  (ZROWPART,  ZROWNAME,  ZROWTYPE)
  values  ( 1,  '要我测试的用例',  @RowType)
set @myc = @myc+1
set @myid = 0
declare my_cursor cursor
for 
select top 10  ZNAME,ZID,ZTAGNAME,ZOPENEDDATE  from TB_TEST_ITEM 
where (( ZSTATUS<>3)  or  ( ZSTATUS=4))  and  ZASSIGNEDTO=@USERID order by ZOPENEDDATE desc

open my_cursor
fetch next from my_cursor into  @RowName,@RowContentID,@RowTagName,@Rowdate

while( @@fetch_status = 0)
begin
 set @myid = @myid + 1
  insert into   temp_usr_daywork
  (ZROWID,ZROWPART,  ZROWNAME,  ZROWTYPE,   ZROWLEVE, ZCONTENTID,ZTAGNAME,ZBUILDDATE,
	ZSTATUS)
  values  ( @myid,  0,   @RowName,  @RowType,@myc,@RowContentID,ltrim(rtrim(@RowTagName)),@RowDate,
	3)
  set @myc = @myc+1
  
  fetch next from my_cursor into @RowName,@RowContentID,@RowTagName,@Rowdate
end

if @myid = 0 
  delete  from temp_usr_daywork where  ZROWTYPE=@RowType

close   my_cursor  
deallocate my_cursor



--------------------------------------------我创建测试的用例(3)------------------------------------------------------------------------------------------------------------------------------------
set @RowType = 3
 insert into   temp_usr_daywork
  (ZROWPART,  ZROWNAME,  ZROWTYPE)
  values  ( 1,  '由我创建测试用例',  @RowType)
set @myc = @myc+1
set @myid = 0
declare my_cursor cursor
for 
select top 10  ZNAME,ZID,ZSTATUS,ZTAGNAME,ZOPENEDDATE  from TB_TEST_ITEM 
where  ZOPENEDBY=@USERID order by ZOPENEDDATE desc

open my_cursor
fetch next from my_cursor into  @RowName,@RowContentID,@RowState,@RowTagName,@RowDate

while( @@fetch_status = 0)
begin
  set @myid = @myid + 1
  if @RowState = 3 --3为关闭
    set @RowClose = 1
  else
    set @RowClose = 0
	
  insert into   temp_usr_daywork
  (ZROWID,ZROWPART,  ZROWNAME,  ZROWTYPE,   ZROWLEVE, ZCONTENTID,ZCLOSE,ZTAGNAME,ZBUILDDATE,
	ZSTATUS)
  values  ( @myid,  0,   @RowName,  @RowType,@myc,@RowContentID,@RowClose,ltrim(rtrim(@RowTagName)),@RowDate,
	@RowState)
  set @myc = @myc+1
  
  fetch next from my_cursor into @RowName,@RowContentID,@RowState,@RowTagName,@RowDate
end

if @myid = 0 
  delete  from temp_usr_daywork where  ZROWTYPE=@RowType

close   my_cursor  
deallocate my_cursor


--------------------------plan(4)------------------------------------------------------------------------------------------------------------------------------------------------
set @RowType = 4
 insert into   temp_usr_daywork
  (ZROWPART,  ZROWNAME,  ZROWTYPE)
  values  ( 1,  '要我完成的任务',  @RowType)
set @myc = @myc+1
set @myid = 0
declare my_cursor cursor
for 
select top 10 a.ZNAME + '(' + b.ZNAME + ')'  as subName ,a.ZID,a.ZSTATUS  from TB_PLAN_DETAIL as a , TB_PLAN_ITEM as b 
where ( a.ZSTATUS=0) and ZDEVE=@USERID and a.ZITEM_GUID=b.ZGUID order by ZID desc

open my_cursor
fetch next from my_cursor into  @RowName,@RowContentID,@myStatus

while( @@fetch_status = 0)
begin
  set @myid = @myid + 1  
  insert into   temp_usr_daywork
  (ZROWID,ZROWPART,  ZROWNAME,  ZROWTYPE,   ZROWLEVE, ZCONTENTID,ZSTATUS)
  values  ( @myid,  0,   @RowName,  @RowType,@myc,@RowContentID,@myStatus)
  set @myc = @myc+1
  

  fetch next from my_cursor into @RowName,@RowContentID,@myStatus
end

if @myid = 0 
  delete  from temp_usr_daywork where  ZROWTYPE=@RowType

close   my_cursor  
deallocate my_cursor


---------------------------------Release(5)-------------------------------------------------
set @RowType = 5
 insert into   temp_usr_daywork
  (ZROWPART,  ZROWNAME,  ZROWTYPE)
  values  ( 1,  '要我上传的项目',  @RowType)
set @myc = @myc+1
set @myid = 0
declare my_cursor cursor
for 
select top 5  ZNAME,ZID,ZOPENDATE,ZSTATUS  from TB_RELEASE_ITEM 
where ( ZSTATUS<>1) and ZASSIGNEDTO=@USERID order by ZOPENDATE desc

open my_cursor
fetch next from my_cursor into  @RowName,@RowContentID,@RowDate,@myStatus

while( @@fetch_status = 0)
begin
 set @myid = @myid + 1
  insert into   temp_usr_daywork
  (ZROWID,ZROWPART,  ZROWNAME,  ZROWTYPE,   ZROWLEVE, ZCONTENTID,ZBUILDDATE,
	ZSTATUS)
  values  ( @myid,  0,   @RowName,  @RowType,@myc,@RowContentID,@RowDate,
	@myStatus)
  set @myc = @myc+1
  
  fetch next from my_cursor into @RowName,@RowContentID,@RowDate,@myStatus
end

if @myid = 0 
  delete  from temp_usr_daywork where  ZROWTYPE=@RowType

close   my_cursor  
deallocate my_cursor

-------------------------------Creaet Release (6)---------------------------------------------------------------
set @RowType = 6
 insert into   temp_usr_daywork
  (ZROWPART,  ZROWNAME,  ZROWTYPE)
  values  ( 1,  '由我发布项目',  @RowType)
set @myc = @myc+1
set @myid = 0
declare my_cursor cursor
for 
select top 5  ZNAME,ZID,ZSTATUS,ZOPENDATE  from TB_RELEASE_ITEM 
where  ZOPENEDBY=@USERID order by ZOPENDATE desc

open my_cursor
fetch next from my_cursor into  @RowName,@RowContentID,@RowState,@RowDate

while( @@fetch_status = 0)
begin
  set @myid = @myid + 1
  if @RowState = 1 --1为关闭
    set @RowClose = 1
  else
    set @RowClose = 0
	
  insert into   temp_usr_daywork
  (ZROWID,ZROWPART,  ZROWNAME,  ZROWTYPE,   ZROWLEVE, ZCONTENTID,ZCLOSE,ZBUILDDATE,
	ZSTATUS)
  values  ( @myid,  0,   @RowName,  @RowType,@myc,@RowContentID,@RowClose,@RowDate,@RowState)
  set @myc = @myc+1
  
  fetch next from my_cursor into @RowName,@RowContentID,@RowState,@RowDate
end

if @myid = 0 
  delete  from temp_usr_daywork where  ZROWTYPE=@RowType

close   my_cursor  
deallocate my_cursor


-----------------------------other-------------------------------------------------------------

select * from temp_usr_daywork
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


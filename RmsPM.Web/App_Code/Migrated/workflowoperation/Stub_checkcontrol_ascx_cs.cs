//===========================================================================
// 此文件是作为 ASP.NET 2.0 Web 项目转换的一部分生成的。
// 此代码文件“App_Code\Migrated\workflowoperation\Stub_checkcontrol_ascx_cs.cs”已创建，其中包含一个抽象类 
//，该类在文件“workflowoperation\checkcontrol.ascx.cs”中用作类“Migrated_CheckControl”的基类。
// 此项允许您的项目中的所有代码文件引用该基类。
// 有关此代码模式的更多信息，请参考 http://go.microsoft.com/fwlink/?LinkId=46995 
//===========================================================================




namespace RmsPM.Web.WorkFlowOperation
 {

	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
	using RmsPM.Web.WorkFlowControl;

abstract public class CheckControl :  System.Web.UI.UserControl
{
		abstract public string Result
		{
		  get;
		  set;
		}
		abstract public ModuleState State
		{
		  get;
		  set;
		}
	abstract public void InitControl();
	abstract public void LoadData();


}



}

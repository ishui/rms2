using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Rms.ORMap;
using RmsPM.DAL;
using RmsPM.DAL.QueryStrategy;
using RmsPM.BLL;

namespace RmsPM.Web.SelectBox
{
	/// <summary>
	/// SelectBuildingByPBSUnit 的摘要说明。
	/// </summary>
	public partial class SelectBuildingByPBSUnit : PageBase
	{
		protected System.Web.UI.HtmlControls.HtmlInputHidden txtCanSelectArea;
		protected System.Web.UI.HtmlControls.HtmlInputButton Button1;
		protected System.Web.UI.HtmlControls.HtmlInputButton btnDelete;
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if ( !IsPostBack)
			{
				IniPage();
				LoadData();
			}
		}

		private void IniPage()
		{
			this.txtProjectCode.Value = Request["ProjectCode"];
			this.txtAct.Value = Request["Act"];
			this.txtType.Value = Request["Type"];
			this.txtPBSTypeCode.Value = Request["PBSTypeCode"];
			this.txtInputCode.Value = Request["SelectCode"];
//			this.txtInputName.Value = Request["SelectName"];
			this.txtReturnFunc.Value = Request["ReturnFunc"];
			this.txtCanSelectPBSUnit.Value = Request["CanSelectPBSUnit"];

			if (this.txtReturnFunc.Value == "") 
			{
				this.txtReturnFunc.Value = "SelectBuildingReturn";
			}
		}

		private void LoadData()
		{
		}

		#region Web 窗体设计器生成的代码
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: 该调用是 ASP.NET Web 窗体设计器所必需的。
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// 设计器支持所需的方法 - 不要使用代码编辑器修改
		/// 此方法的内容。
		/// </summary>
		private void InitializeComponent()
		{    

		}
		#endregion

		protected void btnSave_ServerClick(object sender, System.EventArgs e)
		{
			Response.Write(Rms.Web.JavaScript.ScriptStart);
			Response.Write("window.parent.SelectReturn('" + this.txtOutputCode.Value + "', '" + this.txtOutputName.Value + "');");
//			Response.Write("window.parent.opener." + this.txtReturnFunc.Value + "('" + this.txtAlloType.Value + "','" + this.txtOutputCode.Value + "', '" + this.txtOutputName.Value + "');");
//			Response.Write("window.parent.close();");
			Response.Write(Rms.Web.JavaScript.ScriptEnd);
			Response.End();
		}
	}
}

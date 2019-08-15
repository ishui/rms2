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

namespace RmsPM.Web.Select
{
	/// <summary>
	/// SelectUnit 的摘要说明。
	/// </summary>
	public partial class SelectUnit : PageBase
	{
		protected System.Web.UI.HtmlControls.HtmlInputHidden txtCanSelectArea;
		protected System.Web.UI.HtmlControls.HtmlInputButton Button1;
		protected System.Web.UI.HtmlControls.HtmlInputButton btnDelete;
		protected System.Web.UI.HtmlControls.HtmlInputHidden txtPBSTypeCode;
	
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
			this.txtInputCode.Value = Request["SelectCode"];
//			this.txtInputName.Value = Request["SelectName"];
			this.txtReturnFunc.Value = Request["ReturnFunc"];
			this.txtType.Value = Request["Type"];
			this.txtDefine1.Value = Request["Define1"];

			if (this.txtReturnFunc.Value == "") 
			{
				this.txtReturnFunc.Value = "SelectUnitReturn";
			}

			if (this.txtType.Value.ToLower() == "multi") 
			{
				this.btnClear.Style["display"] = "none";
				this.btnOK.Style["display"] = "";
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
			Response.Write(string.Format("window.opener.{0}('{1}', '{2}', '{3}');", this.txtReturnFunc.Value, this.txtOutputCode.Value, this.txtOutputName.Value, this.txtDefine1.Value));
			Response.Write(Rms.Web.JavaScript.WinClose(false));
			Response.Write(Rms.Web.JavaScript.ScriptEnd);
			Response.End();
		}

	}
}

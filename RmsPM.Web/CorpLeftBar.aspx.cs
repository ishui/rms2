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
using System.Xml;

namespace RmsPM.Web
{
	/// <summary>
	/// ProjectLeftBar 的摘要说明。
	/// </summary>
	public partial class CorpLeftBar : PageBase
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			
			XMLTreeViewManager vm = new XMLTreeViewManager( Server.MapPath(System.Configuration.ConfigurationSettings.AppSettings["VirtualDirectory"]) + @"CorpLeftBar.xml");
			string corpCode = Request["UnitCode"]+"";
			this.divUnitName.InnerText = Request["UnitName"] + "";

			string s = vm.GetLeftBarString( base.user ,"" ,corpCode );
			this.tdBar.InnerHtml = s;
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
	}
}

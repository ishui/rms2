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
using Rms.Web;
using RmsPM.DAL.EntityDAO;
using RmsPM.BLL;

namespace RmsPM.Web.PBS
{
	/// <summary>
	/// ShowPicture 的摘要说明。
	/// </summary>
	public partial class ShowPicture : PageBase
	{
		protected void Page_Load(object sender, System.EventArgs e)
		{
			string fileID = "" + Request["FileID"];
			
			if ( fileID == "" )
				return;

			if ( !Page.IsPostBack )
			{

				try
				{
					EntityData entity=RmsPM.DAL.EntityDAO.ProductDAO.GetPhotosByCode(fileID);
					if ( entity.HasRecord() )
					{
						if ( !entity.CurrentRow.IsNull("PicContent") )
							Response.BinaryWrite((byte[]) entity.CurrentRow["PicContent"] );

						//Response.BinaryWrite((byte[])myDataReader["imgdata"]);

					}
					entity.Dispose();

				}
				catch ( Exception ex )
				{
					ApplicationLog.WriteLog(this.ToString(), ex, "读取图片失败");
				}
			}
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

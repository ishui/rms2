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

namespace RmsPM.Web.Contract
{
	/// <summary>
	/// ContractAccountPrint 的摘要说明。
	/// </summary>
	public partial class ContractAccountPrint : System.Web.UI.Page
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// 在此处放置用户代码以初始化页面
			if ( !IsPostBack )
			{
				LoadData();
			}
		}

		/// <summary>
		/// 装载控件数据
		/// </summary>
		public void LoadData()
		{
			try
			{
				string contractCode = Request["ContractCode"]+"";
				string projectCode = Request["ProjectCode"]+"";

				EntityData entity = DAL.EntityDAO.ContractDAO.GetStandard_ContractByCode(contractCode);

				if ( !entity.HasRecord() )
				{
					return;						
				}



				//合同基本信息
				lblProjectName.Text = BLL.ProjectRule.GetProjectName(projectCode);
				lblContractID.Text = entity.GetString("ContractID");

				lblContractName.Text  = entity.GetString("ContractName");
				lblSupplierName.Text = BLL.ProjectRule.GetSupplierName( entity.GetString("SupplierCode"));

				//显示合同金额
				decimal TotalMoney,TotalChangeMoney,OriginalMoney,NewTotalMoney,ChangeMoney,BudgetMoney,AdjustMoney,EstimateChangeMoney;

				string contractLabel = entity.GetString("ContractLabel");

				TotalMoney = entity.GetDecimal("TotalMoney");
				OriginalMoney = entity.GetDecimal("OriginalMoney");
				BudgetMoney = entity.GetDecimal("BudgetMoney");
				AdjustMoney = entity.GetDecimal("AdjustMoney");

				TotalChangeMoney = TotalMoney - OriginalMoney;

				if ( contractLabel != "" )
				{
					NewTotalMoney = BLL.MathRule.SumColumn(entity.Tables["ContractCostChange"].Select(String.Format("ContractChangeCode='{0}'",contractLabel)),"NewMoney");
				}
				else
				{
					NewTotalMoney = TotalMoney;
				}
				ChangeMoney = NewTotalMoney - TotalMoney;
				EstimateChangeMoney = TotalChangeMoney + ChangeMoney;

				lblTotalChangeMoney.Text = TotalChangeMoney.ToString("#,##0.00");
				lblChangeMoney.Text = ChangeMoney.ToString("#,##0.00");
				lblEstimateChangeMoney.Text = EstimateChangeMoney.ToString("#,##0.00");

				entity.Dispose();

			}
			catch(Exception ex)
			{
				ApplicationLog.WriteLog(this.ToString(),ex,"");
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

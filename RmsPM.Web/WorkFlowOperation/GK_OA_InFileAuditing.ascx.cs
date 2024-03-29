﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Collections.Generic;

using RmsPM.Web.WorkFlowControl;
using Rms.ORMap;
using RmsPM.Web;


public partial class WorkFlowOperation_GK_OA_InFileAuditing : WorkFlowOperationBase
{
    private RmsOA.BFL.GK_OA_InFileAuditingMainBFL bfl = new RmsOA.BFL.GK_OA_InFileAuditingMainBFL();
    private string _InFileRegisterAuditingCode;
    /// <summary>
    /// 装载控件数据
    /// </summary>
    public override void LoadData()
    {
        try
        {
            this._InFileRegisterAuditingCode = Request["InFileRegisterAuditingCode"];

            if (this.ApplicationCode != "")
            {
                this.OperationCode = this.ApplicationCode;
            }
            else if (this.OperationCode != "")
            {
                this.ApplicationCode = this.OperationCode;
            }
            else
            {
                return;
            }
            //业务呈现
            if (_InFileRegisterAuditingCode == "" || _InFileRegisterAuditingCode == null)
            {
                if (this.State == RmsPM.Web.WorkFlowControl.ModuleState.Operable)
                {
                    this.FormView1.ChangeMode(FormViewMode.Edit);
                }
                else
                {
                    this.FormView1.ChangeMode(FormViewMode.ReadOnly);

                }

                this.ObjectDataSource1.SelectParameters.Clear();
                this.ObjectDataSource1.SelectParameters.Add("Code", this.ApplicationCode);


                this.ObjectDataSource2.SelectMethod ="GetGK_OA_InFileRegisterByAuditing";
                this.ObjectDataSource2.SelectParameters.Clear();
                this.ObjectDataSource2.SelectParameters.Add("RegisterAuditingMainCodeEqual", this.ApplicationCode);

            }
            else
            {
                if (_InFileRegisterAuditingCode == "New" || _InFileRegisterAuditingCode == null)
                {
                    this.FormView1.ChangeMode(FormViewMode.Insert);
                    this.ApplicationTitle = "文件承办单评审";


                }
            }
            //业务流程属性保存


        }
        catch (Exception ex)
        {
            ApplicationLog.WriteLog(this.ToString(), ex, "");
            Response.Write(Rms.Web.JavaScript.Alert(true, "读取业务数据出错：" + ex.Message));
        }
    }

    /// <summary>
    /// 保存控件数据
    /// </summary>
    public override string SubmitData()
    {
        try
        {
            string ErrMsg = "";
            if (this.UserCode == "")
            {
                ErrMsg = "操作用户为空";

                return ErrMsg;
            }

            if (this.OperationCode == "New") //新增数据保存到数据库
            {
                if (this.FormView1.CurrentMode == FormViewMode.Insert)
                {

                    this.ApplicationTitle = "文件承办单评审";
                }

                this.FormView1.InsertItem(true);
            }

            if (this.State == RmsPM.Web.WorkFlowControl.ModuleState.Operable && this.FormView1.CurrentMode == FormViewMode.Edit)
            {
                this.ApplicationTitle = "文件承办单评审";

                this.FormView1.UpdateItem(false);
            }

            return ErrMsg;
        }
        catch (Exception ex)
        {
            ApplicationLog.WriteLog(this.ToString(), ex, "");
            Response.Write(Rms.Web.JavaScript.Alert(true, "保存出错：" + ex.Message));
            throw ex;
        }
    }

    /// <summary>
    ///  改变业务数据状态（退回）
    /// </summary>
    /// <returns></returns>
    public override string RestoreStatus()
    {
        try
        {
            base.RestoreStatus();
            string ErrMsg = "";
            if (this.OperationCode != "New")
            {
                bfl.ModifyNotAuditing(int.Parse(this.OperationCode));

            }
            return ErrMsg;
        }
        catch (Exception ex)
        {
            ApplicationLog.WriteLog(this.ToString(), ex, "");
            Response.Write(Rms.Web.JavaScript.Alert(true, "恢复业务数据状态出错：" + ex.Message));
            throw ex;
        }
    }

    /// <summary>
    /// 改变业务数据状态（流程中）
    /// </summary>
    /// <param name="dao"></param>
    /// <returns></returns>
    public override string ChangeStatusWhenSend(StandardEntityDAO dao)
    {
        try
        {
            base.ChangeStatusWhenSend(dao);

            string ErrMsg = "";

            bfl.ModifyAlreadyAuditing(int.Parse(this.OperationCode));
            return ErrMsg;
        }
        catch (Exception ex)
        {
            ApplicationLog.WriteLog(this.ToString(), ex, "");
            Response.Write(Rms.Web.JavaScript.Alert(true, "改变业务数据状态出错：" + ex.Message));
            throw ex;
        }
    }

    /// <summary>
    /// 业务审核(有审核权限的人)
    /// </summary>
    public override bool Audit(string pm_sOpinionConfirm)
    {
        base.Audit(pm_sOpinionConfirm);

        string ErrMsg = "";

        if (pm_sOpinionConfirm != "")
        {
            switch (pm_sOpinionConfirm)
            {
                case "Approve"://批准                  

                    bfl.ModifyPassAuditing(int.Parse(this.OperationCode));
                    break;
                case "Reject"://否决                   
                    bfl.ModifyNotPassAuditing(int.Parse(this.OperationCode));
                    break;
                case "Unknow":
                    ErrMsg = "请选择评审结果！";
                    break;
                default:
                    ErrMsg = "请选择评审结果！";
                    break;
            }

        }
        return true;
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ObjectDataSource1_Selected(object sender, ObjectDataSourceStatusEventArgs e)
    {
        RmsOA.MODEL.GK_OA_InFileAuditingMainModel manpowerneedModel = ((List<RmsOA.MODEL.GK_OA_InFileAuditingMainModel>)e.ReturnValue)[0];
        this.ApplicationTitle = manpowerneedModel.SystemCode + "文件承办单评审";

    }
    /// <summary>
    /// 作废
    /// </summary>
    public void BlankOut()
    {
        try
        {
            bfl.ModifyBankOutAuditing(int.Parse(this.OperationCode));
        }
        catch (Exception ex)
        {
            ApplicationLog.WriteLog(this.ToString(), ex, "");
            Response.Write(Rms.Web.JavaScript.Alert(true, "作废出错：" + ex.Message));
            throw ex;
        }
    }
    protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        e.Values["Status"] = "0";
        e.Values["Field1"] = "";
    }

    protected void ObjectDataSource1_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        this.OperationCode = e.ReturnValue.ToString();
        this.ApplicationCode = e.ReturnValue.ToString();

        this.ObjectDataSource1.SelectParameters.Clear();
        this.ObjectDataSource1.SelectParameters.Add("Code", e.ReturnValue.ToString());

        RmsOA.MODEL.GK_OA_InFileRegisterModel model = new RmsOA.MODEL.GK_OA_InFileRegisterModel();
        RmsOA.BFL.GK_OA_InFileRegisterBFL bfl = new RmsOA.BFL.GK_OA_InFileRegisterBFL();
        model = bfl.GetGK_OA_InFileRegister(Convert.ToInt32(Request["InFileRegisterCode"]+""));
        model.AuditingMailCode = this.ApplicationCode;
        bfl.Update(model);
    }
}

﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GK_OA_InFileRegisterAuditingList.aspx.cs"
    Inherits="RmsOA_GK_OA_InFileRegisterAuditingList" %>

<%@ Register TagPrefix="cc3" Namespace="AspWebControl" Assembly="AspWebControl" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>文件承办单列表</title>
    <link href="../Images/index.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" language="javascript" src="../Rms.js"></script>

    <script type="text/javascript">
		function SelectUnit()
		{
			OpenMiddleWindow("../SelectBox/SelectUnit.aspx?UnitCode=000000");
		}
		function SelectUnitReturn(code, name)
		{
			window.document.all.txtUnitName.value = name;
			window.document.all.txtUnit.value = code;
		}	
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <table height="100%" cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td bgcolor="#e4eff6" height="6">
                </td>
            </tr>
            <tr>
                <td height="25">
                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr>
                            <td class="topic" background="../images/topic_bg.gif">
                                <img height="25" src="../images/topic_li.jpg" width="35" align="absMiddle"><span
                                    id="spanTitle">文件承办单列表</span></td>
                            <td width="9">
                                <img height="25" src="../images/topic_corr.gif" width="9"></td>
                        </tr>
                    </table>
                    <table class="search-area" cellspacing="0" cellpadding="0" border="0">
                        <tr>
                            <td>
                                <table width="100%">
                                    <tr>
                                        <td>
                                            文件编号</td>
                                        <td>
                                            <asp:TextBox ID="SystemCodeTextBox" runat="server" CssClass="input"></asp:TextBox></td>
                                        <td>
                                            标识序号</td>
                                        <td>
                                            <asp:TextBox ID="FileCodeTextBox" runat="server" CssClass="input"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            状态：</td>
                                        <td>
                                            <asp:CheckBoxList ID="cblStatus" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem Value="0" Selected="True">申请</asp:ListItem>
                                                <asp:ListItem Value="1">审核中</asp:ListItem>
                                                <asp:ListItem Value="2">以审</asp:ListItem>
                                                <asp:ListItem Value="3">未通过</asp:ListItem>
                                                <asp:ListItem Value="4">作废</asp:ListItem>
                                            </asp:CheckBoxList></td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td rowspan="4" align="center">
                                            <input type="button" name="button" value="搜索" class="button" runat="server" id="Button1"
                                                onserverclick="Button1_ServerClick"></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr height="100%">
                <td class="table" valign="top">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                        AllowSorting="True" CssClass="list" Width="100%" DataSourceID="ObjectDataSource1">
                        <Columns>
                            <asp:TemplateField HeaderText="文件编号">
                                <ItemTemplate>
                                    <a href="#" onclick="javascript:OpenMiddleWindow('../WorkFlowPage/GK_OA_InFileAuditing.aspx?&CaseCode=<%# RmsPM.BLL.WorkFlowRule.GetCaseCodeByProcedureNameAndApplicationCode("文件承办单审批",Eval("Code").ToString()) %>&ApplicationCode=<%# Eval("Code")%>','InFileDetail');return false;">
                                        <%# Eval("SystemCode")%>
                                    </a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="FileCode" HeaderText="标识序号" SortExpression="FileCode" />
                             <asp:TemplateField HeaderText="状态" SortExpression="Status">
                                <ItemTemplate>
                                    <%# RmsOA.BFL.GK_OA_InFileAuditingMainBFL.GetManpowerNeedStatusName((string)Eval("Status"))%>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="list-title" />
                        <HeaderStyle CssClass="list-title" />
                        <EmptyDataTemplate>
                            无匹配数据

                        </EmptyDataTemplate>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" EnablePaging="True" MaximumRowsParameterName="MaxRecords"
                        SelectMethod="GetGK_OA_InFileAuditingMainList" SortParameterName="SortColumns"
                        StartRowIndexParameterName="StartRecord" TypeName="RmsOA.BFL.GK_OA_InFileAuditingMainBFL">
                        <SelectParameters>
                            <asp:Parameter Name="sortColumns" Type="String" />
                            <asp:Parameter Name="startRecord" Type="Int32" />
                            <asp:Parameter Name="maxRecords" Type="Int32" />
                            <asp:ControlParameter ControlID="SystemCodeTextBox" Name="SystemCodeEqual" PropertyName="Text"
                                Type="String" />
                            <asp:ControlParameter ControlID="FileCodeTextBox" Name="FileCodeEqual" PropertyName="Text"
                                Type="String" />
                            <asp:Parameter Name="StatusEqual" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
            <tr>
                <td height="12">
                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr>
                            <td background="../images/corl_bg.gif">
                                <img height="12" src="../images/corl.gif" width="12"></td>
                            <td width="12">
                                <img height="12" src="../images/corr.gif" width="12"></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td bgcolor="#e4eff6" height="6">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

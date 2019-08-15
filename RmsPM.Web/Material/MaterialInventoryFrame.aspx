<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MaterialInventoryFrame.aspx.cs" Inherits="Material_MaterialInventoryList" %>
<%@ Register TagPrefix="cc3" Namespace="AspWebControl" Assembly="AspWebControl" %>
<%@ Register TagPrefix="uc2" TagName="InputUnit" Src="../UserControls/InputUnit.ascx" %>
<%@ Register TagPrefix="uc1" TagName="InputUser" Src="../UserControls/InputUser.ascx" %>
<%@ Register TagPrefix="uc1" TagName="InputSupplier" Src="../UserControls/InputSupplier.ascx" %>
<%@ Register TagPrefix="cc4" Namespace="Rms.ControlLb" Assembly="RmsPM.BLL" %>
<%@ Register Src="../UserControls/inputcontract.ascx" TagName="inputcontract" TagPrefix="uc3" %>
<%@ Register TagPrefix="uc1" TagName="InputSystemGroup" Src="../UserControls/InputSystemGroup.ascx" %>
<%@ Register TagPrefix="igtxt" Namespace="Infragistics.WebUI.WebDataInput" Assembly="Infragistics.WebUI.WebDataInput.v5.1, Version=5.1.20051.37, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>材料库存</title>
    <link href="../Images/index.css" type="text/css" rel="stylesheet">
	<LINK href="../Images/infra.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="../Rms.js"></script>

    <script language="javascript">

	
	//高级查询
function ShowAdvSearch()
{
	var display = form1.txtAdvSearch.value;
	if ( display == "none" )
	{
		display = "block";
	}
	else
	{
		display = "none";
	}
	
	form1.txtAdvSearch.value = display;
	
	SetAdvSearch();
}

function SetAdvSearch()
{
	document.all("divAdvSearch").style.display = form1.txtAdvSearch.value;

	if ( form1.txtAdvSearch.value == "none" )
	{
//		Form1.imgAdvSearch.src = "../images/ArrowDown.gif";
		form1.imgAdvSearch.title = "高级查询";
	}
	else
	{
//		Form1.imgAdvSearch.src = "../images/ArrowUp.gif";
		form1.imgAdvSearch.title = "隐藏高级查询";
	}
}
</script>
</head>
<body bottomMargin="0" leftMargin="0" topMargin="0" scroll="no" rightMargin="0" bgcolor="#ffffff">
    <form id="form1" runat="server">
    <table height="100%" cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td bgcolor="#e4eff6" height="6">
                </td>
            </tr>
            <tr>
                <td height="25">
                    <table cellSpacing="0" cellPadding="0" width="100%" border="0">
                        <tr>
                            <td class="topic" background="../images/topic_bg.gif">
                                <img height="25" src="../images/topic_li.jpg" width="35" align="absMiddle"><span
                                    id="spanTitle"> 项目管理 > 材料库存</span></td>
                            <td width="9">
                                <img height="25" src="../images/topic_corr.gif" width="9"></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr height="100%">
                <td class="table" vAlign="top">
                    <table width="100%" height="100%">
                        <tr>
                            <td>
                                <table width="100%" class="search-area" cellspacing="0" cellpadding="0" border="0" onkeydown="SearchKeyDown();">
                                    <tr>
                                         <td>
                                              <table>
                                                 <tr>
                                                    <td nowrap>
                                                        材料名称：</td>
                                                    <td>
                                                        <input ID="MaterialIdTextBox" name="MaterialIdTextBox" runat="server" class="input"></td>
                                                    <td nowrap>
                                                        规 格：</td>
                                                    <td><input ID="Spec" name="Spec" runat="server" class="input" size="12"></td>
                                                    <td nowrap>
                                                        单 位：</td>
                                                    <td>
                                                    <input ID="Unit" name="Unit" runat="server" class="input" size="10">
                                                        </td>
                                                    <td><input id="chkSearch" type="checkbox" value="0" runat="server" checked> 在分类中查找</td>
                                                    <td><INPUT class="submit" id="btnSearch" type="button" value="搜 索" runat="server" onclick="doSearch();">
										            &nbsp;<img src="../images/search_more.gif" title="高级查询" style="CURSOR:hand" id="imgAdvSearch" onclick="javascript:ShowAdvSearch();"></td>
                                                </tr>
                                             </table>
                                             <table style="DISPLAY:none" id="divAdvSearch">  
                                                <tr>
                                                    <td nowrap>
                                                        入库数量：</td>
                                                    <TD nowrap colspan="2"><igtxt:webnumericedit id="txtInQtyMin" runat="server" CssClass="infra-input-nember" Width="100px"
									            JavaScriptFileNameCommon="../images/infragistics/20051/scripts/ig_shared.js" JavaScriptFileName="../images/infragistics/20051/scripts/ig_edit.js"
									            ImageDirectory="../images/infragistics/images/" MinDecimalPlaces="none"></igtxt:webnumericedit>——<igtxt:webnumericedit id="txtInQtyMax" runat="server" CssClass="infra-input-nember" Width="100px"
									            JavaScriptFileNameCommon="../images/infragistics/20051/scripts/ig_shared.js" JavaScriptFileName="../images/infragistics/20051/scripts/ig_edit.js"
									            ImageDirectory="../images/infragistics/images/" MinDecimalPlaces="none"></igtxt:webnumericedit></TD>
							                      <td>
                                                        领料数量：</td>
                                                    <td>
                                                    <TD nowrap colspan="2"><igtxt:webnumericedit id="txtOutQtyMin" runat="server" CssClass="infra-input-nember" Width="100px"
									            JavaScriptFileNameCommon="../images/infragistics/20051/scripts/ig_shared.js" JavaScriptFileName="../images/infragistics/20051/scripts/ig_edit.js"
									            ImageDirectory="../images/infragistics/images/" MinDecimalPlaces="none"></igtxt:webnumericedit>——<igtxt:webnumericedit id="txtOutQtyMax" runat="server" CssClass="infra-input-nember" Width="100px"
									            JavaScriptFileNameCommon="../images/infragistics/20051/scripts/ig_shared.js" JavaScriptFileName="../images/infragistics/20051/scripts/ig_edit.js"
									            ImageDirectory="../images/infragistics/images/" MinDecimalPlaces="none"></igtxt:webnumericedit></TD>
                                                 
                                              </tr>
                                              <tr>
							                      <td>
                                                        库存数量：</td>
                                                    <td><igtxt:webnumericedit id="txtInvQtyMin" runat="server" CssClass="infra-input-nember" Width="100px"
									            JavaScriptFileNameCommon="../images/infragistics/20051/scripts/ig_shared.js" JavaScriptFileName="../images/infragistics/20051/scripts/ig_edit.js"
									            ImageDirectory="../images/infragistics/images/" MinDecimalPlaces="none"></igtxt:webnumericedit>——<igtxt:webnumericedit id="txtInvQtyMax" runat="server" CssClass="infra-input-nember" Width="100px"
									            JavaScriptFileNameCommon="../images/infragistics/20051/scripts/ig_shared.js" JavaScriptFileName="../images/infragistics/20051/scripts/ig_edit.js"
									            ImageDirectory="../images/infragistics/images/" MinDecimalPlaces="none"></igtxt:webnumericedit>
                                                  </td>
                                              </tr>
                                            </table>
                                       </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr height="100%">
                            <td>
                                <table height="100%" cellSpacing="0" cellPadding="0" width="100%" border="0">
                                    <tr height="100%">
	                                    <td vAlign="top" width="28%">
		                                    <iframe id="frameLeft" src=""
			                                    frameBorder="no" width="100%" scrolling="auto" height="100%"></iframe>
	                                    </td>
	                                    <td vAlign="top">
		                                    <iframe id="frameMain" src="" frameBorder="no" width="100%" height="100%" scrolling="no">
		                                    </iframe>
	                                    </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td bgcolor="#e4eff6" height="6">
                </td>
            </tr>
    </table> 
    <input id="txtAdvSearch" type="hidden" value="none" name="txtAdvSearch" runat="server"><input id="txtRootGroupCode" type="hidden" name="txtRootGroupCode" runat="server">
    <input id="txtSelectMaterialTypeCode" type="hidden" runat="server">
    </form>
<script language="javascript">
//var MaterialTypeCode = '<%=Request["MaterialTypeCode"]%>';
var IsEmpty = "1";
document.all("frameLeft").src = '../Systems/ShowSystemGroupTree.aspx?ClassCode=1501&MainFunc=GotoList&ShowSortID=0&RootGroupCode=' + form1.txtRootGroupCode.value;
document.all("frameMain").src = '../Material/MaterialInventoryList.aspx?IsEmpty=' + IsEmpty+'&ProjectCode=<%= Request["ProjectCode"]%>';
function doSearch()
{
	var MaterialTypeCode = form1.txtSelectMaterialTypeCode.value  ;

	var chk = form1.chkSearch.checked ;
	var sChk = "";
	if ( chk )
	sChk = "1";
		
	var href = '../Material/MaterialInventoryList.aspx?'
		
		+ 'MaterialName=' +escape(form1.MaterialIdTextBox.value)+'&ProjectCode=<%= Request["ProjectCode"]%>'
		+ '&Unit=' +escape(form1.Unit.value)
		+ '&Spec=' +escape(form1.Spec.value)

    	+ '&chkSearch=' +sChk
//		+ '&RootGroupCode=' + escape(Form1.txtRootGroupCode.value)
		;
    if(chk)
    href = href + '&MaterialTypeCode='+MaterialTypeCode;
	if (form1.txtAdvSearch.value != "none") //高级查询
	{
	    href = href + '&txtInQtyMin=' +escape(form1.txtInQtyMin.value)
                    + '&txtInQtyMax=' +escape(form1.txtInQtyMax.value)
	         		+ '&txtOutQtyMin=' +escape(form1.txtOutQtyMin.value)
                    + '&txtOutQtyMax=' +escape(form1.txtOutQtyMax.value)
	         		+ '&txtInvQtyMin=' +escape(form1.txtInvQtyMin.value)
                    + '&txtInvQtyMax=' +escape(form1.txtInvQtyMax.value)
	        ;
      	/*
		document.all("frameMain").src = '../Material/MaterialCostListFrame.aspx?MaterialTypeCode='+MaterialTypeCode
			+ '&Description=' +escape(Form1.txtDescription.value)
			+ '&Abbreviation=' +escape(Form1.txtAbbreviation.value)
			+ '&AreaCode=' +escape(Form1.txtAreaCode.value)
			+ '&Quality=' +escape(Form1.txtQuality.value)
			+ '&RegisteredAddress=' +escape(Form1.txtRegisteredAddress.value)
			+ '&ContractPerson=' +escape(Form1.txtContractPerson.value)
			+ '&IndustryType=' +escape(Form1.txtIndustryType.value)
			+ '&Achievement=' +escape(Form1.txtAchievement.value)
			+ '&CheckOpinion=' +escape(Form1.txtCheckOpinion.value)
			+ '&chkSearch=' +sChk;
			*/
	}
	
	document.all("frameMain").src = href;
}
function GotoList(typeCode)
{
	form1.txtSelectMaterialTypeCode.value = typeCode;
	MaterialTypeCode = typeCode;

	if (form1.chkSearch.checked) //按分类＋查询条件查
	{
		doSearch();
	}
	else //只按分类查
	{
		document.all("frameMain").src = '../Material/MaterialInventoryList.aspx?MaterialTypeCode='+MaterialTypeCode + '&chkSearch=1'+'&ProjectCode=<%= Request["ProjectCode"]%>' ;
	}
}
//搜索条件按回车
function SearchKeyDown()
{
	if(event.keyCode==13)
	{
		event.keyCode = 9;
		form1.btnSearch.click();
	}
}
</script>
</body>
</html>

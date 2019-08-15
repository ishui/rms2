<%@ Page Language="c#" Inherits="RmsPM.Web.SelectBox.SelectCostBudgetDtl" CodeFile="SelectCostBudgetDtl.aspx.cs" %>

<%@ Register Assembly="RadTreeView.Net2" Namespace="Telerik.WebControls" TagPrefix="radT" %>
<%@ Register Assembly="RadGrid.Net2" Namespace="Telerik.WebControls" TagPrefix="radG" %>
<%@ Register Assembly="RadComboBox.Net2" Namespace="Telerik.WebControls" TagPrefix="radC" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>选择费用项</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../Images/index.css" type="text/css" rel="stylesheet">

    <script language="javascript" src="../Images/XmlTree.js"></script>

    <script language="javascript" src="../Images/ContentMenu.js"></script>

    <script language="javascript" src="../Rms.js"></script>
    
    <script language="javascript">
    var IsExecSearchTree = 0;
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <div style="display: none">
            <%--<input id="btnSearch" onclick="Search();" type="button" value="btnSearch" name="btnSearch"
                runat="server"> --%><input id="btnSearchTree" onclick="SearchTree();" type="button" value="btnSearchTree" name="btnSearchTree"
                runat="server">
        </div>
        <table height="100%" cellspacing="0" cellpadding="0" width="100%" bgcolor="white"
            border="0">
            <tr>
                <td class="topic" align="center" background="../images/topic_bg.gif" height="25">
                    选择费用项</td>
            </tr>
            <tr>
                <td>
                    <table class="search-area" cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr>
                            <td>
                                <table >
                                    <tr>
                                        <td>预算表：
                                            <radC:RadComboBox ID="RadComboBox1" runat="server" IsCaseSensitive="true" ExpandEffect="RandomDissolve" >
                                                <ItemTemplate>
                                                    <div style="overflow-y:scroll;height:300px;background-color:#F0F8FF">
                                                    <asp:TreeView ID="TreeView1" runat="server" Width="100%" ImageSet="Arrows" NodeIndent="15"  OnSelectedNodeChanged="TreeNode_Click"  BackColor="#F0F8FF" OnTreeNodeCollapsed="TreeNode_Collapsed"
                                                        AutoGenerateDataBindings="False">
                                                        <ParentNodeStyle Font-Bold="False" BorderColor=""  Font-Strikeout="false" Font-Underline="false" Font-Overline="false" CssClass="parenttreenode" />
                                                         <RootNodeStyle CssClass="parenttreenode" />
                                                         
                                                        <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                                                            NodeSpacing="0px" VerticalPadding="2px" />
                                                    </asp:TreeView>
                                                    </div>
                                                </ItemTemplate>
                                                <Items>
                                                    <radC:RadComboBoxItem runat="Server" ID="Radcomboboxitem2"></radC:RadComboBoxItem>
                                                </Items>
                                            </radC:RadComboBox>
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
                    <div style="overflow: auto; width: 100%; position: absolute; height: 100%">
                        <table class="tree" id="Table3" cellspacing="0" cellpadding="0" rules="rows" width="100%"
                            border="0">
                            <thead>
                                <tr class="tree-title" id="trTitle" style="display: none">
                                    <td id="tdCostName" nowrap align="left">
                                        成本项目</td>
                                    <td id="tdCheckBox" nowrap align="left">
                                        选择</td>
                                </tr>
                            </thead>
                            <tbody id="Tree">
                            </tbody>
                            <tfoot>
                                <tr class="tree-title" style="display: none">
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <table id="tableButton" cellpadding="0" cellspacing="10" width="100%" runat="server">
                        <tr>
                            <td align="center">
                                <input class="submit" id="btnOK" onclick="javascript:SelCode();" type="button" value="确 定"
                                    name="btnOK" runat="server">
                                <input class="submit" id="btnClear" onclick="javascript:SelectNull();" type="button"
                                    value="清 空" name="btnClear" runat="server">
                                <input class="submit" id="btnCancel" onclick="javascript:window.close();" type="button"
                                    value="取 消" name="btnCancel" runat="server">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <div id="divHintLoad" style="display: none; left: 1px; width: 100%; position: absolute;
            top: 200px; background-color: transparent">
            <table id="tableHintLoad" height="100" cellspacing="0" cellpadding="0" width="100%"
                border="0">
                <tr>
                    <td valign="top" align="center">
                        <iframe id="frameLoad" src="../Cost/LoadingPrepare.htm" frameborder="no" width="100%"
                            scrolling="auto" height="100%"></iframe>
                    </td>
                </tr>
            </table>
        </div>
        <div id="divHintSave" style="display: none; left: 1px; width: 100%; position: absolute;
            top: 200px">
            <table id="tableHintSave" height="100" cellspacing="0" cellpadding="0" width="100%"
                border="0">
                <tr>
                    <td valign="top" align="center">
                        <iframe id="frameSave" src="../Cost/SavingWating.htm" frameborder="no" width="100%"
                            scrolling="auto" height="100%"></iframe>
                    </td>
                </tr>
            </table>
        </div>
        <input id="txtShowItems" type="hidden" name="txtShowItems" runat="server">
        <input id="txtTreeType" type="hidden" name="txtTreeType" runat="server">
        <input id="txtSelectCostBudgetSetCode" type="hidden" name="txtSelectCostBudgetSetCode" runat="server">
        <input id="PBSTypeID" type="hidden" name="PBSTypeID" runat="server"> <input id="PBSCodeID" type="hidden" name="PBSCodeID" runat="server"> <input id="PBSNameID" type="hidden" name="PBSNameID" runat="server">
    </form>

    <script language="javascript">
//Tree
var TreeObj=document.all("Tree");
var RowClassName="tree-tr";
var GridClassName="tree-tr";

var DataSourceUrl='../SelectBox/SelectCostData.aspx?ProjectCode=<%=Request["ProjectCode"]%>&AccountPoint=<%=Request["AccountPoint"]%>' ;

// @IndentStart			缩进内容循环开始点
// @IndentEnd			缩进内容循环结束点
// @NodeSymbolStart		节点标志开始点 开始和结束两点中写入 闭合标示|开启标示|无节点标示
// @NodeSymbolEnd		节点标志开始点
// @JsCodeStart			节点标志开始点 开始和结束两点中写入 闭合标示|开启标示|无节点标示
// @JsCodeEnd			节点标志开始点

var TreeModels=new Array();
var v0 ="<table cellSpacing=\"0\" cellPadding=\"0\" border=\"0\"><tr>@IndentStart<td width=\"10\">&nbsp;</td>@IndentEnd";
v0+="<td id='td@CostCode'  onclick=\"SpreadNodes('@CostCode','@Layer',this);\" width=\"20\" align=\"center\" style=\"cursor:hand\">@NodeSymbolStart<img src=\"../Images/Plus.gif\">|<img src=\"../Images/Minus.gif\">|@NodeSymbolEnd</td>";

//单选或多选
var MultiSelect='<%=Request["MultiSelect"]%>';

//是否可任意选择费用项
var SelectAllLeaf = '<%=Request["SelectAllLeaf"]%>';

if ( MultiSelect == "1" )
{
	//多选时，显示CHECKBOX
	v0+="<td>";
	v0+="<input type='checkbox' value=@CostCode style='display:@Display' text=@CostName name='CostCode'>";
	v0+="@CostName</td></tr></table>";
}
else
{
	//单选时，显示链接
	Form1.btnOK.style.display = "none";

	if (SelectAllLeaf == "1")
		v0+="<td><a href=\"#\" onclick=\"SelectSingleCostV2('@CostCode','@CostName')\">@CostName</a></td></tr></table>";
	else
		v0+="<td><a style=\"display:@DisplayHref\" href=\"#\" onclick=\"SelectSingleCostV2('@CostCode','@CostName')\">@CostName</a><span style=\"display:@DisplaySpan\">@CostName</span></td></tr></table>";
}

//第一列，成本项
TreeModels.push(v0);

//节点
function SpreadNodes(CostCode,LayerNumber,obj){
	ShowChildNode(DataSourceUrl+"&GetType=ChildNodes&NodeId="+CostCode,obj,TreeModels,"CostCode");
}

//所有
function ShowAll(){
	RemoveAllChildNode(TreeObj);
	GetChildNodes(DataSourceUrl+"&GetType=All",null,TreeModels,"CostCode",RowClassName,GridClassName);
}

//指定层
function ShowLayer(layer){
	RemoveAllChildNode(TreeObj);
	GetChildNodes(DataSourceUrl+"&SelectedLayer="+layer+"&GetType=SelectLayer",null,TreeModels,"CostCode",RowClassName,GridClassName);
}

//更新节点
function updateNode(NodeId){
	RefreshNode(DataSourceUrl+"&GetType=SingleNode&NodeId="+NodeId,TreeObj,NodeId,TreeModels,"CostCode",RowClassName,GridClassName);
}

//更新子节点
function updateChildNodes(parentNodeId,Layer){
	RefreshChildNodes(DataSourceUrl+"&GetType=ChildNodes&NodeId="+parentNodeId+"&Layer="+Layer,TreeObj,parentNodeId,TreeModels,"CostCode",RowClassName,GridClassName);
}

function Search()
{
//	var CostBudgetSetCode = Form1.sltCostBudgetSet.value;
//	
//	RemoveAllChildNode(TreeObj);

//	GetChildNodes(DataSourceUrl+"&GetType=CostBudgetSetRoot&CostBudgetSetCode=" + CostBudgetSetCode,null,TreeModels,"CostCode",RowClassName,GridClassName);

//	//展开根结点
//	if (document.all.Tree.childNodes.length == 1)
//	{
//		SpreadNodes(document.all.Tree.childNodes[0].NodeId, parseInt(document.all.Tree.childNodes[0].NodeLayer) - 1, document.all.Tree.childNodes[0]);
//	}
}



function SearchTree(Code)
{
   // var CostBudgetSetCode = Form1.sltCostBudgetSet.value;
    //alert("fada"+Code);
    RemoveAllChildNode(TreeObj);

    GetChildNodes(DataSourceUrl+"&GetType=CostBudgetSetRoot&CostBudgetSetCode=" + Code,null,TreeModels,"CostCode",RowClassName,GridClassName);

    //展开根结点
    if (document.all.Tree.childNodes.length == 1)
    {
        SpreadNodes(document.all.Tree.childNodes[0].NodeId, parseInt(document.all.Tree.childNodes[0].NodeLayer) - 1, document.all.Tree.childNodes[0]);
    }
}
    

//if (Form1.sltCostBudgetSet.value != "")
//{
//	Search();
//}


    </script>

    <script language="javascript">



	function SelCode()
	{
		var codeObject= document.all("CostCode");
		var codes="";
		var names="";
		
		if ( codeObject[0])
		{
			for(var i=0;i<codeObject.length;i++)
			{
				if ((codeObject[i].checked))
				{
					codes+=((codes=="")?(codeObject[i].value):(","+codeObject[i].value));
					names+=((names=="")?(codeObject[i].text):(","+codeObject[i].text));
				}
			}
		}
		else
		{
			if ( codeObject.checked )
			{
				codes = codeObject.value;
				names = codeObject.text;
			}
		}
		
		var flag = '<%=Request["Flag"]%>';
		window.opener.<%=ViewState["ReturnFunc"]%>(codes, names, flag);
		window.close();
	}
	
	function SelectSingleCost( costCode,costName)
	{
//		var index = Form1.sltCostBudgetSet.selectedIndex;
//		if (index < 0) return;

//		var CostBudgetSetCode = Form1.sltCostBudgetSet.value;
//		var item = Form1.sltCostBudgetSet.item(index);

//		var flag = '<%=Request["Flag"]%>';
//		window.opener.<%=ViewState["ReturnFunc"]%>(costCode,costName, flag, CostBudgetSetCode, item.PBSType, item.PBSCode, item.PBSName);
//		window.close();
		
	}
	
	function SelectNull()
	{
		var flag = '<%=Request["Flag"]%>';
		window.opener.<%=ViewState["ReturnFunc"]%>("","", flag, "", "", "", "");
		window.close();
	}
	
	function SelectSingleCostV2( costCode,costName)
	{

		var CostBudgetSetCode = Form1.txtSelectCostBudgetSetCode.value;
		var PBSType = Form1.PBSTypeID.value;
		var PBSCode = Form1.PBSCodeID.value;
        var PBSName = Form1.PBSNameID.value;
		var flag = '<%=Request["Flag"]%>';
		window.opener.<%=ViewState["ReturnFunc"]%>(costCode,costName, flag, CostBudgetSetCode, PBSType, PBSCode, PBSName);
		window.close();
		
	}

if (IsExecSearchTree == "1")
{
    SearchTree(Form1.txtSelectCostBudgetSetCode.value);
}	

    </script>

</body>
</html>

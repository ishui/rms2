<%@ Page language="c#" Inherits="RmsPM.Web.Contract.ContractAuditingCostAnalyze" CodeFile="ContractAuditingCostAnalyze.aspx.cs" %>
<%@ Register TagPrefix="cc3" Namespace="AspWebControl" Assembly="AspWebControl" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>��ͬ���÷���</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../Images/index.css" type="text/css" rel="stylesheet">
		<SCRIPT language="javascript" src="../Rms.js"></SCRIPT>
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<table height="100%" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<tr>
					<td vAlign="top" align="center">
						<table cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tr>
								<td class="intopic" width="200">�� �� ��</td>
								<td></td>
							</tr>
						</table>
						<asp:datagrid id="dgList1" runat="server" CssClass="list" Width="100%" AllowSorting="True" AutoGenerateColumns="False"
							PageSize="15">
							<AlternatingItemStyle CssClass="list-i"></AlternatingItemStyle>
							<HeaderStyle CssClass="list-title"></HeaderStyle>
							<FooterStyle CssClass="list-title"></FooterStyle>
							<Columns>
								<asp:TemplateColumn HeaderText="��ط�����">
									<ItemTemplate>
										<%#  DataBinder.Eval(Container.DataItem, "CostName") %>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="CurrentCost" HeaderText="��ͬ�������" DataFormatString="{0:N}">
									<HeaderStyle HorizontalAlign="Right"></HeaderStyle>
									<ItemStyle HorizontalAlign="Right"></ItemStyle>
									<FooterStyle HorizontalAlign="Right"></FooterStyle>
								</asp:BoundColumn>
							</Columns>
							<PagerStyle NextPageText="��ҳ&gt;&gt;&gt;" PrevPageText="&lt;&lt;&lt;��ҳ" HorizontalAlign="Right"
								CssClass="ListHeadTr"></PagerStyle>
						</asp:datagrid>
						<asp:datagrid id="dgList2" runat="server" CssClass="list" Width="100%" AllowSorting="True" AutoGenerateColumns="False"
							PageSize="15">
							<AlternatingItemStyle CssClass="list-i"></AlternatingItemStyle>
							<HeaderStyle CssClass="list-title"></HeaderStyle>
							<FooterStyle CssClass="list-title"></FooterStyle>
							<Columns>
								<asp:TemplateColumn HeaderText="��ط�����">
									<ItemTemplate>
										<a href="##" onclick="doViewDynamicCostInfo(this.code);return false;" code='<%#  DataBinder.Eval(Container.DataItem, "CostCode") %>'>
											<%#  DataBinder.Eval(Container.DataItem, "CostName") %>
										</a>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="DynamicCost" HeaderText="��Ԥ�㣨Ԫ��" DataFormatString="{0:N}">
									<HeaderStyle HorizontalAlign="Right"></HeaderStyle>
									<ItemStyle HorizontalAlign="Right"></ItemStyle>
									<FooterStyle HorizontalAlign="Right"></FooterStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="CostSpace" HeaderText="����Ԥ�㣨Ԫ��" DataFormatString="{0:N}">
									<HeaderStyle HorizontalAlign="Right"></HeaderStyle>
									<ItemStyle HorizontalAlign="Right"></ItemStyle>
									<FooterStyle HorizontalAlign="Right"></FooterStyle>
								</asp:BoundColumn>
								<asp:TemplateColumn HeaderText="��ͬ������ã�Ԫ��" HeaderStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
									<ItemTemplate>
										<div align=right class='<%#  DataBinder.Eval(Container.DataItem, "AlertClass") %>'><%#  DataBinder.Eval(Container.DataItem, "CurrentCost","{0:N}") %></div>
									</ItemTemplate>
								</asp:TemplateColumn>
							</Columns>
							<PagerStyle NextPageText="��ҳ&gt;&gt;&gt;" PrevPageText="&lt;&lt;&lt;��ҳ" HorizontalAlign="Right"
								CssClass="ListHeadTr"></PagerStyle>
						</asp:datagrid><asp:datagrid id="dgList3" runat="server" CssClass="list" Width="100%" AllowSorting="True" AutoGenerateColumns="False"
							PageSize="15">
							<AlternatingItemStyle CssClass="list-i"></AlternatingItemStyle>
							<HeaderStyle CssClass="list-title"></HeaderStyle>
							<FooterStyle CssClass="list-title"></FooterStyle>
							<Columns>
								<asp:TemplateColumn HeaderText="��ط�����">
									<ItemTemplate>
										<a href="##" onclick="doViewDynamicCostInfo(this.code);return false;" code='<%#  DataBinder.Eval(Container.DataItem, "CostCode","{0:N}") %>'>
											<%#  DataBinder.Eval(Container.DataItem, "CostName") %>
										</a>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="YearMonth" HeaderText="�ƻ�֧��ʱ��"></asp:BoundColumn>
								<asp:BoundColumn DataField="DynamicCost" HeaderText="����Ԥ��" DataFormatString="{0:N}">
									<HeaderStyle HorizontalAlign="Right"></HeaderStyle>
									<ItemStyle HorizontalAlign="Right"></ItemStyle>
									<FooterStyle HorizontalAlign="Right"></FooterStyle>
								</asp:BoundColumn>
								<asp:BoundColumn DataField="CostSpace" HeaderText="����Ԥ�㣨Ԫ��" DataFormatString="{0:N}">
									<HeaderStyle HorizontalAlign="Right"></HeaderStyle>
									<ItemStyle HorizontalAlign="Right"></ItemStyle>
									<FooterStyle HorizontalAlign="Right"></FooterStyle>
								</asp:BoundColumn>
								<asp:TemplateColumn HeaderText="��ͬ������ã�Ԫ��" HeaderStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
									<ItemTemplate>
										<div align=right class='<%#  DataBinder.Eval(Container.DataItem, "AlertClass") %>'><%#  DataBinder.Eval(Container.DataItem, "CurrentCost","{0:N}") %></div>
									</ItemTemplate>
								</asp:TemplateColumn>
							</Columns>
							<PagerStyle NextPageText="��ҳ&gt;&gt;&gt;" PrevPageText="&lt;&lt;&lt;��ҳ" HorizontalAlign="Right"
								CssClass="ListHeadTr"></PagerStyle>
						</asp:datagrid>
					</td>
				</tr>
			</table>
		</form>
		<script language="javascript">
<!--
	function doViewDynamicCostInfo( costCode )
	{
		OpenFullWindow( "../Cost/DynamicCostInfo.aspx?ProjectCode=<%=Request["ProjectCode"]%>&CostCode=" + costCode,"��̬������Ϣ"  );
	}

	
//-->
		</script>
	</body>
</HTML>
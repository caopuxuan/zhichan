	<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
			<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
			<%
	ResourceBundle res = ResourceBundle.getBundle("application");
%>
			<%
    String flowUrlpath = res.getString("flowUrlpath");
 %>

		<!DOCTYPE html>
<base href="<%=basePath%>">
<html>
<head>
<title>资产汇总查询</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<link href="scripts/miniui/themes/default/miniui.css" rel="stylesheet"
	type="text/css" />
<link href="scripts/miniui/themes/icons.css" rel="stylesheet"
	type="text/css" />
<link href="css/reset.css" rel="stylesheet" type="text/css" />
<link href="css/report.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="scripts/jquery.min.js"></script>
<script type="text/javascript" src="scripts/miniui/miniui.js"></script>
<script type="text/javascript" src="js/assets.js"></script>
</head>
<body>
	<div class="reim-main clearfix">
		<div class="excision-check">
			<div class="mini-toolbar" style="border-bottom: 0; padding: 0px;">
				<table style="width: 100%;">

					<tr>
						<td class="search-inform" style="white-space: nowrap;"><em
							class="search-tit">资产大类：</em> <input id="combo6"
							class="mini-combobox" style="width: 150px;" textField="text"
							valueField="id" emptyText="请选择..." url="" value=""
							allowInput="true" showNullItem="true" nullItemText="" /> <em
							class="search-tit">资产分类：</em> <input id="combo8"
							class="mini-combobox" style="width: 150px;" textField="text"
							valueField="id" emptyText="请选择..." url="" value=""
							allowInput="true" showNullItem="true" nullItemText="" /></td>
					</tr>
					<tr>
						<td style="width: 100%;"><a class="mini-button btn1"
							onclick="search()">查询</a></td>
					</tr>

				</table>
			</div>
		</div>

		<div id="datagrid1" class="mini-datagrid report-table"
			style="width: 100%; height: 480px;" allowResize="false"
			url="${basePath}findAssetByTZ" idField="id" multiSelect="true" showPager="false">
			<div property="columns">
				<div type="indexcolumn"></div>
				<div field="cardNumber" name="cardNumber" width="100"
					headerAlign="center">卡片编号</div>
				<div field="assetCode" name="assetCode" width="100"
					headerAlign="center">资产编号</div>
				<div field="assetFirst" name="assetFirst" width="100"
					headerAlign="center">资产大类</div>

				<div field="className" name="className" width="100"
					headerAlign="center">资产分类</div>

				<div field="assetName" name="assetName" width="100"
					headerAlign="center">资产名称</div>

				<div field="numb" name="numb" width="100" headerAlign="center">数量</div>

				<div field="originalValue" name="originalValue" width="100"
					headerAlign="center">原值</div>

				<div field="equity" name="equity" width="100" headerAlign="center">净值</div>
				<div field="additionMethod" name="additionMethod" width="100"
					headerAlign="center">增加方式</div>

				<div field="useDepartment" name="useDepartment" width="100"
					headerAlign="center">使用部门</div>

				<div field="userName" name="userName" width="100"
					headerAlign="center">使用人名称</div>
			</div>
		</div>

	</div>


	<script type="text/javascript">
		mini.parse();
		var flowUrlpath="<%=flowUrlpath%>";
		//查询-All--土地
		var grid = mini.get("datagrid1");
		grid.load({
			"audit_state" : "3"
		});
		grid.on("drawcell",
						function(e) {
							var record = e.record, column = e.column, field = e.field, value = e.value;

							//将增加方式替换文本--增加方式
							if (column.field == "additionMethod") {
								if (e.value == 1) {
									e.cellHtml = "购置构建"
								}
								if (e.value == 2) {
									e.cellHtml = "调拨"
								}
								if (e.value == 3) {
									e.cellHtml = "接收捐赠"
								}
								if (e.value == 4) {
									e.cellHtml = "增加置换"
								}
								if (e.value == 5) {
									e.cellHtml = "其他增加"
								}
							}
							//将资产大类替换文本--资产大类
							if (column.field == "assetFirst") {
								if (e.value == 1) {
									e.cellHtml = "土地、房屋及构筑物"
								}
								if (e.value == 2) {
									e.cellHtml = "土地、房屋及构筑物"
								}
								if (e.value == 3) {
									e.cellHtml = "土地、房屋及构筑物"
								}
								if (e.value == 4) {
									e.cellHtml = "通用设备"
								}
								if (e.value == 5) {
									e.cellHtml = "通用设备"
								}
								if (e.value == 6) {
									e.cellHtml = "专用设备"
								}
								if (e.value == 7) {
									e.cellHtml = "文物、成列品"
								}
								if (e.value == 8) {
									e.cellHtml = "图书、档案"
								}
								if (e.value == 9) {
									e.cellHtml = "家具、用具、装具及动植物"
								}
								if (e.value == 10) {
									e.cellHtml = "家具、用具、装具及动植物"
								}
							}
						});

		/*查询-条件--土地*/
		function search() {
			var key1 = mini.get("combo6").getValue();
			var key2 = mini.get("combo8").getValue();
			grid.load({
				"asset_first" : key1,
				"资产分类" : key2,
				"audit_state" : "3"
			});
		}
	</script>

</body>
</html>

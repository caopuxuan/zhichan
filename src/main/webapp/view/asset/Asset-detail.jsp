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
<base href="<%=basePath%>" >
<html>
<head>
    <title>资产明细</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="scripts/miniui/themes/default/miniui.css" rel="stylesheet" type="text/css" />
    <link href="scripts/miniui/themes/icons.css" rel="stylesheet" type="text/css" />
    <link href="css/reset.css" rel="stylesheet" type="text/css" />
    <link href="css/report.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="scripts/jquery.min.js"></script>
    <script type="text/javascript" src="scripts/miniui/miniui.js"></script>
    <script type="text/javascript" src="js/assets.js"></script>
</head>
<body>
<div class="reim-main clearfix">

    <div class="excision-check">
        <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
                    <td class="search-inform" style="white-space:nowrap;">
                        <em class="search-tit">资产分类：</em>
                        <input id="combo1" class="mini-combobox" style="width:150px;" textField="valued" valueField="types" emptyText="请选择..." allowInput="true"  onbuttonclick="combobox('zcfl','combo1')" popupHeight="100px"/>           
                        <em class="search-tit">资产名称：</em>
                        <input id="combo2" class="mini-textbox" style="width:150px;" emptyText="请选择..."/>
                    </td>
                </tr>
                <tr>
                    <td style="width:100%;">
                        <a class="mini-button btn1" onclick="search()">查询</a>
                        <!--<a class="mini-button btn1" onclick="onOk()">处置</a>-->
	                   <%--<a class="mini-button btn5" onclick="AuditStatus()">审核状态</a>--%>

                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div id="datagrid1" class="mini-datagrid report-table" style="height:480px;" allowResize="false" idField="id" multiSelect="true">
        <div property="columns">
            <div type="checkcolumn" ></div>
            <div field="cardNumber" name="cardNumber" width="120" headerAlign="center" >卡片编号</div>
            <div field="useDepartment" name="useDepartment" width="120" headerAlign="center" >使用部门</div>
            <div field="className" name="className" width="120" headerAlign="center" >资产分类</div>
            <div field="assetName" name="assetName" width="100" headerAlign="center" >资产名称</div>
            <div field="buyDate" name="buyDate" width="100" headerAlign="center" dateFormat="yyyy-MM-dd" >购置时间</div>
            <div field="additionMethod" name="additionMethod" width="100" headerAlign="center" >取得方式</div>
            <div field="originalValue" name="originalValue" width="100" headerAlign="center" >资产原值</div>
            <div field="equity" name="equity" width="100" headerAlign="center" >资产净值</div>
        </div>
    </div>

</div>

<script type="text/javascript">
    mini.parse();
		var flowUrlpath="<%=flowUrlpath%>";
    //下拉框ajax请求
    function combobox(value,id){
		var combox = mini.get(id);
		$.ajax({

			    url: "${basePath}findByCode",
	            data: {"code" : value},
	            type:'post',
	            success: function (jsonData) {
	            	combox.load(jsonData);
	            },
	            error: function () {
                	alert("请求失败");
                }
	        })
	};
	
	$.ajax({
		url: "${basePath}findAssetByBT",
            data: {"audit_state":"3"},
            type:'post',
            success: function (text) {
				//资产明细-表
				var grid = mini.get("datagrid1");
            	//日期转化
            	for(var n in text ){
	          	  text[n].buyDate=ChangeDateFormat(text[n].buyDate);
	          	}
				grid.setData(text);
				grid.on("drawcell", function (e) {
	                var record = e.record,
	                column = e.column,
	                field = e.field,
	                value = e.value;
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
			     });
            },
            error: function() {
            	alert("提交失败");
		     }
	       })
	       
	  /*查询-条件*/
    function search() {
        var key1 = mini.get("combo1").getValue();
        var key2 = mini.get("combo2").getValue();
		$.ajax({
			url: "${basePath}findAssetByBT",
	            data: {"className":key1,"assetName":key2,"audit_state":"3"},
	            type:'post',
	            success: function (text) {
					//资产明细-表
					var grid = mini.get("datagrid1");
	            	//日期转化
	            	for(var n in text ){
		          	  text[n].buyDate=ChangeDateFormat(text[n].buyDate);
		          	}
					grid.setData(text);
					grid.on("drawcell", function (e) {
		                var record = e.record,
		                column = e.column,
		                field = e.field,
		                value = e.value;
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
				     });
	            },
	            error: function() {
	            	alert("提交失败");
			     }
		       })
    }
	
	/*处置*/
	//获取值
	var grid = mini.get("datagrid1");
	function GetData() {
        var rows = grid.getSelecteds();
        return rows;//返回值
    }

	//处置传值
	function CloseWindow(action) {
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();
    }

    function onOk() {
        CloseWindow("ok");
    }

	//审核状态
	function AuditStatus(){
	var assetName=grid.getSelecteds();
	var name="";
	name=assetName[0].bpmId;
	if (assetName!="") {
	mini.open({
	url: "${basePath}view/asset/file/AuditEjection1.jsp",
	title: "审核状态", width: 800, height: 400,
	onload: function () {
	var iframe = this.getIFrameEl();
	iframe.contentWindow.SetData(name);
	},
	ondestroy: function (action) {
	grid4.reload();
	}
	});
	}else {
	alert("请选中一条记录");
	}
	}

	function auditRecord(){
	var data = grid.getSelected();
	if(typeof(data)!="undefined"){
	$.ajax({
	url:flowUrlpath+"jbpm/findAuditLogsByParam",
	type:"post",
	data:{"source":"zc","businessId":data.cardNumber},
	success:function(objectVO){
	mini.open({
	url: "${basePath}view/asset/file/AuditEjection.html",
	title: "审核记录", width: 1000, height: 500,
	onload: function () {
	var iframe = this.getIFrameEl();
	iframe.contentWindow.SetData(objectVO);
	},
	ondestroy: function (action) {
	grid4.reload();
	}
	});
	},
	error:function(){
	alert("数据请求失败")
	}
	})
	}else{
	alert("请选中一条记录")
	}
	}

	</script>

</body>
</html>

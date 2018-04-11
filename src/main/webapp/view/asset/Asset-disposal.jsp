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
    <title>资产新增、处置查询</title>
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
    <div class="report-tabs">
        <div class="mini-tabs" activeIndex="0"  style="width:100%;height:520px;">
            <div title="新增">
                <div class="excision-check" >
                    <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
                        <table style="width:100%;">
                            <tr>
                                <td class="search-inform" style="white-space:nowrap;">
                                    <em class="search-tit">增加时间：</em>
                                    <input id="combo1" class="mini-datepicker" style="width:150px;" textField="text" valueField="id" emptyText="年/月/日"
                                        allowInput="true" showNullItem="true" nullItemText="年/月/日"/> 至
                                    <input id="combo2" class="mini-datepicker" style="width:150px;" textField="text" valueField="id" emptyText="年/月/日"
                                        allowInput="true" showNullItem="true" nullItemText="年/月/日"/>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:100%;">
                                    <a class="mini-button btn1" onclick="search()">查询</a>
                                    <%--<a class="mini-button btn5" onclick="AuditStatus()">审核状态</a>--%>
    <a class="mini-button btn5" onclick="auditRecord()">审核记录</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div id="datagrid1" class="mini-datagrid report-table" style="height:300px;" allowResize="false"
                     url="${basePath}findAssetByTZ"  idField="id" multiSelect="true"  showPager='false'>
                    <div property="columns">
                        <div field="cardNumber" name="cardNumber" width="120" headerAlign="center" >卡片编号</div>
                        <div field="assetCode" name="assetCode" width="120" headerAlign="center" >资产编号</div>
                        <div field="assetFirst" name="assetFirst" width="120" headerAlign="center" >资产大类</div>
                        <div field="className" name="className" width="100" headerAlign="center" >资产分类</div>
                        <div field="assetName" name="assetName" width="100" headerAlign="center" >资产名称</div>
                        <div field="numb" name="numb" width="80" headerAlign="center" >数量</div>
                        <div field="originalValue" name="originalValue" width="80" headerAlign="center" >原值</div>
						<div field="newsDate" name="newsDate" width="80" headerAlign="center" >增加时间</div>
                        <div field="additionMethod" name="additionMethod" width="80" headerAlign="center" >增加方式</div>
                        <div field="useDepartment" name="useDepartment" width="100" headerAlign="center" >使用部门</div>
                        <div field="userName" name="userName" width="100" headerAlign="center" >使用人名称</div>
                        <div field="startTime" name="startTime" width="100" headerAlign="center" >开始使用日期</div>
                        <div field="expectedMonth" name="expectedMonth" width="100" headerAlign="center" >预计使用月份</div>
                        <div field="usingState" name="usingState" width="100" headerAlign="center" >使用状态</div>
                        <div field="remark" name="remark" width="100" headerAlign="center" >备注</div>
                    </div>
                </div>
            </div>
            <!--<div title="处置">
                <div class="excision-check">
                    <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
                        <table style="width:100%;">
                            <tr>
                                <td class="search-inform" style="white-space:nowrap;">
                                    <em class="search-tit">处置时间：</em>
                                    <input id="combo6" class="mini-datepicker" style="width:150px;" textField="text" valueField="id" emptyText="年/月/日"
                                            allowInput="true" showNullItem="true"/> 至
                                    <input id="combo7" class="mini-datepicker" style="width:150px;" textField="text" valueField="id" emptyText="年/月/日"
                                           allowInput="true" showNullItem="true"/>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:100%;">
                                    <a class="mini-button btn1" onclick="search2()">查询</a>
    <a class="mini-button btn5" onclick="AuditStatus1()">审核状态</a>
    <a class="mini-button btn5" onclick="auditRecord1()">审核记录</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div id="datagrid2" class="mini-datagrid report-table" style="height:300px;" allowResize="false"
                     url="${basePath}findAssetByTZ"  idField="id" multiSelect="true"  showPager='false'>
                    <div property="columns">
                        <div field="cardNumber" name="cardNumber" width="120" headerAlign="center" >卡片编号</div>
                        <div field="assetCode" name="assetCode" width="120" headerAlign="center" >资产编号</div>
                        <div field="assetFirst" name="assetFirst" width="120" headerAlign="center" >资产大类</div>
                        <div field="className" name="className" width="100" headerAlign="center" >资产分类</div>
                        <div field="assetName" name="assetName" width="100" headerAlign="center" >资产名称</div>
                        <div field="numb" name="numb" width="80" headerAlign="center" >数量</div>
                        <div field="originalValue" name="originalValue" width="80" headerAlign="center" >原值</div>
                        <div field="dealDate" name="dealDate" width="80" headerAlign="center" >处置时间</div>
                        <div field="dealStatus" name="dealStatus" width="80" headerAlign="center" >处置方式</div>
                        <div field="useDepartment" name="useDepartment" width="100" headerAlign="center" >使用部门</div>
                        <div field="userName" name="userName" width="100" headerAlign="center" >使用人名称</div>
                        <div field="startTime" name="startTime" width="100" headerAlign="center" >开始使用日期</div>
                        <div field="expectedMonth" name="expectedMonth" width="100" headerAlign="center" >预计使用月份</div>
                        <div field="usingState" name="usingState" width="100" headerAlign="center" >使用状态</div>
                        <div field="remark" name="remark" width="100" headerAlign="center" >备注</div>
                    </div>
                </div>
            </div>-->
        </div>
    </div>
</div>

<script>
	mini.parse();
        var flowUrlpath="<%=flowUrlpath%>";
//查询-All--新增
     var grid = mini.get("datagrid1");
	 grid.load({"audit_state":"3,4"});
	 grid.on("drawcell", function (e) {
                var record = e.record,
                column = e.column,
                field = e.field,
                value = e.value;
        //日期转化
        if (column.field == "startTime") {
        	e.cellHtml=ChangeDateFormat(e.value)
        }
        if (column.field == "newsDate") {
        	e.cellHtml=ChangeDateFormat(e.value)
        }
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
        //将使用状态替换文本--使用状态
        if (column.field == "usingState") {
            if (e.value == 1) {
                e.cellHtml = "在用"
            }
            if (e.value == 2) {
                e.cellHtml = "闲置"
            }
            if (e.value == 3) {
                e.cellHtml = "其他"
            }
            if (e.value == 4) {
                e.cellHtml = "损毁待报废"
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

	 /*查询-条件--新增*/
    function search(){
        var key1 = ChangeDateFormat2(mini.get("combo1").getValue());
        var key2 = ChangeDateFormat2(mini.get("combo2").getValue());
		grid.load({"news_date_str":key1,"news_date_end":key2,"audit_state":"3,4"});   
       }
        
    //查询-All--处置
     var grid2 = mini.get("datagrid2");
	 grid2.load({"audit_state":"5"});
	 grid2.on("drawcell", function (e) {
                var record = e.record,
                column = e.column,
                field = e.field,
                value = e.value;
        //日期转化
        if (column.field == "startTime") {
        	e.cellHtml=ChangeDateFormat(e.value)
        }
        if (column.field == "dealDate") {
        	e.cellHtml=ChangeDateFormat(e.value)
        }
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
        //将使用状态替换文本--使用状态
        if (column.field == "usingState") {
            if (e.value == 1) {
                e.cellHtml = "在用"
            }
            if (e.value == 2) {
                e.cellHtml = "闲置"
            }
            if (e.value == 3) {
                e.cellHtml = "其他"
            }
            if (e.value == 4) {
                e.cellHtml = "损毁待报废"
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

	 /*查询-条件--处置*/
    function search2(){
        var key1 = ChangeDateFormat2(mini.get("combo6").getValue());
        var key2 = ChangeDateFormat2(mini.get("combo7").getValue());
		grid2.load({"deal_date_str":key1,"deal_date_end":key2,"audit_state":"5"});   
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

    //审核状态
    function AuditStatus1(){
    var assetName=grid2.getSelecteds();
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

    //审核记录
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
    //审核记录
    function auditRecord1(){
    var data = grid2.getSelected();
    if(typeof(data)!="undefined"){
    $.ajax({
    url:"${basePath}jbpm/findAuditLogsByParam",
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

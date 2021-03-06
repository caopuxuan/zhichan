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
    <title>资产处置申请</title>
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
                        <em class="search-tit">处置方式：</em>
                        <input id="combo1" class="mini-combobox" style="width:150px;" textField="valued" valueField="types" emptyText="请选择..."
                               onbuttonclick="combobox('czfs','combo1')" allowInput="true" popupHeight="100px" />     
                        <input id="cbox1" name="audit_state" class="mini-checkbox" value="" text="待提交"/>
                        <input id="cbox2" name="audit_state" class="mini-checkbox" value="" text="待审核"/>     
                        <input id="cbox3" name="audit_state" class="mini-checkbox" value="" text="已审核"/>
                        <input id="cbox4" name="audit_state" class="mini-checkbox" value="" text="已退回"/>     
                    </td>
                </tr>
                <tr>
                    <td style="width:100%;">
                        <a class="mini-button btn1" onclick="search()">查询</a>
                        <a class="mini-button btn2" href="${basePath}view/asset/Assets-New-disposal.jsp" target="_blank">新增</a>
                        <a class="mini-button btn3" onclick="edit()">编辑</a>
                        <a class="mini-button btn4" onclick="remove()">删除</a>
                        <a class="mini-button btn5" onclick="submitData()">提交</a>
                        <a class="mini-button btn1" onclick="">打印</a>
                        <a class="mini-button btn5" onclick="AuditStatus()">审核状态</a>
    <a class="mini-button btn5" onclick="auditRecord()">审核记录</a>
                    </td>
                </tr>

            </table>
        </div>
    </div>

    <div id="datagrid1" class="mini-datagrid report-table" style="height:480px;" allowResize="false"
         url="${basePath}findDealByBT"  idField="id" multiSelect="true" showPager="false" >
        <div property="columns">
            <div type="checkcolumn" ></div>
            <div field="dealNumber" name="dealNumber" width="120" headerAlign="center">申请单号</div>
            <div field="applicationUnit" name="applicationUnit" width="120" headerAlign="center">申请单位</div>
            <div field="dealMode" name="dealMode" width="120" headerAlign="center">处置方式</div>
            <div field="original" name="original" width="100" headerAlign="center">资产原值</div>
            <div field="equity" name="equity" width="100" headerAlign="center">资产净值</div>
            <div field="applicant" name="applicant" width="100" headerAlign="center">申请人</div>
            <div field="applicationDate" name="applicationDate" width="100" headerAlign="center">申请时间</div>
            <div field="applicationReasons" name="applicationReasons" width="100" headerAlign="center">申请理由</div>
            <div field="dealStatus" name="dealStatus" width="100" headerAlign="center" >状态</div>
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
    
    //查询-All
     var grid4 = mini.get("datagrid1");
	 grid4.load({"deal_status":"1,2,3,6"});
	 grid4.on("drawcell", function (e) {
                var record = e.record,
                column = e.column,
                field = e.field,
                value = e.value;
        //日期转化
        if (column.field == "applicationDate") {
        	e.cellHtml=ChangeDateFormat(e.value)
        }
        //将使用状态替换文本--处置方式
        if (column.field == "dealMode") {
            if (e.value == 1) {
                e.cellHtml = "出售"
            }
            if (e.value == 2) {
                e.cellHtml = "捐赠"
            }
            if (e.value == 3) {
                e.cellHtml = "报废"
            }
            if (e.value == 4) {
                e.cellHtml = "其他"
            }
        }
        //将资产大类替换文本--状态
        if (column.field == "dealStatus") {
            if (e.value == 1) {
                e.cellHtml = "待提交"
            }
            if (e.value == 2) {
                e.cellHtml = "待审核"
            }
            if (e.value == 3) {
                e.cellHtml = "已审核"
            }
            if (e.value == 4) {
                e.cellHtml = "待处置"
            }
            if (e.value == 5) {
                e.cellHtml = "已处置"
            }
            if (e.value == 6) {
                e.cellHtml = "已退回"
            }
        }
    });
	 /*查询-条件*/
    function search() {
        var key1 = mini.get("combo1").getValue();
        var key2="";
        if(mini.get("cbox1").checked){
        	key2=key2+"1";
        }
        if(mini.get("cbox2").checked){
        	if(mini.get("cbox1").checked){
        		key2=key2+",2";
        	}else{key2=key2+"2";}
        }
        if(mini.get("cbox3").checked){
        	if(mini.get("cbox1").checked||mini.get("cbox2").checked){
        		key2=key2+",3";
        	}else{key2=key2+"3";}
        }
        if(mini.get("cbox4").checked){
        	if(mini.get("cbox1").checked||mini.get("cbox2").checked||mini.get("cbox3").checked){
        		key2=key2+",6";
        	}else{key2=key2+"6";}
        }
        grid4.load({"deal_mode":key1,"deal_status":key2});
    }
    /*提交*/
	function submitData() { 
		var value = grid4.getSelected();
		
        if(typeof(value)!="undefined"){
        	if (confirm("确定提交选中记录？")) {
        		if(value.auditState!=3){
        		grid4.loading("操作中，请稍后......");
        		var id = value.dealNumber;
                $.ajax({
                	type:'post',
                    url: "${basePath}updatebyDid",
                    data: {"dealNumber":id, "dealStatus":"3","auditOpinion":""},		
                    success: function (text) {
                    	if(text==1){
                    		alert("提交成功");
                    	}else{
                    		alert("异常");
                    	}
                        grid4.reload();
                    },
                    error: function () {
                    	alert("请求失败");
                    }
                });	
        	}else{
        		alert("审核数据不能提交");
        	}
        	}
        	
    }else{
    		alert("请选中一条记录");
    	}
    }
	/*删除*/    
    function remove() {
    	var value = grid4.getSelected();
        if(typeof(value)!="undefined"){
        	if (confirm("确定删除选中记录？")) {
        		if(value.auditState==1||value.auditState==6){
        		var id = value.dealNumber;
        		grid4.loading("操作中，请稍后......");
                $.ajax({
                	type:'post',
                    url: "${basePath}deleteDeal?dealNumber=" +id,
                    success: function (text) {
                    	if(text==1){
                    		alert("提交成功");
                    	}else{
                    		alert("异常");
                    	}
                        grid4.reload();
                    },
                    error: function () {
                    	alert("请求失败");
                    }
                });	
        	}else{
        		alert("待审核状态不可删除");
        	}
        	}
        }else{
    		alert("请选中一条记录");
    	}
	}


	/*编辑*/
	function edit() {  
		var value=grid4.getSelected();
        if (typeof(value)!="undefined") {
            if (confirm("确定编辑选中记录？")) {
                var id = value.dealNumber;
                window.open("${basePath}view/asset/Assets-New-disposal.jsp?dealNumber="+id); 
		   }
          
        }else {
            alert("请选中一条记录");
        } 
   }

   //审核状态
    function AuditStatus(){
    var assetName=grid4.getSelecteds();
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
    var data = grid4.getSelected();
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

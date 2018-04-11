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
    <title>资产处置审批</title>
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
                        <em class="search-tit">申请单号：</em>
                        <input id="combo1" class="mini-textbox" style="width:150px;" emptyText="请输入..." allowInput="true" />
                        <em class="search-tit">申请单位：</em>
                        <input id="combo2" class="mini-combobox" style="width:150px;" textField="text" valueField="id" emptyText="请选择..."
                               url="" value=""  allowInput="true" showNullItem="true"/>
                        <em class="search-tit">处置方式：</em>
                        <input id="combo3" class="mini-combobox" style="width:150px;" textField="valued" valueField="types" emptyText="请选择..."
                               allowInput="true" onbuttonclick="combobox('czfs','combo3')" popupHeight="100px"/>
                        <input id="cbox1" name="audit_state" class="mini-checkbox" value="" text="待审核"/>
                        <input id="cbox2" name="audit_state" class="mini-checkbox" value="" text="已审核"/>      
                    </td>
                </tr>
                <tr>
                    <td style="width:100%;">
                        <a class="mini-button btn1" onclick="search()">查询</a>
                        <a class="mini-button btn1" onclick="verify()">审核</a>
                        <a class="mini-button btn1" onclick="moreVerify()">批量审核</a>
                        <a class="mini-button btn5" onclick="AuditStatus()">审核状态</a>
    <a class="mini-button btn5" onclick="auditRecord()">审核记录</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div id="datagrid1" class="mini-datagrid report-table" style="height:480px;" allowResize="false"
         url="${basePath}findDealByBT"  idField="id" multiSelect="true" showPager="false">
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
	            }
	        })
	};
	
	//查询-All
     var grid4 = mini.get("datagrid1");
	 grid4.load();
	 
	 grid4.on("drawcell", function (e) {
                var record = e.record,
                column = e.column,
                field = e.field,
                value = e.value;
        //日期转化
        if (column.field == "applicationDate") {
        	e.cellHtml=ChangeDateFormat(e.value)
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
        //将使用状态替换文本--状态
        if (column.field == "auditState") {
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
                e.cellHtml = "以处置"
            }
            if (e.value == 6) {
                e.cellHtml = "已退回"
            }
        }
        //将处置方式替换文本--处置方式
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
    });

	 /*查询-条件*/
    function search() {
        var key1 = mini.get("combo1").getValue();
        var key2 = mini.get("combo2").getValue();
        var key3 = mini.get("combo3").getValue();
        
        var key4="";
        if(mini.get("cbox1").checked){
        	key4=key4+"2";
        }
        if(mini.get("cbox2").checked){
        	if(mini.get("cbox1").checked){
        		key4=key4+",3";
        	}else{key4=key4+"3";}
        }
        grid4.load({"deal_number":key1,"application_unit":key2,"deal_mode":key3,"deal_status":key4});
    }
    
    /*审核*/
	function verify(){  
		var value=grid4.getSelecteds();
        if (value!="") {
        	if(value.length>1){
        		alert("请选择一条数据进行审核，多条数据请点击批量审核！");
        	}else{
	            if (confirm("确定审核选中记录？")) {
	            	if(value.auditState!=3){
	                //编辑跳转页面--按资产大类
	                var id = value[0].dealNumber;
	                window.location.href="${basePath}view/asset/Approval-assets-disposal.jsp?dealNumber=" +id;
	
	            }else{
	        		alert("审核数据不能提交");
	        	}
		   	}
           }
          
        }else {
            alert("请选中一条记录");
        } 
        
   }
	
	//批量审核	
	function moreVerify(){  
		var value=grid4.getSelecteds();
        if (value!="") {
            if (confirm("确定审核选中记录？")) {
                //批量审核
               sessionStorage.setItem("value",JSON.stringify(value))
		       window.location.href="${basePath}view/asset/Asset-approval-batch.jsp";
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

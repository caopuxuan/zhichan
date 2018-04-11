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
<head lang="en">
    <meta charset="UTF-8">
    <title>资产处置批量审核</title>
    <link href="scripts/miniui/themes/default/miniui.css" rel="stylesheet" type="text/css" />
    <link href="scripts/miniui/themes/icons.css" rel="stylesheet" type="text/css" />
    <link href="css/reset.css" rel="stylesheet" type="text/css" />
    <link href="css/report.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="scripts/jquery.min.js"></script>
    <script type="text/javascript" src="scripts/miniui/miniui.js"></script>
    <script type="text/javascript" src="js/assets.js"></script>
</head>
<body>
<div class="yusuan-up" style="margin-top: 10px">
    <div style="width:98%; margin:0 auto 10px;">
        <div class="mini-toolbar" style="border:0;padding:0px;background: none">
            <table style="width:100%;">
                <tr>
                    <td style="width:45%;">
                        <a class="mini-button btn1" onclick="window.history.back();" plain="true">返回</a>
                        <a class="mini-button btn2" onclick="adopt('3')" plain="true">通过</a>
                        <%--<span class="separator"></span>--%>
                        <%--<a class="mini-button btn3" onclick="adopt('6')" plain="true">退回</a>--%>
                    </td>
                    <td style="white-space:nowrap;font-size: 15px">
                        <h3>资产处置批量审核</h3>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="datagrid1" class="mini-datagrid" style="width:98%;height:280px;margin:0 auto" allowResize="false"
         url=""  idField="id" multiSelect="true"
         showPager="false"  >
        <div property="columns">
            <div header="处置明细" headerAlign="center">
                <div property="columns">
                    <div field="dealNumber" name="dealNumber" width="100" headerAlign="center" renderer="">申请单号</div>
                    <div field="applicationUnit" name="applicationUnit" width="100" headerAlign="center" >申请单位</div>
                    <div field="dealMode" name="dealMode" width="100" headerAlign="center" renderer="">处置方式</div>
                    <div field="applicationReasons" name="applicationReasons" width="100" headerAlign="center">申请理由</div>
                </div>
            </div>
        </div>
    </div>
    <div class="item-footer" style="width: 98%;margin: 10px auto">
        <div id="form9" class="mini-datagrid" style="width:22%;height:auto;float: left"
             url="" idField="id"
             allowResize="false" pageSize="20"
             allowCellEdit="true" allowCellSelect="true" multiSelect="true"
             allowCellValid="true" oncellvalidation="onCellValidation"
             showPager="false" showColumns="true"
                >
            <div property="columns">
                <div type="checkcolumn" width="20"></div>
                <div field="POINT" width="120" headerAlign="center" allowSort="true">
                	审核意见
                </div>
            </div>
        </div>

        <div class="right-tit" style="float: left;width: 47%;text-align: center;margin-top: 3px">
            <div style="text-align: right">审核意见：<textarea id="content1" style="width:80%;height:100px" class="mini-textarea" emptyText="审核意见"></textarea></div>
        </div>
        <div class="examine-right" style="float: right;width: 30%;margin-top: 15px;">
            审核人：<input style="width: 85%" value="单位领导" class="mini-textbox" borderStyle="border:0"/>
            审核时间：<input id="shenhetime" value="" class="mini-textbox" borderStyle="border:0"/>
        </div>
    </div>
</div>
<script>
    mini.parse();
        var flowUrlpath="<%=flowUrlpath%>";
    var grid2=mini.get("form9");
    
    var grid3=mini.get("datagrid1");
    grid3.on("drawcell", function (e) {
                var record = e.record,
                column = e.column,
                field = e.field,
                value = e.value;
                
        //将使用状态替换文本--使用状态
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

    //审核时间
    var d=new Date();
	youWant=d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ' + d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds(); 
	mini.get(shenhetime).setValue(youWant);
    function showTime(){
		var d=new Date();
		youWant=d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ' + d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds(); 
		mini.get(shenhetime).setValue(youWant);
	}
	setInterval("showTime()",1000);
    
    //批量审核
    var grid1=mini.get("datagrid1");
    var date=JSON.parse(sessionStorage.getItem("value"));
    //清空session
    sessionStorage.clear();
    //页面赋值
    grid1.setData(date);
    //取所有id   
    var editId="' '";
			for (var i=0;i<date.length;i++) {
				editId=editId+","+"'"+date[i].dealNumber+"'";
			}
        var editId1=date[0].bpmId;
    $.ajax({
    url:flowUrlpath+"jbpm/findApprovalElement",
    type:"post",
    data:{"bpmId":editId1},
    success:function(text){
    console.log(text);
    grid8.setData(text,false);
    },
    error:function(){
    alert("数据请求失败")
    }
    })
    //审核通过操作			
	function adopt(state) {
	if (mini.get("content1").getValue() == "") {
		if (state == '6') {
			alert('请在审核意见处填写退回理由！');
			return;
		} else {
			mini.get("content1").setValue("通过");
			}
		}
	var grid8 = mini.get("form9");
	var selecteds = grid8.getSelecteds().length;
	var rows = grid8.getData().length;
	//审核要素--全选
	if (selecteds != rows&&state == '3') {
		alert("请选中所有审核要素！");
	} else {

		alert(editId+"+"+state,"+",mini.get("content1").getValue());
		if (confirm("确定提交？")) {
			$.ajax({
				type : 'post',
				url : "${basePath}updatebyDid",
				data : {
					"dealNumber" : editId,
					"dealStatus" : state,
					"auditOpinion" : mini.get("content1").getValue()
				},
				success : function(text) {
					if (text == date.length) {
						alert("提交成功");
    window.history.back();
					} else {
						alert("异常");
					}
				},
				error : function() {
					alert("请求失败");
				}
			});
		}
		
	}
}
    
    
    
    
</script>
</body>
</html>
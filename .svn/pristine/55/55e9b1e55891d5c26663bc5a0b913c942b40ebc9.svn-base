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
    <title>资产卡片批量审核</title>
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
                        <h3>资产卡片批量审核</h3>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="datagrid1" class="mini-datagrid" style="width:98%;height:280px;margin:0 auto" allowResize="false"
         url=""  idField="id" multiSelect="true"
         showPager="false"  >
        <div property="columns">
            <div header="资产卡片" headerAlign="center">
                <div property="columns">
                    <div field="cardNumber" name="cardNumber" width="100" headerAlign="center" renderer="">卡片编号</div>
                    <div field="assetName" name="assetName" width="100" headerAlign="center">资产名称</div>
                    <div field="originalValue" name="originalValue" width="100" headerAlign="center" renderer="">原值</div>
                    <div field="useDepartment" name="useDepartment" width="100" headerAlign="center">使用部门</div>
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
            审核时间：<input id="shenhetime" value="2017-08-01 13:31:22" class="mini-textbox" borderStyle="border:0"/>
        </div>
    </div>
</div>
<script>
    mini.parse();
        var flowUrlpath="<%=flowUrlpath%>";
    var grid2=mini.get("form9");
    //审核时间
	var nowTime=new Date();
	mini.get(shenhetime).setValue(nowTime);
    
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
				editId=editId+","+"'"+date[i].cardNumber+"'";
			}
   var editId1=date[0].bpmId;
    console.log(editId1);
    $.ajax({
        url:flowUrlpath+"jbpm/findApprovalElement",
        type:"post",
        data:{"bpmId":editId1},
        success:function(text){
        console.log(text);
        grid2.setData(text,false);
        },
        error:function(){
        alert("数据请求失败")
        }
    })
    //审核通过操作			
	function adopt(state) {
    var state1;
	if (mini.get("content1").getValue() == "") {
		if (state == '6') {
    state1="退回";
			alert('请在审核意见处填写退回理由！');
			return;
		} else {
    state1="通过";
			mini.get("content1").setValue("通过");
			}
		}else{
    if (state == '6') {
    state1="退回";
    } else {
    state1="通过";
    }
    }
	var grid8 = mini.get("form9");
	var selecteds = grid8.getSelecteds().length;
    /*全部数据*/
    var rowAllselect=grid8.getData();
    for(var i=0;i<rowAllselect.length;i++){
    delete rowAllselect[i]._id,
    delete rowAllselect[i]._uid
    }
    /*选中数据*/
    var rowcheckSelect=grid8.getSelecteds();
    console.log(rowcheckSelect);
    for(var i=0;i<rowcheckSelect.length;i++){
    delete rowcheckSelect[i]._id,
    delete rowcheckSelect[i]._uid
    }
    /*多行文本框的值*/
    var textareaSelect=mini.get("content1").getValue();
	var rows = grid8.getData().length;
    var params1={
        "remark":textareaSelect,
        "rowAll":rowAllselect,
        "rowCheck":rowcheckSelect,
        "state":state1,
    }
	//审核要素--全选
	if (selecteds != rows&&state == '3') {
		alert("请选中所有审核要素！");
	} else {
		alert(editId+"+"+state,"+",mini.get("content1").getValue());
		if (confirm("确定提交？")) {
			$.ajax({
				type : 'post',
				url : "${basePath}updatebyCid",
				data : {
					"cardNumber" : editId,
					"auditState" : state,
					"auditOpinion" : mini.get("content1").getValue(),
                    "params":JSON.stringify(params1)
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
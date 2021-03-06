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


		<%@ page import="java.util.UUID"%>
<%
UUID uuid = UUID.randomUUID(); 
%>

<!DOCTYPE html>
<base href="<%=basePath%>" >

<html>
<head lang="en">
<meta charset="UTF-8">
<title>资产处置申请</title>

<link href="scripts/miniui/themes/default/miniui.css"
	rel="stylesheet" type="text/css" />
<link href="scripts/miniui/themes/icons.css" rel="stylesheet"
	type="text/css" />
<link href="css/reset.css" rel="stylesheet" type="text/css" />
<link href="css/report.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="scripts/jquery.min.js"></script>
<script type="text/javascript" src="scripts/miniui/miniui.js"></script>
<script type="text/javascript" src="js/assets.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
</head>
<body>
	<div class="yusuan-up">
		<div style="border-bottom: 1px solid #999; width: 98%; margin: 0 auto">
			<div style="width: 96%; margin: 10px auto;">
				<div class="mini-toolbar"
					style="border: 0; padding: 0px; background: none">
					<table style="width: 100%;">
						<tr>
							<td style="width: 45%;"><a class="mini-button btn1"
								onclick="saveForm()" plain="true">保存</a> <a
								class="mini-button btn2" onclick="window.close();" plain="true">关闭</a>
							</td>
							<td style="white-space: nowrap; font-size: 15px">
								<h3>资产处置</h3>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="first-tabcont">

			<div class="form-cont" id="form-cont1">
				<div class="line1 clearfix ">
					<div class="lineleft boxline">
						<label>申请单号</label> <input name="dealNumber" class="mini-textbox"
							style="width: 100%" />
					</div>
					<div class="lineright boxline">
						<label>处置方式</label> <input id="combo3" name="dealMode" class="mini-combobox" style="width: 100%" textField="valued" valueField="types" emptyText="请选择..." allowInput="true" onbuttonclick="combobox('czfs','combo3')" popupHeight="100px"/>
					</div>
					<div class="lineright boxline">
						<label>申请单位</label> <input id="combo4" name="applicationUnit"
							class="mini-combobox" style="width: 100%" textField="valued" valueField="types" emptyText="请选择..." allowInput="true" onbuttonclick="combobox('sqdw','combo4')" popupHeight="100px"/>
					</div>
				</div>
				<div class="line1 clearfix ">
					<div class="lineleft boxline">
						<label>资产原值</label> <input id="yzhi" name="资产原值" class="mini-textbox"
							style="width: 100%" />
					</div>
					<div class="lineright boxline">
						<label>资产净值</label> <input id="jzhi" name="equity" class="mini-textbox"
							style="width: 100%" />
					</div>
					<div class="lineleft boxline">
						<label>申请人</label> <input name="applicant" class="mini-textbox"
							style="width: 100%" />
					</div>
				</div>
				<div class="line1 clearfix ">

					<div class="lineright boxline">
						<label>申请时间</label> <input name="applicationDate"
							class="mini-textbox" style="width: 100%" />
					</div>
				</div>
				<div class="line1 clearfix ">
					<div class="lineright">
						<label>申请理由</label>
						<textarea name="applicationReasons" class="mini-textarea"
							emptyText="请输入备注"></textarea>
					</div>
				</div>
			</div>
			<div>
				<div style="margin: 10px auto">
					<div id="attachment" class="mini-datagrid"
						style="width: 90%; height: 280px; margin: 0 auto"
						allowResize="false" url="" idField="id" showPager="false"
						>
						<div property="columns">
							<div field="type" name="type" width="100" align="center"
								headerAlign="center">附件类型</div>
							<div field="name" name="name" width="100" align="center"
								headerAlign="center">附件名称</div>
							<div field="summary" name="summary" width="100" align="center"
								headerAlign="center">附件概述
								<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
							</div>
							<div field="age" width="100" align="center" headerAlign="center" renderer="onActionRenderer2">附件上传</div>
							<div name="action" width="120" headerAlign="center"
								align="center" renderer="onActionRenderer"
								cellStyle="padding:0;">操作</div>
						</div>
					</div>
				</div>
				<div style="margin: 40px auto">
					<div style="width: 90%; margin: 20px auto;">
						<div class="mini-toolbar"
							style="border: 0; padding: 0px; background: none">
							<table style="width: 100%;">
								<tr>
									<td style="width: 45%;"><a class="mini-button btn1"
										onclick="choiceAsset()" plain="true">选择资产</a> <a
										class="mini-button btn2" onclick="" plain="true">批量选择</a></td>
								</tr>
							</table>
						</div>
					</div>
					<div id="assetcont" class="mini-datagrid"
						style="width: 90%; height: 280px; margin: 0 auto"
						allowResize="false" url="" idField="id" multiSelect="false"
						showPager="false" allowCellEdit="true" allowCellSelect="true"
						ondrawsummarycell="onDrawSummaryCell" showSummaryRow="true"
						>
						<div property="columns">
							<div name="action" width="120" headerAlign="center"
								align="center" renderer="onActionRenderer1"
								cellStyle="padding:0;">操作</div>
							<div field="cardNumber" name="cardNumber" width="100"
								align="center" headerAlign="center">卡片编号</div>
							<div field="className" name="className" width="100"
								align="center" headerAlign="center">资产分类</div>
							<div field="assetName" name="assetName" width="100"
								align="center" headerAlign="center">资产名称</div>
							<div field="originalValue" summaryType="sum" name="originalValue" width="100"
								align="center" headerAlign="center">资产原值</div>
							<div field="equity" summaryType="sum" name="equity" width="100" align="center"
								headerAlign="center">资产净值</div>
							<div field="buyDate" name="buyDate" width="100" align="center"
								headerAlign="center">购置时间</div>
							<div field="remark" name="remark" width="100" align="center"
								headerAlign="center">备注</div>
						</div>
					</div>
				</div>
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
		            error: function() {
		            	alert("提交失败");
				     }
		        })
		};
		
	//编辑跳转新增页面
        var editId=window.location.href.split("=")[1];
        if(editId!=null){
			$.ajax({
				url: "${basePath}findDealById",
		            data: { "dealNumber" : editId}, 
		            type:'post',
		            success: function (text) {
		            	//资产处置-表单
		            	var form = new mini.Form("#form-cont1");
		            	var str=text.deal;	
		            	//时间日期转化
		            	str.applicationDate=ChangeDateFormat(str.applicationDate);
						form.setData(str,false);
	
						//附件-表1
						var form2 =mini.get("attachment");
		            	var str2=text.annexes;
						form2.setData(str2);
						
						//资产-表2
						var form3 =mini.get("assetcont");
		            	var str3=text.asset;
		            	for(var n in str3 ){
			          	  str3[n].buyDate=ChangeDateFormat(str3[n].buyDate);
			          	}
						form3.setData(str3);
		            },
		            error: function() {
		            	alert("提交失败");
				     }
		        })
			}
		
/*资产部分-操作*/
	var form3 =mini.get("assetcont");
    function onActionRenderer1(e) {
        var form3 = e.sender;
        var record = e.record;
        var uid = record._uid;
        var rowIndex = e.rowIndex;
        var s = ' <a class="Delete_Button" href="javascript:delRow1(\'' + uid + '\')">删除</a>';
        return s;
    }
    function delRow1(row_uid) {
        var row = form3.getRowByUID(row_uid);
        if (row) {
            if (confirm("确定删除此记录？")) {
				form3.removeRow(row, true);
				//form3.reload();
            }
        }
    }
	/*附件部分-操作*/
	var gridfj =mini.get("attachment");
    function onActionRenderer(e) {
        var gridfj = e.sender;
        var record = e.record;
        var uid = record._uid;
        var rowIndex = e.rowIndex;
        var s =' <a class="Edit_Button" href="javascript:editRow(\'' + uid + '\')" style="margin:0 8px;color:blue;">编辑</a>'
                + ' <a class="Delete_Button" href="javascript:delRow(\'' + uid + '\')" style="margin:0 8px;color:blue;">删除</a>';
                
        if (gridfj.isEditingRow(record)) {
                s = '<a class="Update_Button" href="javascript:updateRow2(\'' + uid + '\')"  style="margin:0 8px;color:blue;">更新</a>'
                    + '<a class="Cancel_Button" href="javascript:cancelRow(\'' + uid + '\')" style="margin:0 8px;color:blue;">取消</a>'
            }
                
        return s;
    }
    
    function onActionRenderer2(e) {
	        var gridfj = e.sender;
	        var record = e.record;
	        var uid = record._uid;
	        var rowIndex = e.rowIndex;
			var s = '<div class="report-file"><span class="fielspan">选择文件</span><input class="file-prew" type="file" onchange="updateRow(' + uid + ',this)" name="upload"></div>';	     
	        return s;	       
	    }
	    //赋值 附件名称
	    function updateRow(uid,obj) {
            var row = gridfj.getRowByUID(uid);
            setTimeout(function(){
               gridfj.updateRow(row, {name: obj.value.substring(obj.value.lastIndexOf("\\")+1)});
             },300)
			
			var newRow = {};
            gridfj.addRow(newRow, 0);
        }


    	function editRow(row_uid) {
            var row = gridfj.getRowByUID(row_uid);
            if (row) {
                gridfj.cancelEdit();
                gridfj.beginEditRow(row);
            }
        }
    	
    	function cancelRow(row_uid) {            
            //gridfj.reload();
            gridfj.cancelEdit();
        }

    	function delRow(row_uid) {
            var row = gridfj.getRowByUID(row_uid);
            if (row) {
                if (confirm("确定删除此记录？")) {
                   gridfj.removeRow(row, true);
                }
            }
        }
		
		function updateRow2(row_uid) {
            var row = gridfj.getRowByUID(row_uid);           
            gridfj.commitEdit();
            gridfj.cancelEdit();
        }
		//var grid2 = mini.get("datagrid2");
//		 gridfj.on("cellbeginedit",function(e){
//			   if(e.record._state!="added") e.cancel=true;
//			})

	

		//保存表单数据//保存表单数据	
		function saveForm() {         
            var form = new mini.Form("#form-cont1").getData(); //获取表单多个控件的数据
            var editId=window.location.href.split("=")[1];
        	if(editId!=null){
        		form.dealNumber=editId;
        	}else{
        		form.dealNumber="<%=uuid%>";
        	}
            var obj = Object.assign(form);//拼接对象
			//保存表格数据
            var form2 = mini.get("attachment").getData();
            for(var n in form2 ){
            	  delete form2[n].id;
            	  delete form2[n]._id;
            	  delete form2[n]._uid;
            	  delete form2[n]._state;
            	  form2[n].dealNumber=editId;
            	  if(editId!=null){
		        		form2[n].dealNumber=editId;
		        	}else{
		        		form2[n].dealNumber="<%=uuid%>";
		        	}
            	}
            
            var form3 = mini.get("assetcont").getData();
            for(var n in form3 ){
          	  delete form3[n].id;
          	  delete form3[n]._id;
          	  delete form3[n]._uid;
          	  delete form3[n]._state;
          	  if(editId!=null){
		        		form3[n].dealNumber=editId;
		        	}else{
		        		form3[n].dealNumber="<%=uuid%>";
		        	}
          	}
           var sumdate= {deal:obj,annexes:form2,asset:form3};
           var jsondate = mini.encode(sumdate);
           
           var url="";
			if (editId != null) {
				//有id就是编辑
				url="${basePath}updateDeal";
			}else{
				//没有id就是新增
				url="${basePath}addDeal";
			}
           
            $.ajax({
                url: url,
                type: "post",
               contentType: 'application/json;charset=UTF-8',
               dataType : "json",
               data:jsondate,
                success: function (text) {
                	if(text==1){
                		alert("提交成功");
                	}else{
                		alert("异常");
                	}
                },
            error:function(){
				alert("提交失败");
			}
            });
            
            //上传
            function ajaxFileUpload() {
           	var newids = "";
           	if(editId!=null){
		        		newids=editId;
		        	}else{
		        		newids="<%=uuid%>";
		        	}
	    	  $.ajaxFileUpload({
	                url: '${basePath}upload',
	                data:{number:newids},
	                fileElementId: 'upload',
	                type:'post',
	                dataType:'text',
	                success: function (Data) {
	                	alert("提交成功!");
	                	//alert(Data);
		            },
		            error: function() {
		            	alert("提交失败!");
				     }
	            });	    	  
	        }
            
            
            
        }

		
		//资产原值、净值--列汇总
		function onDrawSummaryCell(e) {
            if (e.field == "originalValue") {
                e.cellHtml = "原值: " + e.value;
                mini.get("yzhi").setValue(e.value);
            }
            if (e.field == "equity") {
                e.cellHtml = "净值: " + e.value;
                mini.get("jzhi").setValue(e.value);
            }
        }		
		
		/*选择资产*/
		function choiceAsset(e) {
            var btnEdit = mini.get('assetcont');
            mini.open({
                url:"${basePath}view/asset/Asset-detail.jsp",                          
                title: "资产明细",
                width: 960,
                height: 500,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = mini.clone(data);
                        btnEdit.setData(data);
                    }
                }
            });            
        }    
</script>
</body>
</html>
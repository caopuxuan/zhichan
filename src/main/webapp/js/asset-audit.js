var local = window.location;  
var contextPath = local.pathname.split("/")[1];  
//var basePath = local.protocol+"//"+local.host+"/"+contextPath+"/";
var basePath=local.protocol+"//"+local.host+"/";
var flowUrlpath="<%=flowUrlpath%>";


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

	var params1={
		"remark":textareaSelect,
		"rowAll":rowAllselect,
		"rowCheck":rowcheckSelect,
		"state":state1,
	}
	console.log(state1);
	var rows = grid8.getData().length;
	//审核要素--全选
	var url=basePath+"updatebyCid";
	if(state == '3'){
		if (selecteds != rows) {
			alert("请选中所有审核要素！");
		} else {
			/*${basePath}*/
			if (confirm("确定提交？")) {

				$.ajax({
					type : 'post',
					url : url,
					data : {
						"cardNumber" : "'"+editId+"'",
						"auditState" : state,
						"auditOpinion" : mini.get("content1").getValue(),
						"params":JSON.stringify(params1)
					},
					success : function(text) {
						if (text == 1) {
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

	var content=mini.get("content1").getValue();
   var editId2="'"+editId+"'";
	//退回按钮
	if(state=="6"){
		var editBpmid=editJump.asset.bpmId;
		var editorgId=editJump.asset.orgId;

		var url1=flowUrlpath+"jbpm/select4Return1";
		if(textareaSelect!=""){
			$.ajax({
				type : 'post',
				url : url1,
				xhrFields: {
                    //允许带上凭据
                    withCredentials: true
                },
                crossDomain: true, 
				data : {
					"bpmId":editBpmid,
					"businessOrgId":editorgId
				},
				success : function(data) {
					console.log(data);
					mini.open({
						url: "../view/asset/file/return.jsp",
						title: "选择退回节点", width: data.obj.width, height: data.obj.height,
						onload: function () {
							var iframe = this.getIFrameEl();
							iframe.contentWindow.SetData(data,editBpmid,content,params1,url,editId2);
						},
						ondestroy: function (action) {
							grid4.reload();
						}
					});
				},
				error : function() {
					alert("退回失败");
				}
			});
		}else{
			alert("请填写退回意见")
		}

	}



}

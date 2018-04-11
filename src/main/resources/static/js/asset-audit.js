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
		}
	var grid8 = mini.get("form9");
	/*全部数据*/
	var rowAllselect=grid8.getData();
	for(var i=0;i<rowAllselect.length;i++){
		    delete rowAllselect[i]._id,
			delete rowAllselect[i]._uid
	}
	/*选中数据*/
	var rowcheckSelect=grid8.getSelecteds();
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
	console.log(params1);

	var selecteds = grid8.getSelecteds().length;
	var rows = grid8.getData().length;
	//审核要素--全选
	if (selecteds != rows&&state == '3') {
		alert("请选中所有审核要素！");
	} else {
		if (confirm("确定提交？")) {
			$.ajax({
				type : 'post',
				url : "../../updatebyCid",
				data : {
					"cardNumber" : "'"+editId+"'",
					"auditState" : state,
					"auditOpinion" : mini.get("content1").getValue(),
					"params":JSON.stringify(params1)
				},
				success : function(text) {
					console.log(text)
					if (text == 1) {
						alert("提交成功");
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
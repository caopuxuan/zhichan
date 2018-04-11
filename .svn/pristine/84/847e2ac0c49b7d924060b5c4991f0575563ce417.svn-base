var local = window.location;
var contextPath = local.pathname.split("/")[1];
var basePath = local.protocol + "//" + local.host + "/" + contextPath + "/";

function load() {
	var url = basePath + "findAssetById";
	$.ajax({
		url : url,
		data : {"cardNumber" : editId},
		type : 'post',
		success : function(text) {
			//财务信息
			var form = new mini.Form("#firstForm");
			var str = text.asset;			
			form.setData(str, false);
			//购置信息
			var form2 = new mini.Form("#secondForm");
			var str2 = text.asset;
			//时间日期转化
			str2.postingDate = ChangeDateFormat(str2.postingDate);
			str2.completionDate = ChangeDateFormat(str2.completionDate);
			str2.ownershipDate = ChangeDateFormat(str2.ownershipDate);
			//赋值
			form2.setData(str2, false);
			//使用信息
			var form3 = new mini.Form("#thirdForm");
			var str3 = text.asset;

			str3.startTime = ChangeDateFormat(str3.startTime);
			str3.buyDate = ChangeDateFormat(str3.buyDate);

			form3.setData(str3, false);
			//其他信息
			var form4 = new mini.Form("#fourthForm");
			var str4 = text.asset;
			form4.setData(str4, false);

			//辅助信息-表1
			var form5 = mini.get("datagrid1");
			var str5 = text.appurtenance;
			form5.setData(str5);

			//辅助信息-表2
			var form6 = mini.get("datagrid2");
			var str6 = text.subsidiaryFile;
			form6.setData(str6);

			if (mini.get("datagrid3") != null) {
				//辅助信息-表3
				var form7 = mini.get("datagrid3");
				var str7 = text.houseInstitutions;
				form7.setData(str7);
			}
			//卡片编号
			var cpbh = text.asset.cardNumber;
			$('.cardnums span').html(cpbh);
		},
		error : function() {
			alert("提交失败");
		}
	})
}

function saveForm() {
	//验证
	var fm1 = new mini.Form("#firstForm"); //获取表单
	var fm2 = new mini.Form("#secondForm");
	var fm3 = new mini.Form("#thirdForm");
	var fm4 = new mini.Form("#fourthForm");

	fm1.validate();
	fm2.validate();
	fm3.validate();
	fm4.validate();
	if (fm1.isValid() == false && fm2.isValid() == false
			&& fm3.isValid() == false && fm4.isValid() == false) {
		alert("验证不通过！");
		//return;
	}
	//保存表单数据
	var form = new mini.Form("#firstForm").getData(); //获取表单多个控件的数据
	var form2 = new mini.Form("#secondForm").getData();
	var form3 = new mini.Form("#thirdForm").getData();
	var form4 = new mini.Form("#fourthForm").getData();
	form.cardNumber = editId;
	var obj = Object.assign(form, form2, form3, form4);//拼接对象
	//保存表格数据
	var form5 = mini.get("datagrid1").getData();
	for ( var n in form5) {
		delete form5[n].id;
		delete form5[n]._id;
		delete form5[n]._uid;
		delete form5[n]._state;
		form5[n].cardNumber = editId;
	}
	var form6 = mini.get("datagrid2").getData();
	for ( var n in form6) {
		delete form6[n].id;
		delete form6[n]._id;
		delete form6[n]._uid;
		delete form6[n]._state;
		form6[n].cardNumber = editId;
	}
	var form7;
	if (mini.get("datagrid3") != null) {
		var form7 = mini.get("datagrid3").getData();
		for ( var n in form7) {
			delete form7[n].id;
			delete form7[n]._id;
			delete form7[n]._uid;
			delete form7[n]._state;
			form7[n].cardNumber = editId;
		}
	}
	var sumdate = {
		asset : obj,
		appurtenance : form5,
		subsidiaryFile : form6,
		houseInstitutions : form7
	};
	var jsondate = mini.encode(sumdate);
	$.ajax({
		url : url,
		type : "post",
		contentType : 'application/json;charset=UTF-8',
		dataType : "json",
		data : jsondate,
		success : function(text) {
			if (text == 1) {
				alert("提交成功");
				//上传ajax方法
				ajaxFileUpload(editId, "upload");
				//判断是否为“连续保存‘
				if (mini.get('allSave').value == "true") {
					location.reload();
				} else {
					window.close();
				}
			} else {
				alert("异常");
			}
		},
		error : function() {
			alert("提交失败");
		}
	});
}

//上传方法
function ajaxFileUpload(id, name) {
	var url = basePath + "upload";
	$.ajaxFileUpload({
		url : url,
		data : {number : id},
		fileElementId : name,
		type : 'post',
		dataType : 'text',
		success : function(Data) {
			alert(Data);
		},
		error : function() {
			alert("提交失败!");
		}
	});
}
//增加删除行
function AorDRow(datagridname, AorD) {
	var grid = mini.get(datagridname);
	//添加行
	if (AorD == "A") {
		grid.on("cellbeginedit", function(e) {
			if (e.record._state != "added")
				e.cancel = true;
		})
		grid.addRow({}, 0);
		//删除行
	} else {
		var rows = grid.getSelecteds();
		if (rows.length > 0) {
			grid.removeRows(rows, true);
		} else {
			alert("请选择一条数据！");
		}
	}
}
//下拉框ajax请求
function combobox(value, id) {
	var combox = mini.get(id);
	var url = basePath + "findByCode";
	$.ajax({
		url : url,
		data : {
			"code" : value
		},
		type : 'post',
		success : function(jsonData) {
			combox.load(jsonData);
		},
		error : function() {
			alert("提交失败");
		}
	})
};


//计量单位
function combobox2(value, id) {
	var url = basePath + "findByCodeUnit";
	var combox = mini.get(id);
	$.ajax({
		url : url,
		data : {"code" : value},
		type : 'post',
		success : function(jsonData) {
			combox.load(jsonData);
		},
		error : function() {
			alert("提交失败");
		}
	})
};

/*类别名称*/
function onButtonEdit(e) {
	var btnEdit = this;
	var url = basePath + "view/asset/maintenance/SelectTreeWindow.jsp";
	mini.open({
		url : url,
		showMaxButton : false,
		title : "选择类别名称",
		width : 350,
		height : 350,
		ondestroy : function(action) {
			if (action == "ok") {
				var iframe = this.getIFrameEl();
				var data = iframe.contentWindow.GetData();
				data = mini.clone(data);
				if (data) {
					btnEdit.setValue(data.code);
					btnEdit.setText(data.name);
				}
			}
		}
	});
}
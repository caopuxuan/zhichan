var ApproveApplicationDialog = {
		/** 初始化弹框 */
		createApproveApplicationDialog:function(){
			$('#approveApplicationDialog').dialog({    
			    width: 540,    
			    height: 320,  
			    top:25,
			    closed: true,    
			    cache: false,
			    modal: true,
			    onClose : function(){
					$('#approveApplicationDialogForm').form('clear');
			    },
			    buttons:[{text:'通过',handler:ApproveApplicationDialog.approveApplicationToEnding},
			             {text:'退回',
			    		handler:function(){
			    			 if(!$("#application_approveExplain").textbox("getValue")){
				         			$.messager.alert('提示','请填写审批说明！','info');
				         			return
				         		}
			    			 	var row = $('#approveApplicationDataGrid').datagrid("getSelected");
				    			var options={};
				    			options.bpmId=row.bpmId;
				    			options.businessOrgId=row.applyOrgId;
				    			options.approveBack=ApproveApplicationDialog.approveApplicationBack;
				    			CommonData.disableButten("approveApplicationDialog");
				    			CommonData.select4Return(options);
			    			}
			    		},
			             {text:'关闭',handler:ApproveApplicationDialog.closeApproveApplicationDialog}]
			}); 
			
		},
		
		/** 弹框中的通过按钮 */
		approveApplicationToEnding:function(){
			var data = ApproveApplicationDataGrid.getData('approveApplicationDialogForm');
			var row = $('#findElemen').datagrid("getChecked");
			var rowCheck = $('#findElemen').datagrid("getChecked");
			var rowAll = $('#findElemen').datagrid("getRows");
			data.rowCheck=rowCheck;
			data.rowAll=rowAll;
			data.state = '通过';
			if(row.length == rowAll.length){
				//alert(JSON.stringify(data));
				CommonData.disableButten("approveApplicationDialog");
				ApproveApplicationDialog.submit(data);
			}else{
				parent.$.messager.alert('提示',"需满足所有审核要素才可通过！",'info');
				return ;
			}
		},
		/** 弹框中的驳回按钮 */
		approveApplicationBack:function(state){
			var data = ApproveApplicationDataGrid.getData('approveApplicationDialogForm');
			data.state = state;
			var rowCheck = $('#findElemen').datagrid("getChecked");
			var rowAll = $('#findElemen').datagrid("getRows");
			data.rowCheck=rowCheck;
			data.rowAll=rowAll;
			//alert(JSON.stringify(data));
			ApproveApplicationDialog.submit(data);
		},
		/** 提交数据 */
		submit:function(params){
			$.ajax({
				type : "POST",
				dataType : "json",
//				contentType : "application/json",
				url :"applicationForm/approveApplication.do",
				data : {
					params:JSON.stringify(params)
				},
				cache : false,
				success : function(data) {
					if(data.success==true){
						parent.$.messager.alert('提示',data.successInfo,'info');
						$('#approveApplicationDataGrid').datagrid("reload");
						$('#approveApplicationDialog').dialog('close');
						CommonData.enableButten("approveApplicationDialog");
						CommonData.closeSelect4Return();
					}else{
						parent.$.messager.alert('提示',data.errorInfo,'info');
					}
				}
			});
		},
		/** 弹框中的关闭按钮 */
		closeApproveApplicationDialog:function(){
			$('#approveApplicationDialog').dialog('close');
		}
		
};
var ApproveApplicationDataGrid = {
		/** 初始化dataGrid */
		createApproveApplicationDataGrid:function(){
			var queryData = ApproveApplicationDataGrid.getData('approveApplicationQueryForm');
			queryData.isAssignee= '1';//标识流程中是否为第一个节点
			
			$('#approveApplicationDataGrid').datagrid({
				url:'applicationForm/findByparameter.do',
				toolbar:'#approveApplicationQuery',
				fit:true,
				rownumbers:true,
				singleSelect:true,
				pagination:true,
				loadFilter: pagerFilter,
				queryParams:{
					params:JSON.stringify(queryData)
				},
				columns:[[{field:'applicationformCode',title:'申请单号',width:'130',halign:'center',align:'center',
					formatter: function(value,row,index){
						return '<a href=\"http://'+modelUrlpath+'/application/toApplication?applicationformCode='+row.applicationformCode+'&tenantCode='+tenantCode+'&orgId='+orgId+'&fiscalYear='+fiscalYear+'&userId='+user.userId+'\" target="_Blank"  >'+value+"</a>";/*onclick="ApplicationDialog.openView('+index+')"*/ 
//						return "<a href='javascript:void(0);' onclick='ApproveApplicationDataGrid.applicationView("+index+");' >"+ row.applicationformCode +"</a>";
					}
				},
		          {field:'keyWord',title:'主题词',width:'180',halign:'center',align:'left'},
		          {field:'applyOrgName',title:'申请部门',width:'80',halign:'center',align:'center'},
		          {field:'userName',title:'经办人',width:'80',halign:'center',align:'center'},
		          {field:'sumApplyAmount',title:'申请金额',width:'130',halign:'center',align:'right',
		        	  formatter : function(value,row,index){
			             	 return Util.numberFormat(value,FORMATMONEYCODEFORBPM_2); 
			             	}
		          },
		          {field:'sumUsedAmount',title:'使用金额',width:'130',halign:'center',align:'right',
		        	  formatter : function(value,row,index){
			             	 return Util.numberFormat(value,FORMATMONEYCODEFORBPM_2); 
			             	}
		          },
		          {field:'applicationTime',title:'申请日期',width:'90',halign:'center',align:'center'},
		          {field:'unitName',title:'使用部门',width:'80',halign:'center',align:'center'},
		          {field:'stateName',title:'状态',width:'80',halign:'center',align:'center',
		        	  formatter : function(value,row,index){
		        		  if(row.state!='3' && row.isReturn==2){
		        			  return "已审批";
		        		  }
		        		  return value;
		        	  }},
		          {field:'title',title:'签报标题',width:'200',halign:'center',align:'left'},
		         /* {field:'bpmId',title:'流程审批主键'}*/
		          ]]
			});
			
			
			/** 表头的按钮点击事件 */
			$('#approveApplicationSearch').click(ApproveApplicationDataGrid.searchApproveApplication);
			$('#approveApplicationApprove').click(ApproveApplicationDataGrid.approveapproveApplication);
			$('#approveApplicationBpm').click(ApproveApplicationDataGrid.applicationBpm);
			$('#approveApplicationLogs').click(ApproveApplicationDataGrid.approveApplicationLogs);
		},
		/** 查询按钮 */
		searchApproveApplication:function(){
			//将字符串转换为Date
			var beginDate = new Date(Date.parse($('#applicationTimeBegin').datebox('getValue'))).getTime();
			var endDate = new Date(Date.parse($('#applicationTimeEnd').datebox('getValue'))).getTime();

			//判断日期
			if(beginDate != null && beginDate !=""){
				if(endDate < beginDate ){
					parent.$.messager.alert('提示','截止日期必须大于开始日期！','warning');//提示
					return;
				}
			}
			var queryData = ApproveApplicationDataGrid.getData('approveApplicationQueryForm');
			$('#approveApplicationDataGrid').datagrid('load',{
				params:JSON.stringify(queryData)
			});
		},
		/** 审批按钮 */
		approveapproveApplication:function(){
			var selectedRow = $("#approveApplicationDataGrid").datagrid("getSelected");
			if(!selectedRow){
				parent.$.messager.alert('提示','请选择一条记录进行操作！','info');
				return;
			}
			if(selectedRow.state !='2'){
				parent.$.messager.alert('提示','此数据不允许审批操作！','info');
				return;
			}
			if(selectedRow.stateName !='待审批'){
				parent.$.messager.alert('提示','此数据不允许审批操作！','info');
				return;
			}
			$('#approveApplicationDialogForm').form('load',selectedRow);
			$('#approveApplicationDialog').dialog({
				title:'执行申请审批'
			});
			$('#approveApplicationDialog').dialog('open');
			//alert(JSON.stringify(selectedRow));
			
			/*$("#findElemen").datagrid('load',{bpmId:selectedRow.bpmId,});*/
			$("#findElemen").datagrid({
				url:'applicationForm/findApprovalElement.do',
				fit:true,
			    rownumbers:false,
			    async: false,
			    queryParams: {
			    	params : JSON.stringify({
			    		bpmId:selectedRow.bpmId,
			    		tenantCode : tenantCode,
						orgId: orgId
					})
				},
			    columns:[[
			    	{field:'',checkbox:true},
			        {field:'POINT',title:'审核要点',width:178,align:'left'},
			        {field:'TENANT_CODE',hidden:true}
			    ]],
			    onLoadSuccess:function(data){
			    	//alert(JSON.stringify(data));
			    }
			});
		},
		//审核记录按钮
		approveApplicationLogs:function(){
			var selectedRow = $("#approveApplicationDataGrid").datagrid("getSelected");
			if(!selectedRow){
				parent.$.messager.alert('提示','请选择一条记录进行操作！','info');
				return;
			}
			
			
			CommonData.approveResultFn("auditLog/findAuditLogsByParam.do",{source : 'ZCGL_APPLICATIONFORM',businessId : selectedRow.applicationformId});
			$('#bg_layer,.shenhe').fadeIn();
			
		},
		applicationBpm : function(){
			var row= $("#approveApplicationDataGrid").datagrid("getSelected");
			if(!row){
				$.messager.alert('提示','请选择一条记录进行操作！','info');
				return;
			}
			var queryDatas = {};
			//序列化Form表单数据serializeArray
			var formDatas = $('#approveApplicationQueryForm').serializeArray();
			//把表单数据转换成JSON对象
			$.each(formDatas,function(i,field){
				//将form中多个checkBox的值处理为json数组
				if(field.name.indexOf("[]") >=0){
					var fieldName = field.name.substring(0,field.name.indexOf("[]"));
					if(!queryDatas[fieldName]){
						queryDatas[fieldName] = [];
					}
					queryDatas[fieldName].push(field.value);
				}else{
					queryDatas[field.name] = field.value;
				}
			});
			//alert(JSON.stringify(row));
			/*if(queryDatas.approverId || (queryDatas.state && queryDatas.state[0] == '4')){
				$.messager.alert('提示','请在未审批状态下查看审批状态！','info');
				return;
			}*/
			if(row.state=='3' || row.state=='4'){
				$.messager.alert('提示','该状态下不可查看审批状态！','info');
				return;
			}
			if(!row.bpmId){
				return;
			}
			CommonData.processProgressDiv(row.bpmId);
		},
		/** 根据formId获取表单的数据 */
		getData:function(formId){
			var form = $('#'+ formId +'');
			var queryDatas = {};
			//序列化Form表单数据serializeArray
			var formDatas = form.serializeArray();
			//把表单数据转换成JSON对象
			$.each(formDatas,function(i,field){
				//将form中多个checkBox的值处理为json数组
				if(field.name.indexOf("[]") >=0){
					var fieldName = field.name.substring(0,field.name.indexOf("[]"));
					if(!queryDatas[fieldName]){
						queryDatas[fieldName] = [];
					}
					queryDatas[fieldName].push(field.value);
				}else{
					queryDatas[field.name] = field.value;
				}
			});
			if(queryDatas.isApprove||queryDatas.approverId){
				//如果为查询待审批数据
				if(queryDatas.state){
					queryDatas.state.push("2");
				}else{
					queryDatas.state=new Array();
					queryDatas.state.push("2");
				}
			}
			return queryDatas;
		},
		applicationView:function(index){
			var row = $("#approveApplicationDataGrid").datagrid("getRows")[index];
			ApplicationView.openView(row);
			$("#application_dg").dialog({
				title:'执行申请明细'
			});
			$("#application_orgId").combobox("setText",row.applyOrgName);
			$("#applicationForm_unitId").combobox("setText",row.unitName);
			$("#application_dg").dialog('open');
		}
};
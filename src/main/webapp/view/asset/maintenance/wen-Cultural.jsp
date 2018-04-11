<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<base href="<%=basePath%>" >
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>
        文物、陈列品
    </title>
    <link href="scripts/miniui/themes/default/miniui.css" rel="stylesheet" type="text/css" />
    <link href="scripts/miniui/themes/icons.css" rel="stylesheet" type="text/css" />
    <link href="css/reset.css" rel="stylesheet" type="text/css" />
    <link href="css/report.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="scripts/jquery.min.js"></script>
    <script type="text/javascript" src="scripts/miniui/miniui.js"></script>
    <script type="text/javascript" src="js/assets.js"></script>
    <script type="text/javascript" src="js/asset-maintenance.js"></script>
    <script type="text/javascript" src="js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="js/uuid.js"></script>
</head>
<body>
<div class="yusuan-up">
    <div style="width:96%; margin:10px auto;">
        <div class="mini-toolbar" style="border:0;padding:0px;background: none">
            <table style="width:100%;">
                <tr>
                    <td style="width:45%;">
                        <a class="mini-button btn1" onclick="saveForm()" plain="true">保存</a>
                        <a class="mini-button btn2" onclick="window.close();" plain="true">关闭</a>
                        <input id="allSave" name="audit_state" class="mini-checkbox" value="1" text="连续保存"/>
                    </td>
                    <td style="white-space:nowrap;font-size: 15px">
                        <h3>文物、陈列品资产卡片</h3>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="tab-main" style="width: 96%; margin:0 auto;">
        <div class="reim-main clearfix">
            <div class="report-tabs">
                <div class="tb-rp">
                    <div class="line1 clearfix cardnums">
                        <label>卡片编号:</label>
                        <span></span>
                    </div>
                </div>
                <div class="mini-tabs" activeIndex="0"  style="width:100%;height:480px;">
                    <div title="财务信息">
                        <div class="first-tabcont" id="firstForm">
                            <div class="line1 clearfix ">
                                <div class="lineleft boxline">
                                    <label>类别名称</label>
                                    <input id="combo1" name="className" class="mini-buttonedit" style="width:100%" textField="valued" valueField="types" emptyText="请选择..." onbuttonclick="onButtonEdit" allowInput="false" popupHeight="100px" required="true"/>
                                </div>
                                <div class="lineright boxline">
                                    <label>资产代码</label>
                                    <input name="assetCode" class="mini-textbox" style="width:100%" readonly/>
                                </div>
                                <div class="lineright boxline">
                                    <label>资产名称</label>
                                    <input name="assetName" class="mini-textbox" style="width:100%" required="true"/>
                                </div>
                            </div>
                            <div class="line1 clearfix ">
                                <div class="lineleft boxline">
                                    <label>增加方式</label>
                                    <input id="combo2" name="additionMethod" class="mini-combobox" style="width:100%" textField="valued" emptyText="请选择..." valueField="types" allowInput="true" onbuttonclick="combobox('zjfs','combo2')" popupHeight="100px" required="true" onvalidation="onComboValidation"/>
                                </div>
                                <div class="lineright boxline">
                                    <label>计量单位</label>
                                    <input id="combo3" name="units" class="mini-combobox" style="width:100%" textField="valued" valueField="types" emptyText="请选择..." allowInput="true" onbuttonclick="combobox2('jldw','combo3')" popupHeight="100px" onvalidation="onComboValidation" />
                                </div>
                                <div class="lineright boxline">
                                    <label>数量</label>
                                    <input name="numb" class="mini-textbox" style="width:100%" required="true" value="1" vtype="range:1,1"/>
                                </div>
                            </div>
                            <div class="line1 clearfix ">
                                <div class="lineleft boxline">
                                    <label>单价</label>
                                    <input name='unitPrice' class="mini-textbox" style="width:100%;"/>
                                </div>
                                <div class="lineright boxline">
                                    <label>原值</label>
                                    <input name="originalValue" class="mini-textbox" style="width:100%" required="true" onvalidation="greaterzero"/>
                                </div>
                                <div class="lineright boxline">
                                    <label>价值类型</label>
                                    <input id="combo4" name="valueType" class="mini-combobox" style="width:100%" textField="valued" valueField="types" emptyText="请选择..." allowInput="true" onbuttonclick="combobox('jzlx','combo4')" popupHeight="100px" onvalidation="onComboValidation"/>
                                </div>
                            </div>
                            <div class="line1 clearfix ">
                                <div class="lineleft boxline">
                                    <label>经费来源</label>
                                    <input id="combo5" name="fundingSources" class="mini-combobox" style="width:100%" textField="valued" valueField="types" emptyText="请选择..." allowInput="true" onbuttonclick="combobox('jfly','combo5')" popupHeight="100px" onvalidation="onComboValidation"/>
                                </div>
                                <div class="lineright boxline">
                                    <label>财政性资金</label>
                                    <input name="financialFunds" class="mini-textbox" style="width:100%"/>
                                </div>
                                <div class="lineright boxline">
                                    <label>非财政性资金</label>
                                    <input name="unFinancialFunds" class="mini-textbox" style="width:100%"/>
                                </div>
                            </div>
                            <div class="line1 clearfix ">
                                <div class="lineleft boxline">
                                    <label>折旧状态</label>
                                    <input id="combo6" name="depreciationState" class="mini-combobox" style="width:100%" textField="valued" valueField="types" emptyText="请选择..." allowInput="true" onbuttonclick="combobox('zjzt','combo6')" popupHeight="100px" onvalidation="onComboValidation"/>
                                </div>
                                <div class="lineright boxline">
                                    <label>净值</label>
                                    <input name="equity" class="mini-textbox" style="width:100%;"  vtype="float" value="0"/>
                                </div>
                                <div class="lineright boxline">
                                    <label>采购组织形式</label>
                                    <input id="combo7" name="procurementOrganization" class="mini-combobox" style="width:100%" textField="valued" valueField="types" emptyText="请选择..." allowInput="true" onbuttonclick="combobox('cgzzxs','combo7')" popupHeight="100px" onvalidation="onComboValidation"/>
                                </div>
                            </div>
                            <div class="line1 clearfix ">
                                <div class="lineleft boxline">
                                    <label>文物等级</label>
                                    <input id="combo13" name="antiquesLv" class="mini-combobox" style="width:100%" textField="valued" valueField="types" emptyText="请选择..." allowInput="true" onbuttonclick="combobox('wwdj','combo13')" popupHeight="100px" onvalidation="onComboValidation"/>
                                </div>
                                <div class="lineright boxline">
                                    <label>藏品年代</label>
                                    <input name="collectionAge" class="mini-textbox" style="width:100%"/>
                                </div>
                                <div class="lineright boxline">
                                    <label>来源地</label>
                                    <input name="sourceArea" class="mini-textbox" style="width:100%"/>
                                </div>
                            </div>
                            <div class="line1 clearfix ">
                                <div class="lineleft boxline">
                                    <label>入账形式</label>
                                    <input id="combo8" name="formEntry" class="mini-combobox" style="width:100%" textField="valued" valueField="types" emptyText="请选择..." allowInput="true" onbuttonclick="combobox('rzxs','combo8')" popupHeight="100px" onvalidation="onComboValidation"/>
                                </div>
                                <div class="lineright boxline">
                                    <label>会计凭证号</label>
                                    <input name="accountingVoucherNumber" class="mini-textbox" style="width:100%"/>
                                </div>
                                <div class="lineright boxline">
                                    <label>财务入账日期</label>
                                    <input name="postingDate" class="mini-datepicker" style="width:100%"/>
                                </div>
                                <div class="lineright boxline" style="display: none;">
                                    <label>资产大类</label>
                                    <input name="assetFirst" class="mini-textbox" style="width:100%" readonly value="7"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div title="使用信息">
                        <div class="first-tabcont" id="secondForm">
                            <div class="line1 clearfix ">
                                <div class="lineleft boxline">
                                    <label>使用部门</label>
                                    <input id="combo9" name="useDepartment" class="mini-combobox" style="width:100%" textField="valued" valueField="types" emptyText="请选择..." allowInput="true" onbuttonclick="combobox('sybm','combo9')" popupHeight="100px" onvalidation="onComboValidation"/>
                                </div>
                                <div class="lineright boxline">
                                    <label>使用人名称</label>
                                    <input name="userName" class="mini-textbox" style="width:100%"/>
                                </div>
                                <div class="lineright boxline">
                                    <label>存放地点</label>
                                    <input name="storagePlace" class="mini-textbox" style="width:100%"/>
                                </div>
                            </div>
                            <div class="line1 clearfix ">
                                <div class="lineleft boxline">
                                    <label>保管人</label>
                                    <input name="custodian" class="mini-textbox" style="width:100%"/>
                                </div>
                                <div class="lineright boxline">
                                    <label>购置时间</label>
                                    <input name="buyDate" class="mini-datepicker" style="width:100%"/>
                                </div>
                                <div class="lineright boxline">
                                    <label>开始使用日期</label>
                                    <input name="startTime" class="mini-datepicker" style="width:100%" required="true"/>
                                </div>
                            </div>
                            <div class="line1 clearfix ">
                                <div class="lineleft boxline">
                                    <label>使用方向</label>
                                    <input id="combo10" name="useDirection" class="mini-combobox" style="width:100%" textField="valued" valueField="types" emptyText="请选择..." allowInput="true" onbuttonclick="combobox('syfx','combo10')" popupHeight="100px" required="true" onvalidation="onComboValidation"/>
                                </div>
                                <div class="lineright boxline">
                                    <label>使用状态</label>
                                    <input id="combo11" name="usingState" class="mini-combobox" style="width:100%" textField="valued" valueField="types" emptyText="请选择..." allowInput="true" onbuttonclick="combobox('syzt','combo11')" popupHeight="100px" required="true" onvalidation="onComboValidation"/>
                                </div>
                                <div class="lineright boxline">
                                    <label>预计使用月份</label>
                                    <input name="expectedMonth" class="mini-textbox" style="width:100%"/>
                                </div>
                            </div>
                            <div class="line1 clearfix ">
                                <div class="lineleft boxline">
                                    <label>已使用月份</label>
                                    <input name="usedMonth" class="mini-textbox" style="width:100%"/>
                                </div>
                                <div class="lineleft boxline">
                                    <label>旧资产原已使用月份</label>
                                    <input name="oldUseMonth" class="mini-textbox" style="width:100%"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div title="其他信息">
                        <div class="first-tabcont" id="thirdForm">
                            <div class="line1 clearfix ">
                                <div class="lineleft boxline">
                                    <label>信息设备编码</label>
                                    <input name="deviceCoding" class="mini-textbox" style="width:100%"/>
                                </div>
                                <div class="lineright boxline">
                                    <label>标签说明</label>
                                    <input name="labelDescription" class="mini-textbox" style="width:100%"/>
                                </div>
                                <!--<div class="lineright boxline">
                                    <label>资产调拨状态</label>
                                    <input id="combo12" name="stateAssetAllocation" class="mini-combobox" style="width:100%" textField="valued" valueField="types" emptyText="请选择..." allowInput="true" onbuttonclick="combobox('zcdbzt','combo12')" popupHeight="100px" onvalidation="onComboValidation" />
                                </div>-->
                                <div class="lineleft boxline">
                                    <label>资产原分类名称</label>
                                    <input name="originalNameAssets" class="mini-textbox" style="width:100%"/>
                                </div>
                                
                            </div>
                            <div class="line1 clearfix ">
                                
                                <div class="lineright boxline">
                                    <label>备注</label>
                                    <input name="remark" class="mini-textbox" style="width:100%"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div title="辅助信息">
                        <div style="margin: 10px auto" id="fivthForm">
                            <div style="width:96%; margin:10px auto;">
                                <div class="mini-toolbar" style="border:0;padding:0px;background: none">
                                    <table style="width:100%;">
                                        <tr>
                                            <td style="width:45%;">
                                                <a class="mini-button btn1" onclick="AorDRow('datagrid1','A')" plain="true">添加</a>
                                                <a class="mini-button btn2" onclick="AorDRow('datagrid1')" plain="true">删除</a>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div id="datagrid1" class="mini-datagrid" style="width:96%;height:200px;margin: 0 auto;" allowResize="false"
                                   multiSelect="false" showPager="false" allowCellEdit="true" allowCellSelect="true" >
                                <div property="columns">
                                    <div header="添加资产附属设备" align="center" headerAlign="center">
                                        <div property="columns">
                                            <div field="name" name="name" width="100" align="center" headerAlign="center">附属设备名称
                                        <input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />    
                                    	</div>
                                            <div field="numb" name="numb" width="100" align="center" headerAlign="center">附属设备数量
                                            <input property="editor" class="mini-textbox" vtype="float" style="width:100%;" minWidth="200" />
                                            </div>
                                            <div field="remark" name="remark" width="100" align="center" headerAlign="center">备注
                                        <input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div style="margin: 20px auto">
                            <div style="width:96%; margin:20px auto;">
                                <div class="mini-toolbar" style="border:0;padding:0px;background: none">
                                    <table style="width:100%;">
                                        <tr>
                                            <td style="width:45%;">
                                                <a class="mini-button btn1" plain="true" onclick="AorDRow('datagrid2','A')">添加</a>
                                                <a class="mini-button btn2" plain="true" onclick="AorDRow('datagrid2')">删除</a>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div id="datagrid2" class="mini-datagrid" style="width:96%;height:200px;margin: 0 auto" allowResize="false"
                                   multiSelect="false"  showPager="false" allowCellEdit="true" allowCellSelect="true">
                                <div property="columns">
                                    <div header="资产附属文件" align="center" headerAlign="center">
                                        <div property="columns">
                                            <div field="name" name="name" width="100" align="center" headerAlign="center">附件名称</div>
                                            <div field="described" name="described" width="100" align="center" headerAlign="center">附件概述
                                            <input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
                                            </div>
                                            <div field="upload" name="upload" width="100" align="center" headerAlign="center" renderer="onActionRenderer">附件上传</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
	mini.parse();
	
	var editId=window.location.href.split("=")[1];
	var url="";
	if(editId!=null){
		url="${basePath}updateAsset";
	}else{
		editId=uuid();
		url="${basePath}addAsset";
		//卡片编号
		var cpbh = editId; 
		$('.cardnums span').html(cpbh); 
	}
	//加载页面数据
	load();
		//附件上传
		var gridfiel =mini.get("datagrid2");
	    function onActionRenderer(e) {
	        var gridfiel = e.sender;
	        var record = e.record;
	        var uid = record._uid;
	        var rowIndex = e.rowIndex;
			var s = '<div class="report-file"><span class="fielspan">选择文件</span><input class="file-prew" type="file" onchange="updateRow(' + uid + ',this)" name="upload"></div>';	     
	        return s;	       
	    }
	    //赋值 附件名称
	    function updateRow(uid,obj) {
            var row = gridfiel.getRowByUID(uid);
            setTimeout(function(){
               gridfiel.updateRow(row, {name: obj.value.substring(obj.value.lastIndexOf("\\")+1)});
               },300)
        }
	    
	    
	    //调用下拉方法
	    combobox('zjfs','combo2');//增加方式
		combobox2('jldw','combo3');//计量单位
		combobox('jzlx','combo4');//价值类型
		combobox('jfly','combo5');//经费来源
		combobox('cgzzxs','combo7');//采购组织方式
		combobox('zjzt','combo6');//折旧状态
		combobox('rzxs','combo8');//入账形式
		combobox('wwdj','combo13');//文物等级
		combobox('sybm','combo9');//使用部门
		combobox('syfx','combo10');//使用方向
		combobox('syzt','combo11');//使用状态
//		combobox('zcdbzt','combo12');//资产调拨状态
	    
	    
		//下拉菜单限制输入值--验证
		function onComboValidation(e) {
            var comb = e.sender;
            var items = comb.findItems(e.value);
            if (!items || items.length == 0) {
                e.isValid = false;
                e.errorText = "输入值不在下拉数据中";
            }
        }
</script>
</body>
</html>
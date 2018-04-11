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

        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<base href="<%=basePath%>" >
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>资产卡片审核--房屋</title>
    <link href="scripts/miniui/themes/default/miniui.css" rel="stylesheet" type="text/css" />
    <link href="scripts/miniui/themes/icons.css" rel="stylesheet" type="text/css" />
    <link href="css/reset.css" rel="stylesheet" type="text/css" />
    <!--<link href="scripts/miniui/themes/blue/skin.css" rel="stylesheet" type="text/css" />-->
    <link href="css/report.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="scripts/jquery.min.js"></script>
    <script type="text/javascript" src="scripts/miniui/miniui.js"></script>
    <script type="text/javascript" src="js/assets.js"></script>
    <script type="text/javascript" src="js/asset-audit.js"></script>
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
                        <span class="separator"></span>
                        <a class="mini-button btn3" onclick="adopt('6')" plain="true">退回</a>
                    </td>
                    <td style="white-space:nowrap;font-size: 15px">
                        <h3>资产卡片审核</h3>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="item-footer clearfix" style="width: 98%;margin: 10px auto">
        <div id="form9" class="mini-datagrid" style="width:22%;height:auto;float: left"
             url="" idField="id"
             allowResize="false" pageSize="20"
             allowCellEdit="true" allowCellSelect="true" multiSelect="true"
             allowCellValid="true" oncellvalidation="onCellValidation"
             showPager="false" showColumns="true"
                >
            <div property="columns">
                <div type="checkcolumn" width="20"></div>
                <!--<div field="dept_name" width="120">审核面板</div>-->
                <div field="POINT" width="120" headerAlign="center" allowSort="true">
                	审核意见
                </div>
            </div>
        </div>
        <div class="right-tit" style="float: left;width: 47%;text-align: center;margin-top: 15px">
            <div style="text-align: right">审核意见：<textarea id="content1" style="width:80%;" class="mini-textarea" emptyText="审核意见"></textarea></div>
        </div>
        <div class="examine-right" style="float: right;width: 30%;margin-top: 10px;">
            审核人：<input style="width: 85%" value="单位领导" class="mini-textbox" borderStyle="border:0"/>
            审核时间：<input id="shenhetime" value="" class="mini-textbox" borderStyle="border:0"/>
        </div>
    </div>
    <div class="main-serice" style="width: 98%;height: 400px;margin: 30px auto;clear: both;overflow: auto;border: 1px solid #ccc">
        <div class="Essential-information" style="width: 100%;height: 50px;line-height: 50px;margin: 0 auto;border-bottom: 1px solid #ccc">
            财务信息
        </div>
        <div class="first-tabcont shenke-b1">

            <div class="line1 clearfix">
                <div class="lineleft className">
                    <label>类别名称：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright assetCode">
                    <label>资产代码：</label>
                    <span>fafsd</span>
                </div>
            </div>
            <div class="line1 clearfix">
                <div class="lineleft assetName">
                    <label>资产名称：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright additionMethod">
                    <label>增加方式：</label>
                    <span>fafsd</span>
                </div>
            </div>
            <div class="line1 clearfix">
                <div class="lineleft units">
                    <label>计量单位：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright numb">
                    <label>数量：</label>
                    <span>fafsd</span>
                </div>
            </div>
             <div class="line1 clearfix">
                <div class="lineleft totalFloorage">
                    <label>总建筑面积：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineleft useArea">
                    <label>使用面积：</label>
                    <span>fafsd</span>
                </div>
            </div>
            <div class="line1 clearfix">
                <div class="lineleft originalValue">
                    <label>原值：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright valueType">
                    <label>价值类型：</label>
                    <span>fafsd</span>
                </div>
            </div>
            
            <div class="line1 clearfix">
                <div class="lineleft fundingSources">
                    <label>经费来源：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright procurementOrganization">
                    <label>采购组织形式：</label>
                    <span>fafsd</span>
                </div>
            </div>
            
            <div class="line1 clearfix">               
                <div class="lineright depreciationState">
                    <label>折旧状态：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright equity">
                    <label>净值：</label>
                    <span>fafsd</span>
                </div>              
            </div>
            
            <div class="line1 clearfix">
                <div class="lineleft financialFunds">
                    <label>财政性资金：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright unFinancialFunds">
                    <label>非财政性资金：</label>
                    <span>fafsd</span>
                </div>
            </div>
        </div>
        
 		<div class="Essential-information" style="width: 100%;height: 50px;line-height: 50px;margin: 0 auto;border-bottom: 1px solid #ccc">
            购置信息
        </div>
        <div class="first-tabcont shenke-b1">

            <div class="line1 clearfix">           	
                <div class="lineleft formEntry">
                    <label>入账状态：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright accountingVoucherNumber">
                    <label>会计凭证号：</label>
                    <span>fafsd</span>
                </div>
            </div>
            <div class="line1 clearfix">           	
                <div class="lineleft postingDate">
                    <label>财务入账日期：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineleft position">
                    <label>坐落位置：</label>
                    <span>fafsd</span>
                </div>
            </div>
            
            <div class="line1 clearfix">
                <div class="lineleft buildings">
                    <label>建筑结构：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright completionDate">
                    <label>竣工日期：</label>
                    <span>fafsd</span>
                </div>
            </div>
            
            
            <div class="line1 clearfix">
                <div class="lineright propertyFrom">
                    <label>产权形式：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineleft propertyType">
                    <label>产权分类：</label>
                    <span>fafsd</span>
                </div>
            </div>
            
            
            <div class="line1 clearfix">
                <div class="lineleft ownershipCertificate">
                    <label>权属证明：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright ownershipYears">
                    <label>权属年限（月）：</label>
                    <span>fafsd</span>
                </div>
            </div>
            
            <div class="line1 clearfix">               
                <div class="lineright ownershipNature">
                    <label>权属性质：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright certificateHave">
                    <label>权属证书所有人：</label>
                    <span>fafsd</span>
                </div>
            </div>
            
            <div class="line1 clearfix">
            	<div class="lineleft ownershipNumber">
                    <label>权属证书编号：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineleft ownershipDate">
                    <label>权属证书发证时间：</label>
                    <span>fafsd</span>
                </div>
            </div>
            
            
            
        </div>
               
        <div class="Essential-information" style="width: 100%;height: 50px;line-height: 50px;margin: 0 auto;border-bottom: 1px solid #ccc">
            使用信息
        </div>
        <div class="first-tabcont shenke-b1">
            <div class="line1 clearfix">
                <div class="lineleft useDepartment">
                    <label>使用部门：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright userName">
                    <label>使用人名称：</label>
                    <span>fafsd</span>
                </div>
            </div>      
            
            <div class="line1 clearfix">
                <div class="lineleft useDirection">
                    <label>使用方向：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright usingState">
                    <label>使用状态：</label>
                    <span>fafsd</span>
                </div>
            </div>
            
            <div class="line1 clearfix">
                <div class="lineleft buyDate">
                    <label>购置日期：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright startTime">
                    <label>开始使用日期：</label>
                    <span>fafsd</span>
                </div>
            </div>
            
            <div class="line1 clearfix">
                <div class="lineleft expectedMonth">
                    <label>预计使用月份：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright usedMonth">
                    <label>已使用月份：</label>
                    <span>fafsd</span>
                </div>
            </div>

            <div class="line1 clearfix">
                <div class="lineleft unitArea">
                    <label>单位负担费用面积：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright distributionArea">
                    <label>配电面积：</label>
                    <span>fafsd</span>
                </div>
            </div>
            
            <div class="line1 clearfix">
                <div class="lineleft boardroomArea">
                    <label>会议室面积：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright machineArea">
                    <label>机房面积：</label>
                    <span>fafsd</span>
                </div>
            </div>
            
            <div class="line1 clearfix">
                <div class="lineleft garageArea">
                    <label>车库面积：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright canteenArea">
                    <label>食堂面积：</label>
                    <span>fafsd</span>
                </div>
            </div>
            
            <div class="line1 clearfix">
                <div class="lineleft undergroundArea">
                    <label>地下面积：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright undergroundUseArea">
                    <label>地下使用面积：</label>
                    <span>fafsd</span>
                </div>
            </div>
            
			<div class="line1 clearfix">
                <div class="lineleft selfUseArea">
                    <label>自用面积：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright selfUseValue">
                    <label>自用价值：</label>
                    <span>fafsd</span>
                </div>
            </div>

			<div class="line1 clearfix">
                <div class="lineleft logisticArea">
                    <label>自用:后勤面积：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright unusedArea">
                    <label>土地闲置面积：</label>
                    <span>fafsd</span>
                </div>
            </div>

			<div class="line1 clearfix">
                <div class="lineleft lendArea">
                    <label>出借面积：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright lendValue">
                    <label>出借价值：</label>
                    <span>fafsd</span>
                </div>
            </div>
			
			<div class="line1 clearfix">
                <div class="lineleft rentedArea">
                    <label>出租面积：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright rentalValue">
                    <label>出租价值：</label>
                    <span>fafsd</span>
                </div>
            </div>
			
			<!--<div class="line1 clearfix">
                <div class="lineleft investmentArea">
                    <label>对外投资面积：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright investmentValue">
                    <label>对外投资价值：</label>
                    <span>fafsd</span>
                </div>
            </div>
			
			<div class="line1 clearfix">
                <div class="lineleft othUseArea">
                    <label>其它使用面积：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright otherValue">
                    <label>其它价值：</label>
                    <span>fafsd</span>
                </div>
            </div>-->
			
			<!--<div class="line1 clearfix">
                <div class="lineleft oldUseMonth">
                    <label>旧资产原已使用月份：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineleft oldUseMonth">
                    <label>设计用途：</label>
                    <span>fafsd</span>
                </div>
            </div>
			
			<div class="line1 clearfix">
                <div class="lineleft custodian">
                    <label>保管人：</label>
                    <span>fafsd</span>
                </div>
           </div>-->
           
            
            
        </div>
        <div class="Essential-information" style="width: 100%;height: 50px;line-height: 50px;margin: 0 auto;border-bottom: 1px solid #ccc;">
            其他信息
        </div>

        <div class="first-tabcont shenke-b1">
            <div class="line1 clearfix">
                <div class="lineleft customCoding">
                    <label>自定义编码：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright labelDescription">
                    <label>标签说明：</label>
                    <span>fafsd</span>
                </div>
            </div>
            <div class="line1 clearfix">
                <div class="lineleft stateAssetAllocation">
                    <label>资产调拨状态：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright originalNameAssets">
                    <label>资产原分类名称：</label>
                    <span>fafsd</span>
                </div>
            </div>
            <div class="line1 clearfix">
                <div class="lineleft unitName">
                    <label>资产管理单位名称：</label>
                    <span>fafsd</span>
                </div>
                <div class="lineright remark">
                    <label>备注：</label>
                    <span>fafsd</span>
                </div>
            </div>
        </div>
        <div class="Essential-information" style="width: 100%;height: 50px;line-height: 50px;margin: 0 auto;border-bottom: 1px solid #ccc">
            附属信息
        </div>
        <div class="yusuan-up">
            <div style="margin: 10px auto">
                <div id="datagrid1" class="mini-datagrid" style="width:96%;height:280px;margin: 0 auto" allowResize="false"
                     url=""  multiSelect="false"
                     showPager="false"
                        >
                    <div property="columns">
                        <div header="资产附属设备" align="center" headerAlign="center">
                            <div property="columns">
                                <div field="name" name="name" width="100" align="center" headerAlign="center">附属设备名称</div>
                                <div field="numb" name="numb" width="100" align="center" headerAlign="center">附属设备数量</div>
                                <div field="remark" name="remark" width="100" align="center" headerAlign="center">备注</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="margin: 20px auto">
                <div id="datagrid2" class="mini-datagrid" style="width:96%;height:280px;margin: 0 auto" allowResize="false" showPager="false"
                        >
                    <div property="columns">
                        <div header="资产附属文件" align="center" headerAlign="center">
                            <div property="columns">
                                <div field="name" name="name" width="100" align="center" headerAlign="center">附件名称</div>
                                <div field="described" name="described" width="100" align="center" headerAlign="center">附件概述</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div style="margin: 20px auto">
                <div id="datagrid3" class="mini-datagrid" style="width:96%;height:280px;margin: 0 auto" allowResize="false" showPager="false"
                        >
                    <div property="columns">
                        <div header="房屋所属机构" align="center" headerAlign="center">
                            <div property="columns">
                                <div field="name" name="name" width="100" align="center" headerAlign="center">所属机构名称</div>
                                <div field="remark" name="remark" width="100" align="center" headerAlign="center">备注</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
			
			<div class="house-state">
				<label>房屋基本情况：</label>
				<textarea id="content2" style="width:80%;" class="mini-textarea" emptyText="请输入…"></textarea>
			</div>
            
        </div>


    </div>
</div>
<script>
    mini.parse();
        var flowUrlpath="<%=flowUrlpath%>";
    var grid8=mini.get("form9");
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
			//审核跳转资产卡号审核页面
        	var editId=window.location.href.split("=")[1];

        	if(editId!=null){
			$.ajax({
				url: "${basePath}findAssetById",
		            //contentType:"application/x-www-form-urlencoded",
		            data: { "cardNumber" : editId}, 
		            type:'post',
		            success: function (text) {
                        editJump=text;
                        console.log(text)
                        //财务信息
                        //购置信息;
                        //使用信息
                        //其他信息
                        shenkeUpdata(text);
                        $.ajax({
                        url:flowUrlpath+"jbpm/findApprovalElement",

                        xhrFields: {
                        //允许带上凭据
                        withCredentials: true
                        },
                        crossDomain: true,
                        type:"post",
                        data:{"bpmId":text.asset.bpmId,"state":text.asset.auditState,"orgId":text.asset.orgId,"tenantCode":text.asset.tenantCode},
                        success:function(data){
                        console.log(data);
                        grid8.setData(data,false);
                        },
                        error:function(){
                        alert("数据请求失败")
                        }
                        })

						//附属信息-表1
						var form5 =mini.get("datagrid1");
		            	var str5=text.appurtenance;	
						form5.setData(str5);
						
						//附属信息-表2
						var form6 =mini.get("datagrid2");
		            	var str6=text.subsidiaryFile;		            	
						form6.setData(str6); 
		            },
		            error: function(XMLHttpRequest, textStatus, errorThrown) {
			   			 alert(XMLHttpRequest.status);
			   			 alert(XMLHttpRequest.readyState);
			   			 alert(textStatus);
				     },
				      complete: function(XMLHttpRequest, textStatus) {
				    	 this; // 调用本次AJAX请求时传递的options参数
				     }
		        })
  
			}

			//审核卡片信息
			function shenkeUpdata(text){
			//财务信息
				//类别名称
				var lbname = text.asset.className; 
				$('.first-tabcont .line1 .className span').html(lbname); 
				//资产代码
				var zccode = text.asset.assetCode; 
				$('.first-tabcont .line1 .assetCode span').html(zccode);
				//资产名称
				var zcname = text.asset.assetName; 
				$('.first-tabcont .line1 .assetName span').html(zcname);
				//增加方式
				var zjstyle = text.asset.additionMethod; 
				$('.first-tabcont .line1 .additionMethod span').html(zjstyle);
				//计量单位
				var jlunit = text.asset.units; 
				$('.first-tabcont .line1 .units span').html(jlunit);
				//数量
				var shuliang = text.asset.numb; 
				$('.first-tabcont .line1 .numb span').html(shuliang);
				//总建筑面积
				var sumjzmj = text.asset.totalFloorage;
				$('.first-tabcont .line1 .totalFloorage span').html(sumjzmj);
				//使用面积
				var usemj = text.asset.useArea;
				$('.first-tabcont .line1 .useArea span').html(usemj);
				//原值
				var yuanzhi = text.asset.originalValue; 
				$('.first-tabcont .line1 .originalValue span').html(yuanzhi);
				//价值类型
				var jzstyle = text.asset.valueType; 
				$('.first-tabcont .line1 .valueType span').html(jzstyle);
				//经费来源
				var jfly = text.asset.fundingSources; 
				$('.first-tabcont .line1 .fundingSources span').html(jfly);
				//采购组织形式
				var cgzzxs = text.asset.procurementOrganization; 
				$('.first-tabcont .line1 .procurementOrganization span').html(cgzzxs);
				//折旧状态
				var zjstate = text.asset.depreciationState; 
				$('.first-tabcont .line1 .depreciationState span').html(zjstate);
				//净值
				var jingzhi = text.asset.equity; 
				$('.first-tabcont .line1 .equity span').html(jingzhi);
				//财政型资金
				var czxzj = text.asset.financialFunds; 
				$('.first-tabcont .line1 .financialFunds span').html(czxzj);
				//非财政性资金
				var fczxzj = text.asset.unFinancialFunds; 
				$('.first-tabcont .line1 .unFinancialFunds span').html(fczxzj);
				
			//购置信息	
				//入账状态
				var rzzt = text.asset.formEntry; 
				$('.first-tabcont .line1 .formEntry span').html(rzzt);
				//会计凭证号
				var kjpzh = text.asset.accountingVoucherNumber; 
				$('.first-tabcont .line1 .accountingVoucherNumber span').html(kjpzh);
				//财务入账日期
				var cwrzdate = ChangeDateFormat(text.asset.postingDate); 
				$('.first-tabcont .line1 .postingDate span').html(cwrzdate);
				//坐落位置
				var zlwz = text.asset.position; 
				$('.first-tabcont .line1 .position span').html(zlwz);
				//建筑结构
				var jzjg = text.asset.buildings; 
				$('.first-tabcont .line1 .buildings span').html(jzjg);
				//竣工日期
				var completetime = ChangeDateFormat(text.asset.completionDate); 
				$('.first-tabcont .line1 .completionDate span').html(completetime);
				//产权形式
				var cqxs = text.asset.propertyFrom; 
				$('.first-tabcont .line1 .propertyFrom span').html(cqxs);
				//产权分类
				var cqfl = text.asset.propertyType; 
				$('.first-tabcont .line1 .propertyType span').html(cqfl);
				//权属证明
				var qszm = text.asset.ownershipCertificate; 
				$('.first-tabcont .line1 .ownershipCertificate span').html(qszm);
				//权属年限
				var qsyears = text.asset.ownershipYears; 
				$('.first-tabcont .line1 .ownershipYears span').html(qsyears);
				//权属性质
				var qsxz = text.asset.ownershipNature; 
				$('.first-tabcont .line1 .ownershipNature span').html(qsxz);
				//权属证书所有人
				var qszsonwer = text.asset.certificateHave; 
				$('.first-tabcont .line1 .certificateHave span').html(qszsonwer);
				//权属证书编号
				var qszscode = text.asset.ownershipNumber; 
				$('.first-tabcont .line1 .ownershipNumber span').html(qszscode);
				//权属证书发证时间
				var qstimer = ChangeDateFormat(text.asset.ownershipDate); 
				$('.first-tabcont .line1 .ownershipDate span').html(qstimer);
				
			//使用信息
			    //使用部门
				var sybm = text.asset.useDepartment; 
				$('.first-tabcont .line1 .useDepartment span').html(sybm);
				//使用人名称
				var syrmc = text.asset.userName; 
				$('.first-tabcont .line1 .userName span').html(syrmc);
				//存放地点
				var cfdd = text.asset.storagePlace; 
				$('.first-tabcont .line1 .storagePlace span').html(cfdd);
				//保管人
				var bgr = text.asset.custodian; 
				$('.first-tabcont .line1 .custodian span').html(bgr);
				//购置日期
				var gzdate = ChangeDateFormat(text.asset.buyDate); 
				$('.first-tabcont .line1 .buyDate span').html(gzdate);
				//开始使用日期
				var ksdate = ChangeDateFormat(text.asset.startTime); 
				$('.first-tabcont .line1 .startTime span').html(ksdate);
				//使用方向
				var syfx = text.asset.useDirection; 
				$('.first-tabcont .line1 .useDirection span').html(syfx);
				//使用状态
				var syzt = text.asset.usingState; 
				$('.first-tabcont .line1 .usingState span').html(syzt);
				//预计使用月份
				var yjsyyf = text.asset.expectedMonth; 
				$('.first-tabcont .line1 .expectedMonth span').html(yjsyyf);
				//已使用月份
				var ysyyf = text.asset.usedMonth; 
				$('.first-tabcont .line1 .usedMonth span').html(ysyyf);
				//旧资产原已使用月份
				var jzcyysyyf = text.asset.oldUseMonth; 
				$('.first-tabcont .line1 .oldUseMonth span').html(jzcyysyyf);
				
				//单位负担费用面积
				var dwfdmoney = text.asset.unitArea; 
				$('.first-tabcont .line1 .unitArea span').html(dwfdmoney);
				
				//配电面积
				var pdmj = text.asset.distributionArea; 
				$('.first-tabcont .line1 .distributionArea span').html(pdmj);
				
				//会议室面积
				var hysmj = text.asset.boardroomArea; 
				$('.first-tabcont .line1 .boardroomArea span').html(hysmj);
				//机房面积
				var jfmj = text.asset.machineArea; 
				$('.first-tabcont .line1 .machineArea span').html(jfmj);
				//车库面积
				var ckmj = text.asset.garageArea; 
				$('.first-tabcont .line1 .garageArea span').html(ckmj);
				//食堂面积
				var stmj = text.asset.canteenArea; 
				$('.first-tabcont .line1 .canteenArea span').html(stmj);
				//地下面积
				var dxmj = text.asset.undergroundArea; 
				$('.first-tabcont .line1 .undergroundArea span').html(dxmj);
				
				//地下使用面积
				var dxusemj = text.asset.undergroundUseArea; 
				$('.first-tabcont .line1 .undergroundUseArea span').html(dxusemj);
				
				//自用面积
				var selfusemj = text.asset.selfUseArea; 
				$('.first-tabcont .line1 .selfUseArea span').html(selfusemj);
				//自用价值
				var selfusejz = text.asset.selfUseValue; 
				$('.first-tabcont .line1 .selfUseValue span').html(selfusejz);
				//自用：后勤面积
				var selfusehqmj = text.asset.logisticArea; 
				$('.first-tabcont .line1 .logisticArea span').html(selfusehqmj);
				//土地闲置面积
				var landxzmj = text.asset.unusedArea; 
				$('.first-tabcont .line1 .unusedArea span').html(landxzmj);				
				//出借面积
				var cjmj = text.asset.lendArea; 
				$('.first-tabcont .line1 .lendArea span').html(cjmj);				
				//出借价值
				var cjjz = text.asset.lendValue; 
				$('.first-tabcont .line1 .lendValue span').html(cjjz);
				//出租面积
				var czmj = text.asset.rentedArea; 
				$('.first-tabcont .line1 .rentedArea span').html(czmj);
				//出租价值
				var czjz = text.asset.rentalValue; 
				$('.first-tabcont .line1 .rentalValue span').html(czjz);
				
				
			//其他信息
				//自定义编码
				var zdycode = text.asset.customCoding; 
				$('.first-tabcont .line1 .customCoding span').html(zdycode);
				//标签说明
				var bqsm = text.asset.labelDescription; 
				$('.first-tabcont .line1 .labelDescription span').html(bqsm);
				//资产调拨状态
				var zcdbzt = text.asset.stateAssetAllocation; 
				$('.first-tabcont .line1 .stateAssetAllocation span').html(zcdbzt);
				//资产原分类名称
				var zcyflmc = text.asset.originalNameAssets; 
				$('.first-tabcont .line1 .originalNameAssets span').html(zcyflmc);
				//资产管理单位名称
				var zcgldwmc = text.asset.unitName; 
				$('.first-tabcont .line1 .unitName span').html(zcgldwmc);				
				//备注
				var beizhu = text.asset.remark; 
				$('.first-tabcont .line1 .remark span').html(beizhu);	
				
			//审核意见
				var shyj=text.asset.auditOpinion;
				mini.get(content1).setValue(shyj);
			
			}
			
</script>
</body>
</html>
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
<head>
    <title>资产台账</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="scripts/miniui/themes/default/miniui.css" rel="stylesheet" type="text/css" />
    <link href="scripts/miniui/themes/icons.css" rel="stylesheet" type="text/css" />
    <link href="css/reset.css" rel="stylesheet" type="text/css" />
    <link href="css/report.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="scripts/jquery.min.js"></script>
    <script type="text/javascript" src="scripts/miniui/miniui.js"></script>
    <script type="text/javascript" src="js/assets.js"></script>
</head>
<body>
<div class="reim-main clearfix">
    <div class="report-tabs">
        <div class="mini-tabs" activeIndex="0"  style="width:100%;height:520px;">
            <div title="土地">
                <div class="excision-check">
                    <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
                        <table style="width:100%;">
                            <tr>
                                <td class="search-inform" style="white-space:nowrap;">
                                    <em class="search-tit">增加时间：</em>
                                    <input id="combo1" class="mini-datepicker" style="width:150px;" textField="text" valueField="id" emptyText="年/月/日"
                                           url="" value="" allowInput="true" showNullItem="true" nullItemText="年/月/日"/> 至
                                    <input id="combo2" class="mini-datepicker" style="width:150px;" textField="text" valueField="id" emptyText="年/月/日"
                                           url="" value=""  allowInput="true" showNullItem="true" nullItemText="年/月/日"/>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:100%;">
                                    <a class="mini-button btn1" onclick="search()">查询</a>
                                    <a class="mini-button btn2" onclick="Derivation()">导出</a>
                                    <a class="mini-button btn3" onclick="">打印</a>
                                    <%--<a class="mini-button btn5" onclick="AuditStatus()">审核状态</a>--%>
                                    <a class="mini-button btn5" onclick="auditRecord()">审核记录</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div id="datagrid1" class="mini-datagrid report-table" style="height:300px;" allowResize="false"
                     url="${basePath}findAssetByTZ"  idField="id" multiSelect="true"  showPager='false'
                        >
                    <div property="columns">
                        <div type="checkcolumn" ></div>
                        <div field="cardNumber" name="cardNumber" width="120" headerAlign="center" >卡片编号</div>
                        <div field="assetCode" name="assetCode" width="120" headerAlign="center" >资产编号</div>
                        <div field="assetFirst" name="assetFirst" width="120" headerAlign="center" >资产大类</div>
                        <div field="className" name="className" width="100" headerAlign="center" >资产分类</div>
                        <div field="assetName" name="assetName" width="100" headerAlign="center" >资产名称</div>
                        <div field="numb" name="numb" width="80" headerAlign="center" >数量</div>
                        <div field="originalValue" name="originalValue" width="80" headerAlign="center" >原值</div>
                        <div field="additionMethod" name="additionMethod" width="80" headerAlign="center" >增加方式</div>
                        <div field="brand" name="brand" width="100" headerAlign="center" >品牌</div>
                        <div field="specificationModel" name="specificationModel" width="100" headerAlign="center" >规格型号</div>
                        <div field="useDepartment" name="useDepartment" width="100" headerAlign="center" >使用部门</div>
                        <div field="userName" name="userName" width="100" headerAlign="center" >使用人名称</div>
                    </div>
                </div>
            </div>
            <div title="房屋">
                <div class="excision-check">
                    <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
                        <table style="width:100%;">

                            <tr>
                                <td class="search-inform" style="white-space:nowrap;">
                                    <em class="search-tit">增加时间：</em>
                                    <input id="combo6" class="mini-datepicker" style="width:150px;" textField="text" valueField="id" emptyText="年/月/日"
                                           allowInput="true" showNullItem="true"/> 至
                                    <input id="combo7" class="mini-datepicker" style="width:150px;" textField="text" valueField="id" emptyText="年/月/日"
                                           allowInput="true" showNullItem="true"/>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:100%;">
                                    <a class="mini-button btn1" onclick="search2()">查询</a>
                                    <a class="mini-button btn2" onclick="ExportTwo()">导出</a>
                                    <a class="mini-button btn3" onclick="">打印</a>
        <%--<a class="mini-button btn5" onclick="AuditStatus()">审核状态</a>--%>
        <a class="mini-button btn5" onclick="auditRecord2()">审核记录</a>
                                </td>
                            </tr>

                        </table>
                    </div>
                </div>

                <div id="datagrid2" class="mini-datagrid report-table" style="height:300px;" allowResize="false"
                     url="${basePath}findAssetByTZ"  idField="id" multiSelect="true"  showPager='false'
                        >
                    <div property="columns">
                        <div type="checkcolumn" ></div>
                        <div field="cardNumber" name="cardNumber" width="120" headerAlign="center" >卡片编号</div>
                        <div field="assetCode" name="assetCode" width="120" headerAlign="center" >资产编号</div>
                        <div field="assetFirst" name="assetFirst" width="120" headerAlign="center" >资产大类</div>
                        <div field="className" name="className" width="100" headerAlign="center" >资产分类</div>
                        <div field="assetName" name="assetName" width="100" headerAlign="center" >资产名称</div>
                        <div field="numb" name="numb" width="80" headerAlign="center" >数量</div>
                        <div field="originalValue" name="originalValue" width="80" headerAlign="center" >原值</div>
                        <div field="additionMethod" name="additionMethod" width="80" headerAlign="center" >增加方式</div>
                        <div field="totalFloorage" name="totalFloorage" width="100" headerAlign="center" >总建筑面积</div>
                        <div field="position" name="position" width="100" headerAlign="center" >坐落位置</div>
                        <div field="useDepartment" name="useDepartment" width="100" headerAlign="center" >使用部门</div>
                        <div field="userName" name="userName" width="100" headerAlign="center" >使用人名称</div>
                    </div>
                </div>
            </div>
            <div title="构筑物">
                <div class="excision-check">
                    <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
                        <table style="width:100%;">
                            <tr>
                                <td class="search-inform" style="white-space:nowrap;">
                                    <em class="search-tit">增加时间：</em>
                                    <input id="combo10" class="mini-datepicker" style="width:150px;" textField="text" valueField="id" emptyText="年/月/日"
                                            allowInput="true" showNullItem="true"/> 至
                                    <input id="combo11" class="mini-datepicker" style="width:150px;" textField="text" valueField="id" emptyText="年/月/日"
                                            allowInput="true" showNullItem="true"/>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:100%;">
                                    <a class="mini-button btn1" onclick="search3()">查询</a>
                                    <a class="mini-button btn2" onclick="ExportThree()">导出</a>
                                    <a class="mini-button btn3" onclick="">打印</a>
        <%--<a class="mini-button btn5" onclick="AuditStatus()">审核状态</a>--%>
        <a class="mini-button btn5" onclick="auditRecord3()">审核记录</a>
                                </td>
                            </tr>

                        </table>
                    </div>
                </div>

                <div id="datagrid3" class="mini-datagrid report-table" style="height:300px;" allowResize="false"
                     url="${basePath}findAssetByTZ"  idField="id" multiSelect="true"  showPager='false'>
                    <div property="columns">
                        <div type="checkcolumn" ></div>
                        <div field="cardNumber" name="cardNumber" width="120" headerAlign="center" >卡片编号</div>
                        <div field="assetCode" name="assetCode" width="120" headerAlign="center" >资产代码 </div>
                        <div field="assetFirst" name="assetFirst" width="120" headerAlign="center" >资产大类</div>
                        <div field="className" name="className" width="100" headerAlign="center" >资产分类</div>
                        <div field="assetName" name="assetName" width="100" headerAlign="center" >资产名称</div>
                        <div field="numb" name="numb" width="80" headerAlign="center" >数量</div>
                        <div field="originalValue" name="originalValue" width="80" headerAlign="center" >原值</div>
                        <div field="additionMethod" name="additionMethod" width="80" headerAlign="center" >增加方式</div>
                        <div field="totalFloorage" name="totalFloorage" width="100" headerAlign="center" >总建筑面积</div>
                        <div field="position" name="position" width="100" headerAlign="center" >坐落位置</div>
                        <div field="useDepartment" name="useDepartment" width="100" headerAlign="center" >使用部门</div>
                        <div field="userName" name="userName" width="100" headerAlign="center" >使用人名称</div>
                    </div>
                </div>
            </div>
            <div title="通用设备">
                <div class="excision-check">
                    <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
                        <table style="width:100%;">

                            <tr>
                                <td class="search-inform" style="white-space:nowrap;">
                                    <em class="search-tit">增加时间：</em>
                                    <input id="combo8" class="mini-datepicker" style="width:150px;" textField="text" valueField="id" emptyText="年/月/日"
                                            allowInput="true" showNullItem="true" nullItemText="年/月/日"/> 至
                                    <input id="combo9" class="mini-datepicker" style="width:150px;" textField="text" valueField="id" emptyText="年/月/日"
                                            allowInput="true" showNullItem="true" nullItemText="年/月/日"/>
                                    
                                    <em class="search-tit">资产分类：</em>
                                    <input id="combo5" class="mini-combobox" style="width:150px;" textField="text" valueField="id" emptyText="请选择..."
                                            allowInput="true" showNullItem="true" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width:100%;">
                                    <a class="mini-button btn1" onclick="search4()">查询</a>
                                    <a class="mini-button btn2" onclick="ExportFour()">导出</a>
                                    <a class="mini-button btn3" onclick="">打印</a>
        <%--<a class="mini-button btn5" onclick="AuditStatus()">审核状态</a>--%>
        <a class="mini-button btn5" onclick="auditRecord4()">审核记录</a>
                                </td>
                            </tr>

                        </table>
                    </div>
                </div>

                <div id="datagrid4" class="mini-datagrid report-table" style="height:300px;" allowResize="false"
                     url="${basePath}findAssetByTZ"  idField="id" multiSelect="true"  showPager='false'>
                    <div property="columns">
                        <div type="checkcolumn" ></div>
                        <div field="cardNumber" name="cardNumber" width="120" headerAlign="center" >卡片编号</div>
                        <div field="assetCode" name="assetCode" width="120" headerAlign="center" >资产编号</div>
                        <div field="assetFirst" name="assetFirst" width="120" headerAlign="center" >资产大类</div>
                        <div field="className" name="className" width="100" headerAlign="center" >资产分类</div>
                        <div field="assetName" name="assetName" width="100" headerAlign="center" >资产名称</div>
                        <div field="numb" name="numb" width="80" headerAlign="center" >数量</div>
                        <div field="originalValue" name="originalValue" width="80" headerAlign="center" >原值</div>
                        <div field="additionMethod" name="additionMethod" width="80" headerAlign="center" >增加方式</div>
                        <div field="brand" name="brand" width="100" headerAlign="center" >品牌</div>
                        <div field="specificationModel" name="specificationModel" width="100" headerAlign="center" >规格型号</div>
                        <div field="useDepartment" name="useDepartment" width="100" headerAlign="center" >使用部门</div>
                        <div field="userName" name="userName" width="100" headerAlign="center" >使用人名称</div>
                    </div>
                </div>
            </div>
            <div title="车辆">
                <div class="excision-check">
                    <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
                        <table style="width:100%;">

                            <tr>
                                <td class="search-inform" style="white-space:nowrap;">
                                    <em class="search-tit">增加时间：</em>
                                    <input id="combo13" class="mini-datepicker" style="width:150px;" textField="text" valueField="id" emptyText="年/月/日"
                                           allowInput="true" showNullItem="true" nullItemText="年/月/日"/> 至
                                    <input id="combo14" class="mini-datepicker" style="width:150px;" textField="text" valueField="id" emptyText="年/月/日"
                                           allowInput="true" showNullItem="true" nullItemText="年/月/日"/>

                                </td>
                            </tr>
                            <tr>
                                <td style="width:100%;">
                                    <a class="mini-button btn1" onclick="search5()">查询</a>
                                    <a class="mini-button btn2" onclick="ExportFive()">导出</a>
                                    <a class="mini-button btn3" onclick="">打印</a>
        <%--<a class="mini-button btn5" onclick="AuditStatus()">审核状态</a>--%>
        <a class="mini-button btn5" onclick="auditRecord5()">审核记录</a>
                                </td>
                            </tr>

                        </table>
                    </div>
                </div>

                <div id="datagrid5" class="mini-datagrid report-table" style="height:300px;" allowResize="false"
                     url="${basePath}findAssetByTZ"  idField="id" multiSelect="true"  showPager='false'>
                    <div property="columns">
                        <div type="checkcolumn" ></div>
                        <div field="cardNumber" name="cardNumber" width="120" headerAlign="center" >卡片编号</div>
                        <div field="assetCode" name="assetCode" width="120" headerAlign="center" >资产编号</div>
                        <div field="assetFirst" name="assetFirst" width="120" headerAlign="center" >资产大类</div>
                        <div field="className" name="className" width="100" headerAlign="center" >资产分类</div>
                        <div field="assetName" name="assetName" width="100" headerAlign="center" >资产名称</div>
                        <div field="numb" name="numb" width="80" headerAlign="center" >数量</div>
                        <div field="originalValue" name="originalValue" width="80" headerAlign="center" >原值</div>
                        <div field="additionMethod" name="additionMethod" width="80" headerAlign="center" >增加方式</div>
                        <div field="brand" name="brand" width="100" headerAlign="center" >品牌</div>
                        <div field="specificationModel" name="specificationModel" width="100" headerAlign="center" >规格型号</div>
                        <div field="useDepartment" name="useDepartment" width="100" headerAlign="center" >使用部门</div>
                        <div field="userName" name="userName" width="100" headerAlign="center" >使用人名称</div>
                    </div>
                </div>
            </div>
            <div title="专用设备">
                <div class="excision-check">
                    <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
                        <table style="width:100%;">

                            <tr>
                                <td class="search-inform" style="white-space:nowrap;">
                                    <em class="search-tit">增加时间：</em>
                                    <input id="combo16" class="mini-datepicker" style="width:150px;" textField="text" valueField="id" emptyText="年/月/日"
                                            allowInput="true" showNullItem="true" nullItemText="年/月/日"/> 至
                                    <input id="combo17" class="mini-datepicker" style="width:150px;" textField="text" valueField="id" emptyText="年/月/日"
                                            allowInput="true" showNullItem="true" nullItemText="年/月/日"/>
                                   
                                    <em class="search-tit">资产分类：</em>
                                    <input id="combo55" class="mini-combobox" style="width:150px;" textField="text" valueField="id" emptyText="请选择..."
                                            allowInput="true" showNullItem="true" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width:100%;">
                                    <a class="mini-button btn1" onclick="search6()">查询</a>
                                    <a class="mini-button btn2" onclick="ExportSix()">导出</a>
                                    <a class="mini-button btn3" onclick="">打印</a>
        <%--<a class="mini-button btn5" onclick="AuditStatus()">审核状态</a>--%>
        <a class="mini-button btn5" onclick="auditRecord6()">审核记录</a>
                                </td>
                            </tr>

                        </table>
                    </div>
                </div>

                <div id="datagrid6" class="mini-datagrid report-table" style="height:300px;" allowResize="false"
                     url="${basePath}findAssetByTZ"  idField="id" multiSelect="true"  showPager='false'>
                    <div property="columns">
                        <div type="checkcolumn" ></div>
                        <div field="cardNumber" name="cardNumber" width="120" headerAlign="center" >卡片编号</div>
                        <div field="assetCode" name="assetCode" width="120" headerAlign="center" >资产编号</div>
                        <div field="assetFirst" name="assetFirst" width="120" headerAlign="center" >资产大类</div>
                        <div field="className" name="className" width="100" headerAlign="center" >资产分类</div>
                        <div field="assetName" name="assetName" width="100" headerAlign="center" >资产名称</div>
                        <div field="numb" name="numb" width="80" headerAlign="center" >数量</div>
                        <div field="originalValue" name="originalValue" width="80" headerAlign="center" >原值</div>
                        <div field="additionMethod" name="additionMethod" width="80" headerAlign="center" >增加方式</div>
                        <div field="brand" name="brand" width="100" headerAlign="center" >品牌</div>
                        <div field="specificationModel" name="specificationModel" width="100" headerAlign="center" >规格型号</div>
                        <div field="useDepartment" name="useDepartment" width="100" headerAlign="center" >使用部门</div>
                        <div field="userName" name="userName" width="100" headerAlign="center" >使用人名称</div>
                    </div>
                </div>
            </div>
            <div title="文物和陈列品">
                <div class="excision-check">
                    <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
                        <table style="width:100%;">

                            <tr>
                                <td class="search-inform" style="white-space:nowrap;">
                                    <em class="search-tit">增加时间：</em>
                                    <input id="combo18" class="mini-datepicker" style="width:150px;" textField="text" valueField="id" emptyText="年/月/日"
                                            allowInput="true" showNullItem="true" nullItemText="年/月/日"/> 至
                                    <input id="combo19" class="mini-datepicker" style="width:150px;" textField="text" valueField="id" emptyText="年/月/日"
                                            allowInput="true" showNullItem="true" nullItemText="年/月/日"/>
                                    <em class="search-tit">资产分类：</em>
                                    <input id="combo555" class="mini-combobox" style="width:150px;" textField="text" valueField="id" emptyText="请选择..."
                                            allowInput="true" showNullItem="true" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width:100%;">
                                    <a class="mini-button btn1" onclick="search7()">查询</a>
                                    <a class="mini-button btn2" onclick="ExportSeven()">导出</a>
                                    <a class="mini-button btn3" onclick="">打印</a>
        <%--<a class="mini-button btn5" onclick="AuditStatus()">审核状态</a>--%>
        <a class="mini-button btn5" onclick="auditRecord7()">审核记录</a>
                                </td>
                            </tr>

                        </table>
                    </div>
                </div>

                <div id="datagrid7" class="mini-datagrid report-table" style="height:300px;" allowResize="false"
                     url="${basePath}findAssetByTZ"  idField="id" multiSelect="true"  showPager='false'>
                    <div property="columns">
                        <div type="checkcolumn" ></div>
                        <div field="cardNumber" name="cardNumber" width="120" headerAlign="center" >卡片编号</div>
                        <div field="assetCode" name="assetCode" width="120" headerAlign="center" >资产编号</div>
                        <div field="assetFirst" name="assetFirst" width="120" headerAlign="center" >资产大类</div>
                        <div field="className" name="className" width="100" headerAlign="center" >资产分类</div>
                        <div field="assetName" name="assetName" width="100" headerAlign="center" >资产名称</div>
                        <div field="numb" name="numb" width="80" headerAlign="center" >数量</div>
                        <div field="originalValue" name="originalValue" width="80" headerAlign="center" >原值</div>
                        <div field="additionMethod" name="additionMethod" width="80" headerAlign="center" >增加方式</div>
                        <div field="useDepartment" name="useDepartment" width="100" headerAlign="center" >使用部门</div>
                        <div field="userName" name="userName" width="100" headerAlign="center" >使用人名称</div>
                        <div field="startTime" name="startTime" width="100" headerAlign="center" >开始使用日期</div>
                        <div field="expectedMonth" name="expectedMonth" width="100" headerAlign="center" >预计使用月份</div>
                    </div>
                </div>
            </div>
            <div title="图书、档案">
                <div class="excision-check">
                    <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
                        <table style="width:100%;">

                            <tr>
                                <td class="search-inform" style="white-space:nowrap;">
                                    <em class="search-tit">增加时间：</em>
                                    <input id="combo20" class="mini-datepicker" style="width:150px;" textField="text" valueField="id" emptyText="年/月/日"
                                           url="" value=""   allowInput="true" showNullItem="true" nullItemText="年/月/日"/> 至
                                    <input id="combo21" class="mini-datepicker" style="width:150px;" textField="text" valueField="id" emptyText="年/月/日"
                                           url="" value=""   allowInput="true" showNullItem="true" nullItemText="年/月/日"/>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td style="width:100%;">
                                    <a class="mini-button btn1" onclick="search8()">查询</a>
                                    <a class="mini-button btn2" onclick="ExportIt()">导出</a>
                                    <a class="mini-button btn3" onclick="">打印</a>
        <%--<a class="mini-button btn5" onclick="AuditStatus()">审核状态</a>--%>
        <a class="mini-button btn5" onclick="auditRecord8()">审核记录</a>
                                </td>
                            </tr>

                        </table>
                    </div>
                </div>

                <div id="datagrid8" class="mini-datagrid report-table" style="height:300px;" allowResize="false"
                     url="${basePath}findAssetByTZ"  idField="id" multiSelect="true"  showPager='false'>
                    <div property="columns">
                        <div type="checkcolumn" ></div>
                        <div field="cardNumber" name="cardNumber" width="120" headerAlign="center" >卡片编号</div>
                        <div field="assetCode" name="assetCode" width="120" headerAlign="center" >资产编号</div>
                        <div field="assetFirst" name="assetFirst" width="120" headerAlign="center" >资产大类</div>
                        <div field="className" name="className" width="100" headerAlign="center" >资产分类</div>
                        <div field="assetName" name="assetName" width="100" headerAlign="center" >资产名称</div>
                        <div field="numb" name="numb" width="80" headerAlign="center" >数量</div>
                        <div field="originalValue" name="originalValue" width="80" headerAlign="center" >原值</div>
                        <div field="additionMethod" name="additionMethod" width="80" headerAlign="center" >增加方式</div>
                        <div field="useDepartment" name="useDepartment" width="100" headerAlign="center" >使用部门</div>
                        <div field="userName" name="userName" width="100" headerAlign="center" >使用人名称</div>
                        <div field="startTime" name="startTime" width="100" headerAlign="center" >开始使用日期</div>
                        <div field="expectedMonth" name="expectedMonth" width="100" headerAlign="center" >预计使用月份</div>
                    </div>
                </div>
            </div>
            <div title="家具、用具、装具">
                <div class="excision-check">
                    <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
                        <table style="width:100%;">

                            <tr>
                                <td class="search-inform" style="white-space:nowrap;">
                                    <em class="search-tit">增加时间：</em>
                                    <input id="combo22" class="mini-datepicker" style="width:150px;" textField="text" valueField="id" emptyText="年/月/日"
                                            allowInput="true" showNullItem="true" nullItemText="年/月/日"/> 至
                                    <input id="combo23" class="mini-datepicker" style="width:150px;" textField="text" valueField="id" emptyText="年/月/日"
                                            allowInput="true" showNullItem="true" nullItemText="年/月/日"/>
                                    
                                    <em class="search-tit">资产分类：</em>
                                    <input id="combo51" class="mini-combobox" style="width:150px;" textField="text" valueField="id" emptyText="请选择..."
                                            allowInput="true" showNullItem="true"/>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:100%;">
                                    <a class="mini-button btn1" onclick="search9()">查询</a>
                                    <a class="mini-button btn2" onclick="exportEx()">导出</a>
                                    <a class="mini-button btn3" onclick="">打印</a>
        <%--<a class="mini-button btn5" onclick="AuditStatus()">审核状态</a>--%>
        <a class="mini-button btn5" onclick="auditRecord9()">审核记录</a>
                                </td>
                            </tr>

                        </table>
                    </div>
                </div>

                <div id="datagrid9" class="mini-datagrid report-table" style="height:300px;" allowResize="false"
                     url="${basePath}findAssetByTZ"  idField="id" multiSelect="true"  showPager='false'>
                    <div property="columns">
                        <div type="checkcolumn" ></div>
                        <div field="cardNumber" name="cardNumber" width="120" headerAlign="center" >卡片编号</div>
                        <div field="assetCode" name="assetCode" width="120" headerAlign="center" >资产编号</div>
                        <div field="assetFirst" name="assetFirst" width="120" headerAlign="center" >资产大类</div>
                        <div field="className" name="className" width="100" headerAlign="center" >资产分类</div>
                        <div field="assetName" name="assetName" width="100" headerAlign="center" >资产名称</div>
                        <div field="numb" name="numb" width="80" headerAlign="center" >数量</div>
                        <div field="originalValue" name="originalValue" width="80" headerAlign="center" >原值</div>
                        <div field="additionMethod" name="additionMethod" width="80" headerAlign="center" >增加方式</div>
                        <div field="brand" name="brand" width="100" headerAlign="center" >品牌</div>
                        <div field="specificationModel" name="specificationModel" width="100" headerAlign="center" >规格型号</div>
                        <div field="useDepartment" name="useDepartment" width="100" headerAlign="center" >使用部门</div>
                        <div field="userName" name="userName" width="100" headerAlign="center" >使用人名称</div>
                    </div>
                </div>
            </div>
            <div title="特种动植物">
                <div class="excision-check">
                    <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
                        <table style="width:100%;">

                            <tr>
                                <td class="search-inform" style="white-space:nowrap;">
                                    <em class="search-tit">增加时间：</em>
                                    <input id="combo24" class="mini-datepicker" style="width:150px;" textField="text" valueField="id" emptyText="年/月/日"
                                             allowInput="true" showNullItem="true" nullItemText="年/月/日"/> 至
                                    <input id="combo25" class="mini-datepicker" style="width:150px;" textField="text" valueField="id" emptyText="年/月/日"
                                             allowInput="true" showNullItem="true" nullItemText="年/月/日"/>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td style="width:100%;">
                                    <a class="mini-button btn1" onclick="search10()">查询</a>
                                    <a class="mini-button btn2" onclick="excelExport()">导出</a>
                                    <a class="mini-button btn3" onclick="">打印</a>
        <%--<a class="mini-button btn5" onclick="AuditStatus()">审核状态</a>--%>
        <a class="mini-button btn5" onclick="auditRecord10()">审核记录</a>
                                </td>
                            </tr>

                        </table>
                    </div>
                </div>

                <div id="datagrid10" class="mini-datagrid report-table" style="height:300px;" allowResize="false"
                     url="${basePath}findAssetByTZ"  idField="id" multiSelect="true"  showPager='false'>
                    <div property="columns">
                        <div type="checkcolumn" ></div>
                        <div field="cardNumber" name="cardNumber" width="120" headerAlign="center" >卡片编号</div>
                        <div field="assetCode" name="assetCode" width="120" headerAlign="center" >资产编号</div>
                        <div field="assetFirst" name="assetFirst" width="120" headerAlign="center" >资产大类</div>
                        <div field="className" name="className" width="100" headerAlign="center" >资产分类</div>
                        <div field="assetName" name="assetName" width="100" headerAlign="center" >资产名称</div>
                        <div field="numb" name="numb" width="80" headerAlign="center" >数量</div>
                        <div field="originalValue" name="originalValue" width="80" headerAlign="center" >原值</div>
                        <div field="additionMethod" name="additionMethod" width="80" headerAlign="center" >增加方式</div>
                        <div field="useDepartment" name="useDepartment" width="100" headerAlign="center" >使用部门</div>
                        <div field="userName" name="userName" width="100" headerAlign="center" >使用人名称</div>
                        <div field="startTime" name="startTime" width="100" headerAlign="center" >开始使用日期</div>
                        <div field="expectedMonth" name="expectedMonth" width="100" headerAlign="center" >预计使用月份</div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>
<script>
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
	            error: function () {
                	alert("请求失败");
                }
	        })
	};
//查询-All--土地
    var grid = mini.get("datagrid1");
    function Derivation(){
        var row = grid.getSelecteds();
        var ids=[];
        if(typeof(row)=="undefined"){
        alert("请选择一条数据")
        }else{
        for (var i = 0, l = row.length; i < l; i++) {
        var r = row[i];
        ids.push(r.cardNumber);
        }
        var returnValue = JSON.stringify(ids);
        $.ajax({
        url:"${basePath}assetExport",
        type:"post",
        data:{"cids":returnValue},
        success:function(text){
        alert("导出成功");
        },
        error:function(){
        alert("导出失败")
        }
        })
        }
    }
	 grid.load({"audit_state":"3,4","asset_first":"1"});
	 grid.on("drawcell", function (e) {
                var record = e.record,
                column = e.column,
                field = e.field,
                value = e.value;
        //将增加方式替换文本--增加方式
        if (column.field == "additionMethod") {
            if (e.value == 1) {
                e.cellHtml = "购置构建"
            }
            if (e.value == 2) {
                e.cellHtml = "调拨"
            }
            if (e.value == 3) {
                e.cellHtml = "接收捐赠"
            }
            if (e.value == 4) {
                e.cellHtml = "增加置换"
            }
            if (e.value == 5) {
                e.cellHtml = "其他增加"
            }
        }
        //将资产大类替换文本--资产大类
        if (column.field == "assetFirst") {
            if (e.value == 1) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 2) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 3) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 4) {
                e.cellHtml = "通用设备"
            }
            if (e.value == 5) {
                e.cellHtml = "通用设备"
            }
            if (e.value == 6) {
                e.cellHtml = "专用设备"
            }
            if (e.value == 7) {
                e.cellHtml = "文物、成列品"
            }
            if (e.value == 8) {
                e.cellHtml = "图书、档案"
            }
            if (e.value == 9) {
                e.cellHtml = "家具、用具、装具及动植物"
            }
            if (e.value == 10) {
                e.cellHtml = "家具、用具、装具及动植物"
            }
        }
    });

	 /*查询-条件--土地*/
    function search(){
        var key1 = ChangeDateFormat2(mini.get("combo1").getValue());
        var key2 = ChangeDateFormat2(mini.get("combo2").getValue());
        var key3 = mini.get("combo5").getValue();
        grid.load({"news_date_str":key1,"news_date_end":key2,"asset_first":"1","audit_state":"3,4"});   
       }
    //审核状态
    function AuditStatus(){
        var assetName=grid.getSelecteds();
        var name="";
        name=assetName[0].bpmId;
        if (assetName!="") {
        mini.open({
        url: "${basePath}view/asset/file/AuditEjection1.jsp",
        title: "审核状态", width: 800, height: 400,
        onload: function () {
        var iframe = this.getIFrameEl();
        iframe.contentWindow.SetData(name);
        },
        ondestroy: function (action) {
        grid4.reload();
        }
        });
        }else {
        alert("请选中一条记录");
        }
        }
    //审核记录
    function auditRecord(){
        var data = grid4.getSelected();
        if(typeof(data)!="undefined"){
        $.ajax({
        url:flowUrlpath+"jbpm/findAuditLogsByParam",
        type:"post",
        data:{"source":"zc","businessId":data.cardNumber},
        success:function(objectVO){
        mini.open({
        url: "${basePath}view/asset/file/AuditEjection.html",
        title: "审核记录", width: 1000, height: 500,
        onload: function () {
        var iframe = this.getIFrameEl();
        iframe.contentWindow.SetData(objectVO);
        },
        ondestroy: function (action) {
        grid4.reload();
        }
        });
        },
        error:function(){
        alert("数据请求失败")
        }
        })
        }else{
        alert("请选中一条记录")
        }
        }
        
    //查询-All--房屋
     var grid2 = mini.get("datagrid2");
    function ExportTwo(){
    var row = grid2.getSelecteds();
    var ids=[];
    if(typeof(row)=="undefined"){
    alert("请选择一条数据")
    }else{
    for (var i = 0, l = row.length; i < l; i++) {
    var r = row[i];
    ids.push(r.cardNumber);
    }
    $.ajax({
    url:"${basePath}assetExport",
    type:"post",
    data:{"cids":ids},
    success:function(text){
    alert("导出成功");
    },
    error:function(){
    alert("导出失败")
    }
    })
    }
    }
	 grid2.load({"audit_state":"3,4","asset_first":"2"});
	 grid2.on("drawcell", function (e) {
                var record = e.record,
                column = e.column,
                field = e.field,
                value = e.value;
        //将增加方式替换文本--增加方式
        if (column.field == "additionMethod") {
            if (e.value == 1) {
                e.cellHtml = "购置构建"
            }
            if (e.value == 2) {
                e.cellHtml = "调拨"
            }
            if (e.value == 3) {
                e.cellHtml = "接收捐赠"
            }
            if (e.value == 4) {
                e.cellHtml = "增加置换"
            }
            if (e.value == 5) {
                e.cellHtml = "其他增加"
            }
        }
        //将资产大类替换文本--资产大类
        if (column.field == "assetFirst") {
            if (e.value == 1) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 2) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 3) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 4) {
                e.cellHtml = "通用设备"
            }
            if (e.value == 5) {
                e.cellHtml = "通用设备"
            }
            if (e.value == 6) {
                e.cellHtml = "专用设备"
            }
            if (e.value == 7) {
                e.cellHtml = "文物、成列品"
            }
            if (e.value == 8) {
                e.cellHtml = "图书、档案"
            }
            if (e.value == 9) {
                e.cellHtml = "家具、用具、装具及动植物"
            }
            if (e.value == 10) {
                e.cellHtml = "家具、用具、装具及动植物"
            }
        }
    });

	 /*查询-条件--房屋*/
    function search2(){
        var key1 = ChangeDateFormat2(mini.get("combo6").getValue());
        var key2 = ChangeDateFormat2(mini.get("combo7").getValue());
grid2.load({"news_date_str":key1,"news_date_end":key2,"asset_first":"2","audit_state":"3,4"});   
       }
        //审核状态
        function AuditStatus2(){
        var assetName=grid2.getSelecteds();
        var name="";
        name=assetName[0].bpmId;
        if (assetName!="") {
        mini.open({
        url: "${basePath}view/asset/file/AuditEjection1.jsp",
        title: "审核状态", width: 800, height: 400,
        onload: function () {
        var iframe = this.getIFrameEl();
        iframe.contentWindow.SetData(name);
        },
        ondestroy: function (action) {
        grid4.reload();
        }
        });
        }else {
        alert("请选中一条记录");
        }
        }

        //审核记录
        function auditRecord2(){
        var data = grid2.getSelected();
        if(typeof(data)!="undefined"){
        $.ajax({
        url:flowUrlpath+"jbpm/findAuditLogsByParam",
        type:"post",
        data:{"source":"zc","businessId":data.cardNumber},
        success:function(objectVO){
        mini.open({
        url: "${basePath}view/asset/file/AuditEjection.html",
        title: "审核记录", width: 1000, height: 500,
        onload: function () {
        var iframe = this.getIFrameEl();
        iframe.contentWindow.SetData(objectVO);
        },
        ondestroy: function (action) {
        grid4.reload();
        }
        });
        },
        error:function(){
        alert("数据请求失败")
        }
        })
        }else{
        alert("请选中一条记录")
        }
        }
        //查询-All--构筑物
     var grid3 = mini.get("datagrid3");
    function ExportThree(){
        var row = grid3.getSelecteds();
        var ids=[];
        if(typeof(row)=="undefined"){
        alert("请选择一条数据")
        }else{
        for (var i = 0, l = row.length; i < l; i++) {
        var r = row[i];
        ids.push(r.cardNumber);
        }
        $.ajax({
        url:"${basePath}assetExport",
        type:"post",
        data:{"cids":ids},
        success:function(text){
        alert("导出成功");
        },
        error:function(){
        alert("导出失败")
        }
        })
        }
    }
	 grid3.load({"audit_state":"3,4","asset_first":"3"});
	 grid3.on("drawcell", function (e) {
                var record = e.record,
                column = e.column,
                field = e.field,
                value = e.value;
        //将增加方式替换文本--增加方式
        if (column.field == "additionMethod") {
            if (e.value == 1) {
                e.cellHtml = "购置构建"
            }
            if (e.value == 2) {
                e.cellHtml = "调拨"
            }
            if (e.value == 3) {
                e.cellHtml = "接收捐赠"
            }
            if (e.value == 4) {
                e.cellHtml = "增加置换"
            }
            if (e.value == 5) {
                e.cellHtml = "其他增加"
            }
        }
        //将资产大类替换文本--资产大类
        if (column.field == "assetFirst") {
            if (e.value == 1) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 2) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 3) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 4) {
                e.cellHtml = "通用设备"
            }
            if (e.value == 5) {
                e.cellHtml = "通用设备"
            }
            if (e.value == 6) {
                e.cellHtml = "专用设备"
            }
            if (e.value == 7) {
                e.cellHtml = "文物、成列品"
            }
            if (e.value == 8) {
                e.cellHtml = "图书、档案"
            }
            if (e.value == 9) {
                e.cellHtml = "家具、用具、装具及动植物"
            }
            if (e.value == 10) {
                e.cellHtml = "家具、用具、装具及动植物"
            }
        }
    });

	 /*查询-条件--构筑物*/
    function search3(){
        var key1 = ChangeDateFormat2(mini.get("combo10").getValue());
        var key2 = ChangeDateFormat2(mini.get("combo11").getValue());
grid3.load({"news_date_str":key1,"news_date_end":key2,"asset_first":"3","audit_state":"3,4"});   
       }
        //审核状态
        function AuditStatus3(){
        var assetName=grid3.getSelecteds();
        var name="";
        name=assetName[0].bpmId;
        if (assetName!="") {
        mini.open({
        url: "${basePath}view/asset/file/AuditEjection1.jsp",
        title: "审核状态", width: 800, height: 400,
        onload: function () {
        var iframe = this.getIFrameEl();
        iframe.contentWindow.SetData(name);
        },
        ondestroy: function (action) {
        grid4.reload();
        }
        });
        }else {
        alert("请选中一条记录");
        }
        }

        //审核记录
        function auditRecord3(){
        var data = grid3.getSelected();
        if(typeof(data)!="undefined"){
        $.ajax({
        url:flowUrlpath+"jbpm/findAuditLogsByParam",
        type:"post",
        data:{"source":"zc","businessId":data.cardNumber},
        success:function(objectVO){
        mini.open({
        url: "${basePath}view/asset/file/AuditEjection.html",
        title: "审核记录", width: 1000, height: 500,
        onload: function () {
        var iframe = this.getIFrameEl();
        iframe.contentWindow.SetData(objectVO);
        },
        ondestroy: function (action) {
        grid4.reload();
        }
        });
        },
        error:function(){
        alert("数据请求失败")
        }
        })
        }else{
        alert("请选中一条记录")
        }
        }
        //查询-All--通用设备
     var grid4 = mini.get("datagrid4");
    function ExportFour(){
        var row = grid4.getSelecteds();
        var ids=[];
        if(typeof(row)=="undefined"){
        alert("请选择一条数据")
        }else{
        for (var i = 0, l = row.length; i < l; i++) {
        var r = row[i];
        ids.push(r.cardNumber);
        }
        $.ajax({
        url:"${basePath}assetExport",
        type:"post",
        data:{"cids":ids},
        success:function(text){
        alert("导出成功");
        },
        error:function(){
        alert("导出失败")
        }
        })
        }
    }
	 grid4.load({"audit_state":"3,4","asset_first":"4"});
	 grid4.on("drawcell", function (e) {
                var record = e.record,
                column = e.column,
                field = e.field,
                value = e.value;
        //将增加方式替换文本--增加方式
        if (column.field == "additionMethod") {
            if (e.value == 1) {
                e.cellHtml = "购置构建"
            }
            if (e.value == 2) {
                e.cellHtml = "调拨"
            }
            if (e.value == 3) {
                e.cellHtml = "接收捐赠"
            }
            if (e.value == 4) {
                e.cellHtml = "增加置换"
            }
            if (e.value == 5) {
                e.cellHtml = "其他增加"
            }
        }
        //将资产大类替换文本--资产大类
        if (column.field == "assetFirst") {
            if (e.value == 1) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 2) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 3) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 4) {
                e.cellHtml = "通用设备"
            }
            if (e.value == 5) {
                e.cellHtml = "通用设备"
            }
            if (e.value == 6) {
                e.cellHtml = "专用设备"
            }
            if (e.value == 7) {
                e.cellHtml = "文物、成列品"
            }
            if (e.value == 8) {
                e.cellHtml = "图书、档案"
            }
            if (e.value == 9) {
                e.cellHtml = "家具、用具、装具及动植物"
            }
            if (e.value == 10) {
                e.cellHtml = "家具、用具、装具及动植物"
            }
        }
    });

	 /*查询-条件--通用设备*/
    function search4(){
        var key1 = ChangeDateFormat2(mini.get("combo8").getValue());
        var key2 = ChangeDateFormat2(mini.get("combo9").getValue());
        var key3 = mini.get("combo5").getValue();
grid4.load({"news_date_str":key1,"news_date_end":key2,"asset_first":"4","audit_state":"3,4"});   
       }
        //审核状态
        function AuditStatus4(){
        var assetName=grid4.getSelecteds();
        var name="";
        name=assetName[0].bpmId;
        if (assetName!="") {
        mini.open({
        url: "${basePath}view/asset/file/AuditEjection1.jsp",
        title: "审核状态", width: 800, height: 400,
        onload: function () {
        var iframe = this.getIFrameEl();
        iframe.contentWindow.SetData(name);
        },
        ondestroy: function (action) {
        grid4.reload();
        }
        });
        }else {
        alert("请选中一条记录");
        }
        }
        //审核记录
        function auditRecord4(){
        var data = grid4.getSelected();
        if(typeof(data)!="undefined"){
        $.ajax({
        url:flowUrlpath+"jbpm/findAuditLogsByParam",
        type:"post",
        data:{"source":"zc","businessId":data.cardNumber},
        success:function(objectVO){
        mini.open({
        url: "${basePath}view/asset/file/AuditEjection.html",
        title: "审核记录", width: 1000, height: 500,
        onload: function () {
        var iframe = this.getIFrameEl();
        iframe.contentWindow.SetData(objectVO);
        },
        ondestroy: function (action) {
        grid4.reload();
        }
        });
        },
        error:function(){
        alert("数据请求失败")
        }
        })
        }else{
        alert("请选中一条记录")
        }
        }
        //查询-All--车辆
     var grid5 = mini.get("datagrid5");
    function ExportFive(){
        var row = grid5.getSelecteds();
        var ids=[];
        if(typeof(row)=="undefined"){
        alert("请选择一条数据")
        }else{
        for (var i = 0, l = row.length; i < l; i++) {
        var r = row[i];
        ids.push(r.cardNumber);
        }
        $.ajax({
        url:"${basePath}assetExport",
        type:"post",
        data:{"cids":ids},
        success:function(text){
        alert("导出成功");
        },
        error:function(){
        alert("导出失败")
        }
        })
        }
    }
	 grid5.load({"audit_state":"3,4","asset_first":"5"});
	 grid5.on("drawcell", function (e) {
                var record = e.record,
                column = e.column,
                field = e.field,
                value = e.value;
        //将增加方式替换文本--增加方式
        if (column.field == "additionMethod") {
            if (e.value == 1) {
                e.cellHtml = "购置构建"
            }
            if (e.value == 2) {
                e.cellHtml = "调拨"
            }
            if (e.value == 3) {
                e.cellHtml = "接收捐赠"
            }
            if (e.value == 4) {
                e.cellHtml = "增加置换"
            }
            if (e.value == 5) {
                e.cellHtml = "其他增加"
            }
        }
        //将资产大类替换文本--资产大类
        if (column.field == "assetFirst") {
            if (e.value == 1) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 2) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 3) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 4) {
                e.cellHtml = "通用设备"
            }
            if (e.value == 5) {
                e.cellHtml = "通用设备"
            }
            if (e.value == 6) {
                e.cellHtml = "专用设备"
            }
            if (e.value == 7) {
                e.cellHtml = "文物、成列品"
            }
            if (e.value == 8) {
                e.cellHtml = "图书、档案"
            }
            if (e.value == 9) {
                e.cellHtml = "家具、用具、装具及动植物"
            }
            if (e.value == 10) {
                e.cellHtml = "家具、用具、装具及动植物"
            }
        }
    });

	 /*查询-条件--车辆*/
    function search5(){
        var key1 = ChangeDateFormat2(mini.get("combo13").getValue());
        var key2 = ChangeDateFormat2(mini.get("combo14").getValue());
grid5.load({"news_date_str":key1,"news_date_end":key2,"asset_first":"5","audit_state":"3,4"});   
       }
        //审核状态
        function AuditStatus5(){
        var assetName=grid5.getSelecteds();
        var name="";
        name=assetName[0].bpmId;
        if (assetName!="") {
        mini.open({
        url: "${basePath}view/asset/file/AuditEjection1.jsp",
        title: "审核状态", width: 800, height: 400,
        onload: function () {
        var iframe = this.getIFrameEl();
        iframe.contentWindow.SetData(name);
        },
        ondestroy: function (action) {
        grid4.reload();
        }
        });
        }else {
        alert("请选中一条记录");
        }
        }
        //审核记录
        function auditRecord5(){
        var data = grid5.getSelected();
        if(typeof(data)!="undefined"){
        $.ajax({
        url:flowUrlpath+"jbpm/findAuditLogsByParam",
        type:"post",
        data:{"source":"zc","businessId":data.cardNumber},
        success:function(objectVO){
        mini.open({
        url: "${basePath}view/asset/file/AuditEjection.html",
        title: "审核记录", width: 1000, height: 500,
        onload: function () {
        var iframe = this.getIFrameEl();
        iframe.contentWindow.SetData(objectVO);
        },
        ondestroy: function (action) {
        grid4.reload();
        }
        });
        },
        error:function(){
        alert("数据请求失败")
        }
        })
        }else{
        alert("请选中一条记录")
        }
        }
        //查询-All--专用设备
     var grid6 = mini.get("datagrid6");
    function ExportSix(){
        var row = grid6.getSelecteds();
        var ids=[];
        if(typeof(row)=="undefined"){
        alert("请选择一条数据")
        }else{
        for (var i = 0, l = row.length; i < l; i++) {
        var r = row[i];
        ids.push(r.cardNumber);
        }
        $.ajax({
        url:"${basePath}assetExport",
        type:"post",
        data:{"cids":ids},
        success:function(text){
        alert("导出成功");
        },
        error:function(){
        alert("导出失败")
        }
        })
        }
    }
	 grid6.load({"audit_state":"3,4","asset_first":"6"});
	 grid6.on("drawcell", function (e) {
                var record = e.record,
                column = e.column,
                field = e.field,
                value = e.value;
        //将增加方式替换文本--增加方式
        if (column.field == "additionMethod") {
            if (e.value == 1) {
                e.cellHtml = "购置构建"
            }
            if (e.value == 2) {
                e.cellHtml = "调拨"
            }
            if (e.value == 3) {
                e.cellHtml = "接收捐赠"
            }
            if (e.value == 4) {
                e.cellHtml = "增加置换"
            }
            if (e.value == 5) {
                e.cellHtml = "其他增加"
            }
        }
        //将资产大类替换文本--资产大类
        if (column.field == "assetFirst") {
            if (e.value == 1) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 2) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 3) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 4) {
                e.cellHtml = "通用设备"
            }
            if (e.value == 5) {
                e.cellHtml = "通用设备"
            }
            if (e.value == 6) {
                e.cellHtml = "专用设备"
            }
            if (e.value == 7) {
                e.cellHtml = "文物、成列品"
            }
            if (e.value == 8) {
                e.cellHtml = "图书、档案"
            }
            if (e.value == 9) {
                e.cellHtml = "家具、用具、装具及动植物"
            }
            if (e.value == 10) {
                e.cellHtml = "家具、用具、装具及动植物"
            }
        }
    });

	 /*查询-条件--专用设备*/
    function search6(){
        var key1 = ChangeDateFormat2(mini.get("combo16").getValue());
        var key2 = ChangeDateFormat2(mini.get("combo17").getValue());
        var key3 = mini.get("combo55").getValue();
grid6.load({"news_date_str":key1,"news_date_end":key2,"asset_first":"6","audit_state":"3,4"});   
       }
        //审核状态
        function AuditStatus6(){
        var assetName=grid6.getSelecteds();
        var name="";
        name=assetName[0].bpmId;
        if (assetName!="") {
        mini.open({
        url: "${basePath}view/asset/file/AuditEjection1.jsp",
        title: "审核状态", width: 800, height: 400,
        onload: function () {
        var iframe = this.getIFrameEl();
        iframe.contentWindow.SetData(name);
        },
        ondestroy: function (action) {
        grid4.reload();
        }
        });
        }else {
        alert("请选中一条记录");
        }
        }
        //审核记录
        function auditRecord6(){
        var data = grid6.getSelected();
        if(typeof(data)!="undefined"){
        $.ajax({
        url:flowUrlpath+"jbpm/findAuditLogsByParam",
        type:"post",
        data:{"source":"zc","businessId":data.cardNumber},
        success:function(objectVO){
        mini.open({
        url: "${basePath}view/asset/file/AuditEjection.html",
        title: "审核记录", width: 1000, height: 500,
        onload: function () {
        var iframe = this.getIFrameEl();
        iframe.contentWindow.SetData(objectVO);
        },
        ondestroy: function (action) {
        grid4.reload();
        }
        });
        },
        error:function(){
        alert("数据请求失败")
        }
        })
        }else{
        alert("请选中一条记录")
        }
        }
        //查询-All--文物与陈列设备
     var grid7 = mini.get("datagrid7");
    function ExportSeven(){
        var row = grid7.getSelecteds();
        var ids=[];
        if(typeof(row)=="undefined"){
        alert("请选择一条数据")
        }else{
        for (var i = 0, l = row.length; i < l; i++) {
        var r = row[i];
        ids.push(r.cardNumber);
        }
        $.ajax({
        url:"${basePath}assetExport",
        type:"post",
        data:{"cids":ids},
        success:function(text){
        alert("导出成功");
        },
        error:function(){
        alert("导出失败")
        }
        })
        }
    }
	 grid7.load({"audit_state":"3,4","asset_first":"7"});
	 grid7.on("drawcell", function (e) {
                var record = e.record,
                column = e.column,
                field = e.field,
                value = e.value;
        //日期转化
        if (column.field == "startTime") {
        	e.cellHtml=ChangeDateFormat(e.value)
        }
        //将增加方式替换文本--增加方式
        if (column.field == "additionMethod") {
            if (e.value == 1) {
                e.cellHtml = "购置构建"
            }
            if (e.value == 2) {
                e.cellHtml = "调拨"
            }
            if (e.value == 3) {
                e.cellHtml = "接收捐赠"
            }
            if (e.value == 4) {
                e.cellHtml = "增加置换"
            }
            if (e.value == 5) {
                e.cellHtml = "其他增加"
            }
        }
        //将资产大类替换文本--资产大类
        if (column.field == "assetFirst") {
            if (e.value == 1) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 2) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 3) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 4) {
                e.cellHtml = "通用设备"
            }
            if (e.value == 5) {
                e.cellHtml = "通用设备"
            }
            if (e.value == 6) {
                e.cellHtml = "专用设备"
            }
            if (e.value == 7) {
                e.cellHtml = "文物、成列品"
            }
            if (e.value == 8) {
                e.cellHtml = "图书、档案"
            }
            if (e.value == 9) {
                e.cellHtml = "家具、用具、装具及动植物"
            }
            if (e.value == 10) {
                e.cellHtml = "家具、用具、装具及动植物"
            }
        }
    });

	 /*查询-条件--文物、成列品*/
    function search7(){
        var key1 = ChangeDateFormat2(mini.get("combo18").getValue());
        var key2 = ChangeDateFormat2(mini.get("combo19").getValue());
        var key3 = mini.get("combo555").getValue();
grid7.load({"news_date_str":key1,"news_date_end":key2,"asset_first":"7","audit_state":"3,4"});   
       }
        //审核状态
        function AuditStatus7(){
        var assetName=grid7.getSelecteds();
        var name="";
        name=assetName[0].bpmId;
        if (assetName!="") {
        mini.open({
        url: "${basePath}view/asset/file/AuditEjection1.jsp",
        title: "审核状态", width: 800, height: 400,
        onload: function () {
        var iframe = this.getIFrameEl();
        iframe.contentWindow.SetData(name);
        },
        ondestroy: function (action) {
        grid4.reload();
        }
        });
        }else {
        alert("请选中一条记录");
        }
        }
        //审核记录
        function auditRecord7(){
        var data = grid7.getSelected();
        if(typeof(data)!="undefined"){
        $.ajax({
        url:flowUrlpath+"jbpm/findAuditLogsByParam",
        type:"post",
        data:{"source":"zc","businessId":data.cardNumber},
        success:function(objectVO){
        mini.open({
        url: "${basePath}view/asset/file/AuditEjection.html",
        title: "审核记录", width: 1000, height: 500,
        onload: function () {
        var iframe = this.getIFrameEl();
        iframe.contentWindow.SetData(objectVO);
        },
        ondestroy: function (action) {
        grid4.reload();
        }
        });
        },
        error:function(){
        alert("数据请求失败")
        }
        })
        }else{
        alert("请选中一条记录")
        }
        }
        //查询-All--图书、档案
     var grid8 = mini.get("datagrid8");
    function ExportIt(){
        var row = grid8.getSelecteds();
        var ids=[];
        if(typeof(row)=="undefined"){
        alert("请选择一条数据")
        }else{
        for (var i = 0, l = row.length; i < l; i++) {
        var r = row[i];
        ids.push(r.cardNumber);
        }
        $.ajax({
        url:"${basePath}assetExport",
        type:"post",
        data:{"cids":ids},
        success:function(text){
        alert("导出成功");
        },
        error:function(){
        alert("导出失败")
        }
        })
        }
    }
	 grid8.load({"audit_state":"3,4","asset_first":"8"});
	 grid8.on("drawcell", function (e) {
                var record = e.record,
                column = e.column,
                field = e.field,
                value = e.value;
        //日期转化
        if (column.field == "startTime") {
        	e.cellHtml=ChangeDateFormat(e.value)
        }
        //将增加方式替换文本--增加方式
        if (column.field == "additionMethod") {
            if (e.value == 1) {
                e.cellHtml = "购置构建"
            }
            if (e.value == 2) {
                e.cellHtml = "调拨"
            }
            if (e.value == 3) {
                e.cellHtml = "接收捐赠"
            }
            if (e.value == 4) {
                e.cellHtml = "增加置换"
            }
            if (e.value == 5) {
                e.cellHtml = "其他增加"
            }
        }
        //将资产大类替换文本--资产大类
        if (column.field == "assetFirst") {
            if (e.value == 1) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 2) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 3) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 4) {
                e.cellHtml = "通用设备"
            }
            if (e.value == 5) {
                e.cellHtml = "通用设备"
            }
            if (e.value == 6) {
                e.cellHtml = "专用设备"
            }
            if (e.value == 7) {
                e.cellHtml = "文物、成列品"
            }
            if (e.value == 8) {
                e.cellHtml = "图书、档案"
            }
            if (e.value == 9) {
                e.cellHtml = "家具、用具、装具及动植物"
            }
            if (e.value == 10) {
                e.cellHtml = "家具、用具、装具及动植物"
            }
        }
    });

	 /*查询-条件--图书、档案*/
    function search8(){
        var key1 = ChangeDateFormat2(mini.get("combo20").getValue());
        var key2 = ChangeDateFormat2(mini.get("combo21").getValue());
grid8.load({"news_date_str":key1,"news_date_end":key2,"asset_first":"8","audit_state":"3,4"});   
       }
        //审核状态
        function AuditStatus8(){
        var assetName=grid8.getSelecteds();
        var name="";
        name=assetName[0].bpmId;
        if (assetName!="") {
        mini.open({
        url: "${basePath}view/asset/file/AuditEjection1.jsp",
        title: "审核状态", width: 800, height: 400,
        onload: function () {
        var iframe = this.getIFrameEl();
        iframe.contentWindow.SetData(name);
        },
        ondestroy: function (action) {
        grid4.reload();
        }
        });
        }else {
        alert("请选中一条记录");
        }
        }
        //审核记录
        function auditRecord8(){
        var data = grid8.getSelected();
        if(typeof(data)!="undefined"){
        $.ajax({
        url:flowUrlpath+"jbpm/findAuditLogsByParam",
        type:"post",
        data:{"source":"zc","businessId":data.cardNumber},
        success:function(objectVO){
        mini.open({
        url: "${basePath}view/asset/file/AuditEjection.html",
        title: "审核记录", width: 1000, height: 500,
        onload: function () {
        var iframe = this.getIFrameEl();
        iframe.contentWindow.SetData(objectVO);
        },
        ondestroy: function (action) {
        grid4.reload();
        }
        });
        },
        error:function(){
        alert("数据请求失败")
        }
        })
        }else{
        alert("请选中一条记录")
        }
        }
        //查询-All--家具、用具、装具
     var grid9 = mini.get("datagrid9");
    function exportEx(){
        var row = grid9.getSelecteds();
        var ids=[];
        if(typeof(row)=="undefined"){
        alert("请选择一条数据")
        }else{
        for (var i = 0, l = row.length; i < l; i++) {
        var r = row[i];
        ids.push(r.cardNumber);
        }
        $.ajax({
        url:"${basePath}assetExport",
        type:"post",
        data:{"cids":ids},
        success:function(text){
        alert("导出成功");
        },
        error:function(){
        alert("导出失败")
        }
        })
        }
    }
	 grid9.load({"audit_state":"3,4","asset_first":"9"});
	 grid9.on("drawcell", function (e) {
                var record = e.record,
                column = e.column,
                field = e.field,
                value = e.value;
        //将增加方式替换文本--增加方式
        if (column.field == "additionMethod") {
            if (e.value == 1) {
                e.cellHtml = "购置构建"
            }
            if (e.value == 2) {
                e.cellHtml = "调拨"
            }
            if (e.value == 3) {
                e.cellHtml = "接收捐赠"
            }
            if (e.value == 4) {
                e.cellHtml = "增加置换"
            }
            if (e.value == 5) {
                e.cellHtml = "其他增加"
            }
        }
        //将资产大类替换文本--资产大类
        if (column.field == "assetFirst") {
            if (e.value == 1) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 2) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 3) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 4) {
                e.cellHtml = "通用设备"
            }
            if (e.value == 5) {
                e.cellHtml = "通用设备"
            }
            if (e.value == 6) {
                e.cellHtml = "专用设备"
            }
            if (e.value == 7) {
                e.cellHtml = "文物、成列品"
            }
            if (e.value == 8) {
                e.cellHtml = "图书、档案"
            }
            if (e.value == 9) {
                e.cellHtml = "家具、用具、装具及动植物"
            }
            if (e.value == 10) {
                e.cellHtml = "家具、用具、装具及动植物"
            }
        }
    });

	 /*查询-条件--家具、用具、装具*/
    function search9(){
        var key1 = ChangeDateFormat2(mini.get("combo22").getValue());
        var key2 = ChangeDateFormat2(mini.get("combo23").getValue());
        var key3 = mini.get("combo51").getValue();
grid9.load({"news_date_str":key1,"news_date_end":key2,"asset_first":"9","audit_state":"3,4"});   
       }
        //审核状态
        function AuditStatus9(){
        var assetName=grid9.getSelecteds();
        var name="";
        name=assetName[0].bpmId;
        if (assetName!="") {
        mini.open({
        url: "${basePath}view/asset/file/AuditEjection1.jsp",
        title: "审核状态", width: 800, height: 400,
        onload: function () {
        var iframe = this.getIFrameEl();
        iframe.contentWindow.SetData(name);
        },
        ondestroy: function (action) {
        grid4.reload();
        }
        });
        }else {
        alert("请选中一条记录");
        }
        }
        //审核记录
        function auditRecord9(){
        var data = grid9.getSelected();
        if(typeof(data)!="undefined"){
        $.ajax({
        url:flowUrlpath+"jbpm/findAuditLogsByParam",
        type:"post",
        data:{"source":"zc","businessId":data.cardNumber},
        success:function(objectVO){
        mini.open({
        url: "${basePath}view/asset/file/AuditEjection.html",
        title: "审核记录", width: 1000, height: 500,
        onload: function () {
        var iframe = this.getIFrameEl();
        iframe.contentWindow.SetData(objectVO);
        },
        ondestroy: function (action) {
        grid4.reload();
        }
        });
        },
        error:function(){
        alert("数据请求失败")
        }
        })
        }else{
        alert("请选中一条记录")
        }
        }
        //查询-All--动植物
    var grid10 = mini.get("datagrid10");
    function excelExport() {
        var row = grid10.getSelecteds();
        var ids=[];
        for(var i=0;i<row.length;i++){
           var n=row[i];
           ids.push(n.cardNumber)
        };
        var content=JSON.stringify(ids);
        console.log(ids);
        var lineClick=row.cardNumber;
        var url = '${basePath}assetExport';
        var form=$("<form>");
        form.attr("style","display:none");
        form.attr("target","");
        form.attr("method","post");
        form.attr("action",url);
        $("body").append(form)
        var input1=$("<input>");
        input1.attr("type","hidden");
        input1.attr("name","cids");
        input1.attr("value",ids);
        form.append(input1);
        form.submit();//表单提交
    }

    grid10.load({"audit_state":"3,4","asset_first":"10"});
	grid10.on("drawcell", function (e) {
                var record = e.record,
                column = e.column,
                field = e.field,
                value = e.value;
        //日期转化
        if (column.field == "startTime") {
        	e.cellHtml=ChangeDateFormat(e.value)
        }
        //将增加方式替换文本--增加方式
        if (column.field == "additionMethod") {
            if (e.value == 1) {
                e.cellHtml = "购置构建"
            }
            if (e.value == 2) {
                e.cellHtml = "调拨"
            }
            if (e.value == 3) {
                e.cellHtml = "接收捐赠"
            }
            if (e.value == 4) {
                e.cellHtml = "增加置换"
            }
            if (e.value == 5) {
                e.cellHtml = "其他增加"
            }
        }
        //将资产大类替换文本--资产大类
        if (column.field == "assetFirst") {
            if (e.value == 1) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 2) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 3) {
                e.cellHtml = "土地、房屋及构筑物"
            }
            if (e.value == 4) {
                e.cellHtml = "通用设备"
            }
            if (e.value == 5) {
                e.cellHtml = "通用设备"
            }
            if (e.value == 6) {
                e.cellHtml = "专用设备"
            }
            if (e.value == 7) {
                e.cellHtml = "文物、成列品"
            }
            if (e.value == 8) {
                e.cellHtml = "图书、档案"
            }
            if (e.value == 9) {
                e.cellHtml = "家具、用具、装具及动植物"
            }
            if (e.value == 10) {
                e.cellHtml = "家具、用具、装具及动植物"
            }
        }
    });

	 /*查询-条件--动植物*/
    function search10(){
        var key1 = ChangeDateFormat2(mini.get("combo24").getValue());
        var key2 = ChangeDateFormat2(mini.get("combo25").getValue());
grid10.load({"news_date_str":key1,"news_date_end":key2,"asset_first":"10","audit_state":"3,4"});   
       }
        //审核状态
        function AuditStatus10(){
        var assetName=grid10.getSelecteds();
        var name="";
        name=assetName[0].bpmId;
        if (assetName!="") {
        mini.open({
        url: "${basePath}view/asset/file/AuditEjection1.jsp",
        title: "审核状态", width: 800, height: 400,
        onload: function () {
        var iframe = this.getIFrameEl();
        iframe.contentWindow.SetData(name);
        },
        ondestroy: function (action) {
        grid4.reload();
        }
        });
        }else {
        alert("请选中一条记录");
        }
        }
        //审核记录
        function auditRecord10(){
        var data = grid10.getSelected();
        if(typeof(data)!="undefined"){
        $.ajax({
        url:flowUrlpath+"jbpm/findAuditLogsByParam",
        type:"post",
        data:{"source":"zc","businessId":data.cardNumber},
        success:function(objectVO){
        mini.open({
        url: "${basePath}view/asset/file/AuditEjection.html",
        title: "审核记录", width: 1000, height: 500,
        onload: function () {
        var iframe = this.getIFrameEl();
        iframe.contentWindow.SetData(objectVO);
        },
        ondestroy: function (action) {
        grid4.reload();
        }
        });
        },
        error:function(){
        alert("数据请求失败")
        }
        })
        }else{
        alert("请选中一条记录")
        }
        }
        </script>

</body>
</html>

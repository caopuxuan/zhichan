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
    <title>新增</title>
    <link href="scripts/miniui/themes/default/miniui.css" rel="stylesheet" type="text/css" />
    <link href="scripts/miniui/themes/icons.css" rel="stylesheet" type="text/css" />
    <link href="css/reset.css" rel="stylesheet" type="text/css" />
    <link href="css/report.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="scripts/jquery.min.js"></script>
    <script type="text/javascript" src="scripts/miniui/miniui.js"></script>
    <script type="text/javascript" src="js/assets.js"></script>
</head>
<body>
<div class="yusuan-up">
    <div style="width: 100%;border-bottom: 1px solid black">
        <div style="width:95%; margin:10px auto;">
            <div class="mini-toolbar" style="border:0;padding:0px;background: none">
                <table style="width:100%;">
                    <tr>
                        <td style="width:47%;">
                            <a class="mini-button btn2" onclick="window.close();" plain="true">关闭</a>
                        </td>
                        <td style="white-space:nowrap;font-size: 15px">
                            <h2>选择类别</h2>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="add-main1">
        <div class="add-tit1">
            <div class="house-img"><span><img src="img/img4.png" alt=""/></span><span>土地、房屋及构筑物</span></div>
            <div class="house-main">
                <a class="mini-button mini-button-info" href="${basePath}view/asset/maintenance/tu-land.jsp" target="_blank" >土地</a>
                <a class="mini-button mini-button-info"  href="${basePath}view/asset/maintenance/House.jsp" target="_blank">房屋</a>
                <a class="mini-button mini-button-info"  href="${basePath}view/asset/maintenance/gou-Structure.jsp" target="_blank">构筑物</a>
            </div>
        </div>
        <div class="add-tit1">
            <div class="house-img"><span><img src="img/img2.png" alt=""/></span><span>通用设备</span></div>
            <div class="house-main">
                <a class="mini-button mini-button-info" target="_blank" href="${basePath}view/asset/maintenance/tong-equipment.jsp" >通用设备</a>
                <a class="mini-button mini-button-info" target="_blank" href="${basePath}view/asset/maintenance/che-vehicle.jsp">车辆</a>
            </div>
        </div>
        <div class="add-tit1">
            <div class="house-img"><span><img src="img/im6.png" alt=""/></span><span>专用设备</span></div>
            <div class="house-main">
                <a class="mini-button mini-button-info" href="${basePath}view/asset/maintenance/zhuan-special.jsp" target="_blank" >专用设备</a>
            </div>
        </div>
        <div class="add-tit1">
            <div class="house-img"><span><img src="img/img5.png" alt=""/></span><span>文物和成列品</span></div>
            <div class="house-main">
                <a class="mini-button mini-button-info" target="_blank" href="${basePath}view/asset/maintenance/wen-Cultural.jsp">文物、成列品</a>
            </div>
        </div>
        <div class="add-tit1">
            <div class="house-img"><span><img src="img/img3.png" alt=""/></span><span>图书、档案</span></div>
            <div class="house-main">
                <a class="mini-button mini-button-info" target="_blank" href="${basePath}view/asset/maintenance/tu-books.jsp">图书、档案</a>
            </div>
        </div>
        <div class="add-tit1">
            <div class="house-img"><span><img src="img/img1.png" alt=""/></span><span>家具、用具、装具及动植物</span></div>
            <div class="house-main">
                <a class="mini-button mini-button-info" href="${basePath}view/asset/maintenance/jia-appliance.jsp" target="_blank">家具、用具、装具</a>
                <a class="mini-button mini-button-info" target="_blank" href="${basePath}view/asset/maintenance/dong-Flora.jsp">动植物</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
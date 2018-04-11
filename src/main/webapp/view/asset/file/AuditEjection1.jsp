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
    <title>资产卡片审核--车辆</title>
    <link href="css/index.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="scripts/jquery.min.js"></script>
    <script type="text/javascript" src="swfupload.js"></script>
    <style>
       #showProcessProgress{height:230px;overflow:hidden}
    </style>
</head>
<body>
<script>
    var flowUrlpath="<%=flowUrlpath%>";
    function SetData(processInstanceId){
        var url=flowUrlpath+'jbpm/findProcessProgress1?processInstanceId';
        if(!$("#showProcessProgress")[0]){
            $("body").append("<div id='showProcessProgress' style='overflow-y:auto;z-index:200;background:#FFF;-webkit-border-radius: 10px;-moz-border-radius: 10px;'></em>"+
                    "<img id='base64Image' src='"+url+"=" + processInstanceId+ "' style='width:92%'>" +
                    "" +
                    "</div>");
            $(".window-mask").fadeIn();
            $("#showProcessProgress .close_btn").click(function(){
                $("#showProcessProgress").css({visibility:"hidden"});
                $(".window-mask").fadeOut();
                //$("#showProcessProgress").empty();
            });
            //CommonData.divCenter("showProcessProgress");
        }else{
            $("#showProcessProgress").append("<img id='base64Image' src='"+url+"=" + processInstanceId+ "&"+Math.random()+"' style='position:absolute; left:0px; top:0px;height:100%;width:100%;'>");
            $("#showProcessProgress").css({visibility:"visible"});
        }
    }
</script>
</body>
</html>

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
    <script type="text/javascript" src="js/asset-audit.js"></script>
    <style>
        #showProcessProgressReturn{height:230px;overflow:hidden}
    </style>
</head>
<body>
    <script>
    var flowUrlpath="<%=flowUrlpath%>";
    console.log(flowUrlpath)
    function SetData(data,editBpmid,content,params1,url,editId2){
    var arrs = data.rows;
    console.log(arrs)
    $("body").append("<div id='showProcessProgressReturn'>" +"</div>");
    $("#showProcessProgressReturn").append("<img id='base64ImageReturn' src="+flowUrlpath+"jbpm/findProcessProgress1?processInstanceId=" + editBpmid+

    " style='width:100%;height:auto;z-index:500;'>");
    console.log(data)
    var name = arrs[0].post?arrs[0].post.postName:arrs[0].postId;
    $("#base64ImageReturn").before("<a id='"+arrs[0].transitionName+"' name ='bpmReturn' href='javascript:void(0)' " +
    "class='l-btn l-btn-small'"+
    "style='width:100px;z-index:9999;" +
    "position:absolute;top:"+(arrs[0].y+arrs[0].height-30)+
    "px;left:"+(arrs[0].x+arrs[0].width/2-60)+"px;'>"
    +"<span class='l-btn-left' style='margin-top: 0px;'>"+
    "<span class='l-btn-text'>退回到："+name+"</span></span></a>");
    $("#"+arrs[0].transitionName).click(function(){
    var transitionName= $(this).attr("id");
    //var nameAll=$(this).children("span").children("span").text();
    approveApplicationBack(transitionName,content,params1,url,editId2)
    });
    }

    function approveApplicationBack(transitionName,content,params1,url,editId2){
        params1.state=transitionName;
        var data = {
                "cardNumber" : editId2,
                "auditState" : 6,
                "auditOpinion" : content,
                "params":JSON.stringify(params1),
        };
        submit(data,url);
    }
    /** 提交数据 */
    function submit(params,url){
        $.ajax({
        type : "POST",
        dataType : "json",
        //				contentType : "application/json",
        url :url,
        data : params,
        cache : false,
        success : function(data) {
        alert("退回成功")
        window.history.back();
        },
        error:function(){
        alert("退回失败")
    }
    });
    }
    </script>
</body>
</html>
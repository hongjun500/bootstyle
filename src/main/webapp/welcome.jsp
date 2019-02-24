<%@ page import="com.boot.core.ip.GetIPAddress" %>
<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2018/10/7
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎</title>

</head>
<body>


欢迎用户：&nbsp;${USER_SESSION.user_name}使用Bootstyle后台管理系统！<br>

IP:<%=GetIPAddress.getIpAddr(request)%>



</body>
</html>

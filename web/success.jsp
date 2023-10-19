<%--
  Created by IntelliJ IDEA.
  User: 23920
  Date: 2023/10/19
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1><%=request.getSession().getAttribute("user")%>,欢迎您！</h1>
</body>
</html>

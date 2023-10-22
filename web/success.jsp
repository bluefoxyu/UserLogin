<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Profile</title>
    <style>
        body {
            background-image: url('images/背景2.png'); /* 设置背景图片 */
            background-size: cover;
            background-repeat: no-repeat;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        .user-profile {
            text-align: center;
            background-color: rgba(255, 255, 255, 0.8); /* 添加半透明背景 */
            padding: 20px;
            border-radius: 10px;
            max-width: 400px;
        }
        .user-avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
        }
        .profile-form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .profile-form label {
            font-weight: bold;
        }
        .profile-form input[type="text"] {
            padding: 8px;
            margin: 5px 0;
        }
        .profile-form input[type="file"] {
            margin: 5px 0;
        }
        .save-button {
            margin-top: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="user-profile">
    <img class="user-avatar" src="images/一只鹦.jpg" alt="User Avatar">
    <div class="profile-form">
        <h2>Change Your Profile Information</h2>
        <form action="updateProfile" method="post">
            <label for="nickname">昵称:</label>
            <input type="text" id="nickname" name="nickname" value="root">
            <br>
            <label for="avatar">修改头像:</label>
            <input type="file" id="avatar" name="avatar">
            <br>
<%--            <button class="save-button" type="submit">保存更改</button>--%>
        </form>
    </div>
    <h4>Welcome, <%=request.getSession().getAttribute("user")%>!</h4>
</div>
</body>
</html>


<%--第一次写的登录成功后的代码--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--    <head>--%>
<%--        <title>Title</title>--%>
<%--        <style>--%>
<%--            body {--%>
<%--                background-image: url('images/向光者.jpg');--%>
<%--                background-size: cover;--%>
<%--                background-repeat: no-repeat;--%>
<%--                background-attachment: fixed;--%>
<%--            }--%>
<%--        </style>--%>
<%--    </head>--%>
<%--<body>--%>
<%--<%=request.getSession().getAttribute("user")%>,欢迎您！--%>
<%--</body>--%>
<%--</html>--%>

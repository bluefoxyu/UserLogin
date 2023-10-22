<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Login Page</title>
    <script>
      /*
      * 点击超链接或者图片，需要换一张
      *
      * 给超链接和图片绑定单击事件
      * 重新设置图片的src属性值
      * */
      window.onload=function (){
        //获取图片对象
        var img=document.getElementById("img");
        //绑定单击事件
        img.onclick=function(){
          var data=new Date().getTime()
          //加时间戳，保证能多次点击改变验证码的内容，随机数存在相同的可能性
          //img1.src="/UserLogin/checkCodeServlet?"+Math.random();
          img.src="/UserLogin/checkCodeServlet?time="+data;
        }
      }
      function changeVerificationCode() {
        var img = document.getElementById("img");
        var data = new Date().getTime();
        img.src = "/UserLogin/checkCodeServlet?time=" + data;
      }
    </script>

    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
      }
      .container {
        max-width: 350px;
        margin: 0 auto;
        padding: 10px;
        background-color: #fff;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      }
      h1 {
        text-align: center;
      }
      table {
        width: 100%;
      }
      table td {
        padding: 5px;
      }
      input[type="text"],
      input[type="password"],
      input[type="text"] {
        width: 100%;
        padding: 10px;
        margin: 5px 0;
        border: 1px solid #ccc;
        border-radius: 3px;
      }

      #img-container {
        text-align: center;
      }
      #img {
        display: block;
        margin: 0 auto;
      }
      #change {
        display: block;
        text-decoration: none;
        color: #0066cc;
        margin-top: 10px;
        cursor: pointer;
      }
      #change:hover {
        text-decoration: underline;
      }
      #checkCode {
        margin-bottom: 10px; /* Add some bottom margin to create space */
      }
      .error {
        color: red;
      }
      .center-text {
        text-align: center;
      }
    </style>

</head>

<body>
<div class="container">
  <h1>Login</h1>
  <form action="/UserLogin/loginServlet" method="post">
    <table>
      <tr>
        <td>用户名</td>
        <td><input type="text" name="username" placeholder="Enter your username"></td>
      </tr>
      <tr>
        <td>密码</td>
        <td><input type="password" name="password" placeholder="Enter your password"></td>
      </tr>
      <tr>
        <td>验证码</td>
        <td class="input-container">
          <input type="text" id="checkCode" name="checkCode" placeholder="Enter the code" autocomplete="off">
        </td>
      </tr>
      <tr>
        <td colspan="2" class="center-text">
          <div id="img-container">
            <img id="img" src="/UserLogin/checkCodeServlet">
            <a id="change" onclick="changeVerificationCode()" href="#">看不清，换一张？</a>
          </div>
        </td>
      </tr>
      <tr>
        <td colspan="2" class="center-text"><input type="submit" value="Login"></td>
      </tr>
    </table>
  </form>
  <div class="error"><%=request.getAttribute("cc_error")==null?"":request.getAttribute("cc_error")%></div>
  <div class="error"><%=request.getAttribute("login_error")==null?"":request.getAttribute("login_error")%></div>
</div>
</body>

</html>



<%--第一次写的前端登录代码，哈哈哈--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--  <script>--%>
<%--    /*--%>
<%--    * 点击超链接或者图片，需要换一张--%>
<%--    *--%>
<%--    * 给超链接和图片绑定单击事件--%>
<%--    * 重新设置图片的src属性值--%>
<%--    * */--%>
<%--    window.onload=function (){--%>
<%--      //获取图片对象--%>
<%--      var img=document.getElementById("img");--%>
<%--      //绑定单击事件--%>
<%--      img.onclick=function(){--%>
<%--        var data=new Date().getTime()--%>
<%--        //加时间戳，保证能多次点击改变验证码的内容，随机数存在相同的可能性--%>
<%--        //img1.src="/UserLogin/checkCodeServlet?"+Math.random();--%>
<%--        img.src="/UserLogin/checkCodeServlet?time="+data;--%>

<%--      }--%>
<%--    }--%>

<%--  </script>--%>
<%--  <style>--%>
<%--    div{--%>
<%--      color: red;--%>
<%--    }--%>
<%--  </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<form action="/UserLogin/loginServlet" method="post">--%>
<%--  <table>--%>
<%--    <tr>--%>
<%--      <td>用户名</td>--%>
<%--      <td><input type="text" name="username"><br></td>--%>
<%--    </tr>--%>

<%--    <tr>--%>
<%--      <td>密码</td>--%>
<%--      <td><input type="password" name="password"><br></td>--%>
<%--    </tr>--%>

<%--    <tr>--%>
<%--      <td>验证码</td>--%>
<%--      <td><input type="text" name="checkCode"></td>--%>
<%--    </tr>--%>

<%--    <tr>--%>
<%--      <td colspan="2"><img id="img" src="/UserLogin/checkCodeServlet"></td>--%>
<%--    </tr>--%>

<%--    <tr>--%>
<%--      <td><a id="change" href="">看不清，换一张？</a></td>--%>
<%--    </tr>--%>

<%--    <tr>--%>
<%--      <td colspan="2"><input type="submit"value="登录"></td>--%>
<%--    </tr>--%>

<%--  </table>--%>
<%--</form>--%>

<%--<div><%=request.getAttribute("cc_error")==null?"":request.getAttribute("cc_error")%></div>--%>
<%--<div><%=request.getAttribute("login_error")==null?"":request.getAttribute("login_error")%></div>--%>

<%--</body>--%>
<%--</html>--%>


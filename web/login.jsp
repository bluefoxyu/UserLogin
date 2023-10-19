<%--
  Created by IntelliJ IDEA.
  User: 23920
  Date: 2023/10/19
  Time: 22:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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

  </script>
  <style>
    div{
      color: red;
    }
  </style>
</head>
<body>
<form action="/UserLogin/loginServlet" method="post">
  <table>
    <tr>
      <td>用户名</td>
      <td><input type="text" name="username"><br></td>
    </tr>

    <tr>
      <td>密码</td>
      <td><input type="password" name="password"><br></td>
    </tr>

    <tr>
      <td>验证码</td>
      <td><input type="text" name="checkCode"></td>
    </tr>

    <tr>
      <td colspan="2"><img id="img" src="/UserLogin/checkCodeServlet"></td>
    </tr>

    <tr>
      <td><a id="change" href="">看不清，换一张？</a></td>
    </tr>

    <tr>
      <td colspan="2"><input type="submit"value="登录"></td>
    </tr>

  </table>
</form>

<div><%=request.getAttribute("cc_error")==null?"":request.getAttribute("cc_error")%></div>
<div><%=request.getAttribute("login_error")==null?"":request.getAttribute("login_error")%></div>

</body>
</html>

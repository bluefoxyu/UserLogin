package cn.web.servlet;

import cn.dao.UserDao;
import cn.domain.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.apache.commons.beanutils.BeanUtils;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;
//jakarta.servlet

//注解里面为资源路径
//在tomcat配置deployment中那个为虚拟路径

//login.html中form表单的action路径的写法是-->虚拟目录加Servlet的资源路径

//在tomcat 10.1.13中使用的是jakarta,所以在web.servlet里建servlet项目的话要建jakarta.servlet
//如果是用低版本的tomcat，建项目就要建javax，否则会报错
@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置编码
        request.setCharacterEncoding("utf-8");
        //获取请求参数

//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//        //封装User对象
//        User loginUser=new User();
//        loginUser.setUsername(username);
//        loginUser.setPassword(password);

        //获取请求参数，导入了commons-beanutils-1.9.4.jar
        //这个包必须导入web中WEB-INF的lib中才能执行
        Map<String, String[]> map = request.getParameterMap();
        //创建User对象
        User loginUser=new User();
        //使用BeanUtils封装
        try {
            BeanUtils.populate(loginUser,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }


        //调用UserDao的login方法
        UserDao userDao=new UserDao();
        User user = userDao.login(loginUser);
        //判断user
        if (user==null){
            //登录失败
            request.getRequestDispatcher("/failServlet").forward(request,response);
        }
        else {
            //登录成功
            //存储数据
            request.setAttribute("user",user);
            //转发
            request.getRequestDispatcher("/successServlet").forward(request,response);

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}

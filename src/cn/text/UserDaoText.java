package cn.text;

import cn.dao.UserDao;
import cn.domain.User;
import org.junit.Test;

//测试数据库连接操作代码

public class UserDaoText {
    //低版本的mysql-connecter会报错
    //配置文件druid.properties中 driverClassName=com.mysql.cj.jdbc.Driver，不能用低版本的表达
    //删除低版本的mysql-connecter，更新为新的mysql-connecter
    @Test
    public void testLogin(){

        User loginuser=new User();
        loginuser.setUsername("superbaby");
        loginuser.setPassword("123");

        UserDao userDao=new UserDao();
        User user = userDao.login(loginuser);
        System.out.println(user);

    }
}

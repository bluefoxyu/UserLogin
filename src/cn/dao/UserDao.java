package cn.dao;

import cn.domain.User;
import cn.util.JDBCUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 * 操作数据库中User表中的类
 */
public class UserDao {

    //声明JDBCTemplate对象公用
    private JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());

/*由于这里是个sql查询语句，我们明确的知道当loginUser不等于参数数据库存储的值时应该是返回 null ，
\所以我们在捕获了 EmptyResultDataAccessException 异常后直接返回一个 null 值。*/
//如果不抛这个异常会报错
    public User login(User loginUser){
        User user=null;
        try {
            String sql="select * from user where username=? and password=?";
            //调用query方法
            user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class),
                    loginUser.getUsername(), loginUser.getPassword());
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
        return user;
    }
}

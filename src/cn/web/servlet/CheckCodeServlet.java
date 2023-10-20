package cn.web.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.security.PublicKey;
import java.util.Random;


@WebServlet("/checkCodeServlet")
public class CheckCodeServlet extends HttpServlet {
    private Color randomColor(Random random) {
        int red= random.nextInt(150);
        int yellow=random.nextInt(150);
        int blue=random.nextInt(150);
        return new Color(red,yellow,blue);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int width=100;
        int height=50;
        //创建一个对象，在内存中的图片（验证码图片）
        BufferedImage image=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        Random random=new Random();


        //美化图片
        //填充背景色
        Graphics2D g2=(Graphics2D) image.getGraphics();//画笔对象
        g2.setColor(Color.white);//设置画笔颜色
        g2.fillRect(0,0,width,height);
        //画边框
        g2.setColor(randomColor(random));
        g2.drawRect(0,0,width-1,height-1);

        //写验证码
        String str="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

        StringBuilder sb=new StringBuilder();
        for (int i=1;i<=4;i++) {
            g2.setColor(randomColor(random));
            int index = random.nextInt(str.length());
            char ch = str.charAt(index);
            sb.append(ch);
            int style=random.nextInt(10);//生成数字的样式
            int size=random.nextInt(10)+24;//生成随机字号
            Font font=new Font(ch+"",style,size);
            g2.setFont(font);
            g2.drawString(ch+"",width/5*i,height/(random.nextInt(2)+1));
            //g.drawString(ch+"",width/5*i,height/2);
        }
        String checkCode_session = sb.toString();
        //将验证码存入session
        request.getSession().setAttribute("checkCode_session",checkCode_session);
        //画干扰线

        for (int i=0;i<15;i++) {
            g2.setColor(randomColor(random));
            int x1 = random.nextInt(width);
            int x2 = random.nextInt(width);

            int y1 = random.nextInt(width);
            int y2 = random.nextInt(width);
            g2.drawLine(x1,y1,x2,y2);
        }

        //将图片输出到页面展示
        ImageIO.write(image,"jpg",response.getOutputStream());

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}

package cn.web.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@WebServlet("/checkCodeServlet")
public class CheckCodeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int width=100;
        int height=50;
        //创建一个对象，在内存中的图片（验证码图片）
        BufferedImage image=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);

        //美化图片
        //填充背景色
        Graphics g=image.getGraphics();//画笔对象
        g.setColor(Color.WHITE);//设置画笔颜色
        g.fillRect(0,0,width,height);
        //画边框
        g.setColor(Color.blue);
        g.drawRect(0,0,width-1,height-1);

        //写验证码
        String str="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random random=new Random();
        StringBuilder sb=new StringBuilder();
        for (int i=1;i<=4;i++) {
            int index = random.nextInt(str.length());
            char ch = str.charAt(index);
            sb.append(ch);
            g.drawString(ch+"",width/5*i,height/2);
        }
        String checkCode_session = sb.toString();
        //将验证码存入session
        request.getSession().setAttribute("checkCode_session",checkCode_session);
        //画干扰线
        g.setColor(Color.green);

        for (int i=0;i<10;i++) {
            int x1 = random.nextInt(width);
            int x2 = random.nextInt(width);

            int y1 = random.nextInt(width);
            int y2 = random.nextInt(width);
            g.drawLine(x1,y1,x2,y2);
        }

        //将图片输出到页面展示
        ImageIO.write(image,"jpg",response.getOutputStream());

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}

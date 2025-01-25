package lk.ijse.assignment01javaee_project.listeners;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

import java.sql.SQLException;

@WebListener
public class MyListener implements ServletContextListener {
//    @Override
//    public void contextInitialized(ServletContextEvent sce) {
//        BasicDataSource ds = new BasicDataSource();
//        ds.setDriverClassName("com.mysql.jdbc.Driver");
//        ds.setUrl("jdbc:mysql://localhost:3306/ecommerce");
//        ds.setUsername("root");
//        ds.setPassword("Ijse@123");
//        ds.setMaxTotal(5);
//        ds.setInitialSize(5);
//
//        ServletContext servletContext = sce.getServletContext();
//        servletContext.setAttribute("dataSource", ds);
//    }
//
//    @Override
//    public void contextDestroyed(ServletContextEvent sce) {
//        ServletContext servletContext = sce.getServletContext();
//        BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("dataSource");
//
//        try {
//            ds.close();
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//
//    }
}
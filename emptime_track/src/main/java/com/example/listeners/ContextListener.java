package com.example.listeners;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ContextListener implements ServletContextListener {

    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Context initialized");
    }

    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("Context destroyed");
    }
}

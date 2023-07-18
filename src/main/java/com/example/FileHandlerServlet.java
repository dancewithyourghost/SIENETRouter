package com.example;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;

public class FileHandlerServlet extends HttpServlet {
    private static final String FILE_PATH = "D:\\s1.icnf";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Properties properties = new Properties();
        try (FileInputStream fileInputStream = new FileInputStream(FILE_PATH)) {
            properties.load(fileInputStream);
        }

        String userName = properties.getProperty("USER_NAME");
        String password = properties.getProperty("PASSWORD");

        request.setAttribute("userName", userName);
        request.setAttribute("password", password);

        request.getRequestDispatcher("/config.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");

        Properties properties = new Properties();
        try (FileInputStream fileInputStream = new FileInputStream(FILE_PATH)) {
            properties.load(fileInputStream);
        }

        if (userName != null && !userName.isEmpty()) {
            properties.setProperty("USER_NAME", userName);
        }

        if (password != null && !password.isEmpty()) {
            properties.setProperty("PASSWORD", password);
        }

        try (FileOutputStream fileOutputStream = new FileOutputStream(FILE_PATH)) {
            properties.store(fileOutputStream, null);
        }

        response.sendRedirect(request.getContextPath() + "/config.html");
    }
}

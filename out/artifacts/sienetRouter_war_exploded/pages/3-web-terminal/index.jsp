<%--
  Created by IntelliJ IDEA.
  User: pedro
  Date: 2023/7/17
  Time: 9:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>网页终端</title>
    <style>
        #output {
            width: 100%;
            height: 600px;
            background-color: #ccc;
            padding: 10px;
            overflow: auto;
        }
    </style>
</head>
<body>
<div id="output"></div>
<input type="text" id="command" name="command" placeholder="输入命令" onkeydown="handleKeyDown(event)">
<button onclick="executeCommand()">执行</button>
<button onclick="pingBilibili()">ping bilibili.com</button>

<script>
    function handleKeyDown(event) {
        if (event.key === "Enter") {
            event.preventDefault(); // 阻止回车键默认提交表单的行为
            executeCommand();
        }
    }
    function executeCommand() {
        var commandInput = document.getElementById("command");
        var command = commandInput.value;
        commandInput.value = "";

        var outputDiv = document.getElementById("output");

        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4) {
                if (this.status == 200) {
                    var response = this.responseText;
                    outputDiv.innerHTML += "<p><strong>$ " + command + "</strong></p>";
                    outputDiv.innerHTML += "<pre>" + response + "</pre>";
                } else {
                    outputDiv.innerHTML += "<p><strong>Command execution failed</strong></p>";
                }
                outputDiv.scrollTop = outputDiv.scrollHeight;
            }
        };
        xhttp.open("POST", "execute.jsp", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("command=" + encodeURIComponent(command));
    }
    function pingBilibili() {
        var bilicommand = "ping www.bilibili.com";

        var outputDiv = document.getElementById("output");

        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4) {
                if (this.status == 200) {
                    var response = this.responseText;
                    outputDiv.innerHTML += "<p><strong>$ " + bilicommand + "</strong></p>";
                    outputDiv.innerHTML += "<pre>" + response + "</pre>";
                } else {
                    outputDiv.innerHTML += "<p><strong>Command execution failed</strong></p>";
                }
                outputDiv.scrollTop = outputDiv.scrollHeight;
            }
        };
        xhttp.open("POST", "execute.jsp", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("command=" + encodeURIComponent(bilicommand));
    }
</script>
</body>
</html>

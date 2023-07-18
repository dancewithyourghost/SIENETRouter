<%--
  Created by IntelliJ IDEA.
  User: pedro
  Date: 2023/7/17
  Time: 7:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>
        function showIPAddress() {
            var ipAddress = document.getElementById("ipAddress").value;
            alert("当前 IP 地址：" + ipAddress);
        }
    </script>
</head>
<body>
<h1>网络配置</h1>

<form>
    <div>
        <label for="ipAddress">IP 地址:</label>
        <input type="text" id="ipAddress" name="ipAddress">
    </div>

    <div>
        <label for="subnetMask">子网掩码:</label>
        <input type="text" id="subnetMask" name="subnetMask">
    </div>

    <div>
        <label>查看 IP 地址:</label>
        <button type="button" onclick="showIPAddress()">显示 IP 地址</button>
    </div>

    <div>
        <button type="submit">保存</button>
        <button type="reset">重置</button>
    </div>
</form>
</body>
</html>

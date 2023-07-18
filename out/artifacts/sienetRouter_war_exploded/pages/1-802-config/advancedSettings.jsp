<%--
  Created by IntelliJ IDEA.
  User: pedro
  Date: 2023/7/17
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

iNode客户端路径
<br>
<input type="text" value="/usr/local/iNodeClient">

<hr>

系统类型
<br>
<input name="os" id="win" disabled type="radio">Windows</input>
<input name="os" id="linux" checked type="radio">Linux</input>

<hr>

重启AuthMngService服务
<br>
<button>立即执行</button>

</body>
</html>

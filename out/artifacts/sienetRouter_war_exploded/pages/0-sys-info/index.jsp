<%--
  Created by IntelliJ IDEA.
  User: pedro
  Date: 2023/7/17
  Time: 6:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<html>
<head>
    <title>1-sys-info</title>
    <link rel="stylesheet" type="text/css" href="../../static/layui/css/layui.css">

</head>
<body>
<script src="../../static/layui/layui.js"></script>





<div class="layui-bg-gray" style="padding: 16px;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">系统信息</div>
                <div class="layui-card-body">
                    <%
                        String javaVersion = System.getProperty("java.version");
                        String javaHome = System.getProperty("java.home");
                        String osName = System.getProperty("os.name");
                        String osVersion = System.getProperty("os.version");
                    %>

                    <%-- 在页面上展示 Java 的信息 --%>
                    <p>JVM 版本： <%= javaVersion %>
                    </p>
                    <p>JVM 安装路径： <%= javaHome %>
                    </p>
                    <p>操作系统： <%= osName %>
                    </p>
                    <p>操作系统版本： <%= osVersion %>
                    </p>
                </div>
            </div>
        </div>
        <div class="layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">JVM信息</div>
                <div class="layui-card-body">
                    <div id="JVMmemoryUsage">正在获取...</div>

                </div>
            </div>
        </div>
    </div>
</div>








<script>
    function refreshMemoryUsage() {
        var memoryUsageDiv = document.getElementById("JVMmemoryUsage");

        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                var response = JSON.parse(this.responseText);
                var heapMemory = response.heapMemory;
                var nonHeapMemory = response.nonHeapMemory;

                memoryUsageDiv.innerHTML = "<p><strong>堆内存使用情况：</strong></p>" +
                    "<p>初始大小: " + heapMemory.init + " bytes</p>" +
                    "<p>已使用: " + heapMemory.used + " bytes</p>" +
                    "<p>已分配: " + heapMemory.committed + " bytes</p>" +
                    "<p>最大大小: " + heapMemory.max + " bytes</p><br>" +
                    "<p><strong>非堆内存使用情况：</strong></p>" +
                    "<p>初始大小: " + nonHeapMemory.init + " bytes</p>" +
                    "<p>已使用: " + nonHeapMemory.used + " bytes</p>" +
                    "<p>已分配: " + nonHeapMemory.committed + " bytes</p>" +
                    "<p>最大大小: " + nonHeapMemory.max + " bytes</p>";
            }
        };
        xhttp.open("GET", "memoryUsage.jsp", true);
        xhttp.send();
    }

    // 定时刷新内存使用情况
    setInterval(refreshMemoryUsage, 2000); // 每2秒刷新一次
</script>

</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: pedro
  Date: 2023/7/17
  Time: 6:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SIENET Router Management</title>
    <link rel="stylesheet" type="text/css" href="static/layui/css/layui.css">
    <style>
        .parent-container {
            position: relative;
            width: 100%;
            height: 100%;
        }

        .parent-container iframe {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border: none;
        }
    </style>
    <script>
        function updateIframe(url) {
            var iframe = document.getElementById("content-iframe");
            iframe.src = url;
        }
    </script>
</head>
<body>
<script src="static/layui/layui.js"></script>


<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo layui-hide-xs layui-bg-black" onclick="updateIframe('pages/0-welcome.jsp')">SIENET路由器</div>
        <!-- 头部区域（可配合layui 已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <!-- 移动端显示 -->
            <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
                <i class="layui-icon layui-icon-spread-left"></i>
            </li>

        </ul>
        <ul class="layui-nav layui-layout-right">

            <li class="layui-nav-item layui-hide layui-show-sm-inline-block">
                <a href="javascript:;">
                    <%--          <img src="https://unpkg.com/outeres@0.0.10/img/layui/icon-v2.png" class="layui-nav-img">--%>
                    操作选项
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">登出</a></dd>
                    <dd><a href="javascript:;">重启</a></dd>
                    <dd><a href="javascript:;">关机</a></dd>
                </dl>
            </li>

        </ul>
    </div>
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item">
                    <a href="javascript:void(0);" onclick="updateIframe('pages/0-sys-info/index.jsp')">系统信息</a>
                </li>

                <li class="layui-nav-item">
                    <a href="javascript:void(0);">服务</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:void(0);" onclick="updateIframe('pages/1-802-config/index.jsp')">iNode智能客户端</a></dd>
                        <dd><a href="javascript:void(0);" onclick="updateIframe('pages/portmap/index.jsp')">portmap端口转发/映射</a></dd>
<%--                        <dd><a href="javascript:void(0);" onclick="updateIframe('pages/3-web-terminal/index.jsp')">终端</a></dd>--%>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="javascript:void(0);" onclick="updateIframe('pages/2-net-config.jsp')">网络配置</a></li>
                <li class="layui-nav-item"><a href="javascript:void(0);" onclick="updateIframe('pages/3-web-terminal/index.jsp')">终端</a></li>
                <li class="layui-nav-item"><a href="javascript:void(0);" onclick="updateIframe('pages/qas/index.jsp')">常见问题解答</a></li>

                <li class="layui-nav-item"><a href="javascript:;" onclick="updateIframe('pages/about/index.jsp')">关于SIENET路由器</a></li>
                <%--这里左侧列表结束--%>
            </ul>
        </div>
    </div>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="parent-container style="background-color: #c0c4cc">



                <iframe id="content-iframe" src="pages/0-welcome.jsp" frameborder="0"></iframe>


        </div>
    </div>
    <div class="layui-footer">
        <!-- 底部固定区域 -->
        SIENET路由器 暂无版权 莫得备案
    </div>
</div>

</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: pedro
  Date: 2023/7/17
  Time: 7:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>iNode智能客户端</title>
    <link rel="stylesheet" type="text/css" href="../../static/layui/css/layui.css">
    <style>
        html, body {
            background-color: #fff;
            margin: 0;
            padding: 0;
        }

        /*
        1,transform居中方法，不用指定具体width,height;
        2,使用transform属性进行居中定位
         */
        .warp {
            /*border: 1px solid #c00;*/
            position: absolute;
            top: 45%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        .warning {
            color: #f00;
        }
        .no-margin {
            margin: 0px;
        }
        .layui-input-group .layui-input{
            padding-right: auto;
        }
    </style>
</head>
<body>
<script src="../../static/layui/layui.js"></script>

<%
    String fileName = "D:/s1.icnf";
    String user_name = "";
    String password = "";
    String nic_info = "";

    try {
        File file = new File(fileName);
        BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file)));

        String line;
        while ((line = br.readLine()) != null) {
            if (line.startsWith("USER_NAME=")) {
                user_name = line.substring(line.indexOf('=') + 1);
            } else if (line.startsWith("PASSWORD=")) {
                password = line.substring(line.indexOf('=') + 1);
            } else if (line.startsWith("NIC_INFO=")) {
                nic_info = line.substring(line.indexOf('=') + 1);
            }
        }

        br.close();
    } catch (IOException e) {
        e.printStackTrace();
    }
%>

<div class="layui-col-xs12 layui-col-md4 warp">

    <h1 id="title">
        <center>802.1X 配置</center>
    </h1>
    <%--<label for="user_name">用户名：</label>--%>
    <%--<input type="text" id="user_name" name="user_name" value="<%= user_name %>"><br>--%>

<center>
    <div class="layui-form"  style="width: 60%;margin-top: 20px;">
        <div class="layui-form-item">
            <div class="layui-input-group no-margin">
                <div class="layui-input-split layui-input-prefix" id="user-name">
                    用户名
                </div>
                <input type="text" placeholder="学号@s.sie" class="layui-input" id="user_name" name="user_name"
                       value="<%= user_name %>">
            </div>
        </div>





    <%--<label for="password">密码：</label>--%>
    <%--<input type="text" id="password" name="password" value="<%= password %>"><br>--%>



        <div class="layui-form-item">
            <div class="layui-input-group no-margin">
                <div class="layui-input-split layui-input-prefix" id="pass-word">
                    密 码
                </div>
                <input type="text" class="layui-input" id="password" name="password" value="<%= password %>">
            </div>
            <div class="warning">
                这里请输入密码密文。
                <a href="">密码密文是什么？</a>
            </div>

        </div>





    <%--<label for="nic_info">网卡：</label>--%>
    <%--<input type="text" id="nic_info" name="nic_info" value="<%= nic_info %>"><br>--%>

        <div class="layui-form-item">
            <div class="layui-input-group">
                <div class="layui-input-split layui-input-prefix" id="nic-info">
                    网 卡
                </div>
                <input type="text" placeholder="用来连接校园网的网卡名称" class="layui-input" id="nic_info" name="nic_info"
                       value="<%= nic_info %>">
            </div>
        </div>
    </div>


</center>

    <center>
        <%--<button onclick="saveToFile()">保存</button>--%>
        <button class="layui-btn layui-btn-primary layui-border-blue" onclick="saveToFile()">保存</button>
        <button class="layui-btn layui-btn-primary layui-border-blue" lay-on="iframe">高级设置</button>
    </center>
</div>

<script>

    var element1 = document.getElementById('user-name');
    var width = element1.offsetWidth;
    var element2 = document.getElementById('pass-word');
    element2.style.width = width + "px";
    var element3 = document.getElementById('nic-info');
    element3.style.width = width + "px";

    function saveToFile() {
        var user_name = document.getElementById("user_name").value;
        var password = document.getElementById("password").value;
        var nic_info = document.getElementById("nic_info").value;

        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                alert("文件已保存。");
            }
        };
        xhttp.open("POST", "save.jsp", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("user_name=" + user_name + "&password=" + password + "&nic_info=" + nic_info);
    }

    layui.use(function () {
        var layer = layui.layer;
        var util = layui.util;
        // 批量事件
        util.on('lay-on', {
            alert: function () {
                layer.alert('对话框内容');
            },

            iframe: function () {
                // iframe 层
                layer.open({
                    type: 2,
                    title: 'iNode客户端高级设置',
                    shadeClose: true,
                    shade: 0.8,
                    area: ['380px', '80%'],
                    content: 'advancedSettings.jsp' // iframe 的 url
                });
            },
            'test-tips-left': function(){
                layer.tips('这里请输入密码密文', this, {
                    tips: 4
                });
            },

        });
    });


</script>
</body>
</html>

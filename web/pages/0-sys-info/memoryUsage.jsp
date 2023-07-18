<%--
  Created by IntelliJ IDEA.
  User: pedro
  Date: 2023/7/17
  Time: 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" %>
<%@ page import="java.lang.management.ManagementFactory" %>
<%@ page import="java.lang.management.MemoryMXBean" %>
<%@ page import="java.lang.management.MemoryUsage" %>
<%@ page import="java.text.DecimalFormat" %>
<%
    MemoryMXBean memoryMXBean = ManagementFactory.getMemoryMXBean();
    MemoryUsage heapMemoryUsage = memoryMXBean.getHeapMemoryUsage();
    MemoryUsage nonHeapMemoryUsage = memoryMXBean.getNonHeapMemoryUsage();

    DecimalFormat format = new DecimalFormat("#,###");

    // 构建内存使用情况的 JSON 字符串
    String memoryUsageJson = "{\"heapMemory\": {"
            + "\"init\": \"" + format.format(heapMemoryUsage.getInit()) + "\","
            + "\"used\": \"" + format.format(heapMemoryUsage.getUsed()) + "\","
            + "\"committed\": \"" + format.format(heapMemoryUsage.getCommitted()) + "\","
            + "\"max\": \"" + format.format(heapMemoryUsage.getMax()) + "\""
            + "},"
            + "\"nonHeapMemory\": {"
            + "\"init\": \"" + format.format(nonHeapMemoryUsage.getInit()) + "\","
            + "\"used\": \"" + format.format(nonHeapMemoryUsage.getUsed()) + "\","
            + "\"committed\": \"" + format.format(nonHeapMemoryUsage.getCommitted()) + "\","
            + "\"max\": \"" + format.format(nonHeapMemoryUsage.getMax()) + "\""
            + "}}";

    out.print(memoryUsageJson);
%>

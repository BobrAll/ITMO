<%@ page import="data.Row" %>
<%@ page import="java.util.List" %>
<%@ page import="model.DataSaver" %>
<%@ page import="java.util.Optional" %>
<%--
  Created by IntelliJ IDEA.
  User: arlet
  Date: 02.10.2022
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    DataSaver dataSaver = (DataSaver) request.getServletContext().getAttribute("dataSaver");
    List<Row> rows = dataSaver.loadData(session);
    if (Optional.ofNullable(rows).isPresent()) {
        for (Row row : rows)
            out.println(row.getHTMLRow());
    }
%>

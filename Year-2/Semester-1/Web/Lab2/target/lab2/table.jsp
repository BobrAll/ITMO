<%@ page import="data.Row" %>
<%@ page import="java.util.List" %>
<%@ page import="model.DataSaver" %>
<%@ page import="java.util.Optional" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    DataSaver dataSaver = (DataSaver) request.getServletContext().getAttribute("dataSaver");
    List<Row> rows = dataSaver.loadData(session);
    if (Optional.ofNullable(rows).isPresent()) {
        for (Row row : rows)
            out.println(row.getHTMLRow());
    }
%>

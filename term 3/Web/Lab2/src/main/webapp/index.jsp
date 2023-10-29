<%@ page import="data.Row" %>
<%@ page import="java.util.Optional" %>
<%@ page import="model.DataSaver" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%!
    final int heightOfMap = 600;
    final int widthOfMap = 600;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Лабораторная работа №2</title>
    <script src="js/jquery-3.6.1.min.js"></script>

    <link rel="stylesheet" href="style.css">
</head>
<body>
<table class="mainTable">
    <tr class="head">
        <table class="head">
            <tr>
                <td class="head"><p>Бобрусь Александр Владимирович P32091</td>
                <td class="head"><p>Вариант - <b>209103</b></td>
            </tr>
        </table>
    </tr>
    <tr>
        <table class="mainBody">
            <tr class="task">
                <img src="images/task.png">

            </tr>
            <tr><h2><b>Ввод данных</b></h2></tr>
            <tr>
                <td class="map">
                    <canvas height="<%=heightOfMap%>" width="<%=widthOfMap%>" class="map"></canvas>
                    <svg class="map" xmlns="http://www.w3.org/2000/svg" width="<%=widthOfMap%>" height="<%=heightOfMap%>" fill="none" viewBox="0 0 701 701">

                    </svg>
                </td>
                <td>
                    <form name="coords">
                        <table class="form">
                            <tr>
                                <p>X:
                              <%
                                for(float i=-2;i<=2; i+=0.5) {
//                                  out.println(i+": "+"<input name=\"x\" type=\"checkbox\" value = \""+i+"\">");
                                    out.println("<input name=\"x\" type=\"checkbox\" value = \""+i+"\"> " + i);
                                }
                              %>
                            </tr>
                            <tr>
                                <p>Y:
                                    <input type="text" name="y" require placeholder="-3..3">
                            </tr>
                            <tr>
                                <p>R:
                              <%
                                for(int i=1;i<=5; i++) {
                                  out.println(i+": "+"<input type=\"checkbox\" name=\"r\" value = \""+i+"\">");
                                }
                              %>
                            </tr>
                            <tr>
                                <input type="button" name="submitButton" value="Отправить">
                            </tr>
                        </table>
                    </form>
                </td>
            </tr>
        </table>
    </tr>
    <tr>
        <h2><b>Таблица данных (последние <%=DataSaver.MAX_ROWS%> записей)</b></h2>
    </tr>
    <tr>
        <table class="results">
            <th>Время</td>
            <th>Координаты
            </td>
            <th>Попадание
            </td>
            <th>Время выполнения скрипта</td>
            <tfoot id="receivingData">
            <%
                DataSaver dataSaver = (DataSaver) getServletContext().getAttribute("dataSaver");
                if (dataSaver != null) {
                    List<Row> rows = dataSaver.loadData(session);
                    if (Optional.ofNullable(rows).isPresent()) {
                        for (Row row : rows)
                            out.println(row.getHTMLRow());
                    }
                }
            %>
            </tfoot>
        </table>
    </tr>
</table>
</body>
<script src="js/coords-sender.js"></script>
<script src="js/form-checker.js"></script>
<script src="js/input-handler.js"></script>
<script src="js/map-handler.js"></script>
<script src="js/form-handler.js"></script>
</html>

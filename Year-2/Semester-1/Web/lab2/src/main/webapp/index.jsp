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
<%--                    <svg class="map" xmlns="http://www.w3.org/2000/svg" width="<%=widthOfMap%>" height="<%=heightOfMap%>" fill="none" viewBox="0 0 701 701">--%>
<%--                        <g filter="url(#a)">--%>
<%--                            <path fill="#5BE983" d="M651 351H351V51c165.685 0 300 134.315 300 300Z"/>--%>
<%--                            <path stroke="#fff" d="M351.5 51.5c165.013.27 298.73 133.987 299 299h-299v-299Z"/>--%>
<%--                        </g>--%>
<%--                        <path fill="#5BE983" d="M351 501V351h300L351 501ZM50 352h300v150H50z"/>--%>
<%--                        <path fill="#000" d="M700.355 351.353a.502.502 0 0 0-.002-.708l-3.192-3.172a.5.5 0 1 0-.705.709l2.837 2.82-2.82 2.836a.5.5 0 0 0 .709.706l3.173-3.191ZM349.21 352v.5h.001l-.001-.5ZM0 352.5h349.21v-1H0v1Zm349.211 0 350.79-1-.002-1-350.79 1 .002 1Z"/>--%>
<%--                        <path fill="#000" d="M350.353.646a.5.5 0 0 0-.707.001l-3.177 3.186a.5.5 0 1 0 .708.707l2.824-2.833 2.832 2.824a.501.501 0 0 0 .707-.708L350.353.646ZM349.5 1l1 700 1-.002-1-700-1 .002Z"/>--%>
<%--                        <defs>--%>
<%--                            <filter id="a" width="308" height="308" x="347" y="51" color-interpolation-filters="sRGB" filterUnits="userSpaceOnUse">--%>
<%--                                <feFlood flood-opacity="0" result="BackgroundImageFix"/>--%>
<%--                                <feColorMatrix in="SourceAlpha" result="hardAlpha" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"/>--%>
<%--                                <feOffset dy="4"/>--%>
<%--                                <feGaussianBlur stdDeviation="2"/>--%>
<%--                                <feComposite in2="hardAlpha" operator="out"/>--%>
<%--                                <feColorMatrix values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0"/>--%>
<%--                                <feBlend in2="BackgroundImageFix" result="effect1_dropShadow_3_9"/>--%>
<%--                                <feBlend in="SourceGraphic" in2="effect1_dropShadow_3_9" result="shape"/>--%>
<%--                            </filter>--%>
<%--                        </defs>--%>
<%--                    </svg>--%>
                </td>
                <td>
                    <form name="coords">
                        <table class="form">
                            <tr>
                                <p>X:
                                        <%
                                for(float i=-2;i<=2; i+=0.5) {
                                  out.println(i+": "+"<input name=\"x\" type=\"checkbox\" value = \""+i+"\">");
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
<script src="js/drawer.js"></script>
</html>

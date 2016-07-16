<%-- 
    Document   : exportToExcel
    Created on : Jul 13, 2016, 4:30:30 PM
    Author     : Chathura Dananjaya Rupasinghe (14208554)
--%>
<!--this class is used to generate the excel file 
In here we are just converting the request headers
-->
<%
    response.reset();
    response.setContentType("application/vnd.ms-excel");
    response.setHeader("Content-Disposition", "inline; filename=resultByGroupDenver.xls");

%>
<%=request.getParameter("table")%>


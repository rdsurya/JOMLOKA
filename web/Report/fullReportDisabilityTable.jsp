<%-- 
    Document   : fullReportDisabilityTable
    Created on : Feb 20, 2017, 3:10:55 AM
    Author     : User
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>

<%
    Config.getBase_url(request);
    Config.getFile_url(session);
    Conn conn = new Conn();
    String date1 = request.getParameter("field1");
    String date2 = request.getParameter("field2");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container">
    <table id="fullReportDisabilityTable" class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; margin-top: 20px">
        <thead>

        <th> Diagnosis </th>
        <th> Sum </th>

        <%  String sql = "SELECT diagnosis_cd, sumbla bla WHERE date????";
            
            ArrayList<ArrayList<String>> fullReportDisability = conn.getData(sql);

            int size = fullReportDisability.size();
            for (int i = 0; i < size; i++) {
        %>

        <tr >
            <td> <%= fullReportDisability.get(i).get(0)%></td>
            <td> <%= fullReportDisability.get(i).get(1)%></td>
        </tr>
        <%
            }
        %>
        </thead>

    </table>
</div>

<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#fullReportDisabilityTable').DataTable();
    });
</script>
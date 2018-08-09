<%-- 
    Document   : fullReportFamilyHistoryTable
    Created on : Feb 20, 2017, 3:17:30 AM
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
    <table id="fullReportFamilyHistoryTable" class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; margin-top: 20px">
        <thead>

        <th> Diagnosis </th>
        <th> Sum </th>

        <%  String sql = "SELECT diagnosis_cd, sumbla bla WHERE date????";
            
            ArrayList<ArrayList<String>> fullReportFamilyHistoryTable = conn.getData(sql);

            int size = fullReportFamilyHistoryTable.size();
            for (int i = 0; i < size; i++) {
        %>

        <tr >
            <td> <%= fullReportFamilyHistoryTable.get(i).get(0)%></td>
            <td> <%= fullReportFamilyHistoryTable.get(i).get(1)%></td>
        </tr>
        <%
            }
        %>
        </thead>

    </table>
</div>

<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#fullReportFamilyHistoryTable').DataTable();
    });
</script>
<%-- 
    Document   : service_table
    Created on : Aug 21, 2018, 5:49:31 PM
    Author     : user
--%>


<%@page import="ADM_helper.MySessionKey"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();
%>
<table  id="THE_systemTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="width: 15% ">Service Code</th>
    <th>Service Name</th>
    <th style="width: 5% ">Fee</th>
    <th style="width: 5% ">Deposit</th>
    <th style="width: 5% ">Discount</th>
    <th style="width: 10% ">Action</th>
</thead>
<tbody>

    <%
        String tenant_cd = (String) session.getAttribute(MySessionKey.TENANT_CD);
        String sql = " SELECT ty.service_type, rf.service_name, ty.service_fees, ty.service_deposit, ty.service_discount "
                + "FROM jlk_medic_service_type ty "
                + "JOIN jlk_medic_service_type_ref rf on ty.service_type=rf.service_type "
                + "WHERE ty.tenant_cd='"+tenant_cd+"';";
        ArrayList<ArrayList<String>> dataSystem = conn.getData(sql);

        int size = dataSystem.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr>
        <input id="ST_hidden" type="hidden" value="<%=String.join("|", dataSystem.get(i))%>">
        <td><%= dataSystem.get(i).get(0)%></td>
        <td><%= dataSystem.get(i).get(1)%></td>
        <td><%= dataSystem.get(i).get(2)%></td>
        <td><%= dataSystem.get(i).get(3)%></td>
        <td><%= dataSystem.get(i).get(4)%></td>
        <td>

            <!-- Update Part Start -->
            <a id="ST_btnUpdate" data-toggle="modal" data-target="#ST_detail" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
            &nbsp;
            <a id="ST_btnDelete" class="testing" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>

            <!-- Update Part End -->
        </td>
       
    </tr>
    <%
        }
    %>
</tbody>
</table> 

<script type="text/javascript">
    $("#THE_systemTable").DataTable();
</script>
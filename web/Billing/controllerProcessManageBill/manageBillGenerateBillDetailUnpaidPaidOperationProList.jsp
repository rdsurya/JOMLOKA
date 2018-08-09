<%-- 
    Document   : manageBillGenerateBillDetailUnpaidPaidOperationProList
    Created on : Mar 13, 2018, 3:33:43 PM
    Author     : Shammugam
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<table id="tableOPTProc" class="table table-filter table-bordered">
    <thead>
    <th>Item Code</th>
    <th>Item Name</th>
    <th style="text-align: center;">Price (RM)</th>
</thead>
<tbody>
    <%
        // Conncetion And Session Variable
        Conn conn = new Conn();

        String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
        String dis = session.getAttribute("DISCIPLINE_CODE").toString();
        String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

        // Decimal Format
        DecimalFormat df = new DecimalFormat("0.00");

        String query = "SELECT otp.procedure_cd, otp.procedure_shortName, otp.selling_price "
                + " FROM opt_procedure otp "
                + " WHERE otp.hfc_cd = '" + hfc + "' ";

        ArrayList<ArrayList<String>> data2 = conn.getData(query);

        if (!data2.isEmpty()) {
            for (int i = 0; i < data2.size(); i++) {
    %>
    <tr>
        <td><%=data2.get(i).get(0)%></td>
        <td><%=data2.get(i).get(1)%></td>
        <td style="text-align: center;"><%=df.format(Double.parseDouble(data2.get(i).get(2)))%></td>
    </tr>
    <%}
    } else {%>
    <tr>
        <td colspan="3" style="text-align: center;">No Data Avaliable To Be Showed</td>
    </tr> 
    <% }
    %>
</tbody>
</table>


<script type="text/javascript">

    $(document).ready(function () {

        // Enable Modal Button
        document.getElementById("addMiscItem").disabled = false;

        // Enable TR Choosing Start
        $("#tableOPTProc tbody tr").click(function () {

            $('tr.row_selected').removeClass('row_selected selectedtr');
            $(this).addClass('row_selected selectedtr');

            var dataTableTD = $(this).find('td').html();

            if (dataTableTD === "No Data Avaliable To Be Showed") {

                document.getElementById("addMiscItem").disabled = true;

            } else {

                document.getElementById("addMiscItem").disabled = false;

            }

        });
        // Enable TR Choosing End

        $('.loading').hide();

    });

</script>

<%-- 
    Document   : getListOfOrder
    Created on : Oct 17, 2017, 10:18:54 PM
    Author     : user
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn con = new Conn();
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String hfc_logo = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc_cd + "'";
    ArrayList<ArrayList<String>> logo = con.getData(hfc_logo);

    LocalDate localDate = LocalDate.now();
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
    

    String status = request.getParameter("status");
    String timeFrame = request.getParameter("timeFrame");
    
   String whereCondition="", tabStat="";
   
    if(status.equalsIgnoreCase("0")){
        whereCondition=" AND order_no in "
                + "(SELECT order_no FROM pos_order_detail "
                + "GROUP BY order_no HAVING sum(order_status <> '0') = 0) ";
        tabStat="Pending";
    }
    else if(status.equalsIgnoreCase("1")){
        whereCondition=" AND order_no in "
                + "(SELECT order_no FROM pos_order_detail "
                + "GROUP BY order_no HAVING sum(order_status = '0') > 0 AND sum(order_status = '2')>0 ) ";
        tabStat="In progress";
    }
    else if(status.equalsIgnoreCase("2")){
        whereCondition=" AND order_status='2' ";
        
        tabStat="Complete";
    }
    else if(status.equalsIgnoreCase("3")){
        whereCondition=" AND order_status='3' ";
        
        tabStat="Cancel";
    }
    

    String query="SELECT date_format(order_date, '"+timeFrame+"') as masa, order_status, count(order_no) "
            + "FROM pos_order_master "
            + "WHERE hfc_to='"+hfc_cd+"' "+whereCondition
            + "GROUP BY masa;";
    
    ArrayList<ArrayList<String>> dataPatientApp = con.getData(query);
    
%>

<table id="tableOrder"  class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Order Date</th>
            <th >Status</th>
            <th >Total order</th>
        </tr>
    </thead>
    <tbody>

        <%
            for (int i = 0; i < dataPatientApp.size(); i++) {
                               
        %>
        <tr class="clickable_tr" style="cursor: pointer;">
            <td><%=dataPatientApp.get(i).get(0)%></td>
            <td><%=tabStat%></td>
            <td>
                <%=dataPatientApp.get(i).get(2)%>
                <input type="hidden" id="leDate" value="<%=dataPatientApp.get(i).get(0)%>">
                <input type="hidden" id="leStatus" value="<%=status%>">
                <input type="hidden" id="leTimeFrame" value="<%=timeFrame%>">
            </td>
            
        </tr>
        <%
              
            }
        %>
    </tbody>
</table>
    
<script>

    //$('#tableOrder').DataTable("destroy");

    $('#tableOrder').DataTable({
        pageLength: 15,
        dom: 'Bfrtip',
        buttons: [
            'csv', 'excel', 'pdf',
            {
                extend: 'print',
                title: $('h1').text(),
                customize: function (win) {
                    $(win.document.body)
                            .css('font-size', '10pt')
                            .prepend(
                                    '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
    <img src="<%=logo.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej">Procedure Order Status</div>\n\
    <div class="info_kecik">\n\
    <dd>Date: <strong><%=newdate%></strong></dd>\n\
    <dd>Report No: <strong><%=newdate%></strong></dd>\n\
    </div> '
                                    );
                    $(win.document.body).find('table')
                            .addClass('compact')
                            .css('font-size', 'inherit');
                    $(win.document.body)
                            .css('font-size', '10pt')
                            .append('<div style="text-align: center;padding-top:30px;"><br> ***** &nbsp;&nbsp;  End Of Report  &nbsp;&nbsp;  ***** </div>');
                }
            }

        ]
    });

    
</script>
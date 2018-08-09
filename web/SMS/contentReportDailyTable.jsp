<%-- 
    Document   : contentReportDailyTable
    Created on : Dec 12, 2017, 7:17:16 PM
    Author     : Shammugam
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
%>


<h4>
    DAILY RELEASED DATA
</h4>


<table  id="reportDailyTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">DATE</th>
    <th style="text-align: center;">TOTAL ITEM QUANTITY RELEASED</th>
    <th style="text-align: center;">TOTAL PRICE (RM)</th>
</thead>
<tbody>

    <%
        NumberFormat formatterInt = new DecimalFormat("#0");
        NumberFormat formatter = new DecimalFormat("#0.00");

        double quantity = 0.00;
        double grandTotal = 0.00;

        String sql = " SELECT DATE_FORMAT(sdd.txt_date, '%d %M %Y') AS DATE,COUNT(sdd.item_cd), "
                + " SUM(sdd.item_quantity),SUM(sdd.item_amt),DATE(sdd.txt_date)  "
                + " FROM stk_distribition_detail sdd "
                + " LEFT JOIN stk_distribition_master sdm ON (sdm.order_no =  sdd.order_no) "
                + " WHERE sdm.hfc_cd  = '" + hfc + "' AND sdm.discipline_cd  = '" + dis + "'  "
                + " GROUP BY DATE ";
        
        ArrayList<ArrayList<String>> dataReportDaily = conn.getData(sql);

        int size = dataReportDaily.size();
        for (int i = 0; i < size; i++) {

            quantity = quantity + Double.parseDouble(dataReportDaily.get(i).get(2));
            grandTotal = grandTotal + Double.parseDouble(dataReportDaily.get(i).get(3));

    %>

    <tr style="text-align: center;" id="moveToDailySalesDetailsTButton">
<input id="dataDailySalesListhidden" type="hidden" value="<%=String.join("|", dataReportDaily.get(i))%>">
<td><%= dataReportDaily.get(i).get(0)%></td>
<td><%= formatterInt.format(Double.parseDouble(dataReportDaily.get(i).get(2)))%></td>
<td><%= formatter.format(Double.parseDouble(dataReportDaily.get(i).get(3)))%></td>
</tr>
<%
    }
%>
</tbody>
</table>


<div class="row" id="data">
    <!-- content goes here -->
    <form class="form-horizontal" id="addForm">

        <div class="col-md-3">
        </div>
        <div class="col-md-3">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label" for="textinput">Total Quantity</label>
                <div class="col-md-4">
                    <input id="reportDailyTotalQuantity" name="reportDailyTotalQuantity" type="text" placeholder="Total Order" class="form-control input-md" maxlength="50" value="<%= formatterInt.format(quantity)%>" readonly>
                </div>
            </div>

        </div>

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label" for="textinput">Grand Total (RM)</label>
                <div class="col-md-4">
                    <input id="reportDailyGrandTotal" name="reportDailyGrandTotal" type="number" placeholder="Grand Total (RM)" class="form-control input-md" maxlength="50" value="<%= formatter.format(grandTotal)%>" readonly>
                </div>
            </div>

        </div>
    </form>
</div>


<%
    String hfc_cd = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc + "'";
    ArrayList<ArrayList<String>> mysqlhfc_cd = conn.getData(hfc_cd);
    LocalDate localDate = LocalDate.now();
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
%>


<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {


        var reportQuantity = $("#reportDailyTotalQuantity").val();
        var reportGrandTotal = $("#reportDailyGrandTotal").val();

        $('#reportDailyTable').DataTable({
            pageLength: 15,
            initComplete: function (settings, json) {
                $('.loading').hide();
            },
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'Daily Released Item List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Daily Released Item List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'print',
                    text: 'Print Daily Sales List',
                    title: $('h1').text(),
                    message: '<br><br>',
                    className: 'btn btn-primary',
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Daily Released Item List</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>SMS-0004</strong></dd>\n\
                                        </div> '
                                        );
                        $(win.document.body).find('table')
                                .addClass('compact')
                                .css('font-size', 'inherit');
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .css('font-weight', 'bolder')
                                .append('<div style="text-align: right;padding-top:10px;"><br> Total Item Released : ' + reportQuantity + ' </div>')
                                .append('<div style="text-align: right;"><br> Grand Total (RM) : ' + reportGrandTotal + ' </div>');
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .append('<div style="text-align: center;padding-top:30px;"><br> ***** &nbsp;&nbsp;  End Of Report  &nbsp;&nbsp;  ***** </div>');

                    },
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'colvis',
                    text: 'Filter Table Column',
                    className: 'btn btn-success'
                }
            ]
        });

        // Move to Order Details Fetch Details Start
        $('#contentReportDailyTable').off('click', '#reportDailyTable #moveToDailySalesDetailsTButton').on('click', '#reportDailyTable #moveToDailySalesDetailsTButton', function (e) {

            $('<div class="loading">Loading</div>').appendTo('body');

            e.preventDefault();

            $('#contentReportSalesDetailViewModalTable').DataTable().destroy();


            var row = $(this).closest("tr");
            var rowData = row.find("#dataDailySalesListhidden").val();
            var arrayData = rowData.split("|");
            console.log(arrayData);

            var rdate = arrayData[0];
            var date = arrayData[4];

            var data = {
                date: date
            };

            $.ajax({
                url: "controllerProcessReport/contentReportDailyDetailsTable.jsp",
                type: "post",
                data: data,
                timeout: 3000,
                success: function (returnReportDetailsTableHTML) {

                    var arrayData = returnReportDetailsTableHTML.split("<ShannugamRamasamySeperator></ShannugamRamasamySeperator>");

                    var table = arrayData[0];
                    var reportQuantity = arrayData[1];
                    var reportGrandTotal = arrayData[2];

                    $('#contentReportSalesDetailViewModalTable').html(table);

                    $('.loading').hide();

                    $('#contentReportSalesDetailViewModalTable').DataTable({
                        pageLength: 15,
                        initComplete: function (settings, json) {
                            $('.loading').hide();
                        },
                        dom: 'Bfrtip',
                        buttons: [
                            {
                                extend: 'excelHtml5',
                                text: 'Export To Excel',
                                title: 'Released Item List For ' + rdate,
                                className: 'btn btn-primary',
                                exportOptions: {
                                    columns: ':visible'
                                }
                            }, {
                                extend: 'csvHtml5',
                                text: 'Export To Excel CSV',
                                title: 'Released Item List For ' + rdate,
                                className: 'btn btn-primary',
                                exportOptions: {
                                    columns: ':visible'
                                }
                            }, {
                                extend: 'print',
                                text: 'Print Released Item List',
                                title: $('h1').text(),
                                message: '<br><br>',
                                className: 'btn btn-primary',
                                customize: function (win) {
                                    $(win.document.body)
                                            .css('font-size', '10pt')
                                            .prepend(
                                                    '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Released Item List For ' + rdate + '</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>SMS-0005</strong></dd>\n\
                                        </div> '
                                                    );
                                    $(win.document.body).find('table')
                                            .addClass('compact')
                                            .css('font-size', 'inherit');
                                    $(win.document.body)
                                            .css('font-size', '10pt')
                                            .css('font-weight', 'bolder')
                                            .append('<div style="text-align: right;padding-top:10px;"><br> Total Item Released = ' + reportQuantity + ' </div>')
                                            .append('<div style="text-align: right;"><br> Grand Total (RM) = ' + reportGrandTotal + ' </div>');
                                    $(win.document.body)
                                            .css('font-size', '10pt')
                                            .append('<div style="text-align: center;padding-top:30px;"><br> ***** &nbsp;&nbsp;  End Of Report  &nbsp;&nbsp;  ***** </div>');

                                },
                                exportOptions: {
                                    columns: ':visible'
                                }
                            }, {
                                extend: 'colvis',
                                text: 'Filter Table Column',
                                className: 'btn btn-success'
                            }
                        ]
                    });

                    $('#salesDetailViewModal').modal('show');

                }
            });



        });
        // Move to Order Details Fetch Details End

    });
</script>

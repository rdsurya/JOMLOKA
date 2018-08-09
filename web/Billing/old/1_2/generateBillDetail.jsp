<%-- 
    Document   : generateBillDetail
    Created on : Feb 1, 2017, 10:45:29 PM
    Author     : Mike Ho
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="dbConn1.Conn"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DecimalFormat df = new DecimalFormat("0.00");
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
    DateFormat dateFormat1 = new SimpleDateFormat("MMyyyy");
    Date date = new Date();
    String txnDate = dateFormat.format(date);
    String date1 = dateFormat1.format(date);
    double grandTotal;
    double subtotal = 0;
    double rounding;
    double gst = 0;
    double serviceCharge = 0;
    double discount = 0;
    double gstAmount = 0;
    double serviceChargeAmount = 0;
    double discountAmount = 0;
    
    String orderNo = request.getParameter("orderNo");
    String pmiNo = request.getParameter("pmiNo");
    
    //module name - > 
    //B = Billing
    //R = Receipt
    //I = Invoice
    String sql1 = "SELECT last_seq_no "
            + "FROM far_last_seq_no "
            + "WHERE module_name = 'B' "
            + "FOR UPDATE";
    ArrayList<ArrayList<String>> dataSeq = Conn.getData(sql1);

    //Get last sequance number
    String seqNo = dataSeq.get(0).get(0);
    int seq = Integer.parseInt(seqNo);
    int currSeq = seq + 1;
    String currentSeq = Integer.toString(currSeq);

    //Update last sequance number
    String sql2 = "UPDATE far_last_seq_no "
            + "SET last_seq_no = '"+ currentSeq +"' "
            + "WHERE module_name = 'B'";
    Conn.setData(sql2);

    //Generate bill no
    int length = (int) Math.log10(currSeq) + 1;
    String zero = "0";
    String num = currentSeq;
    int count;
    for (count = length; count < 10; count++) {
        num = zero + num;
    }
    String billNo = num + date1;
    
    //Display selected patient bill info
    String sql3 = "SELECT DISTINCT "
            + "pb.patient_name, "
            + "pb.home_address, "
            + "pb.new_ic_no, "
            + "pb.id_no, "
            + "pb.mobile_phone, "
            + "now(), "
            + "od.item_cd, "
            + "od.item_desc, "
            + "IFNULL(od.quantity, 0), "
            + "IFNULL(od.item_amt/od.quantity, 0), "
            + "IFNULL(od.item_amt, 0), "
            + "pb.id_type "
            + "FROM pms_patient_biodata pb, far_order_master om, far_order_detail od "
            + "WHERE pb.PMI_NO = '"+ pmiNo +"' "
            + "AND om.order_no = '"+ orderNo +"' "
            + "AND od.order_no = '"+ orderNo +"'";
    System.out.print(sql3);
    ArrayList<ArrayList<String>> data = Conn.getData(sql3);
    if (data.isEmpty()){
        out.print("No details found.");
    } else{
%>
<div style="margin-bottom: 50px">
    <h4><b>Bill Detail</b></h4>
    <div class="form-group">
        <label class="col-lg-2">Bill No.</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="billNo" id="billNo" value="<%=billNo%>" readonly="true">
        </div>
        <label class="col-lg-2">Transaction Date</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="txnDate" id="txnDate" value="<%=data.get(0).get(5)%>" readonly="true">
        </div>
        <label class="col-lg-2">Order No.</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="address" id="orderNo" value="<%=orderNo%>" readonly="true">
        </div>
        <label class="col-lg-2">PMI No.</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="address" id="pmiNo" value="<%=pmiNo%>" readonly="true">
        </div>        
        <label class="col-lg-2">Name</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="patientName" id="patientName" value="<%=data.get(0).get(0)%>" readonly="true">
        </div>
        <label class="col-lg-2">Address</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="address" id="address" value="<%=data.get(0).get(1)%>" readonly="true">
        </div>
        <label class="col-lg-2">IC No.</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="ic" id="ic" value="<%=data.get(0).get(2)%>" readonly="true">
        </div>
        <label class="col-lg-2">Other ID</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="otherID" id="otherID" value="<%=data.get(0).get(3)%>" readonly="true">
        </div>
        <label class="col-lg-2">Phone No.</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="phone" id="phone" value="<%=data.get(0).get(4)%>" readonly="true">
        </div>
    </div>
</div>
        
<div>
    <div id="listOfItems">
        <table id="tableItems" class="table table-filter table-striped table-bordered">
            <thead>
                <th>Item Code</th>
                <th>Item Description</th>
                <th style="text-align: right;">Item Quantity</th>
                <th style="text-align: right;">Unit Price (RM)</th>
                <th style="text-align: right;">Total Amount (RM)</th>
            </thead>
            <tbody>
<%
    if (!data.isEmpty()){
        for(int i = 0; i < data.size(); i++){
%>
            <tr>
                <td><%=data.get(i).get(6)%></td>
                <td><%=data.get(i).get(7)%></td>
                <td style="text-align: right;"><%=data.get(i).get(8)%></td>
                <td style="text-align: right;"><%=df.format(Double.parseDouble(data.get(i).get(9)))%></td>
                <td style="text-align: right;"><%=df.format(Double.parseDouble(data.get(i).get(10)))%></td>
            </tr>
<%          
            subtotal += Double.parseDouble(data.get(i).get(10));
        }
    }

    //Search and add miscellaneous item to table.
    String type = data.get(0).get(11);
    if (type.equals("004")) {
        type = "RG00001";
    } else if (type.equals("005")) {
        type = "RG00002";
    } else if (type.equals("Foreigner")) {
        type = "RG00003";
    }

    String sql4 = "SELECT * FROM far_miscellaneous_item WHERE item_code = '"+ type +"'";
    ArrayList<ArrayList<String>> dataItem = Conn.getData(sql4);
    if(!dataItem.isEmpty()){
        subtotal = subtotal + Double.parseDouble(dataItem.get(0).get(4));
%>
        <tr>
            <td><%=dataItem.get(0).get(1)%></td>
            <td><%=dataItem.get(0).get(2)%></td>
            <td style="text-align: right;">1.00</td>
            <td style="text-align: right;"><%=df.format(Double.parseDouble(dataItem.get(0).get(4)))%></td>
            <td style="text-align: right;"><%=df.format(Double.parseDouble(dataItem.get(0).get(4)))%></td>
        </tr>
<%  }
    
    //Search and add billing parameters
    String sql5 = "SELECT param_code, param_name, param_value FROM far_billing_parameter WHERE enable = 'yes'";
    ArrayList<ArrayList<String>>billingParameters = Conn.getData(sql5);

    for (int i = 0 ; i < billingParameters.size() ; i++){
        if (billingParameters.get(i).get(1).equalsIgnoreCase("gst")){
            gst = Double.parseDouble(billingParameters.get(i).get(2));
        } else if (billingParameters.get(i).get(1).equalsIgnoreCase("service charge")){
            serviceCharge = Double.parseDouble(billingParameters.get(i).get(2));
        } else if (billingParameters.get(i).get(1).equalsIgnoreCase("discount")){
            discount = Double.parseDouble(billingParameters.get(i).get(2));
        }
    }

    //Calculate grand total
    discountAmount = subtotal * discount;
    discountAmount = Double.parseDouble(df.format(discountAmount));
    subtotal =  subtotal - discountAmount;

    serviceChargeAmount = subtotal * serviceCharge;
    serviceChargeAmount = Double.parseDouble(df.format(serviceChargeAmount));
    subtotal = subtotal + serviceChargeAmount;

    gstAmount = subtotal * gst;
    gstAmount = Double.parseDouble(df.format(gstAmount));
    subtotal = subtotal + gstAmount;

    //Round the grand total
    grandTotal = subtotal;
    grandTotal = Math.round(grandTotal * 20) / 20.0;

    rounding = grandTotal - subtotal;
    rounding = Double.parseDouble(df.format(rounding));
    
    //display to bill details table
    for (int i = 0 ; i < billingParameters.size() ; i++){
%>
        <tr>
            <td><%=billingParameters.get(i).get(0)%></td>
            <td><%=billingParameters.get(i).get(1)%></td>
            <td style="text-align: right;">1</td>
<%
        if (billingParameters.get(i).get(1).equalsIgnoreCase("gst")){
%>
            <td style="text-align: right;"><%=df.format(gstAmount)%></td>
            <td style="text-align: right;"><%=df.format(gstAmount)%></td>
<%
        } else if (billingParameters.get(i).get(1).equalsIgnoreCase("service charge")){
%>
            <td style="text-align: right;"><%=df.format(serviceChargeAmount)%></td>
            <td style="text-align: right;"><%=df.format(serviceChargeAmount)%></td>
<%
        } else if (billingParameters.get(i).get(1).equalsIgnoreCase("discount")){
%>
            <td style="text-align: right;"><%=df.format(discountAmount)%></td>
            <td style="text-align: right;"><%=df.format(discountAmount)%></td>
<%
        }
    }
%>
            </tbody>
        </table>
    </div>
</div>
        
<div>
        <div class="col-lg-4 pull-left" style="margin-bottom: 10px; ">
            <button id="cancel" class="btn btn-warning" style="float: left;">Cancel</button>
        </div>
        <div class="col-lg-8 pull-right" style="margin-bottom: 10px; ">
            <button id="back" class="btn btn-success" style="float: right;" disabled="true">Back</button>
            <button id="confirm" class="btn btn-success" style="float: right; margin-right: 10px;" >Confirm</button>
            <button id="openItemList" class="btn btn-success modal-toggle" data-toggle="modal" data-target="#addItemList" disabled="true" style="float: right; margin-right: 10px;">Add Item</button>
            <button id="openMakePayment" class="btn btn-success" data-toggle="modal" data-target="#makePayment" disabled="true" style="float: right; margin-right: 10px;">Payment</button>
        </div>
</div>
<div class="modal fade" id="makePayment" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Payment Calculator</h4>
            </div>
            
            <div class="modal-body">
                <label class="col-lg-4">Subtotal</label>
                <div class="col-lg-8" style="margin-bottom: 10px">
                    <input type="text" class="form-control" id="subtotal" value="<%=df.format(subtotal)%>" readonly="true" style="text-align: center;">
                </div>
                <label class="col-lg-4">Grand Total</label>
                <div class="col-lg-8" style="margin-bottom: 10px">
                    <input type="text" class="form-control" id="grandTotal" value="<%=df.format(grandTotal)%>" readonly="true" style="text-align: center;">
                </div>
                <label class="col-lg-4">Payment Method</label>
                <div class="dropdown col-lg-8" style="margin-bottom: 10px">
                    <button id="paymentMethod" class="btn btn-primary dropdown-toggle form-control" type="button" data-toggle="dropdown">Cash</button>
                    <ul id="method" class="dropdown-menu">
                        <li><a>Cash</a></li>
                        <li><a>Credit Card</a></li>
                        <li><a>Cheque</a></li>
                    </ul>
                </div>
                <label class="col-lg-4">Amount Received</label>
                <div class="col-lg-8" style="margin-bottom: 10px">
                    <input type="text" class="form-control" id="amtReceived" value="" style="text-align: center;">
                </div>
                <label class="col-lg-4">Change</label>
                <div class="col-lg-8" style="margin-bottom: 10px">
                    <input type="text" class="form-control" id="change" value="" readonly="true" style="text-align: center;">
                </div>
            </div>
            <div class="modal-footer">
                <button id="payment" type="button" class="btn btn-success" data-dismiss="modal">Make Payment</button>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="addItemList" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <ul id="tabs" class="nav nav-tabs col-md-12 custom-bullet">
                    <li class="active"><a data-toggle="tab" href="#tabMiscItem">Miscellaneous Item</a></li>
                    <li><a data-toggle="tab" href="#tabDrugsItem">Drugs Item</a></li>
                </ul>
            </div>
            <div class="modal-body scrollable-modal-body">
                <div class="sd-tabs sd-tab-interaction">
                    <div class="row">
                        <div class="tab-content col-md-12">
                            <div id="tabMiscItem" class="tab-pane active">
                                <!-- Misc Item -->
                                <div id="custom-search-input" style="margin-top: 10px;">
                                    <div class="form-group ">
                                        <label class="col-md-4 control-label" for="textinput">Enter Item Name to Filter</label>
                                        <div class="col-md-4">
                                            <input id="searchMiscItem" type="text" class=" search-query form-control" placeholder="Item Name" onkeyup="searchMiscItem()"/>
                                        </div>
                                    </div>
                                </div>
                                <div id="miscItem" ></div>
                            </div>

                            <div id="tabDrugsItem" class="tab-pane">
                                <!-- Drugs Item -->
                                <div id="custom-search-input" style="margin-top: 10px;">
                                    <div class="form-group ">
                                        <label class="col-md-4 control-label" for="textinput">Enter Item Name to Filter</label>
                                        <div class="col-md-4">
                                            <input id="searchDrugsItem" type="text" class=" search-query form-control" placeholder="Item Name" onkeyup="searchDrugsItem()"/>
                                        </div>
                                    </div>
                                </div>
                                <div id="drugsItem" ></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button id="addMiscItem" type="button" class="btn btn-success" data-dismiss="modal">Add Item</button>
            </div>
        </div>
    </div>
</div>
               
<div class="modal fade" id="addQuantityModal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Quantity to Add</h4>
            </div>
            
            <div class="modal-body">
                <label class="col-lg-4">Quantity</label>
                <div class="col-lg-8" style="margin-bottom: 10px">
                    <input type="text" class="form-control" id="quantity" value="" style="text-align: center;">
                </div>
            </div>
            <div class="modal-footer">
                <button id="addDrugsItem" type="button" class="btn btn-success" data-dismiss="modal">Ok</button>
            </div>
        </div>
    </div>
</div>
<%}%>
                
<script src="assets/js/jquery.min.js" type="text/javascript"></script>
<script src="assets/js/custom.js" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function searchDrugsItem() {
        // Declare variables
        var input, filter, table, tr, td, i;
        input = document.getElementById("searchDrugsItem");
        filter = input.value.toUpperCase();
        table = document.getElementById("drugsItem");
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows, and hide those who don't match the search query
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[1];
            if (td) {
                if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }

    function searchMiscItem() {
        // Declare variables
        var input, filter, table, tr, td, i;
        input = document.getElementById("searchMiscItem");
        filter = input.value.toUpperCase();
        table = document.getElementById("miscItem");
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows, and hide those who don't match the search query
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[1];
            if (td) {
                if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
    
    $(document).ready(function(){
        
        var contextPath = '<%=request.getContextPath()%>';
        
        $('#cancel').click(function(){
            location.reload();
        });
        
        $('#back').click(function(){
            location.reload();
        });
        
        $('#amtReceived').keypress(function(event) {
            if (((event.which != 46 || $(this).val().indexOf('.') != -1) 
                    && (event.which < 48 || event.which > 57) 
                    || ($(this).val().length > 8)) 
                    && event.which != 8 ) {
                event.preventDefault();
            }
        });
        
        $('#amtReceived').keyup(function() {
            var amtReceived = $(this).val();
            var grandTotal = document.getElementById('grandTotal').value;
            var change = 0;

            if (amtReceived == '.'){
                amtReceived = 0;
            }
            
            change = amtReceived - grandTotal;

            $('#change').val(change);
        });
        
        $('#method li a').click(function(){
            $('#paymentMethod').text($(this).text());
        });      
        
        $('#confirm').click(function(){
            var orderNo = document.getElementById('orderNo').value;
            var pmiNo = document.getElementById('pmiNo').value;
            var billNo = document.getElementById('billNo').value;
            var txnDate = document.getElementById('txnDate').value;
            var patientName = document.getElementById('patientName').value;
            var grandTotal = document.getElementById('grandTotal').value;
            var tableItem;
            tableItem = new Array();

            $('#tableItems tr').each(function(row, tr){
                tableItem[row]={
                    "itemCode" : $(tr).find('td:eq(0)').text()
                    , "itemDesc" : $(tr).find('td:eq(1)').text()
                    , "itemQty" : $(tr).find('td:eq(2)').text()
                    , "unitPrice" : $(tr).find('td:eq(3)').text()
                    , "totalPrice" : $(tr).find('td:eq(4)').text()
                };    
            }); 
            tableItem.shift();  // first row will be empty - so remove
            tableItem = JSON.stringify(tableItem);
            
            $.ajax({
                url: "saveGenerateBill.jsp",
                type: "post",
                data: {
                    pmiNo: pmiNo,
                    billNo: billNo,
                    orderNo: orderNo,
                    txnDate: txnDate,
                    patientName: patientName,
                    tableItem: tableItem,
                    grandTotal: grandTotal
                },
                timeout: 10000,
                success: function(data) {
                    var d = data.split("|");
                    if (d[1] == 1){
                        $('#confirm').prop('disabled', true);
                        $('#cancel').prop('disabled', true);
                        $('#openItemList').prop('disabled', false);
                        $('#openMakePayment').prop('disabled', false);
                        $('#back').prop('disabled', false);
                        
                        document.getElementById('messageHeader').innerHTML = "Success!";
                        document.getElementById('messageContent').innerHTML = "Bill created.";
                        $("#alertMessage").modal();
                    } else {
                        document.getElementById('messageHeader').innerHTML = "Error!";
                        document.getElementById('messageContent').innerHTML = d[2];
                        $("#alertMessage").modal();
                    }
                },
                error: function(err) {
                }
            });
        });
        
        $('#openItemList').click(function(){
            $('#miscItem').load('tableAddMiscItem.jsp');
            $('#drugsItem').load('tableAddDrugsItem.jsp');
        });
        
        $('#addMiscItem').click(function (){
            var selected = $('.modal-body').find('.row_selected').text();
            var activeTab = $('ul#tabs').find('li.active').text();
            
            if (selected == ''){
                alert("Please select an item.");
            } else {
                var itemCode = $('#tableMisc').find(".row_selected td:nth-child(1)").text();
                var itemName = $('#tableMisc').find(".row_selected td:nth-child(2)").text();
                var unitPrice = $('#tableMisc').find(".row_selected td:nth-child(3)").text();
                var custID = document.getElementById('pmiNo').value;
                var billNo = document.getElementById('billNo').value;
                
                if (activeTab == 'Miscellaneous Item'){
                    $.ajax({
                        url: "addBillItem.jsp",
                        type: "post",
                        data: {
                            itemCode: itemCode,
                            itemName: itemName,
                            unitPrice: unitPrice,
                            custID: custID,
                            billNo: billNo,
                            itemType: 'M'
                        },
                        timeout: 10000,
                        success: function(data) {
                           var d = data.split("|");
                           if (d[1] == 1){
                                document.getElementById('messageHeader').innerHTML = "Success!";
                                document.getElementById('messageContent').innerHTML = d[2];
                                $("#alertMessage").modal();
                               
                                var row = 
                                        '<tr>\n\
                                            <td>'+ itemCode +'</td>\n\
                                            <td>'+ itemName +'</td>\n\
                                            <td style="text-align: right;">1</td>\n\
                                            <td style="text-align: right;">'+ unitPrice +'</td>\n\
                                            <td style="text-align: right;">'+ unitPrice +'</td>\n\
                                        </tr>';
                               $('#tableItems tr:last').after(row);
                               
                                var subTotal = parseFloat(document.getElementById('subtotal').value);
                                var grandTotal = parseFloat(document.getElementById('grandTotal').value);
                            
                                subTotal = subTotal + parseFloat(unitPrice);
                                grandTotal = grandTotal + parseFloat(d[3]);

                                $('#subtotal').val(subTotal.toFixed(2));
                                $('#grandTotal').val(grandTotal.toFixed(2));
                               
                           } else {
                                document.getElementById('messageHeader').innerHTML = "Failed!";
                                document.getElementById('messageContent').innerHTML = d[2];
                                $("#alertMessage").modal();
                           }
                        },
                        error: function(err) {
                            document.getElementById('messageHeader').innerHTML = "Error!";
                            document.getElementById('messageContent').innerHTML = "Failed to make payment.\nPlease try again.";
                            $("#alertMessage").modal();
                        }
                    });
                    
                } else if (activeTab == 'Drugs Item'){
                    $('#addQuantityModal').modal('show');
                } 
            }
        });
        
        $('#addDrugsItem').click(function (){
            var quantity = document.getElementById('quantity').value;
            
            if (quantity == '' || quantity == 0){
                alert("Please enter a quantity.");
            } else {
                var itemCode = $('#tableDrugsItem').find(".row_selected td:nth-child(1)").text();
                var itemName = $('#tableDrugsItem').find(".row_selected td:nth-child(2)").text();
                var unitPrice = $('#tableDrugsItem').find(".row_selected td:nth-child(4)").text();
                var custID = document.getElementById('pmiNo').value;
                var billNo = document.getElementById('billNo').value;
                
                $.ajax({
                    url: "addBillItem.jsp",
                    type: "post",
                    data: {
                        itemCode: itemCode,
                        itemName: itemName,
                        unitPrice: unitPrice,
                        custID: custID,
                        billNo: billNo,
                        itemType: 'D',
                        quantity: quantity
                    },
                    timeout: 10000,
                    success: function(data) {
                       var d = data.split("|");
                       if (d[1] == 1){
                            document.getElementById('messageHeader').innerHTML = "Success!";
                            document.getElementById('messageContent').innerHTML = d[2];
                            $("#alertMessage").modal();
                           
                           var totalPrice = quantity * unitPrice;
                           
                            var row = 
                                    '<tr>\n\
                                        <td>'+ itemCode +'</td>\n\
                                        <td>'+ itemName +'</td>\n\
                                        <td style="text-align: right;">'+ quantity +'</td>\n\
                                        <td style="text-align: right;">'+ unitPrice +'</td>\n\
                                        <td style="text-align: right;">'+ totalPrice.toFixed(2) +'</td>\n\
                                    </tr>';
                           $('#tableItems tr:last').after(row);

                            var subTotal = parseFloat(document.getElementById('subtotal').value);
                            var grandTotal = parseFloat(document.getElementById('grandTotal').value);
                            
                            subTotal = subTotal + totalPrice;
                            grandTotal = grandTotal + parseFloat(d[3]);

                            $('#subtotal').val(subTotal.toFixed(2));
                            $('#grandTotal').val(grandTotal.toFixed(2));

                       } else {
                            document.getElementById('messageHeader').innerHTML = "Failed!";
                            document.getElementById('messageContent').innerHTML = d[2];
                            $("#alertMessage").modal();
                       }
                    },
                    error: function(err) {
                        document.getElementById('messageHeader').innerHTML = "Error!";
                        document.getElementById('messageContent').innerHTML = "Failed to add item.\nPlease try again.";
                        $("#alertMessage").modal();
                    }
                });
            }
        });
        
        $('#quantity').keypress(function(event) {
            if ((event.which != 46 || $(this).val().indexOf('.') != 1) && (event.which < 48 || event.which > 57) && event.which != 8) {
                event.preventDefault();
            }
        });     
        
        $('#payment').click(function (){
            var subTotal = document.getElementById('subtotal').value;
            var grandTotal = document.getElementById('grandTotal').value;
            var amtReceived = document.getElementById('amtReceived').value;
            var paymentMethod = document.getElementById('paymentMethod').innerHTML;
            var custID = document.getElementById('pmiNo').value;
            var billNo = document.getElementById('billNo').value;
            var change = document.getElementById('change').value;
            
            if (amtReceived == '0' || amtReceived == '.' || amtReceived == ''){
                document.getElementById('messageHeader').innerHTML = "Warning!";
                document.getElementById('messageContent').innerHTML = "Please enter an amount first.";
                $("#alertMessage").modal();
            } else {
                
                $.ajax({
                    url: "makePayment.jsp",
                    type: "post",
                    data: {
                        subTotal: subTotal,
                        grandTotal: grandTotal,
                        amtReceived: amtReceived,
                        paymentMethod: paymentMethod,
                        custID: custID,
                        billNo: billNo
                    },
                    timeout: 10000,
                    success: function(data) {
                       var d = data.split("|");
                       if (d[1] == 1){
                            var url = contextPath + "/Receipt?"
                            url += "&custID=" + custID;
                            url += "&billNo=" + billNo;
                            url += "&subtotal=" + d[3];
                            url += "&grandTotal=" + d[4];
                            url += "&amount=" + d[5];
                            url += "&change=" + change;
                            url += "&gst=" + d[6];
                            url += "&serviceCharge=" + d[7];
                            url += "&discount=" + d[8];
                            url += "&rounding=" + d[9];

                            var win = window.open(url, '_blank');
                            win.focus();
                           
                           location.reload();
                           
                            document.getElementById('messageHeader').innerHTML = "Success!";
                            document.getElementById('messageContent').innerHTML = "Success make payement.";
                            $("#alertMessage").modal();
                       } else {
                            document.getElementById('messageHeader').innerHTML = "Error!";
                            document.getElementById('messageContent').innerHTML = "Failed to make payment.";
                            $("#alertMessage").modal();
                       }
                    },
                    error: function(err) {
                        document.getElementById('messageHeader').innerHTML = "Error!";
                        document.getElementById('messageContent').innerHTML = "Failed to make payment.";
                        $("#alertMessage").modal();
                    }
                });
            }
        });
    });
</script>
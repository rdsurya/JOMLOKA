<%-- 
    Document   : patientOrderListBasicInfo
    Created on : Feb 7, 2017, 2:44:32 PM
    Author     : Shammugam
--%>

<div class="thumbnail">
    <h4>Basic Info</h4>
    <hr/>
    <form class="form-horizontal" name="patientOrderDetailContentBasicInfoForm" id="patientOrderDetailContentBasicInfoForm">
        <div class="row">

            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">PMI No.</label>
                    <div class="col-md-8">
                        <input id="patientpmino" name="patientpmino" type="text" placeholder="" readonly class="form-control input-md">   
                    </div>
                </div>
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Name</label>
                    <div class="col-md-8">
                        <input id="patientName" name="patientName" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>

            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">New IC No.</label>
                    <div class="col-md-8">
                        <input id="patientnic" name="patientnic" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>
                <!--Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Gender</label>
                    <div class="col-md-8">
                        <input id="patientGender" name="patientGender" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>

            <div class="col-md-4">

                <!--Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">D.O.B</label>
                    <div class="col-md-8">
                        <input id="patientBdate" name="patientBdate" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>
                <!--Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Blood Type</label>
                    <div class="col-md-8">
                        <input id="patientBtype" name="patientBtype" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>

        </div>
    </form>

    <hr/>
    <h5 style="padding-bottom: 1%;font-weight: bolder">
        Allergy List
    </h5>

    <div id="patientAllergyListTableDiv" class="form-group">
        <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="patientAllergyListTable">
            <thead>
            <th style="display: none">PMI NO</th>
            <th>HFC CODE</th>
            <th>EPISODE DATE</th>
            <th>ENCOUNTER DATE</th>
            <th>ALLERGY CODE</th>
            <th>ALLERGY DESCRIPTION</th>
            <th>COMMENT</th>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
</div>


<div class="thumbnail">
    <h4>Diagnosis Info</h4>
    <hr/>
    <div id="patientDiagnosisListTableDiv" class="form-group">
        <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="patientDiagnosisListTable">
            <thead>
            <th style="display: none">PMI NO</th>
            <th >HFC CODE</th>
            <th>EPISODE DATE</th>
            <th>ENCOUNTER DATE</th>
            <th>DIAGNOSIS CODE</th>
            <th>DIAGNOSIS DESCRIPTION</th>
            <th>COMMENT</th>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
</div>


<div class="thumbnail">
    <h4>Order Info</h4>
    <hr/>
    <form class="form-horizontal" name="patientOrderDetailContentOrderInfoForm" id="patientOrderDetailContentOrderInfoForm">
        <div class="row">

            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Order No.</label>
                    <div class="col-md-8">
                        <input id="patientOrderNo" name="patientOrderNo" type="text" placeholder=" " readonly class="form-control input-md">   
                    </div>
                </div>

            </div>


            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Order Date</label>
                    <div class="col-md-8">
                        <input id="patientOrderDate" name="patientOrderDate" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>


            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Location</label>
                    <div class="col-md-8">
                        <input id="patientOrderLocationCode" name="patientOrderLocationCode" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>


        </div>
    </form>
    <hr/>
    <h4 style="padding-bottom: 1%">
        <div class="pull-right">
            <button id="patientOrderNewDrugButton" name="patientOrderNewDrugButton" class="btn btn-primary" data-toggle="modal" ><i class="fa fa-plus fa-lg"></i>&nbsp; New Order</button>
        </div>
        <br>
    </h4>


    <div id="patientOrderDetailsListTableDiv" class="form-group">
        <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="patientOrderDetailsListTable">
            <thead>
            <th>Order No</th>
            <th>Code</th>
            <th>Description</th>
            <th>Strength</th>
            <th>Frequency</th>
            <th>Duration</th>
            <th>Dose</th>
            <th>Price/Pack</th>
            <th>Stock Qty</th>
            <th>Ordered Qty</th>
            <th>Supplied Qty</th>
            <th>Dispensed Qty</th>
            <!--    <th>Total Price (RM)</th>-->
            <th>Status</th>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>

    <div style="padding-top: 1%; padding-bottom: 8%;">
        <!-- content goes here -->
        <form class="form-horizontal" id="addForm">

            <div class="col-md-2">
                <input id="dispenseFarBillNo" name="dispenseFarBillNo" type="hidden" class="form-control input-md" maxlength="50" readonly>
            </div>

            <div class="col-md-3">
                <input id="dispenseTotalQuantity" name="dispenseTotalQuantity" type="hidden" placeholder="Total Order" class="form-control input-md" maxlength="50" readonly>
                <input id="dispenseTotalQuantityChecked" name="dispenseTotalQuantityChecked" type="hidden" placeholder="Total Order" class="form-control input-md" maxlength="50" readonly>
            </div>

            <div class="col-md-3">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-5 control-label" for="textinput">Total Order</label>
                    <div class="col-md-4">
                        <input id="dispenseTotalOrder" name="dispenseTotalOrder" type="text" placeholder="Total Order" class="form-control input-md" maxlength="50" readonly>
                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-5 control-label" for="textinput">Total Order Final</label>
                    <div class="col-md-4">
                        <input id="dispenseTotalOrderChecked" name="dispenseTotalOrderChecked" type="text" placeholder="Total Order" class="form-control input-md" maxlength="50" readonly>
                    </div>
                </div>

            </div>

            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-5 control-label" for="textinput">Grand Total (RM)</label>
                    <div class="col-md-4">
                        <input id="dispenseGrandTotal" name="dispenseGrandTotal" type="number" placeholder="Grand Total (RM)" class="form-control input-md" maxlength="50" readonly>
                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-5 control-label" for="textinput">Grand Total Final (RM)</label>
                    <div class="col-md-4">
                        <input id="dispenseGrandTotalChecked" name="dispenseGrandTotalChecked" type="number" placeholder="Grand Total (RM)" class="form-control input-md" maxlength="50" readonly>
                    </div>
                </div>

            </div>

        </form>
    </div>

    <div class="text-center" id="patientOrderDispenseButtonDiv" > 
        <button class="btn btn-success " type="button" id="btnOrderDispense" name="btnOrderDispense" > <i class="fa fa-shopping-cart fa-lg"></i>&nbsp; Dispense &nbsp;</button>
        <button class="btn btn-primary " type="button" id="btnOrderDispensePrescribe" name="btnOrderDispensePrescribe" > <i class="fa fa-print fa-lg" ></i>&nbsp; Print Label &nbsp;</button>
        <button class="btn btn-default " type="button" id="btnClearOrderDetailDispense" name="btnClearOrderDetailDispense" > <i class="fa fa-ban fa-lg"></i>&nbsp; Back &nbsp;</button>
    </div>
</div>


<script>


//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

    // Move to Order Details Fetch Details Start
    $('#patientOrderListContent').off('click', '#patientOrderListTable #moveToOrderDetailsTButton').on('click', '#patientOrderListTable #moveToOrderDetailsTButton', function (e) {

        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#dataPatientOrderListhidden").val();
        var arrayData = rowData.split("|");
        console.log(arrayData);

        //Assign Array into seprated val
        var patientpmino = arrayData[1];
        var patientName = arrayData[15];
        var patientnic = arrayData[16];
        var patientGender = arrayData[18];
        var patientBdate = arrayData[17];
        var patientBtype = arrayData[19];
        var patientOrderNo = arrayData[0];
        var patientOrderDate = arrayData[5];
        var patientOrderLocationCode = arrayData[2];


        $.ajax({
            url: "patientOrderListDetailsDispenceFarTableBillNo.jsp",
            type: "post",
            timeout: 3000,
            success: function (data) {

                var billNo = data.trim();

                //Set value to the Second Tab 
                $("#patientpmino").val(patientpmino);
                $("#patientName").val(patientName);
                $("#patientnic").val(patientnic);
                $("#patientGender").val(patientGender);
                $("#patientBdate").val(patientBdate);
                $("#patientBtype").val(patientBtype);
                $("#patientOrderNo").val(patientOrderNo);
                $("#patientOrderDate").val(patientOrderDate);
                $("#patientOrderLocationCode").val(patientOrderLocationCode);
                $("#dispenseFarBillNo").val(billNo);

                loadAllergyDiagnosisOrder(patientOrderNo, patientpmino);
            }
        });



    });
    // Move to Order Details Fetch Details End


    // Move to Order Details And Load All Table Data Start
    function loadAllergyDiagnosisOrder(orderNo, pmino) {

        var dataDiagnosis = {
            pmino: pmino
        };

        var dataAllergy = {
            pmino: pmino
        };

        var dataOrder = {
            orderNo: orderNo
        };


        $.ajax({
            url: "patientOrderListAllergyTable.jsp",
            type: "post",
            data: dataAllergy,
            timeout: 3000,
            success: function (returnAllergyTableHTML) {

                $('#patientAllergyListTable').html(returnAllergyTableHTML);

                $.ajax({
                    url: "patientOrderListDiagnosisTable.jsp",
                    type: "post",
                    data: dataDiagnosis,
                    timeout: 3000,
                    success: function (returnDiagnosisTableHTML) {

                        $('#patientDiagnosisListTable').html(returnDiagnosisTableHTML);

                        $.ajax({
                            url: "patientOrderListDetailsNew.jsp",
                            type: "post",
                            data: dataOrder,
                            timeout: 3000,
                            success: function (returnOrderDetailsTableHTML) {
                                //console.log(returnOrderDetailsTableHTML);
                                $('#patientOrderDetailsListTable').html(returnOrderDetailsTableHTML);
                                $('#patientOrderDetailsListTable').trigger('contentchanged');
                                $('.nav-tabs a[href="#tab_default_2"]').tab('show');
                            }
                        });

                    }
                });

            }
        });

    }
    // Move to Order Details And Load All Table Data End


    // Load Datatable To Tables Start
    $(document).on('contentchanged', '#patientOrderDetailsListTableDiv', function () {

        $('#patientOrderDetailsListTable').DataTable().destroy();

        // do something after the div content has changed
        $('#patientOrderDetailsListTable').DataTable({
            "paging": false,
            "searching": false,
            "info": false,
            "language": {
                "emptyTable": "No Order Available To Display"
            }
        });

    });
    // Load Datatable To Tables End 


//======================================================================================================================================================================================//





//------------------------------------------------------------------------------  Add Part Start  -------------------------------------------------------------------------------------//


    // Getting Order Id And Date Start
    $('#patientOrderDetailContent').off('click', '#patientOrderNewDrugButton').on('click', '#patientOrderNewDrugButton', function (e) {

        e.preventDefault();

        var patientOrderNo = $("#patientOrderNo").val();
        var patientOrderDate = $("#patientOrderDate").val();

        if (patientOrderNo === "" || patientOrderNo === null) {

            $('.nav-tabs a[href="#tab_default_1"]').tab('show');
            bootbox.alert("Please Select A Order First");

        } else {

            $('#addOrderDrug').modal('show');

            console.log(patientOrderDate);
            console.log(patientOrderNo);

            $("#orderDrugDetailsID").val(patientOrderNo);
            $("#orderDrugDetailsDate").val(patientOrderDate);

        }

    });
    // Getting Order Id And Date End


    //js Search in add drug Start
    $(function () {
        $("#orderDrugSearchInput").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value
            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#orderDrugSearchInputDisplayResult').html('<img src="LoaderIcon.gif"/>'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {'input': input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "Search2.jsp", // call the jsp file ajax/auto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#orderDrugSearchInputDisplayResult').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#orderDrugSearchInputDisplayResult li').on('click', function () { // When click on an element in the list
                            $('#orderDrugSearchInput').val($(this).text()); // Update the field with the new element
                            $('#orderDrugSearchInputDisplayResult').text(''); // Clear the <div id="match"></div>
                        });
                    },
                    error: function () { // if error
                        $('#orderDrugSearchInputDisplayResult').text('No Eecord Found !');
                    }
                });
            } else {
                $('#orderDrugSearchInputDisplayResult').text('Problem!'); // If less than 2 characters, clear the <div id="match"></div>
            }
        });
    });
    //js Search in add drug End


    //Start js Search Select drug
    $('#orderDrugSearchInputDisplayResult').on('click', function () {
        var id = $('#orderDrugSearchInput').val();
        $.ajax({
            type: 'post',
            url: 'SearchDTO_cd.jsp',
            data: {'id': id},
            success: function (reply_data) {
                console.log(reply_data);
                var array_data = String(reply_data).split("|");
                var dtoCode = array_data[0];
                var dtoGnr = array_data[1];
                var dtoQty = array_data[2];
                var dtoPackage = array_data[8];
                var dtoRoute = array_data[3];
                var dtoForm = array_data[4];
                var dtoStrength = array_data[5];
                var dtoInstruction = array_data[6];
                var dtoCaution = array_data[7];

                console.log(dtoCode);

                $('#orderDrugDisplayDrugCode').val(dtoCode);
                $('#orderDrugDisplayTradeName').val(dtoGnr);
                $('#orderDrugDisplayStockQuantity').val(dtoQty);
                $('#orderDrugDisplayForm').val(dtoForm);
                $('#orderDrugDisplayRoute').val(dtoRoute);
                $('#orderDrugDisplayStrength').val(dtoStrength);
                $('#orderDrugDisplayInstruction').val(dtoInstruction);
                $('#orderDrugDisplayCautionary').val(dtoCaution);

            }
        });
    });
    //End js Search Select drug


    // Add Order Start
    $('#orderDrugAddButton').on('click', function (e) {

        e.preventDefault();

        var orderNo = $('#orderDrugDetailsID').val();
        var orderDate = $('#orderDrugDetailsDate').val();

        var drugTradeName = $('#orderDrugSearchInput').val();
        var drugCode = $('#orderDrugDisplayDrugCode').val();
        var drugGName = $('#orderDrugDisplayTradeName').val();
        var drugRoute = $('#orderDrugDisplayRoute').val();
        var drugForm = $('#orderDrugDisplayForm').val();

        var drugStrength = $('#orderDrugDisplayStrength').val();
        var drugInstruction = $('#orderDrugDisplayInstruction').val();
        var drugCaution = $('#orderDrugDisplayCautionary').val();
        var drugTotalQty = $('#orderDrugDisplayStockQuantity').val();

        var drugQty = $('#orderDrugInputQuantity').val();
        var drugDose = $('#orderDrugInputDose').val();
        var drugDoseT = $('#orderDrugInputDoseT').val();
        var drugFrequency = $('#orderDrugInputFrequency').val();
        var drugDuration = $('#orderDrugInputDuration').val();
        var drugDurationT = $('#orderDrugInputDurationT').val();

        if (drugTradeName === "" || drugTradeName === null) {
            bootbox.alert("Please Search The Drug Before Continue");
        } else if (drugQty === "" || drugQty === null) {
            bootbox.alert("Please Insert Drug Order Quantity");
        } else if (drugDose === "" || drugDose === null) {
            bootbox.alert("Please Insert Drug Order Dose");
        } else if (drugDoseT === "No Dose" || drugDoseT === null) {
            bootbox.alert("Please Select Drug Dose Type");
        } else if (drugFrequency === "No Frequency" || drugFrequency === null) {
            bootbox.alert("Please Select Drug Frequency");
        } else if (drugDuration === "" || drugDuration === null) {
            bootbox.alert("Please Insert Drug Duration");
        } else if (drugDurationT === "No Duration" || drugDurationT === null) {
            bootbox.alert("Please Select Drug Frequency");
        } else {

            var ItemDesc = (drugTradeName + " - " + drugGName);
            var dosage = (drugDose + drugDoseT);

            var data = {
                orderNo: orderNo
            };

            var datas = {
                orderNo: orderNo,
                drugCode: drugCode,
                drugDesc: ItemDesc,
                drugFrequency: drugFrequency,
                drugRoute: drugRoute,
                drugFrom: drugForm,
                drugStrength: drugStrength,
                dosage: dosage,
                orderOUM: "-",
                drugDuration: drugDuration,
                orderStatus: "0",
                drugQty: drugQty,
                qtySupplied: "0",
                suppliedOUM: "-",
                qtyDispensed: "0",
                dispensedOUM: "-",
                drugDurationT: drugDurationT
            };

            console.log(datas);

            $.ajax({
                url: "patientOrderListNewOrderInsert.jsp",
                type: "post",
                data: datas,
                timeout: 10000,
                success: function (datas) {

                    if (datas.trim() === 'Success') {

                        $('#addOrderDrug').modal('hide');
                        bootbox.alert({
                            message: "Order is Added Successful",
                            title: "Process Result",
                            backdrop: true
                        });
                        resetAddOrder();

                        $.ajax({
                            url: "patientOrderListDetailsNew.jsp",
                            type: "post",
                            data: data,
                            timeout: 3000,
                            success: function (returnOrderDetailsTableHTML) {

                                $('#patientOrderDetailsListTable').html(returnOrderDetailsTableHTML);
                                $('#patientOrderDetailsListTable').trigger('contentchanged');

                            }
                        });

                    } else if (datas.trim() === 'Duplicate') {

                        bootbox.alert({
                            message: "Order Product Code Duplication Detected. Please Order diffrent drug as the data already there",
                            title: "Process Result",
                            backdrop: true
                        });

                    } else if (datas.trim() === 'Failed') {

                        bootbox.alert({
                            message: "Order Add Failed",
                            title: "Process Result",
                            backdrop: true
                        });
                        $('#addOrderDrug').modal('hide');
                        resetAddOrder();
                    }

                },
                error: function (err) {
                    console.log("Ajax Is Not Success");
                }

            });
        }

    });
    // Add Order End


    // Reset Order Button Start
    $('#orderDrugResetButton').on('click', function (e) {
        resetAddOrder();
    });
    // Reset Order Button End


    // Reset Order Function Start
    function resetAddOrder() {
        document.getElementById("addDrugOrderForm").reset();
    }
    // Reset Order Function End


//================================================================================  Add Part End  =====================================================================================//





//-------------------------------------------------------------------------  Update And Delete Part Start  ----------------------------------------------------------------------------//

    // global variable declaration
    var row;

    // Get Data For Delete And Update To Load On the Modal
    $('#patientOrderDetailContent').off('click', '#patientOrderDetailsListTable #updateOrderDetailsTButton').on('click', '#patientOrderDetailsListTable #updateOrderDetailsTButton', function (e) {

        e.preventDefault();

        row = $(this).closest("tr");
        var rowData = row.find("#dataPatientOrderDetailsListhidden").val();
        var arrayData = rowData.split("|");
        console.log(row);
        console.log(arrayData);

        var updateOrderNo = arrayData[0];
        var updateOrderDrugCode = arrayData[1];
        var updateOrderDrugOrdered = parseInt(arrayData[11]);
        var updateOrderDrugSupplied = arrayData[12];
        var updateOrderDrugStockQty = arrayData[18];
        var updateOrderDrugDispensed = row.find('td').eq(10).text();
        var updateOrderDrugStatus = row.find('td').eq(13).text();

        $("#updateOrderNo").val(updateOrderNo);
        $("#updateStockQuantity").val(updateOrderDrugStockQty);
        $("#updateDrugCode").val(updateOrderDrugCode);
        $("#updateOrderedDrugQuantity").val(updateOrderDrugOrdered);
        $("#updateSuppliedDrugQuantity").val(updateOrderDrugSupplied);
        $("#updatestatus").val(updateOrderDrugStatus);

        if (updateOrderDrugDispensed === "0") {
            $("#updateDispensedDrugQuantity").val("");
        } else {
            $("#updateDispensedDrugQuantity").val(updateOrderDrugDispensed);
        }

    });
    // Get Data For Delete And Update To Load On the Modal End

    // Update Order Data
    $('#updateOrder').off('click', '#updateOrderMButton').on('click', '#updateOrderMButton', function (e) {

        e.preventDefault();

        var validDispense = document.getElementById("updateDispensedDrugQuantity");

        var updateStockQty = $("#updateStockQuantity").val();
        var updateOrderedQty = $("#updateOrderedDrugQuantity").val();
        var updateSuppliedQty = $("#updateSuppliedDrugQuantity").val();
        var updateDispensedQuantity = $("#updateDispensedDrugQuantity").val();
        var updateOrderStatusStatic = $("#updatestatus").val();
        var updateOrderPrice = row.find('td').eq(11).text();

        var orderTotal = parseFloat(updateOrderPrice) * parseFloat(updateDispensedQuantity);
        var orderTotalFloat = parseFloat(orderTotal).toFixed(2);



        if (updateDispensedQuantity === "" || updateDispensedQuantity === null || parseInt(updateDispensedQuantity) < 1) {
            bootbox.alert("Please Insert The Dispense Quantity Than Is More That 0 !!!");
        } else if (updateOrderStatusStatic === "New" || updateOrderStatusStatic === null) {
            bootbox.alert("Please Select The Order Status");
        } else if ((parseInt(updateDispensedQuantity) > parseInt(updateOrderedQty))) {
            bootbox.alert("The Dispense Quantity Is More Than Ordered Quantity. Please Choose Valid Number !!!");
            $("#updateDispensedDrugQuantity").val("");
        } else if (validDispense.checkValidity() === false) {
            bootbox.alert("The Dispense Quantity Should Not Be Decimal Number. Please Choose Valid Number !!!");
            $("#updateDispensedDrugQuantity").val("");
        } else if ((parseInt(updateDispensedQuantity) > parseInt(updateStockQty))) {
            bootbox.alert("The Dispense Quantity Is More Than Stock Quantity. Please Choose Valid Number !!!");
            $("#updateDispensedDrugQuantity").val("");
        } else if (((parseInt(updateDispensedQuantity) + parseInt(updateSuppliedQty)) > parseInt(updateOrderedQty))) {
            bootbox.alert("The Combination of Dispense And Supplied Quantity Is More Than Ordered Quantity. Please Choose Valid Number !!!");
            $("#updateDispensedDrugQuantity").val("");
        } else {

            var updateOrderDrugDispensed = row.find('td').eq(10).text(updateDispensedQuantity);
            var updateOrderTotalPrice = row.find('td').eq(12).text(orderTotalFloat);
            var updateOrderDrugStatus = row.find('td').eq(13).text(updateOrderStatusStatic);


            $('#updateOrder').modal('hide');

            bootbox.alert({
                message: "Drug Order Detail is Updated Successfully",
                title: "Process Result",
                backdrop: true
            });

        }
    });
    // Update Order Data End

    // Delete Order Data 
    $('#updateOrder').on('click', '#deleteOrderMButton', function (e) {

        var orderNo = $("#updateOrderNo").val();
        var drugCode = $("#updateDrugCode").val();

        var data = {
            orderNo: orderNo,
            drugCode: drugCode
        };

        console.log(data);

        $('#updateOrder').modal('hide');

        bootbox.confirm({
            message: "Are you sure want to delete this order ?",
            title: "Delete Item?",
            buttons: {
                confirm: {
                    label: 'Yes',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'No',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {

                if (result === true) {

                    $.ajax({
                        url: "patientOrderListNewOrderDelete.jsp",
                        type: "post",
                        data: data,
                        timeout: 10000, // 10 seconds
                        success: function (datas) {

                            if (datas.trim() === 'Success') {

                                $.ajax({
                                    url: "patientOrderListDetailsNew.jsp",
                                    type: "post",
                                    data: data,
                                    timeout: 3000,
                                    success: function (returnOrderDetailsTableHTML) {

                                        $('#patientOrderDetailsListTable').html(returnOrderDetailsTableHTML);

                                        bootbox.alert({
                                            message: "Drug Order is Deleted Successfully",
                                            title: "Process Result",
                                            backdrop: true
                                        });

                                        $('#patientOrderDetailsListTable').trigger('contentchanged');

                                    }
                                });

                            } else if (datas.trim() === 'Failed') {
                                bootbox.alert({
                                    message: "Drug Order Delete Failed",
                                    title: "Process Result",
                                    backdrop: true
                                });
                            }

                        },
                        error: function (err) {
                            alert("Error! Deletion Ajax failed!!");
                        }

                    });
                } else {
                    console.log("Process Is Canceled");
                }

            }
        });

    });
    // Delete Order Data End


//============================================================================  Update And Delete Part End  ===========================================================================//





//-------------------------------------------------------------------------------  Dispense Part Start  -------------------------------------------------------------------------------//


    // Dispense Order Data
    $('#patientOrderDetailContent').off('click', '#patientOrderDispenseButtonDiv #btnOrderDispense').on('click', '#patientOrderDispenseButtonDiv #btnOrderDispense', function (e) {

        e.preventDefault();

        var table = $("#patientOrderDetailsListTable tbody");

        var orderNo, drugCode, drugDesc, drugStrength, drugFrequency, drugDuration, drugDose,
                drugStockQty, drugOrderedQty, drugSuppliedQty, drugDispensedQty, drugPrice, drugTotalPrice, drugStatus, drugChecked;

        var cars = [];

        table.find('tr').each(function (i) {

            var $tds = $(this).find('td');

            // Get The Data
            orderNo = $tds.eq(0).text();
            drugCode = $tds.eq(1).text();
            drugDesc = $tds.eq(2).text();
            drugStrength = $tds.eq(3).text();
            drugFrequency = $tds.eq(4).text();
            drugDuration = $tds.eq(5).text();
            drugDose = $tds.eq(6).text();
            drugStockQty = $tds.eq(7).text();
            drugOrderedQty = $tds.eq(8).text();
            drugSuppliedQty = $tds.eq(9).text();
            drugDispensedQty = $tds.eq(10).text();
            drugPrice = $tds.eq(11).text();
            drugTotalPrice = $tds.eq(12).text();
            drugStatus = $tds.eq(13).text();
            drugChecked = $(this).find("#drugDispenseChecked").is(':checked');

            cars.push(drugChecked);

        });
        var checkedDispense = cars.indexOf(true);
        console.log(cars);
        console.log(checkedDispense);

        if (checkedDispense === -1) {
            bootbox.alert("Please Select A Order To Be Dispense");
        } else {

            bootbox.confirm({
                message: "Are you sure that you want to dispense this order ?",
                title: "Dispense Item ?",
                buttons: {
                    confirm: {
                        label: 'Yes',
                        className: 'btn-success'
                    },
                    cancel: {
                        label: 'No',
                        className: 'btn-danger'
                    }
                },
                callback: function (result) {

                    if (result === true) {

                        fullDispense();

                    } else {
                        console.log("Process Is Canceled");
                    }

                }
            });

        }

    });
    // Dispense Order Data End

    // Dispense Order Check Function Start
    function checkAll(ele) {
        var checkboxes = document.getElementsByTagName('input');
        if (ele.checked) {
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].type === 'checkbox') {
                    checkboxes[i].checked = true;
                }
            }
        } else {
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].type === 'checkbox') {
                    checkboxes[i].checked = false;
                }
            }
        }
    }
// Dispense Order Check Function End

    function fullDispense() {

        var table = $("#patientOrderDetailsListTable tbody");

        var orderNo, drugCode, drugDesc, drugStrength, drugFrequency, drugDuration, drugDose,
                drugStockQty, drugOrderedQty, drugSuppliedQty, drugDispensedQty, drugPrice, drugTotalPrice, drugStatus, drugChecked;

        var orderDate, locationCode, arrivalDate, pmino, pname, dispenseFarBillNo, dispenseFarMasterQuantity, dispenseFarMasterTotal, dispenseFarMasterQuantityChecked, dispenseFarMasterTotalChecked;



        pmino = $("#patientpmino").val();
        pname = $("#patientName").val();
        orderDate = $("#patientOrderDate").val();
        locationCode = $("#patientOrderLocationCode").val();
        arrivalDate = $("#patientOrderDate").val();
        dispenseFarBillNo = $("#dispenseFarBillNo").val();
        dispenseFarMasterQuantity = $("#dispenseTotalQuantity").val();
        dispenseFarMasterTotal = $("#dispenseGrandTotal").val();
        dispenseFarMasterQuantityChecked = $("#dispenseTotalQuantityChecked").val();
        dispenseFarMasterTotalChecked = $("#dispenseGrandTotalChecked").val();


        table.find('tr').each(function (i) {

            var $tds = $(this).find('td');

            // Get The Data
            orderNo = $tds.eq(0).text();
            drugCode = $tds.eq(1).text();
            drugDesc = $tds.eq(2).text();
            drugStrength = $tds.eq(3).text();
            drugFrequency = $tds.eq(4).text();
            drugDuration = $tds.eq(5).text();
            drugDose = $tds.eq(6).text();
            drugStockQty = $tds.eq(7).text();
            drugOrderedQty = $tds.eq(8).text();
            drugSuppliedQty = $tds.eq(9).text();
            drugDispensedQty = $tds.eq(10).text();
            drugPrice = $tds.eq(11).text();
            drugTotalPrice = $tds.eq(12).text();
            drugStatus = $tds.eq(13).text();
            drugChecked = $(this).find("#drugDispenseChecked").is(':checked');


            if (drugChecked === true) {

                console.log("Ok : " + drugCode);

                if (drugStatus === "New") {

                    if (parseInt(drugDispensedQty) >= parseInt(drugOrderedQty)) {
                        drugStatus = "4";
                    } else if (parseInt(drugDispensedQty) < parseInt(drugOrderedQty)) {
                        drugStatus = "1";
                    }

                } else if (drugStatus === "Partial") {

                    if ((parseInt(drugDispensedQty) + parseInt(drugSuppliedQty)) === parseInt(drugOrderedQty)) {
                        drugStatus = "4";
                    } else if ((parseInt(drugDispensedQty) + parseInt(drugSuppliedQty)) < parseInt(drugOrderedQty)) {
                        drugStatus = "1";
                    }

                } else if (drugStatus === "Complete Partial") {
                    drugStatus = "2";
                } else if (drugStatus === "Full Complete") {
                    drugStatus = "3";
                } else if (drugStatus === "Full") {
                    drugStatus = "4";
                }

                var updatedQtySupplied = String(parseInt(drugDispensedQty) + parseInt(drugSuppliedQty));
                var updateQtyStock = parseInt(drugStockQty) - parseInt(drugDispensedQty);


                var dataAjax = {
                    orderNo: orderNo,
                    drugCode: drugCode,
                    drugDesc: drugDesc,
                    drugPrice: drugPrice,
                    drugStockQty: updateQtyStock,
                    drugOrderedQty: drugOrderedQty,
                    drugSuppliedQty: updatedQtySupplied,
                    drugDispensedQty: drugDispensedQty,
                    drugStatus: drugStatus,
                    orderDate: orderDate,
                    locationCode: locationCode,
                    arrivalDate: arrivalDate,
                    pmino: pmino,
                    pname: pname,
                    drugTotalPrice: drugTotalPrice,
                    dispenseFarBillNo: dispenseFarBillNo,
                    dispenseDrugMasterQuantity: dispenseFarMasterQuantity,
                    dispenseDrugMasterTotal: dispenseFarMasterTotal,
                    dispenseDrugMasterQuantityChecked: dispenseFarMasterQuantityChecked,
                    dispenseDrugMasterTotalChecked: dispenseFarMasterTotalChecked,
                    drugChecked: drugChecked
                };

                console.log(dataAjax);

                $.ajax({
                    url: "patientOrderListDetailsDispenceOverall.jsp",
                    type: "post",
                    data: dataAjax,
                    timeout: 3000,
                    success: function (datas) {
                        console.log(datas);

                        $.ajax({
                            url: "patientOrderListDetailsDispenceFarTable.jsp",
                            type: "post",
                            data: dataAjax,
                            timeout: 3000,
                            success: function (datas) {
                                console.log(datas);

                            },
                            error: function (err) {
                                console.log("Error update!");
                            }

                        });

                    },
                    error: function (err) {
                        console.log("Error Dispense!" + err);
                    }
                });

            } else {
                console.log("Not Ok : " + drugCode);
            }

        });

        resetDispense();

    }

    // Grand Total Calculator Start
    !function calculateAllTotal() {

        // Getting Table
        var table = $("#patientOrderDetailsListTable tbody");

        // Setting Variable For Overall Dispense
        var drugPrice, drugDispensedQty, product;
        var drugTotalOrder = 0;
        var grandTotal = 0.0;
        var drugDispensedQtyTotal = 0.0;

        // Setting Variable For Selected Dispense
        var drugPriceChecked, drugDispensedQtyChecked, productChecked;
        var drugTotalOrderChecked = 0;
        var grandTotalDispenseChecked = 0.0;
        var drugDispensedQtyTotalChecked = 0.0;


        // Calculating Data For Overall Dispense
        table.find('tr').each(function (i) {

            var $tds = $(this).find('td');
            drugTotalOrder = drugTotalOrder + 1;
            drugPrice = parseFloat($tds.eq(11).text());
            drugDispensedQty = parseFloat($tds.eq(10).text());
            product = drugDispensedQty * drugPrice;

            grandTotal = grandTotal + product;
            drugDispensedQtyTotal = drugDispensedQtyTotal + drugDispensedQty;

        });

        // Calculating Data For Selected Dispense
        table.find('tr').each(function (i) {

            var drugChecked = $(this).find("#drugDispenseChecked").is(':checked');

            if (drugChecked === true) {

                var $tds = $(this).find('td');
                drugTotalOrderChecked = drugTotalOrderChecked + 1;
                drugPriceChecked = parseFloat($tds.eq(11).text());
                drugDispensedQtyChecked = parseFloat($tds.eq(10).text());
                productChecked = drugDispensedQtyChecked * drugPriceChecked;

                grandTotalDispenseChecked = grandTotalDispenseChecked + productChecked;
                drugDispensedQtyTotalChecked = drugDispensedQtyTotalChecked + drugDispensedQtyChecked;

            }
        });


        // Assigining Value For Overall Dispense
        $("#dispenseTotalOrder").val(drugTotalOrder);
        $("#dispenseTotalQuantity").val(drugDispensedQtyTotal);
        $("#dispenseGrandTotal").val(grandTotal.toFixed(2));

        // Assigining Value For Selected Dispense
        $("#dispenseTotalOrderChecked").val(drugTotalOrderChecked);
        $("#dispenseTotalQuantityChecked").val(drugDispensedQtyTotalChecked);
        $("#dispenseGrandTotalChecked").val(grandTotalDispenseChecked.toFixed(2));

        setTimeout(calculateAllTotal, 800);

    }();
    // Grand Total Calculator End

    // Grand Total Calculator Start
    $('#patientOrderDetailContent').off('click', '#patientOrderDispenseButtonDiv #btnOrderDispensePrescribe').on('click', '#patientOrderDispenseButtonDiv #btnOrderDispensePrescribe', function (e) {

        var table = $("#patientOrderDetailsListTable tbody");

        var orderNo, drugCode, drugDesc, drugStrength, drugFrequency, drugDuration, drugDose,
                drugStockQty, drugOrderedQty, drugSuppliedQty, drugDispensedQty, drugPrice, drugTotalPrice, drugStatus;

        var orderDate, locationCode, arrivalDate, pmino, name;

        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1; //January is 0!
        var yyyy = today.getFullYear();

        if (dd < 10) {
            dd = '0' + dd;
        }
        if (mm < 10) {
            mm = '0' + mm;
        }
        var today = dd + '/' + mm + '/' + yyyy;


        pmino = $("#patientpmino").val();
        orderDate = $("#patientOrderDate").val();
        locationCode = $("#patientOrderLocationCode").val();
        arrivalDate = $("#patientOrderDate").val();
        name = $("#patientName").val();

        table.find('tr').each(function (i) {

            var $tds = $(this).find('td');

            // Get The Data
            orderNo = $tds.eq(0).text();
            drugCode = $tds.eq(1).text();
            drugDesc = $tds.eq(2).text();
            drugStrength = $tds.eq(3).text();
            drugFrequency = $tds.eq(4).text();
            drugDuration = $tds.eq(5).text();
            drugDose = $tds.eq(6).text();
            drugStockQty = $tds.eq(7).text();
            drugOrderedQty = $tds.eq(8).text();
            drugSuppliedQty = $tds.eq(9).text();
            drugDispensedQty = $tds.eq(10).text();
            drugPrice = $tds.eq(11).text();
            drugTotalPrice = $tds.eq(12).text();
            drugStatus = $tds.eq(13).text();


            var dataAjax = {
                orderNo: orderNo,
                drugCode: drugCode,
                drugDesc: drugDesc,
                drugStrength: drugStrength,
                drugFrequency: drugFrequency,
                drugDuration: drugDuration,
                drugDose: drugDose,
                pmino: pmino,
                name: name,
                date: today
            };

            console.log(dataAjax);

        });

    });

//===============================================================================  Dispense Part End  ================================================================================//




//-------------------------------------------------------------------------------  Reset Part Start  --------------------------------------------------------------------------------//

    // Dispense Loading Part 
    // Hidding Loading Modal
//    $('#myModal').modal({
//        show: false
//    });

    // prevents closure while the ajax call is in progress
//    $('#myModal').on('hide.bs.modal', function (e) {
//        if (inProgess === true)
//            return false;
//    });

    var inProgess = false;

    // Dispense Loading Function 
    function loading()
    {
        inProgess = true;
        $('#myModal').modal('show');

        setTimeout(function () {
            inProgess = false;
            $('#myModal').modal('hide');

            bootbox.alert({
                message: "Dispense Order is Successfully",
                title: "Dispense Result",
                backdrop: true
            });
        }, 3000);
    }
    // Dispense Loading Part End


    // Dispense Reset Function  
    function resetDispense() {
        console.log("Ok Clean");

        loading();

        setTimeout(
                function () {
                    console.log("Inclean");

                    $.ajax({
                        url: "patientOrderListDetailsDispenceFarTableBillNoUpdate.jsp",
                        type: "post",
                        timeout: 3000,
                        success: function (data) {
                            console.log(data);

                            $.ajax({
                                url: "patientOrderListTable.jsp",
                                type: 'POST',
                                timeout: 3000,
                                success: function (data) {
                                    console.log(data);
                                    $("#patientOrderListContent").html(data);
                                }
                            });

                        }
                    });

                    document.getElementById("patientOrderDetailContentBasicInfoForm").reset();
                    document.getElementById("patientOrderDetailContentOrderInfoForm").reset();
                    $("#patientOrderDetailContent #patientAllergyListTableDiv").load("patientOrderListBasicInfoNew.jsp #patientAllergyListTableDiv");
                    $("#patientOrderDetailContent #patientDiagnosisListTableDiv").load("patientOrderListBasicInfoNew.jsp #patientDiagnosisListTableDiv");
                    $("#patientOrderDetailContent #patientOrderDetailsListTableDiv").load("patientOrderListBasicInfoNew.jsp #patientOrderDetailsListTableDiv");
                    $('.nav-tabs a[href="#tab_default_1"]').tab('show');
                }, 2000);

    }
    // Dispense Reset Function End


    // Reset Fields    
    $('#patientOrderDetailContent').on('click', '#btnClearOrderDetailDispense', function (e) {
        document.getElementById("patientOrderDetailContentBasicInfoForm").reset();
        document.getElementById("patientOrderDetailContentOrderInfoForm").reset();
        $("#patientOrderDetailContent #patientAllergyListTableDiv").load("patientOrderListBasicInfoNew.jsp #patientAllergyListTableDiv");
        $("#patientOrderDetailContent #patientDiagnosisListTableDiv").load("patientOrderListBasicInfoNew.jsp #patientDiagnosisListTableDiv");
        $("#patientOrderDetailContent #patientOrderDetailsListTableDiv").load("patientOrderListBasicInfoNew.jsp #patientOrderDetailsListTableDiv");
        $('.nav-tabs a[href="#tab_default_1"]').tab('show');
    });


//=================================================================================  Reset Part End  ==================================================================================//


</script>



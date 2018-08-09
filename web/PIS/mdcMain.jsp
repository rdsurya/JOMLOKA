<%-- 
    Document   : atcMain
    Created on : Jan 26, 2017, 9:59:32 AM
    Author     : Shammugam
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>


<%
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
%>


<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    DRUG CODE MANAGEMENT
    <span class="pull-right">
        <button class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#mdcAddModal" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD DRUG CODE</button>
        <button id="MDCClone_btnClone" class="btn btn-primary" data-status="pagado" data-toggle="modal" data-id="1" data-target="#mdcCloneModal" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items"><i class=" fa fa-copy" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>CLONE DRUG CODE</button>
        <button id="MDCClone_btnSummary" class="btn btn-danger" data-status="pagado" data-toggle="modal" data-id="1" data-target="#mdcSummaryModal" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items"><i class=" fa fa-file" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>DRUG INVENTORY SUMMARY</button>
    </span>
</h4>
<!-- Add Button End -->







<!-- Summary Modal Start -->
<div class="modal fade" id="mdcSummaryModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 70%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" id="lineModalLabel" align="center">Drug Inventory Summary</h2>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" autocomplete="off">
                    <div class="row">
                        <div class="col-md-6">
                            <br>
                            <div id="mdcDateSummary">

                            </div>
                        </div>
                        <br>
                        <div class="col-md-6">
                            <div id="mdcStockSummary">

                            </div>
                        </div>
                        <div class="col-md-12">
                            <div id="mdcATCSummary">

                            </div>
                        </div>
                        <br>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button class="btn btn-primary btn-block" type="button" id="MDC_btnSummaryClose" data-dismiss="modal"><i class=" fa fa-close"></i> Close</button>
            </div>
        </div>
    </div>
</div>
<!-- Summary Modal End -->   


<!-- Clone Modal Start -->
<div class="modal fade" id="mdcCloneModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 50%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" id="lineModalLabel" align="center">Clone Drug Code</h2>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form style="width: 100%; margin: 0 auto;" id="mdcClone_addForm" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group">


                        <div style="align-items: center; text-align: center">
                            <br>
                            <label>Select Drug To Be Cloned</label>
                            <br><br>
                            <span>
                                <a href="#" class="btn btn-default" id="MDC_Code_selectAll">&nbsp; Select all &nbsp;</a>
                                &nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;
                                <a href="#" class="btn btn-default" id="MDC_Code_deselectAll">Deselect all</a>
                            </span>
                            <br><br>
                            <div>
                                <select id="MDC_DrugCode" multiple="multiple"></select>
                            </div>    
                        </div>
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary btn-block" type="button" id="MDC_btnClone"><i class=" fa fa-check"></i> Clone</button>
            </div>
        </div>
    </div>
</div>
<!-- Clone Modal End -->   

<!-- Modal Add MTC Start -->
<div class="modal fade" id="mdcAddModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:95%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" id="lineModalLabel" align="center">Add New Drug Code</h2>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" autocomplete="off">
                    <div class="row">
                        <div class="col-md-4">

                            <h4>HFC Information</h4>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">HEALTH FACILITY CODE *</label>
                                <div class="col-md-8">
                                    <input id="addMDCHFC" name="textinput" type="text" class="form-control input-md" value="<%= hfc%>" readonly>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">DISCIPLINE CODE *</label>
                                <div class="col-md-8">
                                    <input id="addMDCDISCIPLINE" name="textinput" type="text" class="form-control input-md" value="<%= dis%>" readonly>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">SUB-DISCIPLINE CODE *</label>
                                <div class="col-md-8">
                                    <input id="addMDCSUBDISCIPLINE" name="textinput" type="text" class="form-control input-md" value="<%= sub%>" readonly>
                                </div>
                            </div>

                            <hr/>




                            <h4>Drug Information</h4>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Category Code *</label>
                                <div class="col-md-8">
                                    <input id="addUD_ATC_CODE" name="textinput" type="text" placeholder="Please Search Category Code" class="form-control input-md" maxlength="30" >
                                    <div id="addUD_ATC_CODESearch" class="search-drop">
                                        <!--for search area-->
                                    </div>
                                </div>
                            </div>


                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Drug Code *</label>
                                <div class="col-md-8">
                                    <input id="addUD_MDC_CODE" name="textinput" type="text" placeholder="Please Insert Drug Code" class="form-control input-md" maxlength="30" >
                                </div>
                            </div>



                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Product Name *</label>
                                <div class="col-md-8">
                                    <input id="addD_TRADE_NAME" name="textinput" type="text" placeholder="Please Insert Product Name" class="form-control input-md" maxlength="200">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Generic Name *</label>
                                <div class="col-md-8">
                                    <textarea id="addD_GNR_NAME" class="form-control" rows="2" maxlength="300" placeholder="Please Insert Generic Name"></textarea>
                                </div>
                            </div>


                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Supplier *</label>
                                <div class="col-md-8">
                                    <select id="addD_SupplierID" name="supplierDetails" class="form-control" >
                                        <option value="">Please Select Supplier</option>
                                        <%
                                            String sqlSupp = "SELECT vendor_id,vendor_name FROM fap_vendor where hfc_cd = '" + hfc + "' ";
                                            ArrayList<ArrayList<String>> listOfSup = conn.getData(sqlSupp);

                                            int sizeSup = listOfSup.size();

                                            for (int i = 0; i < sizeSup; i++) {
                                        %>
                                        <option value="<%= listOfSup.get(i).get(0)%>"><%= listOfSup.get(i).get(1)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>


                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Drug Route *</label>
                                <div class="col-md-8">
                                    <select id="addD_ROUTE_CODE" name="selectbasic" class="form-control">
                                        <option value="-" selected>Select Drug Route</option>
                                        <%
                                            String sql2 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0066' AND hfc_cd = '" + hfc + "' ";
                                            ArrayList<ArrayList<String>> listOfDRoute = conn.getData(sql2);

                                            int size2 = listOfDRoute.size();

                                            for (int i = 0; i < size2; i++) {
                                        %>
                                        <option value="<%= listOfDRoute.get(i).get(2)%>"><%= listOfDRoute.get(i).get(2)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>





                        </div>


                        <div class="col-md-4">


                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Dosage Form *</label>
                                <div class="col-md-8">
                                    <select id="addD_FORM_CODE" name="selectbasic" class="form-control">
                                        <option value="-" selected>Select Dosage Form</option>
                                        <%
                                            String sql3 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0067' AND hfc_cd = '" + hfc + "' ";
                                            ArrayList<ArrayList<String>> listOfDForm = conn.getData(sql3);

                                            int size3 = listOfDForm.size();

                                            for (int i = 0; i < size3; i++) {
                                        %>
                                        <option value="<%= listOfDForm.get(i).get(2)%>"> <%= listOfDForm.get(i).get(2)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>


                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Strength *</label>
                                <div class="col-md-8">
                                    <input id="addD_STRENGTH" name="textinput" type="text" placeholder="Please Insert Drug Strength" class="form-control input-md" maxlength="20">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Stock Quantity *</label>
                                <div class="col-md-8">
                                    <input id="addD_STOCK_QTY" name="textinput" type="text" placeholder="Please Insert Stock Qty" class="form-control input-md singleNumbersOnly" maxlength="10">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Minimum Quantity *</label>
                                <div class="col-md-8">
                                    <input id="addD_MINIMUM_QTY" name="textinput" type="text" placeholder="Please Insert Minimum Qty" class="form-control input-md singleNumbersOnly" maxlength="10">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Maximum Quantity *</label>
                                <div class="col-md-8">
                                    <input id="addD_MAXIMUM_QTY" name="textinput" type="text" placeholder="Please Insert Maximum Qty" class="form-control input-md singleNumbersOnly" maxlength="10">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Reorder Quantity *</label>
                                <div class="col-md-8">
                                    <input id="addD_REORDER_QTY" name="textinput" type="text" placeholder="Please Insert Reorder Qty" class="form-control input-md singleNumbersOnly" maxlength="10">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Location Code *</label>
                                <div class="col-md-8">
                                    <input id="addD_LOCATION_CODE" name="textinput" type="text" placeholder="Please Insert Location Code" class="form-control input-md" maxlength="10">
                                </div>
                            </div>


                            <hr/>




                            <h4>Purchase</h4>



                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Packaging *</label>
                                <div class="col-md-4">
                                    <input id="addD_PACKAGING" name="addD_PACKAGING" type="text" placeholder="Please Insert Packaging" class="form-control input-md singleNumbersOnly" maxlength="2">
                                </div>
                                <div class="col-md-4">
                                    <select id="addD_PACKAGINGT" name="addD_PACKAGINGT" class="form-control">
                                        <option value="-" selected>No Packaging</option>
                                        <%
                                            String sql9 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0107' AND hfc_cd = '" + hfc + "' ";
                                            ArrayList<ArrayList<String>> listOfPack = conn.getData(sql9);

                                            int size9 = listOfPack.size();

                                            for (int i = 0; i < size9; i++) {
                                        %>
                                        <option value="<%= listOfPack.get(i).get(2)%>"><%= listOfPack.get(i).get(2)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Price per Pack *</label>
                                <div class="col-md-8">
                                    <input id="addD_PRICE_PPACK" name="textinput" type="text" placeholder="Please Insert Price per Pack" class="form-control input-md decimalNumbersOnly" maxlength="9">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Purchase Price *</label>
                                <div class="col-md-8">
                                    <input id="addD_COST_PRICE" name="textinput" type="text" placeholder="Please Insert Purchase Price" class="form-control input-md decimalNumbersOnly" maxlength="9">
                                </div>
                            </div>

                        </div>





                        <div class="col-md-4">


                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Sell Price *</label>
                                <div class="col-md-8">
                                    <input id="addD_SELL_PRICE" name="textinput" type="text" placeholder="Please Insert Sell Price" class="form-control input-md decimalNumbersOnly" maxlength="9">
                                </div>
                            </div>


                            <hr/>


                            <h4>Label Information</h4>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Dose *</label>
                                <div class="col-md-4">
                                    <input id="addD_QTY" name="textinput" type="text" placeholder="Please Insert Dosage" class="form-control input-md singleNumbersOnly" maxlength="2">
                                </div>
                                <div class="col-md-4">
                                    <select id="addD_QTYT" name="addD_QTYT" class="form-control">
                                        <option value="-" selected>No Dose</option>
                                        <%
                                            String sql4 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0025' AND hfc_cd = '" + hfc + "' ";
                                            ArrayList<ArrayList<String>> listOfDUOM = conn.getData(sql4);

                                            int size4 = listOfDUOM.size();

                                            for (int i = 0; i < size4; i++) {
                                        %>
                                        <option value="<%= listOfDUOM.get(i).get(2)%>"><%= listOfDUOM.get(i).get(2)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Frequency *</label>
                                <div class="col-md-8">
                                    <select id="addD_FREQUENCY" name="addD_FREQUENCY" class="form-control" >
                                        <option value="-" selected>No Frequency</option>
                                        <%
                                            String sql5 = "SELECT frequency_code,frequency_desc,frequency_value FROM pis_drug_frequency where hfc_cd = '" + hfc + "' AND discipline_cd = '" + dis + "' ";
                                            ArrayList<ArrayList<String>> listOfDFreq = conn.getData(sql5);

                                            int size5 = listOfDFreq.size();

                                            for (int i = 0; i < size5; i++) {
                                        %>
                                        <option value="<%= listOfDFreq.get(i).get(1)%>"><%= listOfDFreq.get(i).get(1)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Duration *</label>
                                <div class="col-md-4">
                                    <input id="addD_DURATION" name="textinput" type="text" class="form-control input-md singleNumbersOnly" placeholder="Please Insert Duration" maxlength="2">
                                </div>
                                <div class="col-md-4">
                                    <select id="addD_DURATIONT" name="addD_DURATIONT" class="form-control">
                                        <option value="-" selected>No Duration</option>
                                        <%
                                            String sql6 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0089'  AND hfc_cd = '" + hfc + "' ";
                                            ArrayList<ArrayList<String>> listOfDDura = conn.getData(sql6);

                                            int size6 = listOfDDura.size();

                                            for (int i = 0; i < size6; i++) {
                                        %>
                                        <option value="<%= listOfDDura.get(i).get(2)%>"><%= listOfDDura.get(i).get(2)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Instruction *</label>
                                <div class="col-md-8">
                                    <select id="addD_ADVISORY_CODE" name="addD_ADVISORY_CODE" class="form-control">
                                        <option value="-" selected>No Instruction</option>
                                        <%
                                            String sql7 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0087' AND  hfc_cd = '" + hfc + "' ";
                                            ArrayList<ArrayList<String>> listOfDInst = conn.getData(sql7);

                                            int size7 = listOfDInst.size();

                                            for (int i = 0; i < size7; i++) {
                                        %>
                                        <option value="<%= listOfDInst.get(i).get(2)%>"><%= listOfDInst.get(i).get(2)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Cautionary *</label>
                                <div class="col-md-8">
                                    <textarea id="addD_CAUTIONARY_CODE" class="form-control" rows="2" placeholder="Please Insert Drug Cautionary" maxlength="200"></textarea>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Expire Date *</label>
                                <div class="col-md-8">
                                    <input id="addD_EXP_DATE" name="addD_EXP_DATE" type="text"class="form-control input-md" placeholder="Select Expire Date" readonly>
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Classification *</label>
                                <div class="col-md-8">
                                    <select id="addD_CLASSIFICATION" name="addD_CLASSIFICATION" class="form-control">
                                        <option value="-" selected>No Classification</option>
                                        <%
                                            String sql8 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0091' AND  hfc_cd = '" + hfc + "' ";
                                            ArrayList<ArrayList<String>> listOfDClass = conn.getData(sql8);

                                            int size8 = listOfDClass.size();

                                            for (int i = 0; i < size8; i++) {
                                        %>
                                        <option value="<%= listOfDClass.get(i).get(2)%>"><%= listOfDClass.get(i).get(2)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Select Status *</label>
                                <div class="col-md-8">
                                    <select id="addSTATUS" name="addSTATUS" class="form-control">
                                        <option value="-" disabled>No Status</option>
                                        <option value="1" selected>Active</option>
                                        <option value="0">Inactive</option>     
                                    </select>
                                </div>
                            </div>



                        </div>
                    </div>
                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" id="addMDCButton" class="btn btn-success btn-block btn-lg" role="button">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="addMDCReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal Add MTC End -->
<!-- Add Part End -->


<script>

    $(document).ready(function () {

        $('#mdcAddModal').css('overflow', 'auto');


        // Date Picker For Insert
        $("#addD_EXP_DATE").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy',
            minDate: '0'
        });

        $('.decimalNumbersOnly').keyup(function () {
            if (this.value !== this.value.replace(/[^0-9\.]/g, '')) {
                this.value = this.value.replace(/[^0-9\.]/g, '');
            }
        });


        $('.singleNumbersOnly').keyup(function () {
            if (this.value !== this.value.replace(/[^0-9]/g, '')) {
                this.value = this.value.replace(/[^0-9]/g, '');
            }
        });

        // Reset Function Start
        function reset() {

            console.log("In reset");

            document.getElementById("addUD_MDC_CODE").value = "";

            document.getElementById("addUD_ATC_CODE").value = "";
            $('#addUD_ATC_CODESearch').text('');

            document.getElementById("addD_TRADE_NAME").value = "";
            document.getElementById("addD_GNR_NAME").value = "";
            document.getElementById("addD_ROUTE_CODE").value = "-";
            document.getElementById("addD_FORM_CODE").value = "-";
            document.getElementById("addD_STRENGTH").value = "";
            document.getElementById("addD_STOCK_QTY").value = "";
            document.getElementById("addD_MINIMUM_QTY").value = "";
            document.getElementById("addD_MAXIMUM_QTY").value = "";
            document.getElementById("addD_REORDER_QTY").value = "";
            document.getElementById("addD_LOCATION_CODE").value = "";
            document.getElementById("addSTATUS").value = "-";

            document.getElementById("addD_PACKAGING").value = "";
            document.getElementById("addD_PACKAGINGT").value = "-";
            document.getElementById("addD_PRICE_PPACK").value = "";
            document.getElementById("addD_COST_PRICE").value = "";
            document.getElementById("addD_SELL_PRICE").value = "";
            document.getElementById("addD_QTY").value = "";
            document.getElementById("addD_QTYT").value = "-";
            document.getElementById("addD_FREQUENCY").value = "-";
            document.getElementById("addD_DURATION").value = "";
            document.getElementById("addD_DURATIONT").value = "-";
            document.getElementById("addD_ADVISORY_CODE").value = "-";
            document.getElementById("addD_CAUTIONARY_CODE").value = "";
            document.getElementById("addD_EXP_DATE").value = "";
            document.getElementById("addD_SupplierID").value = "";

        }
        // Reset Function End


        // Reset Button Start
        $('#addMDCReset').on('click', function () {
            reset();
        });
        // Reset Button End


        // Search MDC Function Start
        $("#addUD_ATC_CODE").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value

            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#addUD_ATC_CODESearch').html('<img src="libraries/LoaderIcon.gif"  />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "controllerSearch/mdcSearchATC.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#addUD_ATC_CODESearch').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListATC li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#addUD_ATC_CODE').val($(this).text());
                            $('#addUD_ATC_CODESearch').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#addUD_ATC_CODE').val().split("|");
                            console.log(arrayData);
                            console.log(arrayData[0].trim());
                            console.log(arrayData[1].trim());
                        });
                    },
                    error: function () { // if error
                        $('#addUD_ATC_CODESearch').text('Problem!');
                    }
                });
            } else {
                $('#addUD_ATC_CODESearch').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });
        // Search MDC Function End


        // Add MDC Function Start
        $('#addMDCButton').on('click', function () {

            console.log("In add");

            var UD_MDC_CODECheck = document.getElementById("addUD_MDC_CODE");
            var UD_ATC_CODECheck = document.getElementById("addUD_ATC_CODE");
            var D_TRADE_NAMECheck = document.getElementById("addD_TRADE_NAME");
            var D_GNR_NAMECheck = document.getElementById("addD_GNR_NAME");
            var D_STRENGTHCheck = document.getElementById("addD_STRENGTH");
            var D_STOCK_QTYCheck = document.getElementById("addD_STOCK_QTY");
            var D_MINIMUM_QTYCheck = document.getElementById("addD_MINIMUM_QTY");
            var D_MAXIMUM_QTYCheck = document.getElementById("addD_MAXIMUM_QTY");
            var D_REORDER_QTYCheck = document.getElementById("addD_REORDER_QTY");
            var D_LOCATION_CODECheck = document.getElementById("addD_LOCATION_CODE");
            var D_PACKAGINGCheck = document.getElementById("addD_PACKAGING");
            var D_PRICE_PPACKCheck = document.getElementById("addD_PRICE_PPACK");
            var D_COST_PRICECheck = document.getElementById("addD_COST_PRICE");
            var D_SELL_PRICECheck = document.getElementById("addD_SELL_PRICE");
            var D_QTYCheck = document.getElementById("addD_QTY");
            var D_DURATIONCheck = document.getElementById("addD_DURATION");
            var D_CAUTIONARY_CODECheck = document.getElementById("addD_CAUTIONARY_CODE");


            var UD_MDC_CODE = document.getElementById("addUD_MDC_CODE").value;
            var UD_ATC_CODE = document.getElementById("addUD_ATC_CODE").value;
            var D_TRADE_NAME = document.getElementById("addD_TRADE_NAME").value;
            var D_GNR_NAME = document.getElementById("addD_GNR_NAME").value;
            var D_ROUTE_CODE = document.getElementById("addD_ROUTE_CODE").value;
            var D_FORM_CODE = document.getElementById("addD_FORM_CODE").value;
            var D_STRENGTH = document.getElementById("addD_STRENGTH").value;
            var D_STOCK_QTY = document.getElementById("addD_STOCK_QTY").value;
            var D_MINIMUM_QTY = document.getElementById("addD_MINIMUM_QTY").value;
            var D_MAXIMUM_QTY = document.getElementById("addD_MAXIMUM_QTY").value;
            var D_REORDER_QTY = document.getElementById("addD_REORDER_QTY").value;
            var D_LOCATION_CODE = document.getElementById("addD_LOCATION_CODE").value;
            var STATUS = document.getElementById("addSTATUS").value;

            var D_PACKAGING = document.getElementById("addD_PACKAGING").value;
            var D_PACKAGINGT = document.getElementById("addD_PACKAGINGT").value;
            var D_PRICE_PPACK = document.getElementById("addD_PRICE_PPACK").value;
            var D_COST_PRICE = document.getElementById("addD_COST_PRICE").value;
            var D_SELL_PRICE = document.getElementById("addD_SELL_PRICE").value;
            var D_QTY = document.getElementById("addD_QTY").value;
            var D_QTYT = document.getElementById("addD_QTYT").value;
            var D_FREQUENCY = document.getElementById("addD_FREQUENCY").value;
            var D_DURATION = document.getElementById("addD_DURATION").value;
            var D_DURATIONT = document.getElementById("addD_DURATIONT").value;
            var D_ADVISORY_CODE = document.getElementById("addD_ADVISORY_CODE").value;
            var D_CAUTIONARY_CODE = document.getElementById("addD_CAUTIONARY_CODE").value;
            var D_EXP_DATE = document.getElementById("addD_EXP_DATE").value;
            var D_CLASSIFICATION = document.getElementById("addD_CLASSIFICATION").value;
            var D_SUPPLIER_ID = document.getElementById("addD_SupplierID").value;

            var strCom = D_CAUTIONARY_CODE.replace(/'/g, '\\\'');
            D_CAUTIONARY_CODE = strCom;

            var newCostPrice = parseFloat(D_COST_PRICE).toFixed(2);
            var newSellPrice = parseFloat(D_SELL_PRICE).toFixed(2);
            var newPackPrice = parseFloat(D_PRICE_PPACK).toFixed(2);

            D_COST_PRICE = newCostPrice;
            D_SELL_PRICE = newSellPrice;
            D_PRICE_PPACK = newPackPrice;

            var sDate = D_EXP_DATE.split('/');
            var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

            D_EXP_DATE = newDate + " 00:00:00";

            if (UD_MDC_CODE === "") {
                bootbox.alert("Please Insert Drug Code");
            } else if (UD_ATC_CODE === "") {
                bootbox.alert("Please Search Any Category Code");
            } else if (D_TRADE_NAME === "") {
                bootbox.alert("Please Insert Drug Trade Name");
            } else if (D_GNR_NAME === "") {
                bootbox.alert("Please Insert Drug Generic Name");
            } else if (D_ROUTE_CODE === "-") {
                bootbox.alert("Select Any Route");
            } else if (D_FORM_CODE === "-") {
                bootbox.alert("Select Any Form");
            } else if (D_STRENGTH === "") {
                bootbox.alert("Please Insert Drug Strength");
            } else if (D_STOCK_QTY === "") {
                bootbox.alert("Please Insert Drug Stock Quantity");
            } else if (D_MINIMUM_QTY === "") {
                bootbox.alert("Please Insert Drug Minimum Quantity");
            } else if (D_MAXIMUM_QTY === "") {
                bootbox.alert("Please Insert Drug Maximum Quantity");
            } else if (D_REORDER_QTY === "") {
                bootbox.alert("Please Insert Drug Reorder Quantity");
            } else if (D_LOCATION_CODE === "") {
                bootbox.alert("Please Insert Drug Location Code");
            } else if (STATUS === "-") {
                bootbox.alert("Select Any Status");

            } else if (D_PACKAGING === "") {
                bootbox.alert("Please Insert Drug Packaging");
            } else if (D_PACKAGINGT === "-") {
                bootbox.alert("Please Select Drug Packaging Type");
            } else if (D_PRICE_PPACK === "") {
                bootbox.alert("Please Insert Drug Per Pack Price");
            } else if (D_COST_PRICE === "") {
                bootbox.alert("Please Insert Drug Cost Price");
            } else if (D_SELL_PRICE === "") {
                bootbox.alert("Please Insert Drug Sell Price");
            } else if (D_QTY === "") {
                bootbox.alert("Please Insert Drug Quantity");
            } else if (D_QTYT === "-") {
                bootbox.alert("Select Any Dose");
            } else if (D_FREQUENCY === "-") {
                bootbox.alert("Select Any Frequency");
            } else if (D_DURATION === "") {
                bootbox.alert("Please Insert Drug Duration");
            } else if (D_DURATIONT === "-") {
                bootbox.alert("Select Any Duration");
            } else if (D_ADVISORY_CODE === "-") {
                bootbox.alert("Select Any Instruction");
            } else if (D_CAUTIONARY_CODE === "") {
                bootbox.alert("Please Insert Drug Cautionary Code");
            } else if (D_EXP_DATE === "") {
                bootbox.alert("Please Insert Drug Expire Date");
            } else if (D_CLASSIFICATION === "-") {
                bootbox.alert("Select Any Classification");
            } else if (D_SUPPLIER_ID === "") {
                bootbox.alert("Select Any Supplier");

            } else if (UD_MDC_CODECheck.checkValidity() === false) {
                bootbox.alert("Please Insert Drug Code Not More Than 30 Characters");
            } else if (UD_ATC_CODECheck.checkValidity() === false) {
                bootbox.alert("Please Insert Category Code Not More Than 30 Characters");
            } else if (D_TRADE_NAMECheck.checkValidity() === false) {
                bootbox.alert("Please Insert Drug Trade Name Not More Than 200 Characters");
            } else if (D_GNR_NAMECheck.checkValidity() === false) {
                bootbox.alert("Please Insert Drug Generic Name Not More Than 300 Characters");
            } else if (D_STRENGTHCheck.checkValidity() === false) {
                bootbox.alert("Please Insert Drug Strength Not More Than 20 Characters");
            } else if (D_STOCK_QTYCheck.checkValidity() === false) {
                bootbox.alert("Please Insert Drug Stock Not More Than 10 Characters");
            } else if (D_MINIMUM_QTYCheck.checkValidity() === false) {
                bootbox.alert("Please Insert Drug Minimum Level Not More Than 10 Characters");
            } else if (D_MAXIMUM_QTYCheck.checkValidity() === false) {
                bootbox.alert("Please Insert Drug Maximum Level Not More Than 10 Characters");
            } else if (D_REORDER_QTYCheck.checkValidity() === false) {
                bootbox.alert("Please Insert Drug Reorder Level Not More Than 10 Characters");
            } else if (D_LOCATION_CODECheck.checkValidity() === false) {
                bootbox.alert("Please Insert Drug Location Not More Than 10 Characters");
            } else if (D_PACKAGINGCheck.checkValidity() === false) {
                bootbox.alert("Please Insert Drug Packaging Not More Than 2 Number");
            } else if (D_PRICE_PPACKCheck.checkValidity() === false) {
                bootbox.alert("Please Insert Drug Per Pack Price Not More Than 9 Number In Decimal Form");
            } else if (D_COST_PRICECheck.checkValidity() === false) {
                bootbox.alert("Please Insert Drug Cost Price Not More Than 9 Number In Decimal Form");
            } else if (D_SELL_PRICECheck.checkValidity() === false) {
                bootbox.alert("Please Insert Drug Sell Price Not More Than 9 Number In Decimal Form");
            } else if (D_QTYCheck.checkValidity() === false) {
                bootbox.alert("Please Insert Drug Dose Not More Than 2 Number");
            } else if (D_DURATIONCheck.checkValidity() === false) {
                bootbox.alert("Please Insert Drug Duration Not More Than 2 Number");
            } else if (D_CAUTIONARY_CODECheck.checkValidity() === false) {
                bootbox.alert("Please Insert Drug Cautionary Not More Than 200 Characters");

            } else {

                var arrayDataATC = $('#addUD_ATC_CODE').val().split("|");
                UD_ATC_CODE = arrayDataATC[0].trim();

                var data = {
                    UD_MDC_CODE: UD_MDC_CODE,
                    UD_ATC_CODE: UD_ATC_CODE,
                    D_TRADE_NAME: D_TRADE_NAME,
                    D_GNR_NAME: D_GNR_NAME,
                    D_ROUTE_CODE: D_ROUTE_CODE,
                    D_FORM_CODE: D_FORM_CODE,
                    D_STRENGTH: D_STRENGTH,
                    D_STOCK_QTY: D_STOCK_QTY,
                    D_MINIMUM_QTY: D_MINIMUM_QTY,
                    D_MAXIMUM_QTY: D_MAXIMUM_QTY,
                    D_REORDER_QTY: D_REORDER_QTY,
                    D_LOCATION_CODE: D_LOCATION_CODE,
                    STATUS: STATUS,
                    D_PACKAGING: D_PACKAGING,
                    D_PACKAGINGT: D_PACKAGINGT,
                    D_PRICE_PPACK: D_PRICE_PPACK,
                    D_COST_PRICE: D_COST_PRICE,
                    D_SELL_PRICE: D_SELL_PRICE,
                    D_QTY: D_QTY,
                    D_QTYT: D_QTYT,
                    D_FREQUENCY: D_FREQUENCY,
                    D_DURATION: D_DURATION,
                    D_DURATIONT: D_DURATIONT,
                    D_ADVISORY_CODE: D_ADVISORY_CODE,
                    D_CAUTIONARY_CODE: D_CAUTIONARY_CODE,
                    D_EXP_DATE: D_EXP_DATE,
                    D_CLASSIFICATION: D_CLASSIFICATION,
                    D_SUPPLIER_ID: D_SUPPLIER_ID
                };
                console.log(data);

                $.ajax({
                    url: "controllerProcess/mdcInsert.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $('#contentMDCTable').load('mdcTableLoop.jsp');
                            $('#mdcAddModal').modal('hide');
                            bootbox.alert({
                                message: "Drug Code is Added Successful",
                                title: "Process Result",
                                backdrop: true
                            });
                            reset();

                        } else if (datas.trim() === 'Duplicate') {

                            bootbox.alert({
                                message: "Drug Code Duplication Detected. Please use diffrerent Drug code",
                                title: "Process Result",
                                backdrop: true
                            });

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert({
                                message: "Drug Code Add Failed",
                                title: "Process Result",
                                backdrop: true
                            });
                            $('#mdcAddModal').modal('hide');
                            reset();

                        }

                    },
                    error: function (err) {
                        console.log("Ajax Is Not Success");
                    }

                });
            }

        });
        // Add MDC Function End


        // Clone MDC Function Start

        var User_hfcCode = "<%= hfc%>";
        var User_disCode = "<%= dis%>";


        // Clone MDC Button Click Function Start
        $('#MDCClone_btnClone').on('click', function () {
            MDCCloneReset();
            createMDCCodeList();
        });
        // Clone MDC Button Click Function End


        // Clone MDC Reset Function Start
        function MDCCloneReset() {
            document.getElementById("mdcClone_addForm").reset();
        }
        // Clone MDC Reset Function End


        // Clone MDC Create List Function Start
        function createMDCCodeList() {

            var data = {
                hfc: User_hfcCode,
                dis: User_disCode
            };

            $('#MDC_DrugCode').multiSelect('destroy');
            $('<div class="loading">Loading</div>').appendTo('#mdcCloneModal');

            $.ajax({
                type: 'POST',
                url: "controllerSearch/mdcCloneDrugList.jsp",
                data: data,
                success: function (data, textStatus, jqXHR) {

                    $('#MDC_DrugCode').html(data);
                    $('#MDC_DrugCode').multiSelect({
                        selectableHeader: "<div style='display:block; color:white; background-color:#2196f3; '>Selectable Drug Code</div>",
                        selectionHeader: "<div style='display:block; color:white; background-color:#2196f3'>Selected Drug Code</div>",
                        keepOrder: true
                    });

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    bootbox.alert("Opps! " + errorThrown);
                },
                complete: function (jqXHR, textStatus) {
                    $('.loading').hide();
                }
            });

        }
        // Clone MDC Create List Function End


        // Clone MDC Clone Function Start
        $('#MDC_btnClone').on('click', function () {

            var arraySelect = [];
            $("#MDC_DrugCode option:selected").each(function () {
                arraySelect.push($(this));
            });

            var strMDCClone = arraySelect.map(function (elem) {
                return elem.val();
            }).join("|");

            console.log(strMDCClone);

            if (strMDCClone === "") {
                bootbox.alert("Select at least one drug to be cloned");
            } else {
                $('<div class="loading">Loading</div>').appendTo('#mdcCloneModal');

                var data = {
                    strMDCClone: strMDCClone
                };

                $.ajax({
                    url: "controllerProcess/mdcCloneDrugListInsert.jsp",
                    type: "post",
                    data: data,
                    timeout: 15000,
                    success: function (datas) {
                        console.log(datas.trim());
                        if (datas.trim() === 'Success') {

                            $("#contentMDCTable").load("mdcTableLoop.jsp");
                            $('#mdcCloneModal').modal('hide');

                            bootbox.alert({
                                message: "Drug is successfully cloned",
                                title: "Process Result",
                                backdrop: true
                            });
                            MDCCloneReset();

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert("Insertion failed!");
                            MDCCloneReset();

                        } else {

                            bootbox.alert(datas.trim());
                            $('#MDC_DrugCode').val("");

                        }

                    },
                    error: function (err) {
                        console.log("Ajax Is Not Success");
                    },
                    complete: function (jqXHR, textStatus) {
                        $('.loading').hide();
                    }

                });
            }

        });
        // Clone MDC Clone Function End


        // Clone MDC Select All Function Start
        $('#MDC_Code_selectAll').on('click', function (e) {
            e.preventDefault();
            $('#MDC_DrugCode').multiSelect('select_all');
            return false;
        });
        // Clone MDC Select All Function End


        // Clone MDC Un-Select All Function Start
        $('#MDC_Code_deselectAll').on('click', function (e) {
            e.preventDefault();
            $('#MDC_DrugCode').multiSelect('deselect_all');
            return false;
        });
        // Clone MDC Un-Select All Function End

        // Clone MDC Function End



        // Summary MDC Function Start

        // Summary MDC Button Function Start
        $('#MDCClone_btnSummary').on('click', function () {
            createMDCSummaryStock();
            createMDCSummaryDate();
            createMDCSummaryATC();
        });
        // Summary MDC Button Function End

        // Summary MDC Date Function Start
        function createMDCSummaryDate() {

            $.ajax({
                type: 'GET',
                url: "controllerProcess/mdcDummaryDrugDate.jsp",
                success: function (data, textStatus, jqXHR) {
                    $('#mdcDateSummary').html(data);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    bootbox.alert("Opps! " + errorThrown);
                },
                complete: function (jqXHR, textStatus) {
                    $('.loading').hide();
                }
            });

        }
        // Summary MDC Date Function End


        // Summary MDC Stock Function Start
        function createMDCSummaryStock() {

            $.ajax({
                type: 'GET',
                url: "controllerProcess/mdcDummaryDrugStock.jsp",
                success: function (data, textStatus, jqXHR) {
                    $('#mdcStockSummary').html(data);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    bootbox.alert("Opps! " + errorThrown);
                },
                complete: function (jqXHR, textStatus) {
                    $('.loading').hide();
                }
            });

        }
        // Summary MDC Stock Function Start


        // Summary MDC Stock Function Start
        function createMDCSummaryATC() {

            $.ajax({
                type: 'GET',
                url: "controllerProcess/mdcDummaryDrugATC.jsp",
                success: function (data, textStatus, jqXHR) {
                    $('#mdcATCSummary').html(data);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    bootbox.alert("Opps! " + errorThrown);
                },
                complete: function (jqXHR, textStatus) {
                    $('.loading').hide();
                }
            });

        }
        // Summary MDC Stock Function Start

    });

</script>


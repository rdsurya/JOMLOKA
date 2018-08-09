<%-- 
    Document   : patientOrderList
    Created on : Feb 6, 2017, 4:33:22 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>

<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>

<%    Config.getFile_url(session);
    Config.getBase_url(request);

    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- header -->
        <%@include file = "libraries/pharmacyHeadLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>
        <!-- header -->
    </head>

    <body>

        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->	
                <%@include file = "libraries/pharmacySideMenus.jsp" %>
                <!-- menu side -->	
                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file = "libraries/pharmacyTopMenus.jsp" %>
                    <!-- menu top -->
                    <div class="row">
                        <div class="col-md-12">
                            <div  class="thumbnail">


                                <!-- Tab Menu -->
                                <div class="tabbable-panel">
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs ">
                                            <li class="active">
                                                <a href="#tab_default_1" data-toggle="tab">
                                                    DRUG ORDER LIST</a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_2" data-toggle="tab">
                                                    DRUG ORDER DETAIL</a>
                                            </li>
                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_default_1">

                                                <div id="patientOrderListMain">

                                                </div>
                                                <div id="patientOrderListContent">

                                                </div>
                                            </div>

                                            <div class="tab-pane" id="tab_default_2">
                                                <div id="patientOrderDetailContent">

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <!-- Tab Menu -->

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- main -->		

        </div>


        <!-- Update Dispense Start -->
        <div class="modal fade" id="updateOrder" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                        <h3 class="modal-title" id="lineModalLabel">Update Order Detail</h3>
                    </div>
                    <div class="modal-body">

                        <!-- content goes here -->
                        <form class="form-horizontal" id="addForm" autocomplete="off">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Order No</label>
                                <div class="col-md-8">
                                    <input id="updateOrderNo" name="updateOrderNo" type="text" placeholder="Order No" class="form-control input-md" maxlength="15" readonly>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Drug Code</label>
                                <div class="col-md-8">
                                    <input id="updateDrugCode" name="updateDrugCode" type="text" placeholder="Drug Code" class="form-control input-md" maxlength="15" readonly>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Stock Quantity</label>
                                <div class="col-md-8">
                                    <input id="updateStockQuantity" name="updateStockQuantity" type="text" placeholder="Ordered Drug Quantity" class="form-control input-md" maxlength="50" readonly>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Ordered Drug Quantity</label>
                                <div class="col-md-8">
                                    <input id="updateOrderedDrugQuantity" name="updateOrderedDrugQuantity" type="text" placeholder="Ordered Drug Quantity" class="form-control input-md" maxlength="50" readonly>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Supplied Drug Quantity</label>
                                <div class="col-md-8">
                                    <input id="updateSuppliedDrugQuantity" name="updateSuppliedDrugQuantity" type="number" placeholder="Supplied Drug Quantity" class="form-control input-md" maxlength="50" readonly>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Dispensed Drug Quantity</label>
                                <div class="col-md-8">
                                    <input id="updateDispensedDrugQuantity" name="updateDispensedDrugQuantity" type="number" placeholder="Dispensed Drug Quantity" class="form-control input-md" maxlength="50" required>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Comment</label>
                                <div class="col-md-8">
                                    <input id="updateOrderComment" name="updateOrderComment" type="text" placeholder="Order Comment" class="form-control input-md" maxlength="200" required>
                                </div>
                            </div>


                            <!-- Select input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Status</label>
                                <div class="col-md-8">
                                    <select class="form-control" name="tstatus" id="updatestatus">
                                        <option value="New" selected="selected">-- Select Order Status --</option>
                                        <option value="Partial" >Partial</option>
                                        <option value="Complete Partial" >Complete Partial</option>
                                        <option value="Full Complete" >Full Complete</option>
                                        <option value="Full" >Full</option>
                                    </select>
                                </div>
                            </div>


                        </form>
                        <!-- content goes here -->
                    </div>
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="updateOrderMButton">Update</button>
                            </div>
                            <div class="btn-group" role="group">
                                <button type="submit" class="btn btn-danger btn-block btn-lg" role="button" id="deleteOrderMButton" >Delete</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Update Dispense End -->                         


        <!-- Add Modal Start -->
        <div class="modal fade" id="addOrderDrug" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog" style="width:63%;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                        <h3 class="modal-title" id="lineModalLabel">Add New Order</h3>
                    </div>
                    <div class="modal-body">

                        <!-- content goes here -->

                        <form class="form-horizontal" id="addDrugOrderForm" autocomplete="off">
                            <div class="row">
                                <div class="col-md-6">

                                    <h4>Order Details</h4>
                                    <hr/>
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="textinput">Drug Order ID</label>
                                        <div class="col-md-8">
                                            <input id="orderDrugDetailsID" name="orderDrugDetailsID" type="text" placeholder="Drug Order ID"  class="form-control input-md" readonly>
                                        </div>
                                    </div> 
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="textinput">Drug Order Date</label>
                                        <div class="col-md-8">
                                            <input id="orderDrugDetailsDate" name="orderDrugDetailsDate" type="text" placeholder="Drug Order Date"  class="form-control input-md" readonly>
                                        </div>
                                    </div>
                                    <br/>


                                    <h4>Choose Drug</h4>
                                    <hr/>
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="textinput">Search Drug *</label>
                                        <div class="col-md-8">
                                            <input id="orderDrugSearchInput" name="orderDrugSearchInput" type="text" placeholder="Search Drug"  class="form-control input-md">
                                            <div id="orderDrugSearchInputDisplayResult" class="search-drop"></div>
                                        </div>
                                    </div>
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="textinput">Drug Code</label>
                                        <div class="col-md-8">
                                            <input id="orderDrugDisplayDrugCode" name="orderDrugDisplayDrugCode" type="text" placeholder="Drug Code"  class="form-control input-md" readonly>
                                        </div>
                                    </div>                           
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="textinput">Trade Name</label>
                                        <div class="col-md-8">
                                            <input id="orderDrugDisplayTradeName" name="orderDrugDisplayStockQuantity" type="text" placeholder="Drug Name" class="form-control input-md" readonly>
                                        </div>
                                    </div>
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="textinput">Route</label>
                                        <div class="col-md-8">
                                            <input id="orderDrugDisplayRoute" name="orderDrugDisplayRoute" type="text" placeholder="Drug Route"  class="form-control input-md" readonly>
                                        </div>
                                    </div>
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="textinput">Form</label>
                                        <div class="col-md-8">
                                            <input id="orderDrugDisplayForm" name="orderDrugDisplayForm" type="text" placeholder="Drug Form"  class="form-control input-md" readonly>
                                        </div>
                                    </div>
                                    <br/>

                                </div>

                                <div class="col-md-6">
                                    <br>
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="textinput">Strength</label>
                                        <div class="col-md-8">
                                            <input id="orderDrugDisplayStrength" name="orderDrugDisplayStrength" type="text" placeholder="Drug Strength" class="form-control input-md" readonly>
                                        </div>
                                    </div>
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="textinput">Instruction</label>
                                        <div class="col-md-8">
                                            <input id="orderDrugDisplayInstruction" name="orderDrugDisplayFrequency" type="text" placeholder="Instruction"  class="form-control input-md" readonly>
                                        </div>
                                    </div>
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="textinput">Cautionary</label>
                                        <div class="col-md-8">
                                            <input id="orderDrugDisplayCautionary" name="orderDrugDisplayCautionary" type="text" placeholder="Cautionary"  class="form-control input-md" readonly>
                                        </div>
                                    </div>
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="textinput">Stock Quantity</label>
                                        <div class="col-md-8">
                                            <input id="orderDrugDisplayStockQuantity" name="orderDrugDisplayStockQuantity" type="text" placeholder="Total Stock Quantity"  class="form-control input-md" readonly>
                                        </div>
                                    </div>

                                    <br>

                                    <h4>Order Information</h4>
                                    <hr/>


                                    <!-- Select Basic -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="selectbasic">Dose *</label>
                                        <div class="col-md-4">
                                            <input id="orderDrugInputDose" name="orderDrugInputDose" type="number" class="form-control input-md" placeholder="Insert Drug Dose" step="0.01" maxlength="50">
                                        </div>
                                        <div class="col-md-4">
                                            <select id="orderDrugInputDoseT" name="orderDrugInputDoseT" class="form-control">
                                                <option value="-">Select Dose</option>
                                                <%  String sql4 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail "
                                                            + " where Master_Reference_code = '0025' AND hfc_cd = '" + hfc + "' ";
                                                    ArrayList<ArrayList<String>> listOfDUOM = conn.getData(sql4);

                                                    int size4 = listOfDUOM.size();

                                                    for (int i = 0; i < size4; i++) {
                                                %>
                                                <option value="<%= listOfDUOM.get(i).get(2)%>"> <%= listOfDUOM.get(i).get(2)%> </option>
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
                                            <input id="orderDrugInputDuration" name="orderDrugInputDuration" type="number" class="form-control input-md" step="0.01" placeholder="Insert Drug Duration" maxlength="12">
                                        </div>
                                        <div class="col-md-4">
                                            <select id="orderDrugInputDurationT" name="orderDrugInputDurationT" class="form-control">
                                                <option value="-">Select Duration</option>
                                                <%
                                                    String sql6 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail "
                                                            + " where Master_Reference_code = '0089' AND hfc_cd = '" + hfc + "'  ";
                                                    ArrayList<ArrayList<String>> listOfDDura = conn.getData(sql6);

                                                    int size6 = listOfDDura.size();

                                                    for (int i = 0; i < size6; i++) {
                                                %>
                                                <option value="<%= listOfDDura.get(i).get(2)%>"> <%= listOfDDura.get(i).get(2)%> </option>
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
                                            <select id="orderDrugInputFrequency" name="orderDrugInputFrequency" class="form-control">
                                                <option value="-">Select Frequency</option>
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


                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="textinput">Order Quantity *</label>
                                        <div class="col-md-8">
                                            <input id="orderDrugInputQuantity" name="orderDrugInputQuantity" type="number" placeholder="Insert Drug Quantity" class="form-control input-md" min="1" maxlength="7">
                                        </div>
                                    </div>


                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="textinput">Comment</label>
                                        <div class="col-md-8">
                                            <input id="orderComment" name="orderComment" type="text" placeholder="Comment" class="form-control input-md" maxlength="200">
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
                                <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="orderDrugAddButton">Add</button>
                            </div>
                            <div class="btn-group" role="group">
                                <button type="reset" id="orderDrugResetButton" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Add Modal End -->    


        <!-- Dispense Start -->
        <div class="modal fade" id="dispenseOrder" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                        <h3 class="modal-title" id="lineModalLabel">Dispense Summary</h3>
                    </div>
                    <div class="modal-body">

                        <!-- content goes here -->
                        <form class="form-horizontal" id="addForm">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Order No</label>
                                <div class="col-md-8">
                                    <input id="dispenseOrderNo" name="dispenseOrderNo" type="text" placeholder="Order No" class="form-control input-md" maxlength="15" readonly>
                                </div>
                            </div>


                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Total Order</label>
                                <div class="col-md-8">
                                    <input id="dispenseTotalOrder" name="dispenseTotalOrder" type="text" placeholder="Total Order" class="form-control input-md" maxlength="50" readonly>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Grand Total (RM)</label>
                                <div class="col-md-8">
                                    <input id="dispenseGrandTotal" name="dispenseGrandTotal" type="number" placeholder="Grand Total (RM)" class="form-control input-md" maxlength="50" readonly>
                                </div>
                            </div>

                        </form>
                        <!-- content goes here -->
                    </div>
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="dispenseOrderMButton">Dispense</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Dispense End -->     


        <!-- Loading Start -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="myModalLabel">Processing Transaction</h4>
                    </div>
                    <div class="modal-body" align="center">
                        <b> Your request is being processed... Please wait... </b>
                    </div>
                    <div class="modal-footer center-block">
                        <i class='fa fa-spinner fa-spin fa-2x'></i>    
                    </div>
                </div>
            </div>
        </div>
        <!-- Loading End -->


        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file = "libraries/pharmacyFootLibrary.jsp" %>
        <!-- Placed at the end of the document so the pages load faster -->

        <script>

            $('<div class="loading">Loading</div>').appendTo('body');

            $("#patientOrderListMain").load("patientOrderListMain.jsp");
            $("#patientOrderListContent").load("patientOrderListTable.jsp");
            $("#patientOrderDetailContent").load("patientOrderListBasicInfoNew.jsp");


        </script>

    </body>

</html>
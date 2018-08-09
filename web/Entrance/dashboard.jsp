
<%@page import="dBConn.Conn"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ADM_helper.MySession" %>


<%@include file="validateSession.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- header -->
        <script src="libraries/jquery.min.js" type="text/javascript"></script>
        <%@include file = "../assets/header.html" %>
        <link href="../assets/css/care.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/iconsmind.css" rel="stylesheet" type="text/css"/>

        <!-- header -->
    </head>

    <body>
        <div class="loading"></div>
        <div class="background-all" style="
             position: fixed;
             bottom: 20px;
             right: 20px;
             z-index: 1;
             opacity: 0.08;
             ">
            <i class="fa fa-user-md" style="font-size: 500px;"></i>
        </div>
        <!-- menu top -->
        <%@include file = "libraries/topMenus-dashboard.html" %>
        <!-- menu top -->

        <div class="container-fluid m-scene">
            <div class="col-md-12 main-dashboard m-t-30">
                <div class="row">

                    <div class="col-xs-6 col-sm-6 col-md-3">
                        <a href="../SystemAdmin/Lookup" class="thumbnail">
                            <span class="icon_contain">
                                <i class="iconsmind-Gears" aria-hidden="true" style="color: #FDC671;font-size: 4em;"></i>
                            </span>
                            <div class="kotak text-center">
                                System Administration
                            </div>
                        </a>
                    </div>

                    <div class="col-xs-6 col-sm-6 col-md-3">
                        <a href="../Registration/" class="thumbnail">
                            <span class="icon_contain">
                                <i class="iconsmind-Monitor-Vertical" aria-hidden="true" style="color: #c0a16b;font-size: 4em;"></i>
                            </span>
                            <div class="kotak text-center">
                                Medical Kiosk
                            </div>
                        </a>
                    </div>

                    <div class="col-xs-6 col-sm-6 col-md-3">
                        <a href="../PMS/index.jsp" class="thumbnail">
                            <span class="icon_contain">
                                <i class="iconsmind-Add-User" aria-hidden="true" style="color: #17A086;font-size: 4em;"></i>
                            </span>
                            <div class="kotak text-center">
                                Outpatient Management
                            </div>
                        </a>
                    </div>

                    <div class="col-xs-6 col-sm-6 col-md-3">
                        <a href="../CIS/" class="thumbnail">
                            <span class="icon_contain">
                                <i class="iconsmind-Stethoscope" aria-hidden="true" style="color: #E84C3D;font-size: 4em;"></i>
                            </span>
                            <div class="kotak text-center">
                                Patient Consultation
                            </div>
                        </a>
                    </div>

                    <div class="col-xs-6 col-sm-6 col-md-3">
                        <a href="../PIS/Dispense_Drug_Order" class="thumbnail">
                            <span class="icon_contain">
                                <i class="iconsmind-Medicine-2" aria-hidden="true" style="color: #9A67A0;font-size: 4em;"></i>
                            </span>
                            <div class="kotak text-center">
                                Pharmacy Info System
                            </div>
                        </a>
                    </div>

                    <div class="col-xs-6 col-sm-6 col-md-3">
                        <a href="../LIS/Order_list" class="thumbnail">
                            <span class="icon_contain">
                                <i class="iconsmind-Flask" aria-hidden="true" style="color: #F26353;font-size: 4em;"></i>
                            </span>
                            <div class="kotak text-center">
                                Laboratory Info System
                            </div>
                        </a>
                    </div>

                    <div class="col-xs-6 col-sm-6 col-md-3">
                        <a href="../RIS/HIS060001.jsp" class="thumbnail">
                            <span class="icon_contain">
                                <i class="iconsmind-Radioactive" aria-hidden="true" style="color: #2A80B9;font-size: 4em;"></i>
                            </span>
                            <div class="kotak text-center">
                                Radiology Information System
                            </div>
                        </a>
                    </div>

                    <div class="col-xs-6 col-sm-6 col-md-3">
                        <a href="../ADT/HIS070001.jsp" class="thumbnail">
                            <span class="icon_contain">
                                <i class="iconsmind-Hospital" aria-hidden="true" style="color: #DE3975;font-size: 4em;"></i>
                            </span>
                            <div class="kotak text-center">
                                Inpatient Management
                            </div>
                        </a>
                    </div>

                    <div class="col-xs-6 col-sm-6 col-md-3">
                        <a href="../Billing/HIS080001.jsp" class="thumbnail">
                            <span class="icon_contain">
                                <i class="iconsmind-Billing" aria-hidden="true" style="color: #34A8DA;font-size: 4em;"></i>
                            </span>
                            <div class="kotak text-center">
                                Billing System
                            </div>
                        </a>
                    </div>

                    <div class="col-xs-6 col-sm-6 col-md-3">
                        <a href="../Appointment/" class="thumbnail">
                            <span class="icon_contain">
                                <i class="iconsmind-Calendar-4" aria-hidden="true" style="color: #33B3AA;font-size: 4em;"></i>
                            </span>
                            <div class="kotak text-center">
                                Patient Appointment
                            </div>
                        </a>
                    </div>

                    <div class="col-xs-6 col-sm-6 col-md-3">
                        <a href="../Report/MainMenu.jsp" class="thumbnail">
                            <span class="icon_contain">
                                <i class="iconsmind-Monitor-Analytics" aria-hidden="true" style="color: #00dd1c;font-size: 4em;"></i>
                            </span>
                            <div class="kotak text-center">
                                Reports
                            </div>
                        </a>
                    </div>

                    <div class="col-xs-6 col-sm-6 col-md-3">
                        <a href="../CallingSystem" class="thumbnail">
                            <span class="icon_contain">
                                <i class="iconsmind-Support" aria-hidden="true" style="color: #FFB74D;font-size: 4em;"></i>
                            </span>
                            <div class="kotak text-center">

                                Calling System
                            </div>
                        </a>
                    </div>

                    <div class="col-xs-6 col-sm-6 col-md-3">
                        <a href="../POM/" class="thumbnail">
                            <span class="icon_contain">
                                <i class="iconsmind-Approved-Window" aria-hidden="true" style="color: orange;font-size: 4em;"></i>
                            </span>
                            <div class="kotak text-center">
                                Procedure Order Management
                            </div>
                        </a>
                    </div>

                    <div class="col-xs-6 col-sm-6 col-md-3">
                        <a href="../OperationTheater/index.jsp" class="thumbnail">
                            <span class="icon_contain">
                                <i class="iconsmind-Medical-Sign" aria-hidden="true" style="color:#0000A0;font-size: 4em;"></i>
                            </span>
                            <div class="kotak text-center">
                                Operation Theater
                            </div>
                        </a>
                    </div>

                    <div class="col-xs-6 col-sm-6 col-md-3">
                        <a href="../QMS/" class="thumbnail">
                            <span class="icon_contain">
                                <i class="iconsmind-Mens" aria-hidden="true" style="color:#ab47bc;font-size: 4em;"></i>
                            </span>
                            <div class="kotak text-center">
                                Queue Management
                            </div>
                        </a>
                    </div>                        

                    <div class="col-xs-6 col-sm-6 col-md-3">
                        <a href="../SMS/Distribution_Stock_Order" class="thumbnail">
                            <span class="icon_contain">
                                <i class="iconsmind-Box-withFolders" aria-hidden="true" style="color:#777620;font-size: 4em;"></i>
                            </span>
                            <div class="kotak text-center">
                                Stock Management
                            </div>
                        </a>
                    </div>                        

                    <div class="col-xs-6 col-sm-6 col-md-3">
                        <a href="../TMS/Admin" class="thumbnail">
                            <span class="icon_contain">
                                <i class="iconsmind-Hospital" aria-hidden="true" style="color:#777620;font-size: 4em;"></i>
                            </span>
                            <div class="kotak text-center">
                                Tenant Management
                            </div>
                        </a>
                    </div>                        


                </div>
            </div> 
            <!-- main -->		

        </div>


        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file="libraries/script.html"%>
        <%@include file="../assets/script.html"%>
        <script type="text/javascript" >


            $(function () {
                // Handler for .ready() called.

                $.ajax({
                    type: 'GET',
                    url: "getUserName.jsp",
                    success: function (data, textStatus, jqXHR) {
                        $('#welcome').text(data.trim());
                        console.log(data);
                    }});

            });
        </script>




    </body>
</html>


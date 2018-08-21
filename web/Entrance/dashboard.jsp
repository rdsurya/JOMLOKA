
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
                        <a href="../TMS/Tenant_Info" class="thumbnail">
                            <span class="icon_contain">
                                <i class="iconsmind-Monitor-Vertical" aria-hidden="true" style="color: #c0a16b;font-size: 4em;"></i>
                            </span>
                            <div class="kotak text-center">
                                Tenant Information
                            </div>
                        </a>
                    </div>

                  
                    <div class="col-xs-6 col-sm-6 col-md-3">
                        <a href="../Jom_Medic/service_info.jsp" class="thumbnail">
                            <span class="icon_contain">
                                <i class="iconsmind-Hospital" aria-hidden="true" style="color: #DE3975;font-size: 4em;"></i>
                            </span>
                            <div class="kotak text-center">
                                JOMLOKA Medic
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


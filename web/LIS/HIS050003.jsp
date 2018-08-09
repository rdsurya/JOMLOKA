<%-- 
    Document   : HIS050003
    Created on : Jan 16, 2018, 1:17:49 AM
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

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- header -->
        <%@include file = "libraries/labHeadLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>
        <!-- header -->
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->	
                <%@include file = "libraries/sideMenus.jsp" %>
                <!-- menu side -->	
                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file = "libraries/topMenus.html" %>
                    <!-- menu top -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">

                                <!-- Tab Menu -->
                                <div class="tabbable-panel">
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs ">
                                            <li class="active">
                                                <a href="#tab_default_1" data-toggle="tab">
                                                    SPECIMEN LIST
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_2" data-toggle="tab">
                                                    SPECIMEN DETAIL
                                                </a>
                                            </li>
                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">

                                            <div class="tab-pane active" id="tab_default_1">
                                                <div id="lisLabRequestVerifyMasterMain">
                                                </div>
                                                <div id="lisLabRequestVerifyMasterContent">
                                                </div>
                                            </div>

                                            <div class="tab-pane" id="tab_default_2">
                                                <div id="lisLabRequestVerifyDetailContent">
                                                </div>
                                                <%@include file="manageLabVerifyModal.jsp" %>
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


        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file = "libraries/labFootLibrary.jsp" %>
        <!-- Placed at the end of the document so the pages load faster -->

        <script>

            $(document).ready(function () {

                $('<div class="loading">Loading</div>').appendTo('body');

                // Load LIST Page
                $("#lisLabRequestVerifyMasterMain").load("manageLabVerifyMasterMain.jsp");
                $("#lisLabRequestVerifyMasterContent").load("manageLabVerifyMasterTable.jsp");

                // Load Detail Page
                $("#lisLabRequestVerifyDetailContent").load("manageLabVerifyDetaillBasicInfo.jsp");


            });


        </script>

    </body>

</html>
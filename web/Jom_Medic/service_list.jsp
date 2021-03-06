<%-- 
    Document   : service_list
    Created on : Aug 21, 2018, 4:50:40 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../Entrance/validateSession.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JOMLOKA</title>
        <!-- header -->
        <%@include file="libraries/headLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>
        <link href="libraries/care.css" rel="stylesheet" type="text/css"/>
        <!-- header -->
        <style type="text/css">
            .salah{
                background-color: #ef2828 !important;
                color: white !important;
            }
        </style>
    </head>

    <body>
        <div class="loading"></div>
        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->	
                <%@include file = "libraries/sideMenus.jsp" %>
                <!-- menu side -->	
                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file = "libraries/topMenus.jsp" %>
                    <!-- menu top -->
                    <div class="row">
                        <div class="col-md-12">
                            <div  class="thumbnail">


                                <!-- Tab Menu -->
                                <div class="tabbable-panel">
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs ">
                                            <li class="active">
                                                <a href="#tab_default_1" data-toggle="tab" >
                                                    Services</a>
                                            </li>                                            
                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_default_1">
                                                <div id="serviceTab">
                                                    <!--put body form here-->

                                                    <!--put body form here-->
                                                </div>  
                                                <div id="serviceTable" class="table-guling">
                                                    
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


        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file = "libraries/footLibrary.jsp" %>

        <script type="text/javascript" src="../assets/js/rd.jquery.preventKey.js"></script>
        <script type="text/javascript" src="../assets/js/rd.jquery.check-file.js"></script>
        <script type="text/javascript" src="../assets/js/rd.jquery.validator.js"></script>
        <script src="../assets/js/dropzone.js"></script>
        <!-- Placed at the end of the document so the pages load faster -->


        <script>
           
            $("#serviceTab").load("service_list/service.jsp");
            $("#serviceTable").load("service_list/service_table.jsp");

            $(function () {
                preventPipeKeyPress(document);
                preventPipeKeyUp("input");
                codeValidityKeyUp(".code-input");

            });

        </script>

    </body>

</html>


<%-- 
    Document   : HIS050010
    Created on : Feb 1, 2018, 10:39:38 AM
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
                            <div  class="thumbnail">

                                <h3>Sales List For Laboratory</h3>
                                <hr class="pemisah"/>

                                <div id="ReportSalesListMain">
                                </div>
                                <hr class="pemisah" />
                                <div id="ReportSalesListTable">
                                </div>
                                <%@include file="manageReportSalesListModal.jsp" %>

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

        //  $('<div class="loading">Loading</div>').appendTo('body');

        $("#ReportSalesListMain").load("manageReportSalesListMain.jsp");

    });


</script>

</body>

</html>
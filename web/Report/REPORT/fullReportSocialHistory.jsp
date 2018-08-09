<%-- 
    Document   : fullReportSocialHistory
    Created on : Feb 20, 2017, 2:01:08 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <title>Full Report Social History</title>
    </head>
    <body>
        <!-- nav side bar -->
        <div id="head"></div>
        <div id="top"></div>	
        <div id="test"></div>
        <!-- nav side bar -->

        <div class='container'>
            <div class='row'>

                <h1 style='text-align: center'> Diagnosis </h1>

                <div id="fullReportSocialHistoryTable">

                </div>
            </div>
        </div>
    </body>
</html>

<script>
    $("#test").load("libraries/reportSideMenus.jsp");
    $("#head").load("libraries/reportHeader.jsp");
    $("#top").load("libraries/reportTopMenus.jsp");
    $("#fullReportSocialHistoryTable").load("fullReportSocialHistoryTable.jsp");

</script>

<%-- 
    Document   : timeSlipMain
    Created on : Feb 19, 2017, 9:46:05 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <!--        <link rel="stylesheet" href="/resources/demos/style.css">-->
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <title>Print Time Slip</title>
        <%@include file = "../assets/header.html" %>
    </head>
    <body>


        <div class="main" style="background: #f2ff4f8;"> 
            <!-- menu top -->
            <%@ include file ="libraries/reportTopMenus.jsp" %>
            <!-- menu top -->

            <!-- side bar -->
            <%@ include file ="libraries/reportSideMenus.jsp" %>
            <!-- side bar -->
        </div>

        <div class="container">
            <div class="row">      
                <div class="row">
                    <div class="col-md-12">
                        <div class="thumbnail">

                            <h2 style="text-align: center"> Print Time Slip </h2>
                            </br>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">ID Type:</label>


                                <div class="form-group">
                                    <div class="col-md-8">
                                        <select class="form-control" name="tsType" id="mcType">
                                            <option value="0" id="0" >Please select</option>
                                            <option value="PMI_NO" id="PMI_NO" >PMI NO.</option>
                                            <option value="OLD_IC_NO" id="OLD_IC_NO">OLD IC NO.</option>
                                            <option value="NEW_IC_NO" id="NEW_IC_NO">NEW IC NO.</option>
                                            <option value="ID_NO" id="ID_NO">MATRIC NO.</option>
                                            <option value="ID_NO" id="ID_NO">STAFF NO.</option>

                                        </select>
                                    </div>
                                </div>
                            </div>
                            </br></br></br>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">IC NO/ ID NO :</label>
                                <div class="col-md-8">
                                    <input id="tsInput" name="tsInput" type="text" placeholder="" class="form-control input-md">
                                </div>
                            </div>

                            </br></br></br>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Date:</label>
                                <div class="col-md-6">
                                    <input id="startDate" name="startDate" type="text" class="form-control datepicker" placeholder="" readonly>
                                </div>
                            </div>
                            </br></br></br>


                            <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                                <div class="btn-group" role="group">
                                    <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="printTimeSlip">Generate Time Slip</button>
                                </div>
                                <div class="btn-group" role="group">
                                    <button type="reset" id="PrintReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

</body>
</html>

<script>

    $(document).ready(function ()) {

        $("#startDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'yy-mm-dd',
        });

        $('#printTimeSlip').on('click', function (e) {

            e.preventDefault();

            var tsType = $("#tsType").val();
            var tsInput = $("#tsInput").val();
            console.log(tsType);
            console.log(tsInput);

            window.open("timeslip.jsp?tsType=" + tsType + "&tsInput=" + tsInput);

        });
    });
</script>
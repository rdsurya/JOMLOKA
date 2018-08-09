
<%-- 
    Document   : view_order
    Created on : Nov 24, 2016, 12:24:01 PM
    Author     : Ahmed
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Order</title>
        <%@include file="Header.jsp"%>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   
        <title>Main Page</title>
        <%@include file="../assets/header.html"%>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="assets/js/jquery.min.js"></script>
        <!-- Custom styles for this template -->
        <link rel="stylesheet" href="assets/css/loading.css">
        <link href="assets/datepicker/jquery-ui.css" rel="stylesheet">    
        <script src="assets/datepicker/jquery-ui.js"></script>
        <script src="assets/js/form-validator.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script> 
        <script src="assets/js/w3data.js"></script>
        <script src="assets/js/bootbox.min.js"></script>  
        <link href="datepicker/jquery-ui.css" rel="stylesheet" type="text/css">

    </head>
    <body>

        <form enctype="multipart/form-data" method="get">
            <div class="container-fluid">
                <div class="row">
                    <!-- menu side -->		
                    <%@include file = "libraries/sideMenus.jsp" %>
                    <!-- menu side -->
                    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="background: #f2f4f8;">
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
                                                        Assign Test Result </a>
                                                </li>

                                            </ul>
                                            <!-- tab content -->
                                            <div class="tab-content">

                                                <div class="tab-pane active" id="tab_default_1">
                                                    <h3>
                                                        <%  String item_cd = request.getParameter("item_cd");
                                                            session.setAttribute("item_cd", item_cd);

                                                            String pmi1 = request.getParameter("pmi");
                                                            session.setAttribute("pmi1", pmi1);

                                                            String specimen_no1 = request.getParameter("specimen_no");
                                                            session.setAttribute("specimen_no1", specimen_no1);

                                                            Conn conn = new Conn();

                                                            String query4 = "SELECT ls.order_no, lod.item_name FROM lis_order_detail lod,lis_specimen ls WHERE lod.item_cd = ls.item_cd AND ls.item_cd='" + item_cd + "' AND ls.specimen_no = '" + specimen_no1 + "'";
                                                            ArrayList<ArrayList<String>> q4 = conn.getData(query4);

                                                            out.println("Test Name: " + q4.get(0).get(1));

                                                            session.setAttribute("order_no", q4.get(0).get(0));
                                                            session.setAttribute("item_name", q4.get(0).get(1));
                                                            out.println("<span class='pull-right'>Item Code:" + item_cd + "</span>");
                                                        %></h3>
                                                    <input type="text" id="pmi" value="<%=pmi1%>" style="display: none">
                                                    <input type="text" id="specimen_no" value="<%=specimen_no1%>" style="display: none">
                                                    <input type="text" id="item_cd" value="<%=item_cd%>" style="display: none">
                                                    <input type="text" id="order_no" value="<%=q4.get(0).get(0)%>" style="display: none">    
                                                    <hr>                   
                                                    <span class="pull-right">
                                                        <button id="MLM_btnAddNew" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#TestCategory" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD Test Result</button>
                                                    </span>
                                                    <br><br>
                                                    <div class="modal fade" id="TestCategory" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
                                                        <div class="modal-dialog" style="width: 950px !important; ">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                                                                    <h3 class="modal-title" id="lineModalLabel">Add  Test Result</h3>

                                                                </div>
                                                                <div class="modal-body">

                                                                    <!-- content goes here -->

                                                                    <div class="row">
                                                                        <div class="col-md-6">
                                                                            <!-- Text input-->
                                                                            <div class="form-group">
                                                                                <label class="col-md-4 control-label" for="textinput">Test Name</label>
                                                                                <div class="col-md-8">
                                                                                    <input type="text" name="testName" id="testName" class="form-control" value="<%=q4.get(0).get(1)%>" disabled="disabled"/>
                                                                                </div>
                                                                            </div>

                                                                            <!-- Text input-->
                                                                            <div class="form-group">
                                                                                <label class="col-md-4 control-label" for="textinput">Result</label>
                                                                                <div class="col-md-8">
                                                                                    <input type="text" name="testCatName" id="testCatName" class="form-control" style="display: none;"/>
                                                                                    <textarea name="career[message]" class="form-control" id="Result" placeholder="Write your result" required="required"></textarea>
                                                                                </div>
                                                                            </div>

                                                                            <!-- Text input-->
                                                                            <div class="form-group">
                                                                                <label class="col-md-4 control-label" for="textinput">Remark</label>
                                                                                <div class="col-md-8">
                                                                                    <input type="text" name="testCatName" id="testCatName" class="form-control" style="display: none;"/>
                                                                                    <textarea name="career[message]" class="form-control" id="Remark" placeholder="Write your Remark" required="required"></textarea>
                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <div class="form-group">
                                                                                <label class="col-md-4 control-label" for="textinput">Test Date</label>
                                                                                <div class="col-md-8">
                                                                                    <input type="text" id="testDate" class="form-control input-md" placeholder="DD-MM-YYYY">
                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <div class="form-group">
                                                                                <label class="col-md-4 control-label" for="textinput">Test Time</label>
                                                                                <div class="col-md-8">
                                                                                    <input type="time" id="testTime" class="form-control input-md">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <div class="form-group">
                                                                                <label class="col-md-4 control-label" for="textinput">Test Perform By</label>
                                                                                <div class="col-md-8">
                                                                                    <input type="text" name="performBy" id="performBy" class="form-control" />
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <label class="col-md-4 control-label" for="textinput">Upload Result</label>
                                                                            <div class="col-md-8">
                                                                                <input class="form-control" id="inputFileToLoad" type="file" accept=".jpg, .png, .gif" >
                                                                            </div>

                                                                        </div>
                                                                        <hr/>
                                                                        <div class="row">
                                                                            <div class="col-md-12" style="width: 100%; margin: 0 auto">
                                                                                <div id="dym" style="text-align: center;">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>


                                                                    <!-- content goes here -->
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                                                                        <div class="btn-group" role="group">
                                                                            <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="btn_add">Add</button>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <br><br>
                                                    <div id="viewTA">

                                                    </div>
                                                    <div class="col-xs-12 col-md-12">

                                                        <div class=" pull-right">
                                                            <button type="button" name="back" id="back" class="btn btn-default" data-dismiss="modal" onclick="openPage('VerifySpecimen.jsp?pmi=<%=pmi1%> &specimen_no=<%=specimen_no1%>')">Back</button>
                                                        </div>
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
            </div>
            <script type="text/javascript" charset="utf-8">

                $(document).ready(function () {
                    $('#orderRecieve').DataTable();

                });


            </script>
            <script type="text/javascript">

                (function ($) {
                    
                    $.fn.checkFileType = function (options) {
                        var defaults = {
                            allowedExtensions: [],
                            success: function () {},
                            error: function () {}
                        };
                        options = $.extend(defaults, options);

                        return this.each(function () {

                            $(this).on('change', function () {
                                var value = $(this).val(),
                                        file = value.toLowerCase(),
                                        extension = file.substring(file.lastIndexOf('.') + 1);

                                if ($.inArray(extension, options.allowedExtensions) === -1) {
                                    options.error();
                                    $(this).focus();
                                } else {
                                    options.success();

                                }

                            });

                        });
                    };

                })(jQuery);

                $('#inputFileToLoad').checkFileType({
                    allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
                    success: function () {
                        loadImageFileAsURL();
                    },
                    error: function () {
                        bootbox.alert('Incompatible file type');
                        $('#inputFileToLoad').val("");
                        $('#dym').html("");
                        gambarURI = "";
                    }
                });


                var gambarURI = "";

                function loadImageFileAsURL()
                {

                    var iSize = 0;

                    iSize = ($("#inputFileToLoad")[0].files[0].size / 1024);

                    var sizeSmall = false;

                    if (iSize / 1024 > 1) {
                        sizeSmall = false;

                    } else {

                        iSize = (Math.round(iSize * 100) / 100);

                        sizeSmall = iSize <= 45;

                    }
                    if (sizeSmall) {
                        document.getElementById("dym").innerHTML = '<div class="loader"></div>';
                        var filesSelected = document.getElementById("inputFileToLoad").files;
                        if (filesSelected.length > 0)
                        {
                            var fileToLoad = filesSelected[0];

                            var fileReader = new FileReader();

                            fileReader.onload = function (fileLoadedEvent)
                            {

                                gambarURI = fileLoadedEvent.target.result;


                                document.getElementById("dym").innerHTML = '<img id="myImage">';

                                document.getElementById("myImage").src = gambarURI;
                            };

                            fileReader.readAsDataURL(fileToLoad);
                        }

                    } else {

                        bootbox.alert("File size must not exceed 40kb");
                        $('#inputFileToLoad').val("");
                        gambarURI = "";
                        $('#dym').html("");
                    }


                }



                $('#btnClearPic').on('click', function () {
                    $('#dym').html("");
                    $('#inputFileToLoad').val("");
                    gambarURI = "";
                });

            </script>
            <script>
                w3IncludeHTML();
                $(document).ready(function () {

                    $(function () {
                        $("#testDate").datepicker({
                            yearRange: '1999:c+1',
                            changeMonth: true,
                            changeYear: true,
                            minDate: new Date(1999, 10 - 1, 25),
                            maxDate: '+30Y',
                        });
                    });
                    $("#back").click(function () {
                        var specimen_no = $("#specimen_no").val();
                        var pmi = $("#pmi").val();
                        window.location.replace("VerifySpecimen.jsp?pmi=" + pmi + " &specimen_no=" + specimen_no);
                    });

                    $("#btn_add").click(function () {
                        var specimen_no = $("#specimen_no").val();
                        var pmi = $("#pmi").val();
                        var item_cd = $("#item_cd").val();
                        var testName = $("#testName").val();
                        var order_no = $("#order_no").val();
                        var Result = $("#Result").val();
                        var Remark = $("#Remark").val();
                        var testDate = $("#testDate").val();
                        var testTime = $("#testTime").val();
                        var performBy = $("#performBy").val();

                        if (gambarURI === "") {
                            bootbox.alert("Choose a picture");
                            return;
                        }
                        //alert(specimen_no + "  " + pmi + " " + item_cd + " " + testName + " " + Result + " " + Remark);
                        $.ajax({
                            url: "tAssignResult.jsp",
                            type: "post",
                            data: {
                                pic: gambarURI,
                                specimen_no: specimen_no,
                                pmi: pmi,
                                item_cd: item_cd,
                                testName: testName,
                                order_no: order_no,
                                Result: Result,
                                Remark: Remark,
                                testDate: testDate,
                                testTime: testTime,
                                performBy: performBy
                            },
                            timeout: 10000,
                            success: function (data) {
                                bootbox.alert("Specimen Accept succesfully");
                                $("#viewTA").load("viewTA.jsp");

                            },
                        });

                        //$(".modal-backdrop").hide();

                    });

                    $("#btn_update").click(function () {
                        var healthCentre = $("#healthCentre").val();
                        var pmi = $("#pmi").val();
                        var specimen_no = $("#specimen_no").val();

                        $.ajax({
                            url: "tAcceptSpecimen.jsp",
                            type: "post",
                            data: {
                                healthCentre: healthCentre,
                                pmi: pmi,
                                specimen_no: specimen_no
                            },
                            timeout: 10000,
                            success: function (data) {
                                bootbox.alert("Specimen Accept succesfully");
                                window.location.reload();
                                $("#basicModal").hide();
                                $(".modal-backdrop").hide();

                            },
                        });

                    });
                });
                $(document).ready(function () {
                    $("#viewTA").load("viewTA.jsp");
                    $("#headerindex").load("libraries/header.html");
                    $("#topmenuindex").load("libraries/topMenus.html");
                    $("#sidemenus").load("libraries/sideMenus.jsp");
                });

            </script>
        </form>
    </body>
</html>

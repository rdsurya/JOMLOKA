<%-- 
    Document   : service_info
    Created on : Aug 20, 2018, 11:55:08 AM
    Author     : user
--%>
<%@include file="../Entrance/validateSession.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                                                    Operation Hours</a>
                                            </li>                                            
                                            <li>
                                                <a href="#tab_default_2" data-toggle="tab" >
                                                    Documents</a>
                                            </li>                                            
                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_default_1">
                                                <div id="operationHourTab">
                                                    <!--put body form here-->

                                                    <!--put body form here-->
                                                </div>                                               
                                            </div>
                                            <div class="tab-pane" id="tab_default_2">
                                                <div id="documentTab">
                                                    <!--put body form here-->

                                                    <!--put body form here-->
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
            $("html").on("dragover", function (e) {
                e.preventDefault();
                e.stopPropagation();
                //$("h1").text("Drag here");
            });

            $("html").on("drop", function (e) {
                e.preventDefault();
                e.stopPropagation();
            });
            // createScreenLoading();
            $("#operationHourTab").load("service_info/operation_hours.jsp");
            $("#documentTab").load("service_info/document.jsp");
            
            $(function () {
                preventPipeKeyPress(document);
                preventPipeKeyUp("input");
                codeValidityKeyUp(".code-input");

            });

            function loadDocumnentImage(img, img_id) {
                var $img = $("#documentTab").find("#" + img_id);

                var input = {
                    img: img
                };

                console.log($img.attr("id"));
                $.ajax({
                    type: 'POST',
                    data: input,
                    timeout: 60000,
                    dataType: 'json',
                    url: "service_info/getDocument.jsp",
                    success: function (data, textStatus, jqXHR) {
                        $img.attr("src", data.src);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("Fail load APC: " + errorThrown);
                    }
                });
            }

            function initDropzone(boxID, btnID) {

                return new Dropzone("#" + boxID,
                        {
                            url: "/post",
                            autoProcessQueue: false,
                            clickable: "#" + btnID,
                            maxFiles: "1",
                            maxFilesize: "0.65",
                            acceptedFiles: "image/*",
                            addRemoveLinks: true,
                            createImageThumbnails: true,
                            thumbnailHeight: null,
                            thumbnailWidth: null,
                            previewTemplate: '<div class="dz-preview dz-file-preview"> <div class="dz-details"> <div class="dz-filename"><span data-dz-name></span></div> <div class="dz-size" data-dz-size></div> <img data-dz-thumbnail /> </div> <div class="dz-progress"><span class="dz-upload" data-dz-uploadprogress></span></div></div>',
                            error: function (file, error) {
                                if (!file.accepted) {
                                    this.removeFile(file);
                                    bootbox.alert(error);
                                }

                            }
                        });


            }
            
            function loadOperationHour(){
                $.ajax({
                    type: 'GET',
                    dataType: 'json',
                    url: "service_info/getOperationHour.jsp",
                    timeout: 60000,
                    success: function (data, textStatus, jqXHR) {
                        var $timeInputs = $("#operationHourTab .time-input");
                        $timeInputs.each(function(i){
                            $(this).val(data[i]);
                        });
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("Fail get operation: "+errorThrown);
                    }
                });
            }


        </script>

    </body>

</html>

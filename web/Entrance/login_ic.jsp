<%-- 
    Document   : index
    Created on : Jan 13, 2017, 9:26:29 AM
    Author     : user
--%>

<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%

    if (session.getAttribute("TEMP_ID") == null) {

        response.sendRedirect("login.jsp");

        return;

    }

//    Config.getBase_url(request);
//    Config.getFile_url(session);
    Conn conn = new Conn();
    //out.print(conn.getIpCall());
%>
<!DOCTYPE html>
<html>
    <head>
        <title>HIS CARE</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="../assets/js/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link href="../assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/care.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/png" href="../assets/favicon.png"/>
        <style>
            html, body, .login_container {
                height: 100%;
            }

            .login_container {
                display: table;
            }

            .login_row {
                display: table-cell;
                vertical-align: middle;
            }

            .login_panel {
                margin: 0 auto;
                position: relative;
                width: 320px;
            }

            .login_logo {
                margin: 50px 0 30px;
            }

            .login_logo img {
                width: 220px;
            }

            .login_colon {
                position: absolute;
                right: -20px;
                top: 20px;
            }

            .login_colon img {
                width: 40px;
            }

            .login_body {
                padding: 15px 70px 50px; 
            }

            .login_msg {
                text-align: left;
                margin-bottom: 30px;
                width: 100%;
            }

            .login_label {
                font-family: 'proxima_nova_ltthin';
            }

            .login_input {
                border: none;
                border-bottom: solid 1px #4a4a4a;
                border-radius: 0px;
                padding: 6px 0 6px;
                box-shadow: none;
                outline: none;
            }

            .login_input:focus {
                border: none;
                border-bottom: solid 2px #5fc095;
                box-shadow: none;
                outline: none;
            }

            .login_alert {
                color: #F44336;
                font-size: 12px;
                text-align: left;
                margin-top: -10px;
            }

            .login_btn_rounded {
                background-color: #05d8dd;
                border-radius: 2em;
                border: none;
                margin-top: 30px;
            }

            .login_btn_rounded:hover, .login_btn_rounded:focus {
                background-color: #03babe;
                border-radius: 2em;
                border: none;
            }

            .login_btn_check {
                background-color: #00ff99;
                margin-top: 50px;
            }

            .login_btn_check:focus, .login_btn_check:hover {
                background-color: #00c778;
                margin-top: 50px;
            }

            .login_problem {
                margin: 10px 0 -20px;
            }

            .login_problem a {
                color: #010128;
                font-family: 'proxima_nova_ltthin';
            }

            .login_banner {
                background: url(../assets/img/login-banner.jpg);
                background-repeat: no-repeat;
                background-position: center;
                background-size: cover;
            }
        </style>
    </head>
    <body class="">
        <div class="login_container col-md-4">
            <div class="login_row panel login_panel">
                <div class="login_logo text-center">
                    <img class="login-logo" src="../assets/img/hiscare-icon.svg"/>
                </div>
                <div class="panel-body login_body">
                    <form id="leForm" class="form-horizontal">
                        <fieldset>
                            <div class="form-group">
                                <div class="col-md-12"><label class="control-label" for="company_name">User ID</label></div>
                                <div class="col-md-12">
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-user"></i></span>
                                        <input id="inputUserID" type="text" class="form-control input-lg" name="username" required autofocus>
                                    </div>
                                    <span style="color: red; margin-bottom: 10px;">Please log in using your IC number / Passport number and your password</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><label class="control-label" for="company_name">Password</label></div>
                                <div class="col-md-12">
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-key"></i></span>
                                        <input id="inputPassword" type="password" class="form-control input-lg" name="password" required >
                                    </div>
                                    <a href="Forgot_Password"> Forgot your password?</a><br>
                                    <a href="Sign-in" class="forgot-password">Sign-in with different account.</a>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                    <button id="btnSign" class="btn btn-rounded btn-block btn-mkag btn-lg login-btn">Enter<i style="margin-top: 3px;" class="fa fa-caret-right pull-right"></i></button>
                    <div class="text-center login-footer">
                        <p>Powered by <a href="http://mkagtechnologies.com" target="_blank">MKAG Technologies PLT</a></p>
                        <p>Version 4.0.0</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-8 login_banner" style="height: 100%"></div>
        
        
        <%@include file="libraries/script.html" %>
        <!--<script src="Dashboard_files\jquery.min.js.download"></script>
        <script src="http://www.w3schools.com/lib/w3data.js"></script>-->



        <script>
          
            $(document).ready(function () {

                $(document).bind('keypress', pressed);
            });

            function pressed(e)
            {
                if (e.keyCode === 13)
                {
                    //alert('enter pressed');
                    login();
                    //put button.click() here
                }
            }

            $('#btnSign').on('click', function () {

                login();

            });

            function login() {

                var userID = $("#inputUserID").val();
                var password = $("#inputPassword").val();

                if (userID === "") {
                    alert("Fill in the User ID");
                    $("#inputUserID").focus();
                } else if (password === "") {
                    alert("Fill in the password");
                    $("#inputPassword").focus();
                } else {
                    $('<div class="loading">Loading</div>').appendTo('#leForm');
                    $.ajax({
                        url: "login_process.jsp",
                        type: "post",
                        data: {userIC: userID,
                            password: password,
                            user_group: "HIS-CARE"
                        },
                        dataType: 'json',
                        timeout: 60000,
                        success: function (data) {
                            if(data.msg != null){
                                alert(data.msg);
                            }
                            
                            if(data.isRedirect){
                                window.location = data.url;
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            alert("Opps! " + errorThrown);
                        },
                        complete: function (jqXHR, textStatus) {
                            $('.loading').hide();
                        }


                    });
                }
            }
        </script>
    </body>
</html>

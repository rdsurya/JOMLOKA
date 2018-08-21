<%-- 
    Document   : operation_hours
    Created on : Aug 20, 2018, 4:53:01 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<form id="hour-form" class="form-horizontal">
    <fieldset class="steps step5 activate">
        <h5>Please enter the time using 24-hour system('HH:mm') format. Example '01:30'. Enter 'OFF' for holiday.</h5>
        <div class="row">
            <div class="col-md-2">
                <label class="control-label" for="company_name">Monday:</label>
            </div>
            <div class="col-md-5">
                <div class="form-group">
                    <div class="col-md-12">
                        <input id="inputFrom1" type="text" class="form-control input-lg time-input time-from" required placeholder="Start">
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <div class="form-group">
                    <div class="col-md-12">
                        <input id="inputTo1" type="text" class="form-control input-lg time-input time-to" required placeholder="End">
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-2">
                <label class="control-label" for="company_name">Tuesday:</label>
            </div>
            <div class="col-md-5">
                <div class="form-group">
                    <div class="col-md-12">
                        <input id="inputFrom2" type="text" class="form-control input-lg time-input time-from" required placeholder="Start">
                    </div>
                </div>
            </div>

            <div class="col-md-5">
                <div class="form-group">
                    <div class="col-md-12">
                        <input id="inputTo2" type="text" class="form-control input-lg time-input time-to" required placeholder="End">
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-2">
                <label class="control-label" for="company_name">Wednesday:</label>
            </div>
            <div class="col-md-5">
                <div class="form-group">
                    <div class="col-md-12">
                        <input id="inputFrom3" type="text" class="form-control input-lg time-input time-from" required placeholder="Start">
                    </div>
                </div>
            </div>

            <div class="col-md-5">
                <div class="form-group">
                    <div class="col-md-12">
                        <input id="inputTo3" type="text" class="form-control input-lg time-input time-to" required placeholder="End">
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-2">
                <label class="control-label" for="company_name">Thursday:</label>
            </div>
            <div class="col-md-5">
                <div class="form-group">
                    <div class="col-md-12">
                        <input id="inputFrom4" type="text" class="form-control input-lg time-input time-from" required placeholder="Start">
                    </div>
                </div>
            </div>

            <div class="col-md-5">
                <div class="form-group">
                    <div class="col-md-12">
                        <input id="inputTo4" type="text" class="form-control input-lg time-input time-to" required placeholder="End">
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-2">
                <label class="control-label" for="company_name">Friday:</label>
            </div>
            <div class="col-md-5">
                <div class="form-group">
                    <div class="col-md-12">
                        <input id="inputFrom5" type="text" class="form-control input-lg time-input time-from" required placeholder="Start">
                    </div>
                </div>
            </div>

            <div class="col-md-5">
                <div class="form-group">
                    <div class="col-md-12">
                        <input id="inputTo5" type="text" class="form-control input-lg time-input time-to" required placeholder="End">
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-2">
                <label class="control-label" for="company_name">Saturday:</label>
            </div>
            <div class="col-md-5">
                <div class="form-group">
                    <div class="col-md-12">
                        <input id="inputFrom6" type="text" class="form-control input-lg time-input time-from" required placeholder="Start">
                    </div>
                </div>
            </div>

            <div class="col-md-5">
                <div class="form-group">
                    <div class="col-md-12">
                        <input id="inputTo6" type="text" class="form-control input-lg time-input time-to" required placeholder="End">
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-2">
                <label class="control-label" for="company_name">Sunday:</label>
            </div>
            <div class="col-md-5">
                <div class="form-group">
                    <div class="col-md-12">
                        <input id="inputFrom7" type="text" class="form-control input-lg time-input time-from" required placeholder="Start">
                    </div>
                </div>
            </div>

            <div class="col-md-5">
                <div class="form-group">
                    <div class="col-md-12">
                        <input id="inputTo7" type="text" class="form-control input-lg time-input time-to" required placeholder="End">
                    </div>
                </div>
            </div>
        </div>

        <div class="text-center">
            <button id="btnSaveOperation" class="btn btn-success"><i class="fa fa-floppy-o"></i> Save</button>
        </div>

    </fieldset>
</form>

<script type="text/javascript">
    loadOperationHour();

    $(function () {

        //bind time input with time validation
        $(".time-input").on("change keyup keypress", function () {

            var strOff = $(this).val().toUpperCase();
            if (strOff === "OFF") {
                var className = ".time-from";
                if ($(this).hasClass("time-from")) {
                    className = ".time-to";
                }

                $(this).closest(".row").find(className).val(strOff);
                $(this).val(strOff);
                $(this).removeClass("salah");
                return;
            }

            var isValid = /^([0-1][0-9]|2[0-3]):([0-5][0-9])$/.test($(this).val());
            console.log($(this).val() + " - " + isValid);
            if (isValid) {
                $(this).removeClass("salah");
            } else {
                $(this).addClass("salah");
            }
        });
        $("#btnSaveOperation").on("click", function (event) {
            event.preventDefault();
            var $time_input = $(".time-input");
            var breakout = false;
            $time_input.each(function (i) {
                if ($(this).val() === "") {
                    bootbox.alert("Please enter all operation hours!");
                    breakout = true;
                    return false;
                }
            });
            
            if(breakout)
                return false;

            var $time_input_false = $(".time-input.salah");
            
            if ($time_input_false.length > 0) {
                bootbox.alert("Please enter the operation hours using 'HH:mm' format!");
                
                return false;
            }

            var arrTime = [];

            $time_input.each(function (i) {
                arrTime.push($(this).val());
            });

            var input = {
                time: JSON.stringify(arrTime)
            };

            createScreenLoading();
            $.ajax({
                type: 'POST',
                data: input,
                dataType: 'json',
                url: "service_info/setOperationHour.jsp",
                timeout: 60000,
                success: function (data, textStatus, jqXHR) {
                    bootbox.alert(data.msg);
                    if (!data.isValid) {
                        console.log(data.sql);
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("Fail save: " + errorThrown);
                },
                complete: function (jqXHR, textStatus) {
                    destroyScreenLoading();
                }
            });
        });

    });
</script>

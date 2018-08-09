<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%--<%@page import="Config.connect"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //String relation = "select * from lookup_detail where master_ref_code = '0007' order by Description";
    String hcf81 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0081' AND hfc_cd = '" + hfc + "' and status ='0'";
    //String insuranceCompany81 = "select * from adm_lookup_detail where master_reference_code = '0083'   ";
    String insurancePolicy81 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0058' AND hfc_cd = '" + hfc + "' and status ='0'";
    ArrayList<ArrayList<String>> dataHfc81, dataInsurancePolicy81, dataInsuranceCompany81;
    dataHfc81 = conn.getData(hcf81);
    dataInsurancePolicy81 = conn.getData(insurancePolicy81);
    //dataInsuranceCompany81 = conn.getData(insuranceCompany81);

%>
<!-- Modal -->
<div class="modal fade" id="MEDModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">X</span><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Medical Insurance Information</h3>
            </div>
            <div class="modal-body" >

                <div id="maintainMED">
                    <!--            <h4>Medical Insurance Information</h4>-->
                    <form class="form-horizontal" id="formMed">

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">PMI No.</label>
                            <div class="col-md-8">
                                <input id="MEDpmino" name="MEDpmino" type="text"  class="form-control input-md" readonly>
                                <input id="MEDseq" name="MEDseq" type="hidden"  class="form-control input-md">
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Insurance Company *</label>
                            <div class="col-md-8">

                                <input id="MEDinscom" name="textinput" type="text" placeholder="select Insurance Company.." class="form-control input-md" autocomplete="off">
                                <input id="MEDinscomCODE" name="PMIhstateCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                                <div id="matcMEDinscom" class="search-drop" style="max-height: 500px; overflow: auto; height: 100%"></div>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Policy No. *</label>  
                            <div class="col-md-8">
                                <input id="MEDpolicy" name="MEDpolicy" type="text"  class="form-control input-md" maxlength="15">

                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Maturity Date</label>  
                            <div class="col-md-8">
                                <input id="MEDdate" name="MEDdate" type="text"  class="form-control input-md">

                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Health Facility</label>
                            <div class="col-md-8">

                                <input id="MEDhfc" name="textinput" type="text" placeholder="select health facility.." class="form-control input-md" autocomplete="off">
                                <input id="MEDhfcCODE" name="PMIhstateCODE" type="hidden" class="form-control input-md">
                                <div id="matcMEDhfc" class="search-drop" style="max-height: 500px; overflow: auto; height: 100%"></div>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Policy Status</label>
                            <div class="col-md-8">
                                <select id="MEDstatus" name="MEDstatus" class="form-control">
                                    <option value="null" selected="" disabled="">Please Select Policy Status</option>
                                    <option value="-">-</option>
                                    <% for (int i = 0; i < dataInsurancePolicy81.size(); i++) {%>
                                    <option value="<%=dataInsurancePolicy81.get(i).get(1)%>"><%=dataInsurancePolicy81.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                    </form>

                </div>

            </div>
            <div class="modal-footer">
                <div class="text-center">
                    <button id="MEDsave" name="MEDsave" class="btn btn-primary"><i class="fa fa-floppy-o fa-lg"></i>&nbsp; Save</button>
                    <button id="MEDclear" name="MEDclear" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $(function () {
            $('#MEDdate').datepicker({
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                minDate: '-150Y',
                maxDate: '+10Y',
                yearRange: '-150:+10'
            });
        });
    });
    $('#MEDsave').on('click', function (e) {
        e.preventDefault();
        $('#MEDModal').css('overflow', 'auto');
        var pmino = $('#MEDpmino').val(),
                insuranceCom = $('#MEDinscomCODE').val(),
                policy = $('#MEDpolicy').val(),
                maturityDate = $('#MEDdate').val(),
                hfc = $('#MEDhfcCODE').val(),
                status = $('#MEDstatus').val(),
                seq = $('#MEDseq').val();

        if (insuranceCom == null || insuranceCom === "") {
            bootbox.alert("Search existing insurance company!", function () {
                $('#MEDinscom').focus();
            });
            return;
        }
        if (policy === "") {
            bootbox.alert("Key in the policy number!", function () {
                $('#MEDpolicy').focus();
            });
            return;
        }
        if (hfc === null) {
            hfc = "-";
        }
        if (status === null) {
            status = "-";
        }
        var convertedmaturitydate = "-";
        if (maturityDate !== null) {
            var splitmaturitydate = String(maturityDate).split("/");
            if (splitmaturitydate.length === 3) {
                convertedmaturitydate = splitmaturitydate[2] + "-" + splitmaturitydate[1] + "-" + splitmaturitydate[0];
            }
        }


        var datas = {
            pmino: pmino,
            insuranceCom: insuranceCom,
            policy: policy,
            maturityDate: convertedmaturitydate,
            hfc: hfc,
            status: status,
            seq: seq
        };



        bootbox.confirm({
            message: "Are you sure want to save patient's Medical Information?",
            buttons: {
                confirm: {
                    label: 'Yes',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'No',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
//if true go to PMI page
                if (result === true) {
                    $('#MEDModal').modal('hide');
                    $.ajax({
                        type: "post",
                        url: "controller/saveMedical.jsp",
                        data: datas,
                        timeout: 3000,
                        success: function (data) {
                            console.log(data);
                            if (data.trim() === "true") {
                                bootbox.alert("Patient's Medical Information saved successfully");
                                $('#formMed')[0].reset();
                                $('input[id=MEDpmino]').val(pmino);

                                $.ajax({
                                    url: "controller/listMedical.jsp",
                                    type: "post",
                                    data: {'PMINO': pmino},
                                    timeout: 3000,
                                    success: function (returnhtml) {
                                        //console.log(returnhtml);
                                        $('#tableListMed').html(returnhtml);
                                        //$('#MEDpmino').prop('readonly', false);
                                        $('#MEDpolicy').prop('readonly', false);
                                    }
                                });
                            } else {
                                bootbox.alert("Patient's Medical Information  fail to save");
                            }

                        }, error: function () {

                        }

                    });
                }
            }
        });
    });
    $('#MEDclear').on('click', function () {
        var pmino = $('#MEDpmino').val();
        $('#formMed')[0].reset();
        $('#MEDpmino').val(pmino);
        $('#MEDseq').val("");
        //$('#MEDpmino').prop('readonly', false);
        $('#MEDpolicy').prop('readonly', false);
    });

</script>


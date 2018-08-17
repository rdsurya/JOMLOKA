<%-- 
    Document   : tenant_main
    Created on : Apr 16, 2018, 4:14:16 AM
    Author     : user
--%>
<%@page import="ADM_helper.LookupHelper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="ADM_helper.MySessionKey"%>
<%
    String tnt_cd = (String) session.getAttribute(MySessionKey.TENANT_CD);

    //                        0        1          2        3          4        5         6             7          8           9          10      11
    String query = "SELECT tnt_name, address1, address2, postcode, town_cd, district_cd, state_cd, country_cd, telephone_no, email, bank_name, bank_account_no "
            + "FROM adm_tenant WHERE tnt_cd='" + tnt_cd + "';";
    Conn con = new Conn();
    ArrayList<ArrayList<String>> arrData = con.getData(query);
    String longData = "||||||||||||";
    if (arrData.size() > 0) {
        LookupHelper lh = new LookupHelper("99_iHIS_99");
        String pos = lh.getLookupDetailDescription("0079", arrData.get(0).get(3));
        String town = lh.getLookupDetailDescription("0003", arrData.get(0).get(4));
        String dis = lh.getLookupDetailDescription("0078", arrData.get(0).get(5));
        String sta = lh.getLookupDetailDescription("0002", arrData.get(0).get(6));
        String cou = lh.getLookupDetailDescription("0001", arrData.get(0).get(7));
        ArrayList<String> tempArr = arrData.get(0);
        tempArr.add(pos);
        tempArr.add(town);
        tempArr.add(dis);
        tempArr.add(sta);
        tempArr.add(cou);
        longData = String.join("|", tempArr);
    }
%>
<input type="hidden" id="tnt_hidden" value="<%=longData%>"/>
<div style="width: 70%; margin: auto; background: #f2f4f8;">
    <form class="form-horizontal" role="form" id="regForm">

        <div class="form-group">
            <div class="col-md-12"><label class="control-label" for="company_name">Provider Name:</label></div>
            <div class="col-md-12">
                <input id="regName" type="text" class="form-control input-lg" name="provider" maxlength="200" required>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <div class="col-md-12"><label class="control-label" for="company_name">Building Number:</label></div>
                    <div class="col-md-12">
                        <input id="regAddress1" type="text" class="form-control input-lg" name="building" maxlength="40" required>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="col-md-12"><label class="control-label" for="company_name">Street Name:</label></div>
                    <div class="col-md-12">
                        <input id="regAddress2" type="text" class="form-control input-lg" name="street" maxlength="40" required>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <div class="col-md-12"><label class="control-label" for="company_name">Postcode:</label></div>
                    <div class="col-md-12">
                        <input id="regPostcode" type="text" class="form-control input-lg" name="inputUserID" required autocomplete="off" required>
                        <div id="regPostcodeMatch"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="col-md-12"><label class="control-label" for="company_name">Town:</label></div>
                    <div class="col-md-12">
                        <input id="regTown" type="text" class="form-control input-lg" name="inputUserID" required autocomplete="off" required>
                        <div id="regTownMatch"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <div class="col-md-12"><label class="control-label" for="company_name">District:</label></div>
                    <div class="col-md-12">
                        <input id="regDistrict" type="text" class="form-control input-lg" name="inputUserID" required autocomplete="off" required>
                        <div id="regDistrictMatch"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="col-md-12"><label class="control-label" for="company_name">State:</label></div>
                    <div class="col-md-12">
                        <input id="regState" type="text" class="form-control input-lg" name="inputUserID" required autocomplete="off" required>
                        <div id="regStateMatch"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-12"><label class="control-label" for="company_name">Country:</label></div>
            <div class="col-md-12">
                <input id="regCountry" type="text" class="form-control input-lg" required autocomplete="off" required>
                <div id="regCountryMatch"></div>
            </div>
        </div>


        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <div class="col-md-12"><label class="control-label" for="company_name">Mobile:</label></div>
                    <div class="col-md-12">
                        <input id="regPhone" type="text" class="form-control input-lg" name="mobile" maxlength="20" required>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="col-md-12"><label class="control-label" for="company_name">E-mail:</label></div>
                    <div class="col-md-12">
                        <input id="regEmail" type="text" class="form-control input-lg" name="inputUserID" maxlength="100" required>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <div class="col-md-12"><label class="control-label" for="company_name">Bank:</label></div>
                    <div class="col-md-12">
                        <select id="inputBank" class="form-control input-lg"></select>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="col-md-12"><label class="control-label" for="company_name">Bank Account No:</label></div>
                    <div class="col-md-12">
                        <input id="inputAccount" type="text" class="form-control input-lg" name="bank" maxlength="10" required>
                    </div>
                </div>
            </div>
        </div>

    </form>
    <div class="form-group">
        <div class="col-sm-offset-4 col-sm-4">

            <button class="btn btn-success" id="btnSave">
                <i class="fa fa-floppy-o" aria-hidden="true"></i> Save
            </button>
        </div>
    </div>
</div>

<script>
    //init bank
    function setBank(value) {
        $.ajax({
            type: 'POST',
            url: "control/getDetailFlexList.jsp",
            data: {
                master_cd: "0097",
                keyword: ""
            },
            dataType: 'json',
            timeout: 60000,
            success: function (data, textStatus, jqXHR) {
                data.forEach(function (item)
                {
                    $('#inputBank').append("<option value='" + item.value + "'>" + item.name + "</option>");
                });
                if (value != null) {
                    $('#inputBank').val(value);                    
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Oops! Can't load bank: " + errorThrown);
            }
        });
    }

    destroyScreenLoading();
    //init felx-data-list
    function initFlexData(elemInputID, elemDivID, url, value, objData) {
        $('#' + elemInputID).val(value).flexdatalist({
            minLength: 1,
            searchIn: 'name',
            searchDelay: 1000,
            selectionRequired: true,
            url: url,
            visibleProperties: 'name',
            cache: false,
            valueProperty: 'value',
            searchContain: false,
            searchByWord: true,
            params: {
                master_cd: objData
            }
        });
        $('#' + elemInputID).on('before:flexdatalist.data', function (response) {
            $('#' + elemDivID).html('<img src="../assets/img/LoaderIcon.gif" />');
        });
        $('#' + elemInputID).on('after:flexdatalist.data', function (response) {
            $('#' + elemDivID).html('');
        });
    }
   

    function validateMyForm() {
        if (!$('#regForm')[0].checkValidity()) {
            $('<input type="submit">').hide().appendTo('#regForm').click().remove();
            return false;
        }

        var state = $('#regState').val();
        if (state === "" || state==null) {
             bootbox.alert("Select existing state!", function () {
                $('#regState-flexdatalist').val("");
                $('#regState-flexdatalist').focus();
            });
            return false;
        }

        var district = $('#regDistrict').val();
        if (district === "" || district == null) {
             bootbox.alert("Select existing district!", function () {
                $('#regDistrict-flexdatalist').val("");
                $('#regDistrict-flexdatalist').focus();
            });
            return false;
        }

        var town = $('#regTown').val();
        if (town === "" || town == null) {
            bootbox.alert("Select existing town!", function () {
                $('#regTown-flexdatalist').val("");
                $('#regTown-flexdatalist').focus();
            });
            return false;
        }
        
        var country = $('#regCountry').val();
        if (country === "" || country == null) {
            bootbox.alert("Select existing country!", function () {
                $('#regCountry-flexdatalist').val("");
                $('#regCountry-flexdatalist').focus();
            });
            return false;
        }

        var pos = $('#regPostcode').val();
        if (pos == null || pos === "") {
            bootbox.alert("Select existing postcode!", function () {
                $('#regPostcode-flexdatalist').val("");
                $('#regPostcode-flexdatalist').focus();
            });
            return false;
        }

        var phone = $('#regPhone').val().trim();
        if (phone !== "" && !validatePhonenumber(phone)) {
            bootbox.alert("Invalid mobile phone number. Only numbers and +, - signs are allowed.", function () {
                $('#regPhone').val("");
                $('#regPhone').focus();
            });
            return false;
        }
        
        var email = $('#regEmail').val().trim();
        if (email !== "" && !ValidateEmail(email)) {
            bootbox.alert("Invalid email format!", function () {
                $('#regEmail').val("");
                $('#regEmail').focus();
            });
            return false;
        }

        return true;
    }


    $('#btnSave').on('click', function () {
        if (validateMyForm()) {
            createScreenLoading();
            var tenant_name = $('#regName').val().replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            var add1 = $('#regAddress1').val().replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            var add2 = $('#regAddress2').val().replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            var town = $('#regTown').val();
            var district = $('#regDistrict').val();
            var state = $('#regState').val();
            var pos = $('#regPostcode').val();
            var country = $('#regCountry').val();
            var phone = $('#regPhone').val();
            var email = $('#regEmail').val();
            var bank = $('#inputBank').val();
            var account = $('#inputAccount').val();
            var input = {
                name: tenant_name,
                add1: add1,
                add2: add2,
                town: town,
                district: district,
                state: state,
                country: country,
                pos: pos,
                phone: phone,
                email: email,
                bank : bank,
                account : account
            };

            $.ajax({
                type: 'POST',
                data: input,
                timeout: 60000,
                url: "tenant_info/tenant_update.jsp",
                dataType: 'json',
                success: function (data, textStatus, jqXHR) {
                    bootbox.alert(data.msg, function () {
                        if (data.isValid) {
                            location.reload();
                        }
                    });

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("Oops! " + errorThrown);
                },
                complete: function (jqXHR, textStatus) {
                    destroyScreenLoading();
                }
            });
        }


    });

    function setAllData() {
        var arrData = $('#tnt_hidden').val().split("|");

        initFlexData("regPostcode", "regPostcodeMatch", "control/getDetailFlexList.jsp", arrData[3], "0079");
        $('#regPostcode-flexdatalist').val(arrData[12]);
        
        initFlexData("regTown", "regTownMatch", "control/getDetailFlexList.jsp", arrData[4], "0003");
        $('#regTown-flexdatalist').val(arrData[13]);
        
        initFlexData("regDistrict", "regDistrictMatch", "control/getDetailFlexList.jsp", arrData[5], "0078");
        $('#regDistrict-flexdatalist').val(arrData[14]);
        
        initFlexData("regState", "regStateMatch", "control/getDetailFlexList.jsp", arrData[6], "0002");
        $('#regState-flexdatalist').val(arrData[15]);
        
        initFlexData("regCountry", "regCountryMatch", "control/getDetailFlexList.jsp", arrData[7], "0001");
        $('#regCountry-flexdatalist').val(arrData[16]);

        setBank(arrData[10]);

        $('#regName').val(arrData[0]);
        $('#regAddress1').val(arrData[1]);
        $('#regAddress2').val(arrData[2]);
        $('#regPhone').val(arrData[8]);
        $('#regEmail').val(arrData[9]);
        $("#inputAccount").val(arrData[11]);
    }

    setAllData();

</script>

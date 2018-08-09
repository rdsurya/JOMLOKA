
<%--<%@page import="dBConn.Conn"%>--%>
<%--<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    //for select box items
    String eliCat4 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0063' AND hfc_cd = '" + hfc + "' and status ='0'";
    String eliType4 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0034' AND hfc_cd = '" + hfc + "' and status ='0'";
    String gender4 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0041' AND hfc_cd = '" + hfc + "' and status ='0'";
    String marital4 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0006' AND hfc_cd = '" + hfc + "' and status ='0'";
    String race4 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0004' AND hfc_cd = '" + hfc + "' and status ='0'";
    String religion4 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0005' AND hfc_cd = '" + hfc + "' and status ='0'";
    String idType4 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0012' AND hfc_cd = '" + hfc + "' and status ='0'";
    String bloodty4 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0074' AND hfc_cd = '" + hfc + "' and status ='0'";
    String rhesus4 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0017' AND hfc_cd = '" + hfc + "' and status ='0'";
    String allergy4 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0075' AND hfc_cd = '" + hfc + "' and status ='0'";
    String chronicDesease4 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0076' AND hfc_cd = '" + hfc + "' and status ='0'";
    String organDonor4 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0077' AND hfc_cd = '" + hfc + "' and status ='0'";
    String payerGroup = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0055' AND hfc_cd = '" + hfc + "' and status ='0'";
    String personType = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0106' AND hfc_cd = '" + hfc + "' and status ='0'";

    ArrayList<ArrayList<String>> dataEliCat4, dataEliType4, dataIdType4, dataGender4, dataMarital4, dataRace4, dataNationality4, dataReligion4, dataTitle4,
            dataBloodty4, dataRhesus4, dataAllergy4, dataChronicDesease4, dataOrganDonor4, dataDistrict4, dataPostcode4, dataCountry4, dataTown4, dataState4, datapayer, datapersontype;

    dataEliCat4 = conn.getData(eliCat4);
    dataEliType4 = conn.getData(eliType4);
    dataGender4 = conn.getData(gender4);
    dataMarital4 = conn.getData(marital4);
    dataRace4 = conn.getData(race4);
    dataReligion4 = conn.getData(religion4);
    dataIdType4 = conn.getData(idType4);
    dataBloodty4 = conn.getData(bloodty4);
    dataRhesus4 = conn.getData(rhesus4);
    dataAllergy4 = conn.getData(allergy4);
    dataChronicDesease4 = conn.getData(chronicDesease4);
    dataOrganDonor4 = conn.getData(organDonor4);
    datapayer = conn.getData(payerGroup);
    datapersontype = conn.getData(personType);


%>

<div class="row">
    <div class="col-md-12">
        <h4>Patient Information</h4>
        <form style=" margin: 0 auto;" class="form-horizontal" id="formPMI" autocomplete="off">
            <div class="row">
                <div class="col-md-12">
                    <center>
                        <div class="form-group">
                            <div style="width: 50%; margin: 0 auto">
                                <div id="my_camera"></div>
                            </div>
                        </div>
                    </center>
                </div>
                <script>

                    Webcam.set({
                        width: 320,
                        height: 240,
                        dest_width: 640,
                        dest_height: 480,
                        image_format: 'jpeg',
                        jpeg_quality: 90,
                        force_flash: false
                    });
                    var elementFile = document.getElementById('my_camera');
                    function start_camera() {
                        var x = $('#btncamera').text();
                        if (x === "Open Camera") {
                            Webcam.attach('#my_camera');
                            document.getElementById('my_camera').scrollIntoView();
                            $('#btncamera').text("Take Picture");
                        } else if (x === "Take Picture") {
                            Webcam.snap(function (data_uri) {
                                document.getElementById('dym2').innerHTML = '<img id="myImage2" src="' + data_uri + '"/>';
                            });
                            Webcam.reset();
                            elementFile.removeAttribute("style");
                            $('#btncamera').text("Open Camera");
                        }
                    }
                    function close_camera() {
                        Webcam.reset();
                        elementFile.removeAttribute("style");
                        $('#btncamera').text("Open Camera");
                    }
                </script>
            </div>
            <div class="row">
                <!-- Text input-->
                <div class="col-md-12">
                    <center>
                        <div class="form-group">
                            <div style="width: 50%; margin: 0 auto">
                                <div id="dym2">
                                </div>
                            </div>
                        </div>
                    </center>
                    <div class="form-group">
                        <div style="width: 50%; margin: 0 auto">
                            <input class="form-control" id="inputFileToLoad2" type="file" accept=".jpg, .png, .gif">
                        </div>
                    </div>
                    <center>
                        <div class="form-group">
                            <div style="width: 50%; margin: 0 auto"><a id="btncamera" href="javascript:void(start_camera())">Open Camera</a></div>
                        </div>
                    </center>
                    <center>
                        <div class="form-group">
                            <div style="width: 50%; margin: 0 auto"><a href="javascript:void(close_camera())">Close Camera</a></div>
                        </div>
                    </center>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">PMI No. *</label>
                        <div class="col-md-6">
                            <div class="input-group">
                                <input id="PMIpmino" name="PMIpmino" type="text" placeholder="Generate the PMI number manually" class="form-control input-md" readonly>
                                <span class="input-group-btn">
                                    <button class="btn btn-primary form-control" id="PMI_btnGenerate">Generate PMI</button>
                                </span>
                            </div>

                        </div>
                    </div>                  

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Nationality *</label>
                        <div class="col-md-6">

                            <input id="PMInational" name="textinput" type="text" placeholder="select nationality.." class="form-control input-md">
                            <input id="PMInationalCODE" type="hidden" class="form-control input-md">
                            <div id="matchnational" class="search-drop"></div>
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group" id="PMIprimary_idty_div">
                        <label class="col-md-4 control-label" for="selectbasic">Primary ID Type *</label>
                        <div class="col-md-6">
                            <select id="PMIprimary_idty" name="selectbasic" class="form-control">

                            </select>
                        </div>
                    </div>

                    <!-- Text input; Previously known as New IC No-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Primary ID Number *</label>
                        <div class="col-md-6">
                            <input id="PMInic" name="PMInic" type="text" placeholder="Enter IC No/ Passport No/ Military ID" class="form-control input-md" maxlength="12">
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Secondary ID Type *</label>
                        <div class="col-md-6">
                            <select id="PMIidty" name="selectbasic" class="form-control">

                            </select>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Secondary ID Number *</label>
                        <div class="col-md-6">
                            <input id="PMIino" name="textinput" type="text" placeholder="" class="form-control input-md" maxlength="10">
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Salutation *</label>
                        <div class="col-md-6">

                            <input id="PMItitle" name="textinput" type="text" placeholder="Seacrh salutation" class="form-control input-md">
                            <input id="PMItitleCODE" name="PMIhstateCODE" type="hidden" class="form-control input-md">
                            <div id="matchtitle" class="search-drop"></div>
                        </div>
                    </div>


                    <!-- Text input-->
                    <div class="form-group hidden">
                        <label class="col-md-4 control-label" for="textinput">Temporary PMI No.</label>
                        <div class="col-md-6">
                            <input id="PMIpminotemp" name="textinput" type="text" placeholder="" class="form-control input-md">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Name *</label>
                        <div class="col-md-6">
                            <input id="PMIpname" name="PMIpname" type="text" placeholder="" class="form-control input-md" required maxlength="80">
                        </div>
                    </div>  

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Date of Birth *</label>
                        <div class="col-md-6">
                            <input id="PMIbday" name="textinput" type="text" class="form-control input-md" required="">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group hidden">
                        <label class="col-md-4 control-label" for="textinput">Old IC No.</label>
                        <div class="col-md-6">
                            <input id="PMIoic" name="PMIoic" type="text" placeholder="" class="form-control input-md" maxlength="8">
                        </div>
                    </div>

                </div>

                <!--  end of first half     end of first half        end of first half-->

                <div class="col-md-6">

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Martial Status *</label>
                        <div class="col-md-6">
                            <select id="PMImarital" name="selectbasic" class="form-control">
                                <option value="null" selected="" disabled="">Select Martial Status</option>
                                <option value="-">-</option>
                                <%                                    for (int i = 0;
                                            i < dataMarital4.size();
                                            i++) {%>
                                <option value="<%=dataMarital4.get(i).get(1)%>"><%=dataMarital4.get(i).get(2)%></option>
                                <%  }
                                %>
                            </select>
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Gender *</label>
                        <div class="col-md-6">
                            <select id="PMIsex" name="selectbasic" class="form-control">
                                <option value="null" selected="" disabled="">Select Gender</option>
                                <%
                                    for (int i = 0;
                                            i < dataGender4.size();
                                            i++) {%>
                                <option value="<%=dataGender4.get(i).get(1)%>"><%=dataGender4.get(i).get(2)%></option>
                                <%  }
                                %>
                            </select>
                        </div>
                    </div>        

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Religion *</label>
                        <div class="col-md-6">
                            <select id="PMIreligion" name="selectbasic" class="form-control">
                                <option value="null" selected="" disabled="">Select Religion</option>
                                <option value="-">-</option>
                                <%
                                    for (int i = 0;
                                            i < dataReligion4.size();
                                            i++) {%>
                                <option value="<%=dataReligion4.get(i).get(1)%>"><%=dataReligion4.get(i).get(2)%></option>
                                <%  }
                                %>
                            </select>
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Race *</label>
                        <div class="col-md-6">
                            <select id="PMIrace" name="selectbasic" class="form-control">
                                <option value="null" selected="" disabled="">Select Race</option>
                                <option value="-">-</option>
                                <%
                                    for (int i = 0;
                                            i < dataRace4.size();
                                            i++) {%>
                                <option value="<%=dataRace4.get(i).get(1)%>"><%=dataRace4.get(i).get(2)%></option>
                                <%  }
                                %>
                            </select>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Payer group </label>
                        <div class="col-md-6">
                            <select id="PMIpg" name="selectbasic" class="form-control">
                                <option value="null" selected="" disabled="">Select payer group</option>
                                <%                                        for (int i = 0; i < datapayer.size(); i++) {%>
                                <option value="<%=datapayer.get(i).get(1)%>"><%=datapayer.get(i).get(2)%></option>
                                <%  }
                                %>
                            </select>
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Eligibility Type </label>
                        <div class="col-md-6">
                            <select id="PMIelity" name="selectbasic" class="form-control">
                                <option value="null" selected="" disabled="">Select Eligibility Type</option>
                                <option value="-">-</option>
                                <%
                                    for (int i = 0;
                                            i < dataEliType4.size();
                                            i++) {%>
                                <option value="<%=dataEliType4.get(i).get(1)%>"><%=dataEliType4.get(i).get(2)%></option>
                                <%  }
                                %>
                            </select>
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Eligibility Category </label>
                        <div class="col-md-6">
                            <select id="PMIelicat" name="selectbasic" class="form-control">
                                <option value="null" selected="" disabled="">Select Eligibility Category</option>
                                <option value="-">-</option>
                                <%
                                    for (int i = 0;
                                            i < dataEliCat4.size(); i++) {%>
                                <option value="<%=dataEliCat4.get(i).get(1)%>"><%=dataEliCat4.get(i).get(2)%></option>
                                <%  }
                                %>
                            </select>
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Person Type </label>
                        <div class="col-md-6">
                            <select id="PMIperty" name="selectbasic" class="form-control">
                                <option value="null" selected="" disabled="">Select type</option>
                                <%
                                    for (int i = 0;
                                            i < datapersontype.size();
                                            i++) {%>
                                <option value="<%=datapersontype.get(i).get(1)%>"><%=datapersontype.get(i).get(2)%></option>
                                <%  }
                                %>
                            </select>
                        </div>
                    </div>        
                </div>
            </div>

            <hr/>
            <h4>Medical Information</h4>

            <div class="row">
                <div class="col-md-6">
                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Blood Type</label>
                        <div class="col-md-6">
                            <select id="PMIblood" name="selectbasic" class="form-control">
                                <option value="null" selected="" disabled="">Select Blood Type</option>
                                <option value="-">-</option>
                                <%
                                    for (int i = 0;
                                            i < dataBloodty4.size();
                                            i++) {%>
                                <option value="<%=dataBloodty4.get(i).get(1)%>"><%=dataBloodty4.get(i).get(2)%></option>
                                <%  }
                                %>
                            </select>
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Blood Rhesus</label>
                        <div class="col-md-6">
                            <select id="PMIrhesus" name="selectbasic" class="form-control">
                                <option value="null" selected="" disabled="">Select Blood Rhesus</option>
                                <option value="-">-</option>
                                <%
                                    for (int i = 0;
                                            i < dataRhesus4.size();
                                            i++) {%>
                                <option value="<%=dataRhesus4.get(i).get(1)%>"><%=dataRhesus4.get(i).get(2)%></option>
                                <%  }
                                %>
                            </select>
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Allergy</label>
                        <div class="col-md-6">
                            <select id="PMIallergy" name="selectbasic" class="form-control">
                                <option value="null"  disabled="">Select Allergy</option>
                                <option value="-">-</option>
                                <%
                                    for (int i = 0; i < dataAllergy4.size(); i++) {
                                        if (dataAllergy4.get(i).get(2).equalsIgnoreCase("no")) {%>
                                <option value="<%=dataAllergy4.get(i).get(1)%>" selected=""><%=dataAllergy4.get(i).get(2)%></option>
                                <%         } else {%>
                                <option value="<%=dataAllergy4.get(i).get(1)%>"><%=dataAllergy4.get(i).get(2)%></option>
                                <%                }
                                %>

                                <%  }
                                %>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Chronic Disease</label>
                        <div class="col-md-6">
                            <select id="PMIchronic" name="selectbasic" class="form-control">
                                <option value="null" selected="" disabled="">Select Chronic Disease</option>
                                <option value="-">-</option>
                                <%
                                    for (int i = 0; i < dataChronicDesease4.size(); i++) {
                                        if (dataChronicDesease4.get(i).get(2).equalsIgnoreCase("no")) {%>
                                <option value="<%=dataChronicDesease4.get(i).get(1)%>" selected=""><%=dataChronicDesease4.get(i).get(2)%></option>
                                <%       } else {%>
                                <option value="<%=dataChronicDesease4.get(i).get(1)%>" ><%=dataChronicDesease4.get(i).get(2)%></option>

                                <%  }
                                %> 

                                <%  }
                                %>
                            </select>
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Organ Donor</label>
                        <div class="col-md-6">
                            <select id="PMIorgan" name="selectbasic" class="form-control">
                                <option value="null" selected="" disabled="">Select Organ Donor Status</option>
                                <option value="-">-</option>
                                <%
                                    for (int i = 0; i < dataOrganDonor4.size(); i++) {
                                        if (dataOrganDonor4.get(i).get(2).equalsIgnoreCase("cancelled")) {%>
                                <option value="<%=dataOrganDonor4.get(i).get(1)%>" selected=""><%=dataOrganDonor4.get(i).get(2)%></option>

                                <% } else {%>
                                <option value="<%=dataOrganDonor4.get(i).get(1)%>"><%=dataOrganDonor4.get(i).get(2)%></option>

                                <%   }


                                %>
                                <%  }
                                %>
                            </select>
                        </div>
                    </div>
                </div>
            </div>

            <hr/>
            <h4>Patient Contact</h4>

            <div class="row">
                <div class="col-md-6">
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Home Address *</label>
                        <div class="col-md-6">
                            <textarea  id="PMIhadd" name="textinput" type="text" placeholder="" class="form-control input-md"></textarea>
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Home District</label>
                        <div class="col-md-6">

                            <input id="PMIhdis" name="textinput" type="text" placeholder="select district.." class="form-control input-md">
                            <input id="PMIhdisCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                            <div id="matchHdis" class="search-drop"></div>
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Home Town</label>
                        <div class="col-md-6">

                            <input id="PMIhtown" name="textinput" type="text" placeholder="select town.." class="form-control input-md">
                            <input id="PMIhtownCODE" name="PMIhstateCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                            <div id="matchHtown" class="search-drop"></div>
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Home Postcode</label>
                        <div class="col-md-6">

                            <input id="PMIhpostcode" name="textinput" type="text" placeholder="select postcode.." class="form-control input-md">
                            <input id="PMIhpostcodeCODE" name="PMIhstateCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                            <div id="matchHpostcode" class="search-drop"></div>
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Home State</label>
                        <div class="col-md-6">

                            <input id="PMIhstate" name="textinput" type="text" placeholder="select state.." class="form-control input-md">
                            <input id="PMIhstateCODE" name="PMIhstateCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                            <div id="matchHstate" class="search-drop"></div>
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Home Country</label>
                        <div class="col-md-6">
                            <!--                                <input id="PMIhcountry" class="form-control input-md">-->
                            <input id="PMIhcountry" name="textinput" type="text" placeholder="select country.." class="form-control input-md">
                            <input id="PMIhcountryCODE" name="PMIhcountryCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                            <div id="matchHcountry" class="search-drop"></div>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Phone</label>
                        <div class="col-md-6">
                            <input id="PMIhphone" name="textinput" type="text" placeholder="" class="form-control input-md">
                        </div>
                    </div>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Mobile *</label>
                        <div class="col-md-6">
                            <input id="PMIhandphone" name="textinput" type="text" placeholder="" class="form-control input-md">
                        </div>
                    </div>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Email Address</label>
                        <div class="col-md-6">
                            <input id="PMIemail" name="textinput" type="text" placeholder="" class="form-control input-md">
                        </div>
                    </div>

                </div>
                <div class="col-md-6">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Postal Address</label>
                        <div class="col-md-6">
                            <textarea  id="PMIpadd" name="textinput" type="text" placeholder="" class="form-control input-md"></textarea>
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Postal District</label>
                        <div class="col-md-6">

                            <input id="PMIpdis" name="textinput" type="text" placeholder="select district.." class="form-control input-md">
                            <input id="PMIpdisCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                            <div id="matchPdis" class="search-drop"></div>
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Postal Town</label>
                        <div class="col-md-6">

                            <input id="PMIptown" name="textinput" type="text" placeholder="select town.." class="form-control input-md">
                            <input id="PMIptownCODE" name="PMIhstateCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                            <div id="matchPtown" class="search-drop"></div>
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Postal Postcode</label>
                        <div class="col-md-6">

                            <input id="PMIppostcode" name="textinput" type="text" placeholder="select postcode.." class="form-control input-md">
                            <input id="PMIppostcodeCODE" name="PMIhstateCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                            <div id="matchPpostcode" class="search-drop"></div>

                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Postal State</label>
                        <div class="col-md-6">

                            <input id="PMIpstate" name="textinput" type="text" placeholder="select state.." class="form-control input-md">
                            <input id="PMIpstateCODE" name="PMIhstateCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                            <div id="matchPstate" class="search-drop"></div>
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Postal Country</label>
                        <div class="col-md-6">

                            <input id="PMIpcountry" name="textinput" type="text" placeholder="select country.." class="form-control input-md">
                            <input id="PMIpcountryCODE" name="PMIhcountryCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                            <div id="matchPcountry" class="search-drop"></div>
                        </div>
                    </div>                   

                </div>
            </div>
            <hr/>
            <div class="text-right">
                <!--                    <button class="btn btn-primary " type="button" disabled="">Save</button>-->

                <!--                    <button class="btn btn-default " type="button"> Appointment List</button>-->
                <button class="btn btn-link btn-lg" type="button" id="clearPMI">Clear</button>
                <button class="btn btn-primary btn-lg " type="button" id="updatePatient">Save</button>
            </div>
        </form>
    </div>
</div>

<script>

    var PMI_optIDType;

    $(function () {
        var preNationalityCode = $('#PMInationalCODE').val();

        $('#PMInational').on('blur', function () {
            setTimeout(function () {
                var curNationalityCode = $('#PMInationalCODE').val();
                if (preNationalityCode !== curNationalityCode) {
                    //set the ID type
                    var nation = $('#PMInational').val();
                    PMI_listPrimaryIDType(nation, null, null);

                }
            }, 500);

        });

        $('#PMInational').blur();

        $("#PMIprimary_idty").on("change", function () {
            $("#PMIidty").children('option').remove();
            var addoptarr = [];
            for (var i = 0; i < PMI_optIDType.length; i++) {
                if (PMI_optIDType[i].value.indexOf($(this).val()) < 0) {
                    addoptarr.push(PMI_optIDType[i].option);
                }
            }
            $("#PMIidty").html(addoptarr.join(''));
        });


    });//end ready function


    function PMI_listPrimaryIDType(national, p_idty, s_idty) {
        var input = {
            nation: national
        };
        createScreenLoading();
        $.ajax({
            type: 'POST',
            url: "controller/getIDType.jsp",
            data: input,
            dataType: 'json',
            timeout: 60000,
            success: function (data, textStatus, jqXHR) {
                $('#PMIprimary_idty').html("");
                data.forEach(function (item)
                {
                    $('#PMIprimary_idty').append("<option value='" + item.value + "'>" + item.name + "</option>");
                });

                PMI_optIDType = $("#PMIprimary_idty").children('option').map(function () {
                    return {
                        "value": this.value,
                        "option": "<option value='" + this.value + "'>" + this.text + "</option>"
                    };
                });


                if (p_idty != null) {
                    $('#PMIprimary_idty').val(p_idty);
                }

                $('#PMIprimary_idty').change();
                if (s_idty != null) {
                    $("#PMIidty").val(s_idty);
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Error: " + errorThrown);
            },
            complete: function (jqXHR, textStatus) {
                destroyScreenLoading();
            }
        });
    }
</script>
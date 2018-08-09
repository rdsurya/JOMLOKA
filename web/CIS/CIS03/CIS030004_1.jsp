<%-- 
    Document   : CIS030003_1
    Created on : 29-Mar-2017, 17:35:03
    Author     : ahmed
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="java.util.ArrayList"%>

<%
//    Config.getBase_url(request);
//    Config.getFile_url(session);

    //String pmiNo = "";//session.getAttribute("patientPMINo").toString();
    String pmiNo = session.getAttribute("patientPMINo").toString();
    Conn conn = new Conn();
    String sql = "";
    String sql2 = "";
    sql = "select w.pmi_no,w.episode_date,h.hfc_name,d.discipline_name from wis_inpatient_episode w inner join adm_health_facility h on w.hfc_cd = h.hfc_cd inner join  adm_discipline d on w.discipline_cd = d.discipline_cd where w.pmi_no = '" + pmiNo + "'AND w.inpatient_status = '1' group by w.episode_date order by w.episode_date desc;";
    sql2 = "select p.pmi_no,p.episode_date,h.hfc_name,d.discipline_name from pms_episode p inner join adm_health_facility h on p.`HEALTH_FACILITY_CODE` = h.hfc_cd inner join  adm_discipline d on p.DISCIPLINE_CODE = d.discipline_cd where p.pmi_no = '" + pmiNo + "' and p.`STATUS` = '1' group by p.`EPISODE_DATE` ORDER BY p.`EPISODE_DATE` desc;";
    //   q                             0      1            2              3               4               5                6            7          8               9           10          11             12              13   
  
    ArrayList<ArrayList<String>> searchInpatient;
    searchInpatient = conn.getData(sql);

    ArrayList<ArrayList<String>> searchOutpatient;
    searchOutpatient = conn.getData(sql2);



%>
<div class="row">
    <div class="col-md-12">
        <h4 style="padding: 0px;"><strong>ACTIVE DRUG LIST</strong></h4><br/>
        <div id="table_active_drug">

        </div>
    </div>
</div>
                </br>
                </br>
<div class="row">
    <div class="col-md-12">
        <h4 style="padding: 0px;">PREVIOUS VISIT (INPATIENT EPISODE) <% //out.print(pmiNo);%></h4><br/>
        <div id="inpatientdrug" >
            <table id="inPatientDrug" class="table table-striped table-bordered" cellspacing="0" width="100%">
                <thead>  
                    <tr>
                        <th class="col-sm-1">Episode Date</th>
                        <th class="col-sm-1">Health Care Facility</th>
                        <th class="col-sm-1">Discipline Name</th>
                        <th class="col-sm-1">Action</th>				 
                    </tr>
                </thead>

                <tbody id="inpatientdrug">
                    <%
                        if (searchInpatient.size() > 0) {
                            for (int i = 0; i < searchInpatient.size(); i++) {

                    %>
                    <tr>
                        <td><%=searchInpatient.get(i).get(1)%>
                            <input type="hidden" id="pmidrug" value="<%=searchInpatient.get(i).get(0)%>">
                            <input type="hidden" id="episodedrug" value="<%=searchInpatient.get(i).get(1)%>">
                            <input type="hidden" id="disciplinedrug" value="<%=searchInpatient.get(i).get(3)%>">
                        </td>
                        <td><%=searchInpatient.get(i).get(2)%></td>
                        <td><%=searchInpatient.get(i).get(3)%></td>
                        <td><a href="#inpatientProblemDrug" id="inBtndrug" name="ViewDetail" class="btn btn-default" type="button" role="button">View Details</a></td>
                    </tr>
                    <%}
                        }%>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="row">
    <hr/>
    <div class="col-md-12">
        <h4 style="padding: 0px;">PREVIOUS VISIT (OUTPATIENT EPISODE)</h4><br/>
        <div id="outpatientdrug">
            <table id="outPatientDrug"  class="table table-striped table-bordered" cellspacing="0" width="100%">
                <thead>  
                    <tr>
                        <th class="col-sm-1">Episode Date</th>
                        <th class="col-sm-1">Health Care Facility</th>
                        <th class="col-sm-1">Discipline Name</th>
                        <th class="col-sm-1">Action</th>				 
                    </tr>
                </thead>

                <tbody id="outpatientdrug">
                    <%
                        if (searchOutpatient.size() > 0) {
                            for (int i = 0; i < searchOutpatient.size(); i++) {

                    %>
                    <tr>
                        <td><%=searchOutpatient.get(i).get(1)%>
                            <input type="hidden" id="pmi1drug" value="<%=searchOutpatient.get(i).get(0)%>">
                            <input type="hidden" id="episode1drug" value="<%=searchOutpatient.get(i).get(1)%>">
                            <input type="hidden" id="discipline1drug" value="<%=searchOutpatient.get(i).get(3)%>">
                        </td>
                        <td><%=searchOutpatient.get(i).get(2)%></td>
                        <td><%=searchOutpatient.get(i).get(3)%></td>       
                        <td>
                            <a href="#outpatientProblemDrug" id="outBtndrug" name="ViewDetail" class="btn btn-default" type="button" role="button">View Details</a>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
            <script type="text/javascript">
                $(document).ready(function () {
                    $('#inPatientDrug').DataTable();
                    $('#outPatientDrug').DataTable();
                    $('#tableActiveDrugList').DataTable();
                });
            </script>
        </div>
    </div>
</div>

<div  id="inpatientProblemDrug">

</div>

<div  id="outpatientProblemDrug">

</div>
<script type="text/javascript">
    $("#table_active_drug").load("CIS03/CIS030004_drugTable.jsp");

    $('#inpatientdrug').on('click', '#inBtndrug', function () {
        var row = $(this).closest("tr");
        var pmi_no = row.find("#pmidrug").val();
        var episodeDate = row.find("#episodedrug").val();
        var discipline = row.find("#disciplinedrug").val();

        $.ajax({
            type: 'post',
            data: {pmi_no: pmi_no, episodeDate: episodeDate, discipline: discipline},
            url: 'search/searchInpatient.jsp',
            timeout: 10000,
            success: function (getData) {
                if (getData.trim() === "1") {
                    alert("No Medication!");
                    $('#inpatientProblemDrug').html("");
                } else {
                    $('#inpatientProblemDrug').html(getData);
                }
            }});

    });
    
    $("#table_active_drug").on('click','#tableActiveDrugList #btnDeleteActivDrug',function(){
        var row = $(this).closest("tr");
        var pmi_no = row.find("#pmidrug").val();
        var drug_code = row.find("#drugcodedrug").val();
        var drug_onset = row.find("#drugonsetDate").text();
        var data = {
            pmi_no:pmi_no,
            drug_code:drug_code,
            drug_onset:drug_onset
        }
      
        bootbox.confirm("This is the default confirm!", function(result)
        { 
            console.log('This was logged in the callback: ' + result); 
            if(result === true){
                deleteActiveDrug(data);
             
            }else{
               return false;
            }
        });

    })
    
    function deleteActiveDrug(data){
        $.ajax({
            type:'post',
            data:data,
            url:'search/ResultDeleteActiveDrugOutPatient.jsp',
            timeout: 10000,
            success:function(r){
                if(r.trim() === "|-SUCCESS-|"){
                    
                    $("#table_active_drug").load("CIS03/CIS030004_drugTable.jsp");
                    
                    bootbox.alert("Delete Success");
                }else{
                   bootbox.alert("Delete Fail");
                   
                   
                }
            }
            
        })
    }
</script>
<script type="text/javascript">
    $('#outpatientdrug').on('click', '#outBtndrug', function () {
        var row = $(this).closest("tr");
        var pmi_no = row.find("#pmi1drug").val();
        var episodeDate = row.find("#episode1drug").val();
        var discipline = row.find("#discipline1drug").val();

        $.ajax({
            type: 'post',
            data: {pmi_no: pmi_no, episodeDate: episodeDate, discipline: discipline},
            url: 'search/searchOutpatientDrug.jsp',
            timeout: 10000,
            success: function (getData) {
                //console.log(getData);
                if (getData.trim() === "1") {
                    alert("No Medication!");
                    $('#outpatientProblemDrug').html("");
                } else {
                    $('#outpatientProblemDrug').html(getData);
                }
            }});

    });
    
    $("#outpatientProblemDrug").on('click','#detailDrugList #btnAddActivDrug',function(){
        var row = $(this).closest("tr");
        var drugcode = row.find("#idDrugOutPatient").val();
        var pmino =row.find("#idDrugOutPatientpmino").val();
        var episodedate =row.find("#idDrugOutPatientepisodedate").val();
        var discipline=row.find("#idDrugOutPatientdiscipline").val();
        var subdiscipline=row.find("#idDrugOutPatientsubdiscipline").val();
        var hfc=row.find("#idDrugOutPatienthfc").val();
        
        var doctor = "<%=session.getAttribute("USER_ID")%>";
        //alert(drugcode+" "+pmino+" "+episodedate+" "+discipline+" "+subdiscipline+" "+hfc+" "+doctor);
        var data = {pmino:pmino,
            episodedate:episodedate,
            discipline:discipline,
            subdiscipline:subdiscipline,
            hfc:hfc,
            doctor:doctor,
        drugcode:drugcode}; 
        
        $.ajax({
           type: 'post',
           data:data,
           url:'search/ResultAddActiveDrugOutPatient.jsp',
           success: function(databack){
               console.log(databack);
               if($.trim(databack)==="already"){
                   alert("This drug already Active");
                   
               }else if($.trim(databack)==="success"){
                   alert("Success activating the drug");
                   $("#table_active_drug").load("CIS03/CIS030004_drugTable.jsp");
               }else if($.trim(databack)==="fail"){
                   alert("Fail activating the drug");
               }
           }
        });
        
    });


</script>
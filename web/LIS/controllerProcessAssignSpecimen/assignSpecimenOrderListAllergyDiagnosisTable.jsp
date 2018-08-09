<%-- 
    Document   : assignSpecimenOrderListAllergyDiagnosisTable
    Created on : Jan 13, 2018, 1:20:56 PM
    Author     : Shammugam
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>




<%
    Conn conn = new Conn();
    String pmino = request.getParameter("pmino");

    String allergyList = "select lhr_allergy.pmi_no,lhr_allergy.hfc_cd,lhr_allergy.episode_date,lhr_allergy.encounter_cd,lhr_allergy.allergy_cd,icd10_codes.icd10_desc,lhr_allergy.comment,adm_health_facility.hfc_name"
            + " FROM lhr_allergy JOIN icd10_codes ON (lhr_allergy.allergy_cd = icd10_codes.icd10_code) JOIN adm_health_facility ON (lhr_allergy.hfc_cd = adm_health_facility.hfc_cd) "
            + " where lhr_allergy.pmi_no = '" + pmino + "' ";

    ArrayList<ArrayList<String>> dataAllergyList;
    dataAllergyList = conn.getData(allergyList);


%>

<table class="table table-filter table-striped table-bordered dt-head-right" style="background: #fff; border: 1px solid #ccc; width: 100%; text-align: left" id="patientAllergyListTable">
    <thead>
    <th style="display: none;text-align: left;">PMI NO</th>
    <th style="display: none;text-align: left;">HFC CODE</th>
    <th style="text-align: left;">HFC NAME</th>
    <th style="text-align: left;">EPISODE DATE</th>
    <th style="text-align: left;">ENCOUNTER DATE</th>
    <th style="text-align: left;">DIAGNOSIS CODE</th>
    <th style="text-align: left; width: 50%;">DIAGNOSIS DESCRIPTION</th>
    <th style="text-align: left; width: 20%;">COMMENT</th>
</thead>
<tbody>
    <%        for (int i = 0; i < dataAllergyList.size(); i++) {

    %>
    <tr style="text-align: left;">
<input id="dataPatientAllergyListhidden" type="hidden" value="<%=String.join("|", dataAllergyList.get(i))%>">
<td style="display: none"><%= dataAllergyList.get(i).get(0)%></td> <!-- PMI No -->
<td style="display: none"><%= dataAllergyList.get(i).get(1)%></td> <!-- HFC Code -->
<td  ><%= dataAllergyList.get(i).get(7)%></td> <!-- HFC Name -->
<td ><%= dataAllergyList.get(i).get(2)%></td> <!-- EPISODE DATE -->
<td ><%= dataAllergyList.get(i).get(3)%></td> <!-- ENCOUNTER DATE -->
<td ><%= dataAllergyList.get(i).get(4)%></td> <!-- DIAGNOSIS CODE -->
<td style="font-weight: 500"><%= dataAllergyList.get(i).get(5)%> </td> <!-- DIAGNOSIS DESCRIPTION -->
<td ><%= dataAllergyList.get(i).get(6)%></td> <!-- COMMENT -->
</tr>

<%  }
%>

</tbody>
</table>




<ShammugamRamasamySeperator></ShammugamRamasamySeperator>




<%
    String diagnosisList = "select lhr_diagnosis.PMI_no,lhr_diagnosis.HFC_Cd,lhr_diagnosis.Episode_Date,lhr_diagnosis.Encounter_Date,lhr_diagnosis.Diagnosis_Cd,icd10_codes.icd10_desc,lhr_diagnosis.Comment,adm_health_facility.hfc_name "
            + " FROM lhr_diagnosis JOIN icd10_codes ON (lhr_diagnosis.Diagnosis_Cd = icd10_codes.icd10_code ) JOIN adm_health_facility ON (lhr_diagnosis.HFC_Cd = adm_health_facility.hfc_cd) "
            + " where lhr_diagnosis.PMI_no = '" + pmino + "' ORDER BY lhr_diagnosis.Episode_Date DESC LIMIT 3";

    ArrayList<ArrayList<String>> dataDiagnosisList;
    dataDiagnosisList = conn.getData(diagnosisList);


%>

<table class="table table-filter table-striped table-bordered dt-head-right" style="background: #fff; border: 1px solid #ccc; width: 100%; text-align: left" id="patientDiagnosisListTable">
    <thead>
    <th style="display: none;text-align: left;">PMI NO</th>
    <th style="display: none;text-align: left;">HFC CODE</th>
    <th style="text-align: left;">HFC NAME</th>
    <th style="text-align: left;">EPISODE DATE</th>
    <th style="text-align: left;">ENCOUNTER DATE</th>
    <th style="text-align: left;">DIAGNOSIS CODE</th>
    <th style="text-align: left; width: 50%;">DIAGNOSIS DESCRIPTION</th>
    <th style="text-align: left; width: 20%;">COMMENT</th>
</thead>
<tbody>
    <%        for (int i = 0; i < dataDiagnosisList.size(); i++) {

    %>
    <tr style="text-align: left;">
<input id="dataPatientDiagnosisListhidden" type="hidden" value="<%=String.join("|", dataDiagnosisList.get(i))%>">
<td style="display: none"><%= dataDiagnosisList.get(i).get(0)%></td> <!-- PMI No -->
<td style="display: none"><%= dataDiagnosisList.get(i).get(1)%></td> <!-- HFC Code -->
<td  ><%= dataDiagnosisList.get(i).get(7)%></td> <!-- HFC Name -->
<td ><%= dataDiagnosisList.get(i).get(2)%></td> <!-- EPISODE DATE -->
<td ><%= dataDiagnosisList.get(i).get(3)%></td> <!-- ENCOUNTER DATE -->
<td ><%= dataDiagnosisList.get(i).get(4)%></td> <!-- DIAGNOSIS CODE -->
<td style="font-weight: 500"><%= dataDiagnosisList.get(i).get(5)%> </td> <!-- DIAGNOSIS DESCRIPTION -->
<td ><%= dataDiagnosisList.get(i).get(6)%></td> <!-- COMMENT -->
</tr>

<%  }
%>

</tbody>
</table>



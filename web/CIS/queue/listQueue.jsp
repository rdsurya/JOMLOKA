<%-- 
    Document   : listEmp
    Created on : Jan 20, 2017, 4:54:38 PM
    Author     : shay
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conn conn = new Conn();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String now = sdf.format(new Date());
    int row ;

    //amik kt session
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String doctor = session.getAttribute("USER_NAME").toString();
    String doctor_id = session.getAttribute("USER_ID").toString();
    String discipline = session.getAttribute("DISCIPLINE_CODE").toString();
    String subdicipline = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
//      String hfc = "04010101";
//      String doctor = "";
//    String sql = "SELECT e.PMI_NO,e.NAME,EPISODE_TIME,e.COMMON_QUEUE,e.DOCTOR,e.STATUS,q.QUEUE_NO FROM PMS_EPISODE e,PMS_PATIENT_QUEUE q WHERE e.EPISODE_DATE LIKE '%" + now + "%' AND e.STATUS NOT LIKE 'Discharge' AND q.PMI_NO=e.PMI_NO";
//    String newSql = "SELECT e.PMI_NO,e.name,e.EPISODE_TIME,e.COMMON_QUEUE,e.DOCTOR,e.STATUS,q.QUEUE_NO FROM PMS_EPISODE e,PMS_PATIENT_QUEUE q WHERE (e.STATUS NOT LIKE 'Discharge') AND ((e.EPISODE_DATE LIKE '%" + now + "%') AND  (q.PMI_NO=e.PMI_NO) AND e.HEALTH_FACILITY_CODE='" + hfc + "' AND e.EPISODE_DATE=q.episode_date)";
//    String newnewSql = "select e.pmi_no,e.name,e.episode_date,e.episode_time,e.common_queue,q.queue_no,e.doctor,e.status from pms_episode e,pms_patient_queue q where e.status !='Discharge' and e.EPISODE_DATE like '%" + now + "%' and e.HEALTH_FACILITY_CODE='" + hfc + "' and e.PMI_NO = q.pmi_no and e.EPISODE_DATE = q.episode_date";
    //String newnewnewsql ="select e.pmi_no,e.name,e.episode_date,e.episode_time,e.common_queue,q.queue_no,e.doctor,e.status,e.consultation_room from pms_episode e inner join pms_patient_queue q on q.pmi_no = e.pmi_no and q.episode_date = e.episode_date where e.status !='1' and e.EPISODE_DATE like '%" + now + "%' and e.HEALTH_FACILITY_CODE='" + hfc + "'";
    //String thesqlCIS ="select e.pmi_no,e.name,e.episode_date,e.episode_time,e.common_queue,q.queue_no,e.doctor,e.status,e.consultation_room from pms_episode e inner join pms_patient_queue q on q.pmi_no = e.pmi_no and q.episode_date = e.episode_date where e.status !='1' and e.EPISODE_DATE like '%" + now + "%' and e.HEALTH_FACILITY_CODE='" + hfc + "' and e.doctor = '"+ doctor +"'";
    String sql = "select q.pmi_no,e.name,q.episode_date,e.episode_time,q.queue_name,q.queue_no,e.doctor,l.description,e.consultation_room from pms_patient_queue q , pms_episode e,adm_lookup_detail l where l.`Master_Reference_code` ='0069' and l.`Detail_Reference_code` = q.status and e.pmi_no = q.pmi_no and e.episode_date = q.episode_date and e.`HEALTH_FACILITY_CODE` = q.hfc_cd and l.`hfc_cd` = '" + hfc + "' and q.episode_date like '%" + now + "%' and q.status !='1' and q.hfc_cd='" + hfc + "' AND (q.queue_type = 'CM' OR q.queue_name = '" + doctor + "') LIMIT 5";

                             //0    //1            //2                //3        //4         //5      //6           //7       //8
    String sqlV3 = "SELECT q.pmi_no,b.patient_name,q.episode_date,q.queue_name,q.queue_no,q.user_id,l.description,u.room_no,q.patient_category,x.description "
            + " from pms_patient_queue q "
            + " join pms_patient_biodata b on b.pmi_no = q.pmi_no"
            + " join adm_lookup_detail l on l.`Master_Reference_code` ='0069' and l.`Detail_Reference_code` = q.status and l.`hfc_cd` = '" + hfc + "'"
            + " left join adm_lookup_detail x on x.`Master_Reference_code` ='0033' and x.`Detail_Reference_code` = q.patient_category and x.`hfc_cd` = '" + hfc + "'"
            + " join adm_users u on u.user_id = q.user_id and u.health_facility_code = '" + hfc + "'"
            + " where q.user_id='" + doctor_id + "' AND q.episode_date like '%" + now + "%'   and q.status !='1' OR "
            + "(q.patient_category = '003' AND q.status != '1' AND q.status != '6' AND q.user_id='" + doctor_id + "') "
            + "and q.hfc_cd='" + hfc + "' and "
            + "((queue_type='PN' and queue_name='" + doctor + "') OR queue_type!='PN')  ORDER BY q.episode_date DESC";
    
    String sqlV4 = "SELECT q.pmi_no,b.patient_name,q.episode_date,q.queue_name,q.queue_no,q.user_id,l.description,q.hfc_cd,q.patient_category,x.description "
            + "FROM pms_patient_queue q "
            + "JOIN pms_patient_biodata b ON b.pmi_no = q.pmi_no "
            + "JOIN adm_lookup_detail l ON l.`Master_Reference_code` ='0069' "
            + "AND l.`Detail_Reference_code` = q.status AND l.`hfc_cd` = '" + hfc + "'" 
            + "LEFT JOIN adm_lookup_detail x ON x.`Master_Reference_code` ='0033' "
            + "AND x.`Detail_Reference_code` = q.patient_category "
            + "AND x.`hfc_cd` = '" + hfc + "' "
// changes made on after this line; One additional where condition which is the patient queue discipline must equal with current user's discipline.: 
            + "WHERE q.discipline_cd='"+discipline+"' AND q.queue_name IN (SELECT queue_name FROM pms_queue_list WHERE user_id = '" + doctor_id + "' AND hfc_cd = '" + hfc + "' AND discipline_cd = '" + discipline + "' AND sub_discipline_cd = '" + subdicipline + "' ) "
            + "AND q.episode_date LIKE '%" + now + "%'  AND q.status !='1'  "
            + "OR (q.patient_category = '003' "
            + "AND q.status != '1' "
            + "AND q.status != '6' "
            + "AND q.queue_name IN (SELECT queue_name FROM pms_queue_list WHERE user_id = '" + doctor_id + "' AND hfc_cd = '" + hfc + "' AND discipline_cd = '" + discipline + "') ) "
            + "ORDER BY q.episode_date DESC;";
    ArrayList<ArrayList<String>> dataQueue;
    dataQueue = conn.getData(sqlV4);
    row =  dataQueue.size();
%>
<script type="text/javascript">
    $(document).ready(function(){
        var row = <%out.print(row);%>;
        if(parseInt(row) > 10){
            $("#formQueueSaya").css("height","500px");
        }
    })
    </script>

<table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;  " id="listQueue">
    <thead>
    <th>PMI no. <%//out.print(sqlV4);%></th>
    <th>Name </th>
    <th>Episode Date/Time </th>

    <th class="hidden-xs">Queue Name </th>
    <th>Queue no.</th>
    <th class="hidden">Doctor </th>
    <th class="hidden">Consultation Room </th>
    <th class="hidden-xs">Patient Category</th>
    <th>Status</th>
    <th>Action </th>

</thead>
<tbody>
    <%
        for (int i = 0; i < dataQueue.size(); i++) {%>
    <tr>
        <td id="pmiNumber"><%=dataQueue.get(i).get(0)%></td>
        <td style="text-transform: uppercase;"><%=dataQueue.get(i).get(1)%></td>
        <td id="epiDate"><%=dataQueue.get(i).get(2)%></td>
<!--        <td id="epiTime" hidden="hidden"><% //dataQueue.get(i).get(3)%></td>-->
        <td class="hidden-xs"><%=dataQueue.get(i).get(3)%></td>
        <td ><%=dataQueue.get(i).get(4)%></td>
        <td id="user_idQueue_List" class="hidden"><%=dataQueue.get(i).get(5)%></td>
        <td ><%=dataQueue.get(i).get(9)%></td>
        <td  class="hidden"><%=dataQueue.get(i).get(9)%></td>
        <td id="status"><%=dataQueue.get(i).get(6)%></td>
        <% if (dataQueue.get(i).get(6).equals("Consult")) { %>
        <td><button class="btn btn-primary changePatientBtn"  disabled="">Consult</button> </td>
        <% } else {%>
        <td><button class="btn btn-primary changePatientBtn" id="consultBtn" >Consult</button> </td>
        <%}%>

    </tr>    
    <%    }

//out.print(sqlV4);
    %>

</tbody>
</table>

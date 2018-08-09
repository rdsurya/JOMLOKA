<%-- 
    Document   : listEmp
    Created on : Jan 20, 2017, 4:54:38 PM
    Author     : shay
--%>

<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conn conn = new Conn();
    String pmiFAM = request.getParameter("PMINO");
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String famList = "select a.*,g.description from pms_family a"
            + " left join adm_lookup_detail g on g.detail_reference_code=a.occupation_code and g.master_reference_code='0050' and g.hfc_cd ='" + hfc + "'"
            + " where pmi_no = '" + pmiFAM + "'";
    ArrayList<ArrayList<String>> dataFamList;
    dataFamList = conn.getData(famList);


%><table class="table table-striped table-bordered" style="background: #fff; border: 1px solid #ccc;" id="listFamily">
    <thead>
        <tr>
            <th>Family Member's Name</th>
            <th>IC / ID Number</th>
            <th>Relationship</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
    </thead>
    <tbody>
        <%  for (int i = 0; i < dataFamList.size(); i++) {

                String relayName = "select description from adm_lookup_detail where master_reference_code = '0007' and detail_reference_code = '" + dataFamList.get(i).get(2) + "'";
                ArrayList<ArrayList<String>> dataRelayName;
                dataRelayName = conn.getData(relayName);
                String relay = "";
                if (dataRelayName.size() == 0) {
                    relay = "-";
                } else {
                    relay = dataRelayName.get(0).get(0);
                }%>
        <tr data-status="pagado" data-toggle="modal" data-id="1" data-target="#type">
            <td id="pmiNumber"><%=dataFamList.get(i).get(4)%></td>
    <input id="famval" type="hidden" value="<%=StringUtils.join(dataFamList.get(i), "|")%>">
    <td><%=dataFamList.get(i).get(3)%></td>
    <td><%=relay%></td>
    <td><button id="FAMedit" name="FAMedit" class="btn btn-default" data-toggle="modal" data-target="#FamilyModal"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></button></td>
    <td><button id="FAMdel" name="FAMdel" class="btn btn-default"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></button></td>
</tr>
<%  }
%>
</tbody>
</table>

<%-- 
    Document   : insertService
    Created on : Aug 11, 2018, 9:44:16 AM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="ADM_helper.MySessionKey"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String tenant_cd = (String) session.getAttribute(MySessionKey.TENANT_CD);
    String user_id = (String) session.getAttribute(MySessionKey.USER_ID);

    String strTime = request.getParameter("time");
    String apc = request.getParameter("apc");
    String blc = request.getParameter("blc");
    String strPack = request.getParameter("package");

    JSONArray arrTime = new JSONArray(strTime);
    JSONArray arrPackage = new JSONArray(strPack);

    Conn con = new Conn();

    RMIConnector rmi = new RMIConnector();

    String query = "INSERT INTO jlk_medic_master(tenant_cd, tenant_type, mon_from, mon_to, tue_from, tue_to, wed_from, wed_to, thu_from, thu_to, fri_from, fri_to, sat_from, sat_to, sun_from, sun_to, apc_image, blc_image, created_by, created_date) "
            + "VALUES('" + tenant_cd + "', 'jlk_medic', '" + arrTime.getString(0) + "', '" + arrTime.getString(1) + "', '" + arrTime.getString(2) + "', '" + arrTime.getString(3) + "', '" + arrTime.getString(4) + "', '" + arrTime.getString(5) + "', '" + arrTime.getString(6) + "', '" + arrTime.getString(7) + "', '" + arrTime.getString(8) + "', '" + arrTime.getString(9) + "', '" + arrTime.getString(10) + "', '" + arrTime.getString(11) + "', '" + arrTime.getString(12) + "', '" + arrTime.getString(13) + "', '" + apc + "', '" + blc + "', '" + user_id + "', now());";

    boolean isInsert = rmi.setQuerySQL(con.HOST, con.PORT, query);

    JSONObject json = new JSONObject();

    if (!isInsert) {
        json.put("isValid", false);
        json.put("msg", "Fail to set up service");
        json.put("sql", query);
        out.print(json.toString());
        return;
    }

    for (int i = 0; i < arrPackage.length(); i++) {
        query = "INSERT INTO jlk_medic_service_type(tenant_cd, service_type) "
                + "VALUES('" + tenant_cd + "', '" + arrPackage.getString(i) + "');";
        isInsert = rmi.setQuerySQL(con.HOST, con.PORT, query);
        if (!isInsert) {
            json.put("isValid", false);
            json.put("msg", "Fail to set up service");
            json.put("sql", query);
            out.print(json.toString());
            return;
        }

    }//end for

    json.put("isValid", true);
    json.put("msg", "Success to set up service");
    json.put("url", "../Entrance/Home");
    json.put("sql", query);
    out.print(json.toString());


%>

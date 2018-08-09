<%-- 
    Document   : validateSession
    Created on : Jan 19, 2017, 4:47:02 PM
    Author     : user
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="ADM_helper.MySessionKey"%>
<%@page import="ADM_helper.MySession"%>
<%
    if (session.getAttribute("USER_ID") == null) {
        response.sendRedirect("../index.jsp");
        return;
    } else {
        String id = (String) session.getAttribute("USER_ID");
        String hfc = (String) session.getAttribute(MySessionKey.TENANT_CD);
        String sID = (String) session.getAttribute("SESSION_ID");

        MySession mys = new MySession(id, hfc);

        if (!mys.isSessionValid(sID)) {
//            response.sendRedirect("../index.jsp");
            out.print("<h1>" + mys.getInvalidSessionMsg() + "</h1>");
            session.invalidate();

%>
<script type="text/javascript">
    setTimeout(function () {
        window.location.href = "../Main"; //will redirect to your blog page (an ex: blog.html)
    }, 3000); //will call the function after 3 secs.
</script>
<%        return;
    }

    String userType = (String) session.getAttribute(MySessionKey.USER_TYPE);

    if ("TENANT".equals(userType) && "???".equals(hfc)) {
        //response.sendRedirect("tenant.jsp");
        out.print("<h1>You have not register a tenant yet. Please register it first</h1>");
%>
<script type="text/javascript">
    setTimeout(function () {
        window.location.href = "../TMS/register-tenant.jsp"; //will redirect to your blog page (an ex: blog.html)
    }, 2000); //will call the function after 2 secs.
</script>
<%
        return;
    }

    String query = "Select tenant_cd, tenant_type from adm_tenant_type where tenant_cd='" + hfc + "' limit 1;";
    Conn con = new Conn();
    ArrayList<ArrayList<String>> adm_tenant_type = con.getData(query);

    if (adm_tenant_type.size() > 0) {
        String tenant_type = adm_tenant_type.get(0).get(1);
        String table_name = tenant_type + "_master";
        query = "Select tenant_cd from " + table_name + " where tenant_cd='" + hfc + "' limit 1;";

        ArrayList<ArrayList<String>> data_tenant = con.getData(query);

        if (data_tenant.size() < 1) {
            out.print("<h1>You have not set up a service/tenant type. Please set it up first!</h1>");
%>
<script type="text/javascript">
    setTimeout(function () {
        window.location.href = "../Jom_Medic/"; //will redirect to your blog page (an ex: blog.html)
    }, 2000); //will call the function after 2 secs.
</script>
<%
                return;

            }

        }

    }
%>

<%-- 
    Document   : side_profile
    Created on : May 1, 2017, 9:55:21 PM
    Author     : user
--%>

<%@page import="ADM_helper.MySessionKey"%>
<%
    String my_1_gamba = "";
    String my_1_nama = "";
    String my_1_hfcName = "";
    String my_1_user_id = "";
 
    if (session.getAttribute("USER_NAME") != null) {

        my_1_gamba = (String) session.getAttribute("PICTURE");
        my_1_nama = (String) session.getAttribute("USER_NAME");
        my_1_hfcName = (String) session.getAttribute(MySessionKey.TENANT_NAME);
        my_1_user_id = (String) session.getAttribute("USER_ID");
        
    }

%>

<li class="dropdown user user-menu">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
        <img src="<%= my_1_gamba%>" class="user-image" alt="User Image">
        <span class="hidden-xs top-profile" style="text-transform: lowercase;"><%=my_1_nama%></span>
    </a>
    <ul class="dropdown-menu">
        <!-- User image -->
        <li class="user-header">
            <img src="<%= my_1_gamba%>" class="img-circle" alt="User Image">

            <p style="text-transform: lowercase;">
                <%=my_1_nama%> - Tenant Manager
                <small><%=my_1_user_id%></small>
            </p>
        </li>
        <!-- Menu Body -->
        <li class="user-body">
            <div class="row">
                <div class="col-xs-12 ">
                    <label>Tenant:</label>&nbsp;<%= my_1_hfcName%>
                </div>
            </div>
            <!-- /.row -->
        </li>
        <!-- Menu Footer-->
        <li class="user-footer" style="display: table; width: 100%;">
            <div class="text-left" style="display: table-cell">
                <button type="button" class="btn btn-default btn-flat" onclick="window.location.href = 'personal.jsp'">Manage Account</button>
            </div>
            <div class="text-right" style="display: table-cell">
                <a href="../Entrance/destroySession.jsp" id="btnCIS_LOGOUT" class="btn btn-default btn-flat">Sign out</a>
            </div>
        </li>
    </ul>
</li>

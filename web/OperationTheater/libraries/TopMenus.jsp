<%-- 
    Document   : TopMenus
    Created on : Mar 28, 2017, 2:38:37 PM
    Author     : Mizi K (UI)
--%>

<nav class="navbar navbar-static-top">
    <div class="container-fluid">
        <div class="row">

            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-left back" style="">
                    <li><a href="../Entrance/dashboard.jsp" title="Back"><i class=" fa fa-chevron-left"></i></a></li>
                </ul>
                <div class="nav navbar-nav navbar-left">
                    <div style="padding: 10px 20px; display: block; font-size: 22px;">
                        <span style="font-size: 22px;">Operation Theater Screen</span>
                    </div>
                </div>

                <ul class="nav navbar-nav navbar-right logout" style="">
                    <%@include file="../../assets/side_profile.jsp" %>
                </ul>

            </div>

        </div>

    </div>
</nav>

<%-- 
    Document   : radiologyTopMenus
    Created on : Mar 28, 2017, 2:38:37 PM
    Author     : Shammugam
--%>

<nav class="navbar navbar-static-top">
    <div class="container-fluid">
        <div class="row">

            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-left back" style="">
                    <li><a href="../Entrance/Home" title="Back"><i class=" fa fa-chevron-left"></i></a></li>
                </ul>
                <div class="nav navbar-nav navbar-left">
                    <div style="padding: 10px 20px; display: block; font-size: 22px;">
                        <span style="font-size: 22px;">RIS Screen</span>
                    </div>
                </div>

                <ul class="nav navbar-nav navbar-right logout" style="">
                    <li>
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#style-3" aria-expanded="false" aria-controls="navbar">
                            <i class="fa fa-bars fa-lg"></i>
                        </button>
                    </li>
                    <%@include file="../../assets/side_profile.jsp" %>
                </ul>

            </div>

        </div>

    </div>
</nav>

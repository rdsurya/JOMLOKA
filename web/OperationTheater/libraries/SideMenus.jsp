<%-- 
    Document   : SideMenus
    Created on : Mar 28, 2017, 2:41:25 PM
    Author     : Mizi K (UI)
--%>


<div class="col-sm-3 col-md-2 sidebar">
    <div class="brand"></div>
    <!-- logo -->
    <div class="logo">
        <img src="../assets/img/hiscare-icon-web.svg">
    </div>
    <!-- logo -->

   
    <!-- profile Sidebar -->
    <li class="nav-title">Navigation</li>
    <ul class="nav nav-sidebar" id="side-menu">
        <li><a href="HIS190001.jsp"><i class="fa fa-credit-card sideIcon" aria-hidden="true" ></i>Receive Order</a></li>   
        <!--<li><a href="HIS060003.jsp"><i class="fa fa-check-square sideIcon" aria-hidden="true" ></i>Verify Result</a></li>-->   
        <li><a href="HIS190002.jsp"><i class="fa fa-code-fork " aria-hidden="true" ></i>Manage Procedure Code</a></li>
        <li><a href="HIS190003.jsp"><i class="fa fa-bed " aria-hidden="true" ></i>Manage Operation Theater Room</a></li>
        <li><a href="HIS190004.jsp"><i class="fa fa-usd " aria-hidden="true" ></i>Billing</a></li>
        <li data-toggle="collapse" data-target="#report_drop_menu" class="collapsed active">
            <a href="#"><i class="fa fa-bar-chart fa-lg"></i> Report <span class="caret"></span></a>
            <ul class="sub-menu collapse" id="report_drop_menu" aria-expanded="true" style="">
                <li><a data-toggle="modal" data-target="#" href="list_procedure_cd.jsp">List of Procedure</a></li>
                <li><a data-toggle="modal" data-target="#" href="list_pending_order.jsp">List of Order</a></li>
                <li><a data-toggle="modal" data-target="#" href="list_OfSale.jsp">Sales</a></li>
            </ul>
        </li>
        <li><a href="HIS190006.jsp"><i class="fa fa-history sideIcon" aria-hidden="true"></i>Past Completed Order</a></li>
    </ul>  
</div>
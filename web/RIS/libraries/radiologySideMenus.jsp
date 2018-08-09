<%-- 
    Document   : radiologySideMenus
    Created on : Mar 28, 2017, 2:41:25 PM
    Author     : Shammugam
--%>


<div class="col-sm-3 col-md-2 sidebar">
    <div class="brand"></div>
    <!-- logo -->
    <div class="logo">
        <img src="../assets/img/hiscare-icon-web.svg">
    </div>
    <!-- logo -->
    
    <!-- profile Sidebar -->
    <ul class="nav nav-sidebar" id="side-menu">
        <li class="nav-title">Navigation</li>
        <li><a href="ReceiveOrder"><i class="fa fa-credit-card sideIcon" aria-hidden="true" ></i>Receive Order</a></li>   
        <li><a href="VerifyResult"><i class="fa fa-check-square sideIcon" aria-hidden="true" ></i>Verify Result</a></li>   
        <li><a href="Procedure"><i class="fa fa-code-fork " aria-hidden="true" ></i>Manage RIS Procedure Code</a></li>
        <li><a href="Bill"><i class="fa fa-usd " aria-hidden="true" ></i>Billing</a></li>
        <li data-toggle="collapse" data-target="#Report" class="collapsed active">
            <a href="#"><i class="fa fa-bar-chart fa-lg"></i> Report <span class="caret"></span></a>
            <ul class="sub-menu collapse" id="Report" aria-expanded="true" style="">
                <li><a data-toggle="modal" data-target="#" href="ListProcedure">List of Procedure</a></li>
                <li><a data-toggle="modal" data-target="#" href="ListOrder">List of Order</a></li>
                <li><a data-toggle="modal" data-target="#" href="ListSale">Sales of Radiology</a></li>
            </ul>
        </li>
        <li><a href="PastOrder"><i class="fa fa-history sideIcon" aria-hidden="true"></i>Past Completed Order</a></li>

    </ul>  
</div>
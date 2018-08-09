<%@page import="ADM_helper.MySession"%>
<%@page import="Config.Config"%>	

<div class="col-sm-3 col-md-2 sidebar" id="style-3">
    <div class="brand"></div>
    <!-- logo -->
    <div class="logo">
        <img src="../assets/img/hiscare-icon-web.svg">
    </div>
    <!-- logo -->


    <!-- profile Sidebar -->
    <ul class="nav nav-sidebar" id="side-menu">
        <li class="nav-title">Navigation</li>
        <!-- Menu without dropdown -->
        <li><a href="Order_Stock"><i class="fa fa-plus fa-lg" aria-hidden="true" ></i>Order Stock</a></li>
        <li><a href="Distribution_Stock_Order"><i class="fa fa-shopping-cart fa-lg" aria-hidden="true" ></i>Distribute Stock Order</a></li>
        <li><a href="Manage_Stock_Code"><i class="fa fa-table fa-lg" aria-hidden="true" ></i>Manage Stock Code</a></li>
        <li><a href="Manage_Stock_Quantity"><i class="fa fa-recycle fa-lg" aria-hidden="true" ></i>Manage Stock Quantity</a></li>
        <li><a href="Manage_VendorS"><i class="fa fa-book fa-lg" aria-hidden="true" ></i>Manage Vendor</a></li>
        <!-- Menu without dropdown -->
        <!-- Menu with dropdown 2 -->
        <li  data-toggle="collapse" data-target="#Report" class="collapsed active">
            <a href="#"><i class="fa fa-bar-chart fa-lg"></i> Report <span class="arrow"></span></a>
        </li>
        <ul class="sub-menu collapse" id="Report">
            <li><a data-toggle="modal" data-target="#" href="List_Of_Category">List Of Category</a></li>
            <li><a data-toggle="modal" data-target="#" href="List_Of_Items">List Of Item</a></li>
            <li><a data-toggle="modal" data-target="#" href="List_Of_Vendor">List Of Vendor</a></li>
            <li><a data-toggle="modal" data-target="#" href="Sales_For_Stock">Sales For Stock</a></li>
        </ul> 
        <!-- Menu with dropdown 2 -->
        <li><a href="Stock_Past_Order"><i class="fa fa-history sideIcon" aria-hidden="true"></i>Past Completed Order</a></li>
    </ul>  

</div>
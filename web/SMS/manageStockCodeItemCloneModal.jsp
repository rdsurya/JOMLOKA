<%-- 
    Document   : manageStockCodeItemCloneModal
    Created on : Nov 14, 2017, 12:19:01 PM
    Author     : Shammugam
--%>

<!-- Clone Modal Start -->
<div class="modal fade" id="stockItemCloneModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 50%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" id="lineModalLabel" align="center">Clone Stock Item Code</h2>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form style="width: 100%; margin: 0 auto;" id="STOCKITEMClone_Form" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group">


                        <div style="align-items: center; text-align: center">
                            <br>
                            <label>Select Item Code To Be Cloned</label>
                            <br><br>
                            <span>
                                <a href="#" class="btn btn-default" id="STOCKITEM_Code_selectAll">&nbsp; Select all &nbsp;</a>
                                &nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;
                                <a href="#" class="btn btn-default" id="STOCKITEM_Code_deselectAll">Deselect all</a>
                            </span>
                            <br><br>
                            <div>
                                <select id="STOCKITEM_Code" multiple="multiple"></select>
                            </div>    
                        </div>
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary btn-block" type="button" id="STOCKITEM_btnClone"><i class=" fa fa-check"></i> Clone</button>
            </div>
        </div>
    </div>
</div>
<!-- Clone Modal End -->   
<%-- 
    Document   : vendorModal
    Created on : Dec 15, 2017, 4:28:41 PM
    Author     : Shammugam
--%>

<!-- Add Button End -->
<div class="modal fade" id="vendorModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:90%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" id="vendorModalTitle" align="center"></h2>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" autocomplete="off" id="vendorModalForm">
                    <div class="row">


                        <div class="col-md-4">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Vendor ID &nbsp; *</label>
                                <div class="col-md-8">
                                    <input id="vendor_ID" type="text" class="form-control" placeholder="Please Insert Vendor ID" maxlength="30" readonly>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Name &nbsp; *</label>
                                <div class="col-md-8">
                                    <input id="vendor_Name" type="text" class="form-control" placeholder="Please Insert Vendor Name" maxlength="100" >
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Bank Acc No &nbsp; *</label>
                                <div class="col-md-8">
                                    <input id="vendor_Bank_Acc" type="text" class="form-control" placeholder="Please Insert Bank Account No" pattern="[0-9]{6,20}"  maxlength="30">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Bank Code &nbsp; *</label>
                                <div class="col-md-8">
                                    <input id="vendor_Bank_Code" type="text" class="form-control" placeholder="Please Search Bank Code" maxlength="50">
                                    <div id="vendor_Bank_Code_Search" class="search-drop">
                                        <!--for search area-->
                                    </div>
                                </div>
                            </div>

                            <br>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Address 1 &nbsp; *</label>
                                <div class="col-md-8">
                                    <input id="vendor_Address1" type="text" class="form-control"  placeholder="Please Insert Address 1" maxlength="50">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Address 2 &nbsp; *</label>
                                <div class="col-md-8">
                                    <input id="vendor_Address2" type="text" class="form-control" placeholder="Please Insert Address 2" maxlength="50">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Address 3 &nbsp; *</label>
                                <div class="col-md-8">
                                    <input id="vendor_Address3" type="text" class="form-control" placeholder="Please Insert Address 3" maxlength="50">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Town Code &nbsp; *</label>
                                <div class="col-md-8">
                                    <input id="vendor_Towncode" type="text" class="form-control" placeholder="Please Search Town Code" maxlength="10">
                                    <div id="vendor_Towncode_Search" class="search-drop">
                                        <!--for search area-->
                                    </div>
                                </div>
                            </div>

                        </div>


                        <div class="col-md-4">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Postcode &nbsp; *</label>
                                <div class="col-md-8">
                                    <input id="vendor_Postcode" type="number" class="form-control" placeholder="Please Search Postcode" maxlength="10">
                                    <div id="vendor_Postcode_Search" class="search-drop">
                                        <!--for search area-->
                                    </div>
                                </div>
                            </div>

                            <br>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">District Code &nbsp; *</label>
                                <div class="col-md-8">
                                    <input id="vendor_District" type="text" class="form-control" placeholder="Please Search District Code" maxlength="10">
                                    <div id="vendor_District_Search" class="search-drop">
                                        <!--for search area-->
                                    </div>
                                </div>
                            </div>

                            <br>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">State Code &nbsp; *</label>
                                <div class="col-md-8">
                                    <input id="vendor_State" type="text" class="form-control" placeholder="Please Search State Code" maxlength="10">
                                    <div id="vendor_State_Search" class="search-drop">
                                        <!--for search area-->
                                    </div>
                                </div>
                            </div>

                            <br>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Country Code &nbsp; *</label>
                                <div class="col-md-8">
                                    <input id="vendor_Country" type="text" class="form-control" placeholder="Please Search Country Code" maxlength="10">
                                    <div id="vendor_Country_Search" class="search-drop">
                                        <!--for search area-->
                                    </div>
                                </div>
                            </div>

                            <br>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Telephone No &nbsp; *</label>
                                <div class="col-md-8">
                                    <input id="vendor_Telephone_No" type="text" class="form-control" placeholder="Please Insert Mobile No" pattern="[0-9]{9,11}" maxlength="15">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Fax No &nbsp; *</label>
                                <div class="col-md-8">
                                    <input id="vendor_Fax_No" type="text" class="form-control" placeholder="Please Insert Fax No" pattern="[0-9]{9,11}" maxlength="15">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">GL Code &nbsp; *</label>
                                <div class="col-md-8">
                                    <input id="vendor_GL_Code" type="text" class="form-control" placeholder="Please Insert GL Code" maxlength="10">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">ROC No &nbsp; *</label>
                                <div class="col-md-8">
                                    <input id="vendor_ROC_No" type="text" class="form-control" placeholder="Please Insert ROC No" maxlength="30">
                                </div>
                            </div>


                        </div>


                        <div class="col-md-4">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Email</label>
                                <div class="col-md-8">
                                    <input id="vendor_Email" type="email" class="form-control" placeholder="Please Insert Vendor Email" maxlength="30">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Contact Person</label>
                                <div class="col-md-8">
                                    <input id="vendor_Contact_Person" type="text" class="form-control" placeholder="Please Insert Contact Person Detail (OPTIONAL)" maxlength="30">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Payment Type</label>
                                <div class="col-md-8">
                                    <input id="vendor_Payment_Term" type="text" class="form-control" placeholder="Please Search Payment Type (OPTIONAL)" maxlength="30">
                                    <div id="vendor_Payment_Term_Search" class="search-drop">
                                        <!--for search area-->
                                    </div>
                                </div>
                            </div>

                            <br>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Account Type</label>
                                <div class="col-md-8">
                                    <input id="vendor_Account_Type" type="text" class="form-control" placeholder="Please Search Account Type (OPTIONAL)" maxlength="10">
                                    <div id="vendor_Account_Type_Search" class="search-drop">
                                        <!--for search area-->
                                    </div>
                                </div>
                            </div>

                            <br>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Credit Limit</label>
                                <div class="col-md-8">
                                    <input id="vendor_Credit_Limit" type="number" class="form-control" placeholder="Please Insert Credit Limit (OPTIONAL)" maxlength="10">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Currency</label>
                                <div class="col-md-8">
                                    <input id="vendor_Currency" type="text" class="form-control" placeholder="Please Search Currency (OPTIONAL)" maxlength="10">
                                    <div id="vendor_Currency_Search" class="search-drop">
                                        <!--for search area-->
                                    </div>
                                </div>
                            </div>

                            <br>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Status</label>
                                <div class="col-md-8">
                                    <select class="form-control" name="tstatus" id="vendor_Status">
                                        <option value="1" selected>Active</option>
                                        <option value="0" >Inactive</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="vendor_btnAdd_or_btnUpdate_div">
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="vendorReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal Add Supplier End -->
<!-- Add Part End -->
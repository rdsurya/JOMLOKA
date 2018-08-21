<%-- 
    Document   : document
    Created on : Aug 20, 2018, 5:10:03 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="row">
    <h3>Annual Practicing Certificate</h3>
    <div class="text-center margin-bottom-10px">
        <img id="imgAPC" src="" class="img-responsive img-thumbnail" alt="Annual Practicing Certificate">
    </div> 
    <div class="text-right">
        <button id="btnAPCModal" class="btn btn-default"><i class="fa fa-pencil-square"></i> Change APC</button>
    </div>
</div>

<div class="row">
    <h3>Business License Certificate</h3>
    <div class="text-center margin-bottom-10px">
        <img id="imgBLC" src="" class="img-responsive img-thumbnail" alt="Business License Certificate">
    </div>
    <div class="text-right">
        <button id="btnBLCModal" class="btn btn-default"><i class="fa fa-pencil-square"></i> Change BLC</button>
    </div>
</div>

<!-- Modal -->
<div id="APCModal" class="modal fade" role="dialog">
    <div class="modal-dialog" style="width: 80%">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Annual Practicing Certificate</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <form id="file-upload-form" class="uploader">
                            <input id="file-upload1" class="file-upload" type="file" name="fileUpload" style="display: none;" accept="image/*" />

                            <label for="file-upload" id="file-drag1" class="upload-box img-responsive">
                                <div id="start">
                                    <i class="fa fa-download" aria-hidden="true"></i>
                                    <h4>Upload Annual Practicing Certificate</h4>
                                    <div>Select a file or drag here</div>
                                    <div id="notimage" class="hidden">Please select an image</div>
                                    <span id="file-upload-btn1" class="btn btn-primary">Select a file</span>
                                </div>
                            </label>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button id="btnUploadAPC" type="button" class="btn btn-success"><i class="fa fa-upload"></i> Upload</button>
            </div>
        </div>

    </div>
</div>

<!-- Modal -->
<div id="BLCModal" class="modal fade" role="dialog">
    <div class="modal-dialog" style="width: 80%">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Business License Certificate</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <form id="file-upload-form" class="uploader">
                            <input id="file-upload2" class="file-upload" type="file" name="fileUpload" style="display: none;" accept="image/*" />

                            <label for="file-upload" id="file-drag2" class="upload-box">
                                <div id="start">
                                    <i class="fa fa-download" aria-hidden="true"></i>
                                    <h4>Upload Business License Certificate</h4>
                                    <div>Select a file or drag here</div>
                                    <div id="notimage" class="hidden">Please select an image</div>
                                    <span id="file-upload-btn2" class="btn btn-primary">Select a file</span>
                                </div>
                            </label>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button id="btnUploadBLC" type="button" class="btn btn-success"><i class="fa fa-upload"></i> Upload</button>
            </div>
        </div>

    </div>
</div>



<script type="text/javascript">

    $(function () {
        loadDocumnentImage("apc", "imgAPC");
        loadDocumnentImage("blc", "imgBLC");

        var APC = initDropzone("file-drag1", "file-upload-btn1");
        var BLC = initDropzone("file-drag2", "file-upload-btn2");


        $("#btnAPCModal").on("click", function () {
            $("#APCModal").modal("show");
        });

        $("#btnBLCModal").on("click", function () {
            $("#BLCModal").modal("show");
        });

        $("#btnUploadAPC").on("click", function () {
            uploadDocument("file-drag1", "apc", "imgAPC", APC);
        });
        
        $("#btnUploadBLC").on("click", function () {
            uploadDocument("file-drag2", "blc", "imgBLC", BLC);
        });

        function uploadDocument(file_drag, img, imgHolder, myDropzone) {
            var $file1 = $("#" + file_drag);
            var $modal = $file1.closest(".modal");
            $modal.css("overflow", "auto");

            if (!$file1.find("img").length) {
                bootbox.alert("Please upload your document!");
                return false;
            }

            createScreenLoading();
            var input = {
                img: img,
                src: $file1.find("img").attr("src")
            };

            $.ajax({
                type: 'POST',
                data: input,
                timeout: 60000,
                url: "service_info/setDocument.jsp",
                dataType: 'json',
                success: function (data, textStatus, jqXHR) {
                    bootbox.alert(data.msg);
                    if (data.isValid) {
                        $("#" + imgHolder).attr("src", input.src);
                        $modal.modal("hide");
                        myDropzone.removeAllFiles(true);
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("Fail upload: " + errorThrown);
                },
                complete: function (jqXHR, textStatus) {
                    destroyScreenLoading();
                }
            });
        }
    });

</script>
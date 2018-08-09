//js search in add procedure
function searchROSCD(){
  
        var id = $.trim($('#ROS').val());
        var hfcIdROS = $.trim($('#hfcIdROS').val()); 
        $.ajax({
        type:'post',
        url:'search/searchRISProcedure_cd.jsp',
        data: {'id': id,'hfc_cd':hfcIdROS
 
    },                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var urosCode = array_data[0];
            var modalityCODE = array_data[1];
            var bodySystem = array_data[2];
            
            var modalityName = array_data[3];
            var bodySystemName = array_data[4];
            //console.log(urosCode);
           
            $('#codeROS_2').val(urosCode.trim());
            
            $('#modalityROS').val(modalityName.trim());
            $('#bodySystemROS').val(bodySystemName.trim());
            
            $('#modalityROSCode').val(modalityCODE.trim());
            $('#bodySystemROSCode').val(bodySystem.trim());
            
            //console.log($('#codeROS').val());
          }
        });
   
};
function UsearchROSCD(){
  
        var id = $.trim($('#UROS').val());
        $.ajax({
        type:'post',
        url:'search/searchRISProcedure_cd.jsp',
        data: {'id': id},                
        success: function(reply_data){
            var array_data = String(reply_data).split("|");
            var urosCode = array_data[0];
            var modalityCODE = array_data[1];
            var bodySystem = array_data[2];
            
            var modalityName = array_data[3];
            var bodySystemName = array_data[4];
            console.log(urosCode);
           
            $('#UcodeROS').val(urosCode.trim());
            $('#UmodalityROS').val(modalityName.trim());
            $('#UbodySystemROS').val(bodySystemName.trim());
            
            $('#UmodalityROSCode').val(modalityCODE.trim());
            $('#UbodySystemROSCode').val(bodySystem.trim());
          }
        });
   
};
 $(function () {
                 $("#ROS").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                      var hfc_cd = $('#hfcIdROS').val();
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#matchROS').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input, 'hfc_cd' : hfc_cd}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/searchRISProcedure.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#matchROS').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#ROSmatchList li').on('click', function () { // When click on an element in the list
                                    $('#ROS').val($(this).text()); // Update the field with the new element
                                    $('#matchROS').text(''); // Clear the <div id="match"></div>
                                    searchROSCD();
                                });
                            },
                            error: function () { // if error
                                $('#matchROS').text('Problem!');
                            }
                        });
                    } else {
                        $('#matchROS').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });


            });
//End js search in add procedure

//js search in Update procedure
 $(function () {
                 $("#UROS").on('keyup', function () { // everytime keyup event
                    var input = $(this).val(); // We take the input value
                    var hfc_cd = $('#UhfcIdROS').val();
                    if (input.length >= 1) { // Minimum characters = 2 (you can change)
                        $('#UmatchROS').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
                        var dataFields = {'input': input,'hfc_cd':hfc_cd}; // We pass input argument in Ajax
                        $.ajax({
                            type: "POST",
                            url: "search/searchRISProcedure.jsp", // call the php file ajax/tuto-autocomplete.php
                            data: dataFields, // Send dataFields var
                            timeout: 3000,
                            success: function (dataBack) { // If success
                                $('#UmatchROS').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                                $('#ROSmatchList li').on('click', function () { // When click on an element in the list
                                    $('#UROS').val($(this).text()); // Update the field with the new element
                                    $('#UmatchROS').text(''); // Clear the <div id="match"></div>
                                    UsearchROSCD();
                                });
                            },
                            error: function () { // if error
                                $('#UmatchROS').text('Problem!');
                            }
                        });
                    } else {
                        $('#UmatchROS').text(''); // If less than 2 characters, clear the <div id="match"></div>
                    }
                });

            });
//End js search in Update procedure
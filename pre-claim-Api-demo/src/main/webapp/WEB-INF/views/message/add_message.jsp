<%@page import = "java.util.List" %>
<%@page import = "java.util.ArrayList" %>
<%@page import = "com.preclaim.models.Location"%>
<%@page import = "com.preclaim.models.InvestigationType"%>
<%@page import = "com.preclaim.models.IntimationType"%>
<%
List<String>user_permission=(List<String>)session.getAttribute("user_permission");
List<InvestigationType> investigationList = (List<InvestigationType>) session.getAttribute("investigation_list");
session.removeAttribute("investigation_list");
List<IntimationType> intimationTypeList = (List<IntimationType>) session.getAttribute("intimation_list");
session.removeAttribute("intimation_list");
List<Location> location_list = (List<Location>) session.getAttribute("location_list");
session.removeAttribute("location_list");
%>
<style type="text/css">
.placeImg { display:none !important;}
</style>
<link href="${pageContext.request.contextPath}/resources/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/resources/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<div class="row">
  <div class="col-md-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
          <i class="icon-user font-green-sharp"></i>
          <span class="caption-subject font-green-sharp sbold">Add Case</span>
        </div>
        <div class="actions">
            <div class="btn-group">
              <a href="${pageContext.request.contextPath}/message/pending_message" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" data-toggle="tooltip" title="Back" style="margin-right: 5px;" data-original-title="Back">
                <i class="fa fa-reply"></i>
              </a>
            </div>
        </div>
      </div>
    </div>
    <div class="box box-primary">
      <!-- /.box-header -->
      <!-- form start -->
      <div id="message_alert"></div>
      <form novalidate id="add_message_form" role="form" method="post" class="form-horizontal" enctype="multipart/form-data">
        <div class="box-body">
          <div class="row">
            <div class="col-sm-10 col-md-10 col-xs-12"> 
			  <div class="form-group">
                <label class="col-md-4 control-label" for="msgTitleEn">Policy Number 
                	<span class="text-danger">*</span>
               	</label>
                <div class="col-md-8">
                  <input type="text" placeholder="Policy Number" name="policyNumber" id="policyNumber" 
                  	class="form-control">
                </div>
              </div>
              <div class="form-group selectDiv">
                <label class="col-md-4 control-label" for="msgCategory">Select Investigation Category 
                	<span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <select name="msgCategory" id="msgCategory" class="form-control" tabindex="-1">
                    <option value="-1" selected disabled>Select</option>
                    <%if(investigationList != null){
                    	for(InvestigationType investigation: investigationList){%>
                    	<option value = "<%=investigation.getInvestigationType()%>"><%=investigation.getInvestigationType() %></option>
                    <%}} %>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="insuredName">Insured Name 
                	<span class="text-danger">*</span>
               	</label>
                <div class="col-md-8">
                  <input type="text" placeholder="Insured Name" name="insuredName" id="insuredName" 
                  	class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="insuredDOD"> Date of Death
                	<span class="text-danger">*</span>
               	</label>
                <div class="col-md-8">
                  <input type="date" placeholder="Date of Death" name="insuredDOD" id="insuredDOD" 
                  	class="form-control">
                </div>  
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="insuredDOB"> Insured Date of Birth 
                	<span class="text-danger">*</span>
               	</label>
                <div class="col-md-8">
                  <input type="date" placeholder="Date of Death" name="insuredDOB" id="insuredDOB" 
                  	class="form-control">
                </div>  
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="sumAssured">Sum Assured 
                	<span class="text-danger">*</span>
               	</label>
                <div class="col-md-8">
                  <input type="number" placeholder="Sum Assured" name="sumAssured" id="sumAssured" 
                  	class="form-control">
                </div>
              </div>
              <div class="form-group selectDiv">
                <label class="col-md-4 control-label" for="msgIntimationType">Select Intimation Type 
                	<span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <select name="msgIntimationType" id="msgIntimationType" class="form-control" tabindex="-1">
                    <option value="-1" selected disabled>Select</option>
                    <%if(intimationTypeList != null){
                    	for(IntimationType intimation: intimationTypeList){%>
                    	<option value = "<%=intimation.getIntimationType()%>"><%=intimation.getIntimationType() %></option>
                    <%}} %>
                  </select>
                </div>
              </div>
              <div class="form-group selectDiv">
                <label class="col-md-4 control-label" for="claimantCity">Claimant City 
                	<span class="text-danger">*</span>
               	</label>
                <div class="col-md-8">
                  	<select name="claimantCity" id="claimantCity" class="form-control" tabindex="-1">
                  	 <option value="-1" selected disabled>Select</option>
                  	 <%if(location_list!=null){ 
                  	  for(Location location : location_list){%>  
                  	  <option value=<%=location.getCity()%> data-state = <%=location.getState() %>
                  	  	data-zone = <%=location.getZone() %>><%=location.getCity()%></option>
                  	 <%}} %>
                  	</select>
                </div>
              </div>
              <div class="form-group selectDiv">
                <label class="col-md-4 control-label" for="claimantState">Claimant State 
                	<span class="text-danger">*</span>
               	</label>
                <div class="col-md-8">
                  	<input type = "text" name="claimantState" id="claimantState" class="form-control" readonly disabled>
                </div>
              </div>
              <div class="form-group selectDiv">
                <label class="col-md-4 control-label" for="claimaintZone">Claimant Zone 
                	<span class="text-danger">*</span>
               	</label>
                <div class="col-md-8">
                  	<input type = "text" name="claimantZone" id="claimantZone" class="form-control" readonly disabled>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="msgTitleEn">Status</label>
                <div class="col-md-8">
                  <input type="text" placeholder="Status" name="status" id="status" class="form-control"
                  	value = "Open"  disabled readonly>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="subStatus">Sub-Status</label>
                <div class="col-md-8">
                  <input type="text" placeholder="Sub Status" name="subStatus" id="subStatus" 
                  	class="form-control" value = "Pending for Assignment" disabled readonly>
                </div>
              </div>           
              <div class="form-group">
                <label class="col-md-4 control-label" for="nomineeName">Nominee Name
                	<span class="text-danger">*</span>
                </label>
                <div class="col-md-8">
                  <input type="text" placeholder="Nominee Name" name="nomineeName" id="nomineeName" 
                  	class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="nomineeMob">Nominee Contact Number</label>
                <div class="col-md-8">
                  <input type="number" placeholder="Nominee Contact Number" name="nomineeMob" id="nomineeMob" 
                  	class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="nomineeAdd">Nominee Address</label>
                <div class="col-md-8">
                  <textarea name="nomineeAdd" id="nomineeAdd" class="form-control" rows="6"></textarea>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="insuredAdd">Insured Address</label>
                <div class="col-md-8">
                  <textarea name="insuredAdd" id="insuredAdd" class="form-control" rows="6"></textarea>
                </div>
              </div>
              <!-- 
              <div class="form-group">
       		  	<label class="col-md-4 control-label">Upload PDF</label>
           		<div class="col-md-8">
                	<input type="file" name="casePDF" id="casePDF" accept="application/pdf" />
              	</div>
              </div>
               -->       
              <div id="uploadImageDiv">
                <div class="form-group">
                  <label class="col-md-4 control-label">Upload Image(En)</label>
                  <div class="col-md-8 col-nopadding-l">
                    <div class="col-md-3">
                      <a href="javascript:void(0);">
                        <div class="uploadFileDiv">
                          <span data-imgID="imgMsgEnLbl_1" data-ID="imgMsgEn_1" id="enLblDelBtn_1" class="delete_btn" data-linkID="link_msgImgEn_1" data-toggle="tooltip" data-toggle="tooltip" title="Remove">
                            <i class="fa fa-remove"></i>
                          </span>
                          <span class="add_link_btn" data-val="" id="link_msgImgEn_1" data-toggle="tooltip" data-toggle="tooltip" title="Update hyperlink">
                            <i class="fa fa-link"></i>
                          </span>
                          <img src="${pageContext.request.contextPath}/resources/uploads/default_img.png" class="imgMsgEnLbl" id="imgMsgEnLbl_1" style="height:height:120px;width: 100%;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload Image 1" />
                        </div>
                        <input type="file" onchange="displayUploadImg(this, 'imgMsgEnLbl_1', 'enLblDelBtn_1', 'link_msgImgEn_1');" name="imgMsgEn_1" id="imgMsgEn_1" class="placeImg" accept="image/*" />
                        <input type="hidden" name="d_link_msgImgEn_1" id="d_link_msgImgEn_1" />
                      </a>
                    </div>
                    <div class="col-md-3">
                      <a href="javascript:void(0);">
                        <div class="uploadFileDiv">
                          <span data-imgID="imgMsgEnLbl_2" data-ID="imgMsgEn_2" id="enLblDelBtn_2" class="delete_btn" data-linkID="link_msgImgEn_2" data-toggle="tooltip" data-toggle="tooltip" title="Remove">
                            <i class="fa fa-remove"></i>
                          </span>
                          <span class="add_link_btn" data-val="" id="link_msgImgEn_2" data-toggle="tooltip" data-toggle="tooltip" title="Update hyperlink">
                            <i class="fa fa-link"></i>
                          </span>
                          <img src="${pageContext.request.contextPath}/resources/uploads/default_img.png" class="imgMsgEnLbl" id="imgMsgEnLbl_2" style="height:height:120px;width: 100%;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload Image 2" />
                        </div>
                        <input type="file" onchange="displayUploadImg(this, 'imgMsgEnLbl_2', 'enLblDelBtn_2', 'link_msgImgEn_2');" name="imgMsgEn_2" id="imgMsgEn_2" class="placeImg" accept="image/*" />
                        <input type="hidden" name="d_link_msgImgEn_2" id="d_link_msgImgEn_2" />
                      </a>
                    </div>
                    <div class="col-md-3">
                      <a href="javascript:void(0);">
                        <div class="uploadFileDiv">
                          <span data-imgID="imgMsgEnLbl_3" data-ID="imgMsgEn_3" id="enLblDelBtn_3" class="delete_btn" data-linkID="link_msgImgEn_3" data-toggle="tooltip" data-toggle="tooltip" title="Remove">
                            <i class="fa fa-remove"></i>
                          </span>
                          <span class="add_link_btn" data-val="" id="link_msgImgEn_3" data-toggle="tooltip" data-toggle="tooltip" title="Update hyperlink">
                            <i class="fa fa-link"></i>
                          </span>
                          <img src="${pageContext.request.contextPath}/resources/uploads/default_img.png" class="imgMsgEnLbl" id="imgMsgEnLbl_3" style="height:height:120px;width: 100%;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload Image 3" />
                        </div>
                        <input type="file" onchange="displayUploadImg(this, 'imgMsgEnLbl_3', 'enLblDelBtn_3', 'link_msgImgEn_3');" name="imgMsgEn_3" id="imgMsgEn_3" class="placeImg" accept="image/*" />
                        <input type="hidden" name="d_link_msgImgEn_3" id="d_link_msgImgEn_3" />
                      </a>
                    </div>
                    <div class="col-md-3">
                      <a href="javascript:void(0);">
                        <div class="uploadFileDiv">
                          <span data-imgID="imgMsgEnLbl_4" data-ID="imgMsgEn_4" id="enLblDelBtn_4" class="delete_btn" data-linkID="link_msgImgEn_4" data-toggle="tooltip" data-toggle="tooltip" title="Remove">
                            <i class="fa fa-remove"></i>
                          </span>
                          <span class="add_link_btn" data-val="" id="link_msgImgEn_4" data-toggle="tooltip" data-toggle="tooltip" title="Update hyperlink">
                            <i class="fa fa-link"></i>
                          </span>
                          <img src="${pageContext.request.contextPath}/resources/uploads/default_img.png" class="imgMsgEnLbl" id="imgMsgEnLbl_4" style="height:height:120px;width: 100%;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload Image 4" />
                        </div>
                        <input type="file" onchange="displayUploadImg(this, 'imgMsgEnLbl_4', 'enLblDelBtn_4', 'link_msgImgEn_4');" name="imgMsgEn_4" id="imgMsgEn_4" class="placeImg" accept="image/*" />
                        <input type="hidden" name="d_link_msgImgEn_4" id="d_link_msgImgEn_4" />
                      </a>
                    </div>
                    <div class="col-md-3">
                      <a href="javascript:void(0);">
                        <div class="uploadFileDiv">
                          <span data-imgID="imgMsgEnLbl_5" data-ID="imgMsgEn_5" id="enLblDelBtn_5" class="delete_btn" data-linkID="link_msgImgEn_5" data-toggle="tooltip" data-toggle="tooltip" title="Remove">
                            <i class="fa fa-remove"></i>
                          </span>
                          <span class="add_link_btn" data-val="" id="link_msgImgEn_5" data-toggle="tooltip" data-toggle="tooltip" title="Update hyperlink">
                            <i class="fa fa-link"></i>
                          </span>
                          <img src="${pageContext.request.contextPath}/resources/uploads/default_img.png" class="imgMsgEnLbl" id="imgMsgEnLbl_5" style="height:height:120px;width: 100%;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload Image 5" />
                        </div>
                        <input type="file" onchange="displayUploadImg(this, 'imgMsgEnLbl_5', 'enLblDelBtn_5', 'link_msgImgEn_5');" name="imgMsgEn_5" id="imgMsgEn_5" class="placeImg" accept="image/*" />
                        <input type="hidden" name="d_link_msgImgEn_5" id="d_link_msgImgEn_5" />
                      </a>
                    </div>
                    
              </div>
              </div>
              </div>
              <!--  Footer -->
              <div class="box-footer">
                <div class="row">
                  <div class="col-md-offset-4 col-md-8">
                    <input type="hidden" id="csrf" name="<?= $token_name; ?>" value="<?= $token_hash; ?>" />
                    <button class="btn btn-info" id="addmessagesubmit" type="submit">Broadcast</button>
                    <button class="btn btn-danger" onClick="return clearForm();" type="button">Clear</button>
                  </div>
                </div>
              </div>
                         
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">

$("document").ready(function(){
	
	$("#claimantCity").change(function(){
		$("#claimantState").val($("#claimantCity option:selected").data("state"));
		$("#claimantZone").val($("#claimantCity option:selected").data("zone"));
	});
	
});


function displayUploadImg(input, PlaceholderID, deleteID, linkID) {
  if (input.files && input.files[0]) {
    var upfile = input.files[0];
    var imagefile = upfile.type;
    var match= ["image/jpeg","image/png","image/jpg"];
    if(!((imagefile==match[0]) || (imagefile==match[1]) || (imagefile==match[2]))){
        alert('Please select a valid image file (JPEG/JPG/PNG).');
        $("#"+input.id).val('');
        return false;
    }
    var file_size = upfile.size/1024/1024;
    if(file_size < 5){
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#'+PlaceholderID)
            .attr('src', e.target.result)
            .width('100%')
            .height(120);
        };
      reader.readAsDataURL(upfile);
      $('#'+deleteID).show();
      $('#'+linkID).show();
    }else{
      alert('File too large. File must be less than 5 MB.');
      $("#"+input.id).val('');
      return false;
    }
  }
}
  $("#add_message_form").on('submit', function(e){
    e.preventDefault();
    var policyNumber   = $( '#add_message_form #policyNumber' ).val();
    var msgCategory    = $( '#add_message_form #msgCategory' ).val();
    var insuredName    = $( '#add_message_form #insuredName' ).val();
    var insuredDOD     = $( '#add_message_form #insuredDOD' ).val();
    var insuredDOB     = $( '#add_message_form #insuredDOB' ).val();
    var sumAssured     = $( '#add_message_form #sumAssured' ).val();
    var msgIntimationType  = $( '#add_message_form #msgIntimationType' ).val();    
    var claimantCity   = $( '#add_message_form #claimantCity option:selected' ).val();
    var claimantZone   = $( '#add_message_form #claimantZone' ).val();
    var claimantState  = $( '#add_message_form #claimantState' ).val();
    var subStatus      = $( '#add_message_form #subStatus' ).val();
    var nomineeName    = $( '#add_message_form #nomineeName' ).val();
    var nomineeMob     = $( '#add_message_form #nomineeMob' ).val();
    var nomineeAdd     = $( '#add_message_form #nomineeAdd' ).val();
    var insuredAdd     = $( '#add_message_form #insuredAdd' ).val();
    
    
    $('#policyNumber').removeClass('has-error-2');
    
    var errorFlag = 0;
    if(policyNumber == '')
    {
    	$('#policyNumber').addClass('has-error-2');
    	toastr.error('Policy Number cannot be empty','Error');
    	errorFlag = 1;
    }
    if(msgCategory == '')
    {
        toastr.error('Investigation Category cannot be empty','Error');
        errorFlag = 1;
    }
    if(insuredName == '')
    {
      	toastr.error('Please enter Insured Name','Error');
      	errorFlag = 1;
    }
    if(insuredDOD == '')
    {
      	toastr.error('Insured Date of Death cannot be empty','Error');
      	errorFlag = 1;
    }
    if(insuredDOB == '')
    {
      	toastr.error('Insured Date of Birth cannot be empty','Error');
      	errorFlag = 1;
    }
    if(sumAssured == '')
    {
        toastr.error('Sum Assured cannot be empty','Error');
        errorFlag = 1;
    }
    if(msgIntimationType == '')
    {
        toastr.error('Please select Intimation Type','Error');
        errorFlag = 1;
    }
    if(claimantCity == '')
    {
	      toastr.error('Claimant City cannot be empty','Error');
	      errorFlag = 1;
    }
    if(claimantZone == '')
    {
      toastr.error('Claimaint Zone Cannot be empty','Error');
      errorFlag = 1;
    }
    if(claimantState == '')
    {
      toastr.error('Claimant State cannot be empty','Error');
      errorFlag = 1;
    }
    if(nomineeName == '')
    {
        toastr.error('Please enter Nominee Name','Error');
        errorFlag = 1;
    }
    if(nomineeMob == '')
    {
        toastr.error('Please enter Nominee Contact Number','Error');
        errorFlag = 1;
    }
    if(nomineeAdd == '')
    {
        toastr.error('Please enter Nominee Address','Error');
        errorFlag = 1;
    }
    if(insuredAdd == '')
    {
        toastr.error('Please enter Insured Address','Error');
        errorFlag = 1;
    }
   
    
    if(errorFlag == 1)
    	return false;
        
    $.ajax({
	    type: "POST",
	    url: 'addMessage',
	    data: {'policyNumber':policyNumber,'msgCategory':msgCategory,'insuredName':insuredName,'insuredDOD':insuredDOB,'insuredDOB':insuredDOD,
	    	       'sumAssured':sumAssured,'msgIntimationType':msgIntimationType,'claimantCity':claimantCity,'claimantZone':claimantZone,'claimantState':claimantState,
	    	       'nomineeName':nomineeName,'nomineeMob':nomineeMob,'nomineeAdd':nomineeAdd,'insuredAdd':insuredAdd},
	    beforeSend: function() {
	    	$("#addmessagesubmit").html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
	        $("#addmessagesubmit").prop('disabled', true);
	        $('#add_message_form').css("opacity",".5");
	    },
	    success: function( data )
	    {
	        $("#addmessagesubmit").html('Broadcast');
	        $("#addmessagesubmit").prop('disabled',false );
	  	  if(data == "****")
	  	  {
	         toastr.success( 'Message Added successfully.','Success' );
	         $("form#add_message_form").trigger("reset");            
	  	  }
	  	  else
	         toastr.error( data,'Error' );
	      $('#add_message_form').css("opacity","");
	    }
	  });
  });

function clearForm(){
  $( '#small_modal' ).modal();
  $( '#sm_modal_title' ).html( 'Are you Sure?' );
  $( '#sm_modal_body' ).html( 'Do you really want to clear this form data?' );
  $( '#sm_modal_footer' ).html( '<button type="button" class="btn dark btn-outline" data-dismiss="modal">Cancel</button><button type="button" id="continuemodal_cl" class="btn green">Yes</button>' );
  $( '#continuemodal_cl' ).click( function() {
    $("form#add_message_form").trigger("reset");
    $("#msgCategory").select2("val", "");
    $("#msgChannel").select2("val", "");
    $(".add_link_btn").hide();
    $('.add_link_btn').attr('data-val','');
    $('#small_modal').modal('hide');
  });
}
</script>
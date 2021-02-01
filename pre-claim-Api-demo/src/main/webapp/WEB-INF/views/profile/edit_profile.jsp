<%@page import="com.preclaim.models.UserDetails" %>
<%
UserDetails user_details = new UserDetails();
user_details = (UserDetails) session.getAttribute("User_Login");
%>
<style type="text/css">
#userImage { display:none;}
</style>
<div class="row">
  <div class="col-md-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
            <i class="icon-user font-green-sharp"></i>
            <span class="caption-subject font-green-sharp sbold">Edit Profile</span>
        </div>
        <div class="actions">
            <div class="btn-group">
              <a href="${pageContext.request.contextPath}/dashboard" data-toggle="tooltip" title="Back" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Back">
                <i class="fa fa-reply"></i>
              </a>
            </div>
        </div>
      </div>
    </div>
    <div class="box box-primary">
      <!-- /.box-header -->
      <!-- form start -->
      <div id="message_account"></div>
      <form novalidate id="edit_profile_form" role="form" method="post" class="form-horizontal">
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="full_name">Name <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" value="<%=user_details.getFull_name() %>" placeholder="Name" id="full_name" class="form-control" name="full_name">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="user_email">Email <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="email" value="<%= user_details.getUser_email() %>" placeholder="Email" id="user_email" class="form-control" name="user_email">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label">Upload image</label>
                <div class="col-md-8">
                  <a href="javascript:void(0);">
                    <span data-imgID="account_picture" data-delID="delUserImg" data-ID="userImage" id="userLblDelBtn" class="delete_btn" data-toggle="tooltip" data-toggle="tooltip" title="Remove"><i class="fa fa-remove"></i></span>
                    <img id="account_picture" style="height:160px;width: auto;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload"
                    <%if(user_details.getUserImageb64().equals("")) {%>
                    src="${pageContext.request.contextPath}/resources/img/default_img.png"
                    <%}else{ %>
                    src="data:image/jpg;base64,<%=user_details.getUserImageb64() %>"
                    ><%} %>
                    <input type="hidden" name="account_image" id="account_image" value="<%=user_details.getUserimage() %>">
                    <input type='file' name="userImage" id="userImage" accept="image/*"  
                    	onchange="displayUploadImg(this, 'account_picture');">
                  </a>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="username">Username <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" value="<%= user_details.getUsername()%>" 
                  	placeholder="User name" maxlength="15" id="username" class="username form-control" 
                  	name="username" readonly disabled>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="password">Password <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required maxlength="15" placeholder="Password" id="password" 
                  	value="<%=user_details.getDecodedPassword() %>"                  	
                  	class="allow_password form-control" name="password">
                </div>
              </div>
            </div>
          </div>
          <!-- /.box-body -->
          <div class="box-footer">
            <div class="col-md-offset-2 col-md-10">
              <input type="hidden" value="<%=user_details.getUserID() %>" id="user_id" name="user_id">
              <button class="btn btn-info" id="editprofilesubmit" type="submit">Update</button>
              <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-danger">Back</a>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
var filename = "";
$(document).ready(function(){
  $("#account_picture").on('click', function() {
    $("#userImage").trigger('click');
  });
  $("#userImage").change(function(e){
	  uploadFiles($("#username").val());
	  filename = $("#username").val() + "_" +e.target.files[0].name;
	  $("#account_image").val(filename);	 
	  console.log(filename); 
  });
  $("#edit_profile_form").on('submit', function(e){
    e.preventDefault();
    var full_name    = $.trim($('#edit_profile_form #full_name').val());
    var username     = $.trim($('#edit_profile_form #username').val());
    var user_email   = $.trim($('#edit_profile_form #user_email').val());
    var password     = $.trim($('#edit_profile_form #password').val());
    var user_id      = $.trim($('#edit_profile_form #user_id').val());
    var acc_img      = $.trim($('#edit_profile_form #account_image').val());

    $('#full_name').removeClass('has-error-2');
    $('#username').removeClass('has-error-2');
    $('#password').removeClass('has-error-2');
    $('#user_email').removeClass('has-error-2');
    if(user_email){
      if (!ValidateEmail(user_email)) {
        $('#user_email').addClass('has-error-2');
        $('#user_email').focus();
        toastr.error("Email ID not in correct format","Error");
      }
    }
    else
   	{
    	$('#user_email').addClass('has-error-2');
        $('#user_email').focus();
        toastr.error("Email-ID cannot be blank");
   	}
    if( password == "" ){
        $('#password').addClass('has-error-2');
        $('#password').focus();
    }
          
    if( full_name == "" ){
        $('#full_name').addClass('has-error-2');
        $('#full_name').focus();
    }
    var newdata = {"full_name":full_name,"username":username,"user_email":user_email,
    		"password":password,"account_img":filename,"user_id":user_id};
    console.log(newdata);
    $.ajax({
        type    : 'POST',
        url     : 'updateProfile',
        data    : newdata,
        beforeSend: function() { 
          $("#editprofilesubmit").html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
          $("#editprofilesubmit").prop('disabled', true);
          $('#edit_profile_form').css("opacity",".5");
        },
        success : function( data ) {
          if(data == "****"){
            $("#editprofilesubmit").html('Update');
            $("#editprofilesubmit").prop('disabled', false);
            toastr.success( 'Profile Updated successfully.','Success' );
          	window.location.href = "${pageContext.request.contextPath}/dashboard";            
            $("#delImgMsgEn").val(0);
            $("#delImgMsgThai").val(0);
          }else{
            toastr.error( data,'Error' );
            $("#editprofilesubmit").html('Update');
            $("#editprofilesubmit").prop('disabled', false);
          }
          $('#edit_profile_form').css("opacity","");
        }
    });
  });
});
function uploadFiles(prefix) {
    var formData = new FormData();
	var files = $("input[type = 'file']");
	$(files).each(function (i,value) {
         		formData.append('file[]', value.files[i]);
    });
    if(prefix != undefined)
		formData.append("prefix",prefix);
    $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath}/uploadFile",
        data: formData,
        contentType: false, //used for multipart/form-data
        processData: false, //doesn't modify or encode the String
        cache: false, 
        async: false,//wait till the execution finishes
        success:function(result)
        {
			if(result == "****")
				toastr.success("File uploaded successfully","Success");
        }
    });
}
//Validate Email
function ValidateEmail(email) {
  var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
  return expr.test(email);
}
</script>
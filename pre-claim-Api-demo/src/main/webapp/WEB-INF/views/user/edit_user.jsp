<%@page import = "java.util.List" %>
<%@page import="com.preclaim.models.UserRole" %>
<%@page import="com.preclaim.models.Location" %>
<%@page import="com.preclaim.models.UserDetails" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<% 
UserDetails user_details = new UserDetails();
user_details = (UserDetails) session.getAttribute("user_details");
session.removeAttribute("user_details");
List<UserRole>role_list = (List<UserRole>) session.getAttribute("role_list");
session.removeAttribute("role_list");
List<Location> location_list = (List<Location>) session.getAttribute("location_list");
session.removeAttribute("location_list");
%>
<style type="text/css">
#imgAccount { display:none;}
</style>
<div class="row">
  <div class="col-md-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
            <i class="icon-user font-green-sharp"></i>
            <span class="caption-subject font-green-sharp sbold">Edit Users</span>
        </div>
        <div class="actions">
            <div class="btn-group">
              <a href="${pageContext.request.contextPath}/user/user_list" data-toggle="tooltip" title="Back" 
              	class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" 
              	style="margin-right: 5px;" data-original-title="Back">
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
      <form novalidate id="edit_account_form" role="form" method="post" class="form-horizontal"
      	modelAttribute = "user_details">
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="full_name">Name<span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" value="<%= user_details.getFull_name()%>" placeholder="Name" 
                  	id="full_name" class="form-control" name="full_name">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="user_email">Email</label>
                <div class="col-md-8">
                  <input type="email" required value="<%= user_details.getUser_email() %>" placeholder="Email" 
                  	id="user_email" class="form-control" name="user_email">
                </div>
              </div>
              <div class="form-group level_div">
                <label class="col-md-4 control-label" for="account_type">Select User Type
                	<span class="text-danger">*</span>
               	</label>
                <div class="col-md-8">
                  <select name="account_type" id="account_type" class="form-control selecter_1" 
                  	tabindex="-1">
                    <option value="-1" selected disabled >Select</option>
                    <%if(role_list != null){
                    	for(UserRole roles: role_list){
                    	%>
                    	<option value = "<%= roles.getRole_code()%>"
                    	<% if(user_details.getAccount_type().equals(String.valueOf(roles.getRole_code()))){%>
                    		selected
                    	<%} %>
                    	>	<%=roles.getRole() %>
                    </option>	
                    <%}} %>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="contactNumber">Contact Number <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="number" placeholder="Contact Number" id="contactNumber" class="form-control"
                  	name="contactNumber" value = "<%=user_details.getContactNumber() %>">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="state">State <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" placeholder="State" id="state" class="form-control" name="state"
                  	value = "<%=user_details.getState() %>">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label">Upload image</label>
                <div class="col-md-8">
                  <a href="javascript:void(0);">
                    <% 
                    if(!user_details.getUserImageb64().equals("")){ %>
                      <img src="data:image/jpg;base64,<%=user_details.getUserImageb64() %>" id="account_picture" 
                      	style="height:160px;width: auto;" data-src="#"> <br />
                    <% 
                    }else {
                    %>
                      <img src="${pageContext.request.contextPath}/resources/uploads/default_img.png" id="account_picture" 
                      	style="height:160px;width: auto;" data-src="#" /> <br />
                    <% 
                    }
                    %>
                    <input type='file' id="imgAccount" accept="image/*" 
                    	onchange="displayUploadImg(this, 'account_picture');">
                  </a>
                  <input type="hidden" id="account_image" name="account_image" value="">
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="username">Username<span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" value="<%=user_details.getUsername() %>" placeholder="User name" 
                  	maxlength="15" id="username" class="username form-control" name="username"
                  	readonly disabled>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="password">Password<span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="password" value="<%=user_details.getDecodedPassword() %>" maxlength="15" 
                  	placeholder="Password" id="password" class="allow_password form-control" 
                  	name="password">
                </div>
              </div>
              <div class="form-group level_div">
                <label class="col-md-4 control-label" for="status">Select Status<span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <select name="status" id="status" class="form-control selecter_1" tabindex="-1">
                    <option value="">Select</option>
                    <option <% if(user_details.getStatus() == 1){ %> selected <% } %> value="1">Active</option>
                    <option <% if(user_details.getStatus() == 0){ %> selected <% } %> value="0">Inactive</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="city">City <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <select id="city" class="form-control" name="city">
                   	 <option value="-1" selected disabled>Select</option>
                  	 <%if(location_list!=null){ 
                  	  for(Location location : location_list){%>  
                  	  <option value = "<%=location.getCity()%>" data-state = "<%=location.getState() %>" 
                  	  	<%if(location.getCity().equals(user_details.getCity())) {%>selected <%} %>
                  	  	data-zone = "<%=location.getZone() %>">
                  	  		<%=location.getCity()%>
           	  		 </option>
                  	 <%}} %>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="zone">Zone <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" placeholder="Zone" maxlength="15" id="zone" class="form-control" 
                  	name="zone" value = "<%=user_details.getZone() %>">
                </div>
              </div>
            </div>
          </div>
          <!-- /.box-body -->
          <div class="box-footer">
            <div class="col-md-offset-2 col-md-10">
              <input type="hidden" value="<%=user_details.getUserID() %>" id="user_id" name="user_id">
              <button class="btn btn-info" id="editaccountsubmit" onclick = "return updateAccountValidate();" 
              	type="button">Update</button>
              <a href="${pageContext.request.contextPath}/user/user_list" class="btn btn-danger">Back</a>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script>
$(document).ready(function(){
  
  $("#account_picture").on('click', function() {
    $("#imgAccount").trigger('click');
  });
  $("#imgAccount").change(function(e){
	 var filename = $("#username").val() + "_" +e.target.files[0].name;
	 $("#account_image").val(filename);
	 console.log($("#account_image").val());
	 uploadFiles($("#username").val());
	  });
  $("#city").change(function(){
		$("#state").val($("#city option:selected").data("state"));
		$("#zone").val($("#city option:selected").data("zone"));		
	});
});
</script>
<script>
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
        url: '${pageContext.request.contextPath}/uploadFile',
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
    return false;
}

//Validate Email
function ValidateEmail(email) {
  var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
  return expr.test(email);
}

//EDIT ACCOUNT

function updateAccountValidate() {
    var full_name    = $.trim($('#edit_account_form #full_name').val());
    var username     = $.trim($('#edit_account_form #username').val());
    var user_email   = $.trim($('#edit_account_form #user_email').val());
    var password     = $.trim($('#edit_account_form #password').val());
    var account_img  = $.trim($('#edit_account_form #account_image').val());
    var account_type = $.trim($('#edit_account_form #account_type').val());
    var user_id      = $.trim($('#edit_account_form #user_id').val());
    var status       = $.trim($('#edit_account_form #status').val());
    var contactNumber = $.trim($('#edit_account_form #contactNumber').val());
    var state        = $.trim($('#edit_account_form #state').val());
    var zone         = $.trim($('#edit_account_form #zone').val());
    var city         = $.trim($('#edit_account_form #city').val());
    
    $('#full_name').removeClass('has-error-2');
    $('#username').removeClass('has-error-2');
    $('#password').removeClass('has-error-2');
    $('#user_email').removeClass('has-error-2');
    $('#status').removeClass('has-error-2');
    $('#account_type').removeClass('has-error-2');
    $('#contactNumber').removeClass('has-error-2');
    $('#state').removeClass('has-error-2');
    $('#zone').removeClass('has-error-2');
    $('#city').removeClass('has-error-2');
    let validflag = 1;
    
    if( contactNumber == "" )
    {
        $('#contactNumber').addClass('has-error-2');
        $('#contactNumber').focus();
        validflag = 0;
        toastr.error("Kindly enter Contact Number","Error");
    }
    if( state == "" )
    {
        $('#state').addClass('has-error-2');
        $('#state').focus();
        validflag = 0;
        toastr.error("Kindly enter your State Name","Error");
    }
    if( zone == "" ){
        $('#zone').addClass('has-error-2');
        $('#zone').focus();
        validflag = 0;
        toastr.error("Kindly enter your Zone Area","Error");
    }
    if( city == "" ){
        $('#city').addClass('has-error-2');
        $('#city').focus();
        validflag = 0;
        toastr.error("Kindly enter your City Name","Error");
    }
    if( status == "" )
    {
        $('#status').addClass('has-error-2');
        $('#status').focus();
        validflag = 0;
        toastr.error("Kindly select User profile status","Error");
    }
    if( account_type == "" )
    {
        $('#account_type').addClass('has-error-2');
        $('#account_type').focus();
        validflag = 0;
        toastr.error("Kindly select User Type","Error");
    }
    if( password == "" )
    {
        $('#password').addClass('has-error-2');
        $('#password').focus();
        validflag = 0;
        toastr.error("Kindly enter Password","Error");
    }
    if( account_type == "" )
    {
        $('#account_type').addClass('has-error-2');
        $('#account_type').focus();
        validflag = 0;
    }
    if( status == "" )
    {    
        $('#status').addClass('has-error-2');
        $('#status').focus();
        validflag = 0;
    }
    if(user_email)
    {
        if (!ValidateEmail(user_email)) 
        {
          $('#user_email').addClass('has-error-2');
          $('#user_email').focus();
          toastr.error("Email ID not in correct format","Error");
          validflag = 0;
        }
      }
    else
   	{
    	$('#user_email').addClass('has-error-2');
        $('#user_email').focus();
        toastr.error("Email-ID cannot be blank");
        validflag = 0;
   	}
//     if( username == "" ){
//         $('#username').addClass('has-error-2');
//         $('#username').focus();
//         validflag = 0;
//         toastr.error("Kindly enter Username","Error");
//     }
//     else
//    	{
//     	console.log("Entered");
// 	    $.ajax({
// 	        type    : 'POST',
// 	        url     : '${pageContext.request.contextPath}/user/accountValidate',
// 	        data    : {'username':username},
// 	        beforeSend: function() { 
// 	            $("#editaccountsubmit").html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
// 	            $("#editaccountsubmit").prop('disabled', true);
// 	        },
// 	        success : function( msg ) {
// 	            $("#editaccountsubmit").html('Update');
// 	            $("#editaccountsubmit").prop('disabled', false);
// 	            if( msg != "****" ) 
// 	            {
// 	                toastr.error(msg,'Error');
// 	                $('#username').addClass('has-error-2');
// 	                $('#username').focus();	            
// 	                validflag = 0;
// 	            }
// 	        }
// 	    });
//    	}
    
    if( full_name == "" )
    {
        $('#full_name').addClass('has-error-2');
        $('#full_name').focus();
        validflag = 0;
        toastr.error("Full Name cannot be blank","Error");
    }
    console.log(validflag);
    if(validflag == 0)
    	return;
    	
    $("#editaccountsubmit").html('<img src = "${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');            
    $("#editaccountsubmit").prop('disabled', true);
    var formdata = {"full_name":full_name, "username":username, "user_email":user_email,
        "password":password, "account_type":account_type, "user_id":user_id, "account_img":account_img,
        "status":status, "city":city, "state":state, "zone":zone, "contactNumber":contactNumber}
    
    $.ajax({
        type    : 'POST',
        url     : '${pageContext.request.contextPath}/user/updateUserDetails',
        data    : formdata,
        success : function( msg ) 
        {
            $("#editaccountsubmit").html('Update');
            $("#editaccountsubmit").prop('disabled', false);
            if( msg == "****" ) 
            {
            	toastr.success("User updated successfully",'success');
                window.location.href = "${pageContext.request.contextPath}/user/user_list";
            } 
            else
                toastr.error(msg,'Error');
        }
    });
}
</script>

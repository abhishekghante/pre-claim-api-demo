<%@page import = "java.util.List" %>
<%@page import="com.preclaim.models.UserRole" %>
<%@page import="com.preclaim.models.Location" %>
<%
List<String> user_permission=(List<String>)session.getAttribute("user_permission");
List<Location> location_list = (List<Location>) session.getAttribute("location_list");
session.removeAttribute("location_list");
%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<link href = "${pageContext.request.contextPath}/resources/custom_css/custom.css">
<style type="text/css">
#imgAccount { display:none;}
</style>
<div class="row">
  <div class="col-md-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
            <i class="icon-user font-green-sharp"></i>
            <span class="caption-subject font-green-sharp sbold">Add Users</span>
        </div>
        <div class="actions">
            <div class="btn-group">
              <a href="${pageContext.request.contextPath}/user/user_list" data-toggle="tooltip" 
              	class="btn green-haze btn-outline btn-xs pull-right" style="margin-right: 5px;" 
              	data-original-title="Back" title="Back">
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
      <form novalidate id="add_account_form" role="form" method="post" class="form-horizontal" 
      	action = "create_user" modelAttribute = "user_details" onsubmit = "return accountValidate()">
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="full_name">Name <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required placeholder="Name" id="full_name" class="form-control" 
                  	name="full_name">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="user_email">Email</label>
                <div class="col-md-8">
                  <input type="email" placeholder="Email" id="user_email" class="form-control" 
                  	name="user_email">
                </div>
              </div>
              <div class="form-group level_div">
                <label class="col-md-4 control-label" for="account_type">Select User Type <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <select name="account_type" id="account_type" class="form-control selecter_1" tabindex="-1" 
                  	required>
                    <option value="-1" selected disabled>Select</option>
                	<c:forEach var="role_list" items="${role_list}">
                		<option value = "${role_list.role_code}">${role_list.role}</option>
                	</c:forEach>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="contactNumber">Contact Number <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="number" required placeholder="Contact Number" id="contactNumber" class="form-control" 
                  	name="contactNumber">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="state">State <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required placeholder="State" id="state" class="form-control" 
                  	name="state">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label">Upload image</label>
                <div class="col-md-8">
                  <a href="javascript:void(0);">
                    <img src="${pageContext.request.contextPath}/resources/img/upload_img.png" 
                    	id="img_userimage" style="height:160px;width: auto;" data-src="#"> <br />
                    <input type='file' id="input_userimage" accept="image/*" style = "display:none"
                    	onchange="displayUploadImg(this, 'img_userimage');">
                  </a>
                  <input type="hidden" id="account_image" name="account_image">
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="username">Username <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required placeholder="User name" maxlength="15" id="username" class="username form-control" name="username">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="password">Password <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="password" required maxlength="15" placeholder="Password" id="password" class="allow_password form-control" name="password">
                </div>
              </div>
              <div class="form-group level_div">
                <label class="col-md-4 control-label" for="status">Select Status <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <select name="status" id="status" class="form-control selecter_1" tabindex="-1" required>
                    <option value="-1" selected disabled>Select</option>
                    <option value="1">Active</option>
                    <option value="2">Inactive</option>
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
                  	  <option value=<%=location.getCity()%> data-state = <%=location.getState() %>
                  	  	data-zone = <%=location.getZone() %>><%=location.getCity()%></option>
                  	 <%}} %>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="zone">Zone <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required placeholder="Zone" maxlength="15" id="zone" class="form-control" name="zone">
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <div class="col-md-offset-2 col-md-10">
            <button class="btn btn-info" id="addaccountsubmit" type="submit">Create</button>
            <button class="btn btn-danger" type="reset">Clear</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	var filename ="";
	$("#img_userimage").on('click', function() {
	    $("#input_userimage").trigger('click');
	  });
	$("#input_userimage").change(function(e){ 
		filename = $("#username").val() + "_" +e.target.files[0].name;
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
function accountValidate() {
	<%if(!user_permission.contains("users/add")){%>
		toastr.error("Access Denied","Error");
		return false;
	<%}%>
    var full_name    = $.trim($('#add_account_form #full_name').val());
    var username     = $.trim($('#add_account_form #username').val());
    var user_email   = $.trim($('#add_account_form #user_email').val());
    var password     = $.trim($('#add_account_form #password').val());
    var account_img  = $.trim($('#add_account_form #account_image').val());
    var account_type = $.trim($('#add_account_form #account_type').val());
    var status       = $.trim($('#add_account_form #status').val());
    var contactNumber = $.trim($('#add_account_form #contactNumber').val());
    var state        = $.trim($('#add_account_form #state').val());
    var zone         = $.trim($('#add_account_form #zone').val());
    var city         = $.trim($('#add_account_form #city').val());
   	
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
    
    if( contactNumber == "" ){
        $('#contactNumber').addClass('has-error-2');
        $('#contactNumber').focus();
        validflag = 0;
        toastr.error("Kindly enter Contact Number","Error");
    }
    if( state == "" ){
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
    if( status == "" ){
        $('#status').addClass('has-error-2');
        $('#status').focus();
        validflag = 0;
        toastr.error("Kindly select User profile status","Error");
    }
    if( account_type == "" ){
        $('#account_type').addClass('has-error-2');
        $('#account_type').focus();
        validflag = 0;
        toastr.error("Kindly select User Type","Error");
    }
    if( password == "" ){
        $('#password').addClass('has-error-2');
        $('#password').focus();
        validflag = 0;
        toastr.error("Kindly enter Password","Error");
    }
    if(user_email){
        if (!ValidateEmail(user_email)) 
        {
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
    if( username == "" ){
        $('#username').addClass('has-error-2');
        $('#username').focus();
        validflag = 0;
        toastr.error("Kindly enter Username","Error");
    }
    else
   	{
	    $.ajax({
	        type    : 'POST',
	        url     : 'accountValidate',
	        data    : {'username':username},
	        beforeSend: function() { 
	            $("#addaccountsubmit").html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
	            $("#addaccountsubmit").prop('disabled', true);
	        },
	        success : function( msg ) {
	            $("#addaccountsubmit").html('Create');
	            $("#addaccountsubmit").prop('disabled', false);
	            if( msg != "****" ) {
	                toastr.error(msg,'Error');
	                $('#username').addClass('has-error-2');
	                $('#username').focus();	            
	                validflag = 0;
	            }
	        }
	    });
   	}
    
    if( full_name == "" ){
        $('#full_name').addClass('has-error-2');
        $('#full_name').focus();
        validflag = 0;
        toastr.error("Full Name cannot be blank","Error");
    }
    if(validflag == 1)
    	return true;
    return false;
}
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
</script>
<%@page import="com.preclaim.models.MailConfigList"%>
<%
MailConfigList mailConfig = (MailConfigList) session.getAttribute("editMailConfig");
session.removeAttribute("editMailConfig");
%>
<div class="row">
  <div class="col-md-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
          <i class="fa fa-inbox font-green-sharp" style = "font-size:20px"></i>
          <span class="caption-subject font-green-sharp sbold">Edit Mail Config</span>
        </div>
        <div class="actions">
          <div class="btn-group">
            <a href="${pageContext.request.contextPath}/mailConfig/pending" data-toggle="tooltip" title="Back" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Back">
              <i class="fa fa-reply"></i>
            </a>
          </div>
        </div>
      </div>
    </div>
    <div class="box box-primary">
      <!-- form start -->
      <div id="message_account"></div>
      <form novalidate id="edit_config_form" role="form" class="form-horizontal">
        <div class="box-body">
          <div class="row">
          	<h4><b>User Information:</b></h4>
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="username">Username <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" placeholder="Username" id="username" class="form-control" 
                  	name="username" value = "<%=mailConfig.getUsername() %>">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="password">Password <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" placeholder="Password" id="password" class="form-control" 
                  	name="password" value = "<%=mailConfig.getPassword()%>">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
          <h4><b>Server Information:</b></h4>
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="outgoingServer">Outgoing SMTP server <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" placeholder="Outgoing Mail Server" id="outgoingServer" 
                  	class="form-control" name="outgoingServer" value = "<%=mailConfig.getOutgoingServer()%>">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="outgoingPort">Outgoing SMTP Port <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="number" placeholder="Outgoing Port" id="outgoingPort" class="form-control" 
                  	name="outgoingPort" value = "<%=mailConfig.getOutgoingPort()%>">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="encryptionType">Encryption Type <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <select id = "encryptionType" name = "encryptionType" class = "form-control">
                  	<option value = "TLS" 
                  		<% if(mailConfig.getEncryptionType().equals("TLS")){%> selected <%} %>>TLS</option>
                  	<option value = "SSL"
                  		<% if(mailConfig.getEncryptionType().equals("SSL")){%> selected <%} %>>SSL</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <div class="col-md-offset-2 col-md-10">
          	<input type = "hidden" name = "mailConfigId" id = "mailConfigId" value = "<%= mailConfig.getMailConfigId()%>">
            <button class="btn btn-info" id="editconfigsubmit" onClick="return validateConfig();" 
            	type="button">Edit Mail Config</button>
            <button class="btn btn-danger" type="reset">Clear</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
function validateConfig() 
{
	var username = $( '#edit_config_form #username').val(); 
	var password = $( '#edit_config_form #password').val();
	var outgoingServer = $( '#edit_config_form #outgoingServer').val();
	var outgoingPort = $( '#edit_config_form #outgoingPort').val();
	var encryptionType = $( '#edit_config_form #encryptionType').val();
	var mailConfigId =  $( '#edit_config_form #mailConfigId').val();
	$("#username").removeClass("has-error-2");
	$("#password").removeClass("has-error-2");
	$("#outgoingServer").removeClass("has-error-2");
	$("#outgoingPort").removeClass("has-error-2");
	$("#encryptionType").removeClass("has-error-2");
	
	let validFlag = 0;
	if(encryptionType == "" || encryptionType == null)
	{
		toastr.error("Encryption Type cannot be blank","Error");
		$("#encryptionType").focus();
		$("#encryptionType").addClass("has-error-2");
		validFlag = 1;
	}
	if(outgoingPort == 0 || outgoingPort == null)
	{
		toastr.error("Outgoing SMTP Port cannot be blank","Error");
		$("#outgoingPort").focus();
		$("#outgoingPort").addClass("has-error-2");
		validFlag = 1;
	}
	if(outgoingServer == "" || outgoingServer == null)
	{
		toastr.error("Outgoing Server cannot be blank","Error");
		$("#outgoingServer").focus();
		$("#outgoingServer").addClass("has-error-2");
		validFlag = 1;
	}
	if(password = "" || password == null)
	{
		toastr.error("Logon Password cannot be blank","Error");
		$("#password").focus();
		$("#password").addClass("has-error-2");
		validFlag = 1;
	}
	if(username == "" || username == null)
	{
		toastr.error("Username cannot be blank","Error");
		$("#username").focus();
		$("#username").addClass("has-error-2");
		validFlag = 1;
	}
	
	if(validFlag == 1)
		return false;
	var formdata = {"username" : username, "password" : password, "outgoingServer" : outgoingServer,
			"outgoingPort" : outgoingPort, "encryptionType" : encryptionType, "mailConfigId":
				mailConfigId};
	$.ajax({
		type : "POST",
		url : '${pageContext.request.contextPath}/mailConfig/update',
		data : formdata,
		beforeSend : function() {
			$("#editconfigsubmit").html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
			$("#editconfigsubmit").prop('disabled', true);
		},
		success : function(data) {
			$("#editconfigsubmit").html('Update');
			$("#editconfigsubmit").prop('disabled', true);
			if (data == "****") 
			{
				toastr.success('Configuration Updated successfully.', 'Success');
				location.href ="${pageContext.request.contextPath}/mailConfig/pending";
			} 
			else 
				toastr.error(data, 'Error');
				
		}
	});
}
</script>
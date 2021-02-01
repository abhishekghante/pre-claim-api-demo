<!DOCTYPE html>
<html lang="en">
  <!--<![endif]-->
  <!-- BEGIN HEAD -->
  <head>
      <meta charset="utf-8" />
      <title>Pre-Claim Investigation | Login</title>
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta content="width=device-width, initial-scale=1" name="viewport" />
      <meta content="" name="description" />
      <meta content="" name="author" />
      <!-- BEGIN GLOBAL MANDATORY STYLES -->
      <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
      <link href="${pageContext.request.contextPath}/resources/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
      <link href="${pageContext.request.contextPath}/resources/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath}/resources/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath}/resources/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
      <link href="${pageContext.request.contextPath}/resources/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
      <!-- END GLOBAL MANDATORY STYLES -->
      <!-- BEGIN PAGE LEVEL PLUGINS -->
      <link href="${pageContext.request.contextPath}/resources/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
      <link href="${pageContext.request.contextPath}/resources/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
      <!-- END PAGE LEVEL PLUGINS -->
      <!-- BEGIN THEME GLOBAL STYLES -->
      <link href="${pageContext.request.contextPath}/resources/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
      <link href="${pageContext.request.contextPath}/resources/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
      <!-- END THEME GLOBAL STYLES -->
      <!-- BEGIN PAGE LEVEL STYLES -->
      <link href="${pageContext.request.contextPath}/resources/pages/css/login-4.min.css" rel="stylesheet" type="text/css" />
      <link href="${pageContext.request.contextPath}/resources/global/plugins/bootstrap-toastr/toastr.min.css" rel="stylesheet" type="text/css" />
      <link href="${pageContext.request.contextPath}/resources/custom_css/custom.css" rel="stylesheet" type="text/css" />
      <!-- END PAGE LEVEL STYLES -->
      <!-- BEGIN THEME LAYOUT STYLES -->
      <!-- END THEME LAYOUT STYLES -->
      <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" />
    </head>
  <!-- END HEAD -->
  <body class="login">
      <!-- BEGIN LOGO -->
      <div class="logo">
          <a href="${pageContext.request.contextPath}/login">
            <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="logo">
          </a>
      </div>
      <!-- END LOGO -->
      <!-- BEGIN LOGIN -->
      <div class="content">
      	<p class = "text-center" style = "font-size:70px;margin-top:-5px"><i class = "fa fa-lock"></i></p>
      	<h3 class = "text-center" style = "margin-top:-24px">Forgot Password?</h3>
		  <div class="login-box-body">
		    <p class="login-box-msg">Enter your username below and we'll mail your password.</p>
			<form>			
		      <div class="row" style = "padding-left:5px;padding-right:5px;margin-bottom:5px">
                <div class="form-group">
                  <label class="control-label visible-ie8 visible-ie9">Username</label>
                  <div class="input-icon">
                    <i class="fa fa-user"></i>
                    <input type="text" class="form-control placeholder-no-fix" id="username" 
                    	name="username" placeholder="Username">
                  </div>
              	</div>
		      </div>
		      <div class = "row" style = "margin-bottom:10px;padding-left:5px;padding-right:5px">
		        <div class="form-group">
		          <button type = "button" class = "btn btn-success pull-right btn-block btn-flat" 
		          	id = "login_submit" name = "login_submit" onClick = "forgotValidate()">
		          	Send My Password
		          	</button> 
		          
		        </div>
		      </div>
		    </form>
		  </div>
		  <!-- /.login-box-body -->
		</div>

      <!-- END LOGIN -->
      <!-- BEGIN COPYRIGHT -->
      <div class="copyright" style="color:#7a1315;"> 2020 &copy; Pre-Claim Investigation. </div>
      <!-- END COPYRIGHT -->
      <!-- BEGIN CORE PLUGINS -->
      <script src="${pageContext.request.contextPath}/resources/global/plugins/jquery.min.js" type="text/javascript"></script>
      <script src="${pageContext.request.contextPath}/resources/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
      <script src="${pageContext.request.contextPath}/resources/global/plugins/js.cookie.min.js" type="text/javascript"></script>
      <script src="${pageContext.request.contextPath}/resources/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
      <script src="${pageContext.request.contextPath}/resources/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
      <script src="${pageContext.request.contextPath}/resources/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
      <script src="${pageContext.request.contextPath}/resources/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
      <script src="${pageContext.request.contextPath}/resources/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
      <!-- END CORE PLUGINS -->
      <!-- BEGIN PAGE LEVEL PLUGINS -->
      <script src="${pageContext.request.contextPath}/resources/global/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
      <!-- END PAGE LEVEL PLUGINS -->
      <!-- BEGIN THEME GLOBAL SCRIPTS -->
      <script src="${pageContext.request.contextPath}/resources/global/scripts/app.min.js" type="text/javascript"></script>
      <script src="${pageContext.request.contextPath}/resources/global/plugins/bootstrap-toastr/toastr.min.js" type="text/javascript"></script>
      <!-- END THEME GLOBAL SCRIPTS -->
      <!-- BEGIN PAGE LEVEL SCRIPTS -->
      
<script>   
//FORGOT PASSWORD
function forgotValidate() {
    var username    = $( '#username' ).val();
    
    if(username == "")
    	{
    		toastr.error("Username cannot be blank", "Error");
    		return;
    	}
    var data = { 'username' : username }
    $.ajax({
        type    : 'POST',
        url     : 'changePassword',
        data    : data,
        beforeSend: function() {
            $("#login_submit").html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
            $("#login_submit").prop("disabled",true);
        },
        success : function( msg ) {
        	$("#login_submit").html("Send My Password");
            $("#login_submit").prop("disabled",false);
            if( msg == "****" ) {
                toastr.success('Password has been sent to your e-mail address.',"Success");
            } else {
                toastr.error(msg,"Error");
            }
        }
    });
}
</script>
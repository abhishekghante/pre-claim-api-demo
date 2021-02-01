<%@page import="java.util.List"%>
<%
List<String> user_permission=(List<String>)session.getAttribute("user_permission");
%>
<div class="row">
  <div class="col-md-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
          <i class="icon-users font-green-sharp"></i>
          <span class="caption-subject font-green-sharp sbold">Add Location</span>
        </div>
        <div class="actions">
          <div class="btn-group">
            <a href="${pageContext.request.contextPath}/locations/pending" data-toggle="tooltip" title="Back" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Back">
              <i class="fa fa-reply"></i>
            </a>
          </div>
        </div>
      </div>
    </div>
    <div class="box box-primary">
      <!-- form start -->
      <div id="message_account"></div>
      <form novalidate id="add_location_form" role="form" method="post" class="form-horizontal">
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="city">City <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" placeholder="City Name" id="city" class="form-control" name="city">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="state">State <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" placeholder="State" id="state" class="form-control" name="state">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="zone">Zone <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" placeholder="Zone" id="zone" class="form-control" name="zone">
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <div class="col-md-offset-2 col-md-10">
            <button class="btn btn-info" id="addlocationsubmit" onClick="return addLocation();" type="button">Add Location</button>
            <button class="btn btn-danger" type="reset">Clear</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
<%-- function addLocation() {
	<%if(!user_permission.contains("location/add")){%>
		toastr.error("Access Denied","Error");
		return false;
	<%}%>
	var city = $( '#add_location_form #city').val();;
	var state = $( '#add_location_form #state').val();;
	var zone = $( '#add_location_form #zone').val();;
	
	//Validation routine
	var errorFlag = 0;
	$("#city").removeClass("has-error-2");
	$("#state").removeClass("has-error-2");
	$("#zone").removeClass("has-error-2");
	if(zone == "")
	{
		toastr.error("Zone cannot be blank", "Error");
		$("#zone").addClass("has-error-2");
		$("#zone").focus();
		errorFlag = 1;
	}
	if(state == "")
	{
		toastr.error("State cannot be blank", "Error");
		$("#state").addClass("has-error-2");
		$("#state").focus();
		errorFlag = 1;
	}
	if(city == "")
	{
		toastr.error("City cannot be blank", "Error");
		$("#city").addClass("has-error-2");
		$("#city").focus();
		errorFlag = 1;
	}
	
    $.ajax({
      type: "POST",
      url:'addLocation',
      data: {"city":city, "state":state, "zone":zone},
      beforeSend: function() { 
          $("#addLocationsubmit").html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
          $("#addLocationsubmit").prop('disabled', true);
      },
      success: function( data ) {
    	  $("#addLocationsubmit").html('Add Location');
          $("#addLocationsubmit").prop('disabled', false);
          
    	  if(data == "****")
    	  {
	          toastr.success( 'Location Added successfully.','Success');
	          location.reload();
    	  }
    	  else
    	  toastr.error( data,'Error');
      }
    });  
} --%>
function addLocation() {
	<%if(!user_permission.contains("location/add")){%>
		toastr.error("Access Denied","Error");
		return false;
	<%}%>	
  	var city  = $( '#add_location_form #city' ).val();
	var state = $( '#add_location_form #state' ).val();
	var zone = $( '#add_location_form #zone' ).val();
	if(city == ''){
	  toastr.error('City cannot be blank','Error');
	  return false;
	}
	if(state == ''){
	  toastr.error('State cannot be blank','Error');
	  return false;
	}
	if(zone == ''){
		  toastr.error('Zone cannot be blank','Error');
		  return false;
		}
	    var formdata = {"city" : city, "state" : state, "zone" : zone};
	    $.ajax({
	      type: "POST",
	      url: 'addLocation',
	      data: formdata,
	      beforeSend: function() { 
	          $("#addlocationsubmit").html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
	          $("#addlocationsubmit").prop('disabled', true);
	      },
	      success: function( data ) {
	        if(data == "****"){
	          $("#addlocationsubmit").html('Add Location');
	          $("#addlocationsubmit").prop('disabled', false);
	          toastr.success( 'Location Added successfully.','Success' );
	          $( '#add_location_form #city' ).val('');
	          $( '#add_location_form #state' ).val('');
	          $( '#add_location_form #zone' ).val('');
	          location.reload();
	        }else{
	          toastr.error( data,'Error' );
	          $("#addlocationsubmit").html('Add Location');
	          $("#addlocationsubmit").prop('disabled', false);
	        }
	      }
	    });
	  
}
</script>
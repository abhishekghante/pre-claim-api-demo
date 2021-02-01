<%@page import="com.preclaim.models.Location"%>
<%@page import="java.util.List"%>
<%
List<Location> pending_location = (List<Location>) session.getAttribute("pending_location");
session.removeAttribute("pending_location");
Location location = (Location) session.getAttribute("location");
session.removeAttribute("location");
List<String> user_permission=(List<String>)session.getAttribute("user_permission");
boolean allow_statusChg = user_permission.contains("location/status");
boolean allow_delete = user_permission.contains("location/delete");
%>
<link href="${pageContext.request.contextPath}/resources/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/resources/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<div class="row">
	<div class="col-md-12 col-sm-12">
		<div class="portlet box">
			<div class="portlet-title">
				<div class="caption">
					<i class="icon-users font-green-sharp"></i>
					<span class="caption-subject font-green-sharp sbold">
						<%= location == null ? "Add " : "Update " %>
						Location
					</span>
				</div>
			</div>
		</div>
		<div class="portlet light bordered">
			<div class="portlet-body">
				<div id="message_account"></div>
				<form novalidate id="edit_location_form" role="form" method="post"
					class="form-horizontal">
					<div class="row">
			            <div class="col-md-6">
			              <div class="form-group">
			                <label class="col-md-4 control-label" for="city">City <span class="text-danger">*</span></label>
			                <div class="col-md-8">
			                  <input type="text" placeholder="City Name" id="city" class="form-control" 
			                  	name="city" value = "<%=location == null ? "" : location.getCity()%>">
			                </div>
			              </div>
			            </div>
			          </div>
			          <div class="row">
			            <div class="col-md-6">
			              <div class="form-group">
			                <label class="col-md-4 control-label" for="state">State <span class="text-danger">*</span></label>
			                <div class="col-md-8">
			                  <input type="text" placeholder="State" id="state" class="form-control" 
			                  	name="state" value = "<%=location == null ? "" : location.getState()%>">
			                </div>
			              </div>
			            </div>
			          </div>
			          <div class="row">
			            <div class="col-md-6">
			              <div class="form-group">
			                <label class="col-md-4 control-label" for="zone">Zone <span class="text-danger">*</span></label>
			                <div class="col-md-8">
			                  <input type="text" placeholder="Zone" id="zone" class="form-control" 
			                  	name="zone" value = "<%=location == null ? "" : location.getZone()%>">
			                </div>
			              </div>
			            </div>
			          </div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<div class="col-md-offset-4 col-md-8">
								<% if(location != null){ %>
									<input type="hidden" id="locationId" name="locationId"
										value = "<%= location.getLocationId()%>">
									<button class="btn btn-info" id="editlocationsubmit"
										onClick="return updateLocation();" type="button">Update</button>
									<a href="${pageContext.request.contextPath}/location/pending"
										class="btn btn-danger">Back</a>
									<% }else{ %> 
									<button class="btn btn-info" id="addlocationsubmit"
										onClick="return addLocation();" type="button">Add
										Location</button>
									<button class="btn btn-danger" type="reset" value="">Clear</button>
									<% } %> 
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- <?php } ?>  -->
<div class="row">
	<div class="col-xs-12 col-sm-12">
		<div class="portlet box">
			<div class="portlet-title">
				<div class="caption">
					<i class="icon-users font-green-sharp"></i> <span
						class="caption-subject font-green-sharp sbold">Pending
						Location</span>
				</div>
				<div class="actions">
					<div class="btn-group">
						<a href="${pageContext.request.contextPath}/location/add"
							data-toggle="tooltip" title="Add" data-original-title="Add New"
							class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip"
							style="margin-right: 5px;"><i class="fa fa-plus"></i>
						</a>
					</div>
				</div>
			</div>
		</div>

		<div class="box box-primary">
			<div class="box-body">
				<div class="row">
					<div class="col-md-12 table-container">
						<div class="box-body no-padding">
							<table id="pending_location_list"
								class="table table-striped table-bordered table-hover table-checkable dataTable data-tbl">
								<thead>
									<tr class="tbl_head_bg">
										<th class="head1 no-sort">#</th>
										<th class="head1 no-sort">City</th>
										<th class="head1 no-sort">State</th>
										<th class="head1 no-sort">Zone</th>
										<th class="head1 no-sort">Status</th>
										<th class="head1 no-sort">Action</th>
									</tr>
								</thead>
								<tfoot>
									<tr class="tbl_head_bg">
										<th class="head2 no-sort"></th>
										<th class="head2 no-sort"></th>
										<th class="head2 no-sort"></th>
										<th class="head2 no-sort"></th>
										<th class="head2 no-sort"></th>
										<th class="head2 no-sort"></th>
									</tr>
								</tfoot>
								<tbody>
									<%
									if (pending_location != null) {
										int i = 1;
										for (Location list_location : pending_location) {
									%>
									<tr>
										<td><%=i%></td>
										<td><%=list_location.getCity()%></td>
										<td><%=list_location.getState()%></td>
										<td><%=list_location.getZone()%></td>
										<td><span class="label label-sm label-danger">Pending</span></td>
										<td>
										   <a href="${pageContext.request.contextPath}/location/pending?locationId=<%=list_location.getLocationId() %>" 										   										   
										   		data-toggle="tooltip" title="Edit" class="btn btn-primary btn-xs">
										   		<i class="glyphicon glyphicon-edit"></i>
									   		</a> 
											<a href="javascript:;" data-toggle="tooltip" title="Active" onClick="return updateLocationStatus(<%=list_location.getLocationId() %>,1,<%=allow_statusChg%>);"
											    class="btn btn-success btn-xs"><i class="glyphicon glyphicon-ok-circle"></i></a> 
											<a href="javascript:;" data-toggle="tooltip" title="Delete" onClick="return deleteLocation('<%=list_location.getLocationId()%>',<%=allow_delete %>);"
										        class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-remove"></i></a>
										</td>
									</tr>
									<%i++;
										}
									}
									%>


								</tbody>
							</table>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<!-- panel body -->
		</div>
	</div>
	<!-- content -->
</div>
<script type="text/javascript">
$(document).ready(function() {
	
	var i = 0;					 
	$('#pending_location_list tfoot th').each(function() {									
		if (i == 1 || i == 2 || i == 3) 
		{										
			$(this).html('<input type="text" class="form-control">');										
		}
		i++;									
	});

	// DataTable
	var table = $('#pending_location_list').DataTable();

	// Apply the search
	table.columns().every(function() {
	var that = this;
	$('input', this.footer()).on('keyup change',function() 
	{
		if (that.search() !== this.value) {
			that.search(this.value).draw();
		}
	});
										
	$('select', this.footer()).on('change',function()
	{
		if (that.search() !== this.value) {
			that.search(this.value).draw();
		}
	});
									
	});
				
});


function addLocation() {
	<%if(!user_permission.contains("location/add")){%>
		toastr.error("Access Denied","Error");
		return false;
	<%}%>	
  	var city  = $( '#edit_location_form #city' ).val();
	var state = $( '#edit_location_form #state' ).val();
	var zone = $( '#edit_location_form #zone' ).val();
	if(city == ''){
	  toastr.error('City cannot be blank','Error');
	  return false;
	}
	if(state == ''){
	  toastr.error('State cannot be blank','Error');
	  return false;
	}
	if(zone == '')
	{
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
          $("#addlocationsubmit").html('Add Location');
          $("#addlocationsubmit").prop('disabled', false);

    	if(data == "****")
        {
          toastr.success( 'Location Added successfully.','Success' );
          location.reload();
        }
        else
          toastr.error( data,'Error' );
      }
    });
	  
}

function updateLocation() {
	<%if(!user_permission.contains("location/add")){%>
		toastr.error("Access Denied","Error");
		return false;
	<%}%>
	var table2 = $('#pending_location_list').DataTable();
	var city = $( '#city').val();
	var state = $( '#state').val();
	var zone = $( '#zone').val();
	var locationId = $( '#locationId').val();
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
	
    var formdata = {"city":city, "state":state, "zone":zone, "locationId":locationId};
    console.log(formdata);
    $.ajax({
		type : "POST",
		url : 'updateLocation',
		data : formdata,
		beforeSend : function() {
			$("#editlocationsubmit").html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
			$("#editlocationsubmit").prop('disabled', true);
		},
		success : function(data) {
			$("#editlocationsubmit").html('Update');
			$("#editlocationsubmit").prop('disabled', true);			
			if (data == "****") 
			{
				toastr.success('Location Updated successfully.', 'Success');
				location.reload;
			} 
			else 
				toastr.error(data, 'Error');
			
		}
	});
}
</script>
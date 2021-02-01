<%@page import="com.preclaim.models.IntimationTypeList"%>
<%@page import="java.util.List"%>
<%
List<IntimationTypeList> pending_list = (List<IntimationTypeList>) session.getAttribute("pending_intimationType");
session.removeAttribute("pending_intimationType");
IntimationTypeList intimationTypeList = (IntimationTypeList) session.getAttribute("intimationTypeList");
session.removeAttribute("intimationTypeList");
List<String> user_permission=(List<String>)session.getAttribute("user_permission");
boolean allow_statusChg = user_permission.contains("intimationType/status");
boolean allow_delete = user_permission.contains("intimationType/delete");
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
						<%=intimationTypeList == null ? "Add " : "Update "%>
						IntimationTypeList
					</span>
				</div>
			</div>
		</div>
		<div class="portlet light bordered">
			<div class="portlet-body">
				<div id="message_account"></div>
				<form novalidate id="add_intimation_type" role="form" method="post"
					class="form-horizontal">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="col-md-4 control-label" for="intimationtypeName">Intimation Type Name
									 <span class="text-danger">*</span>
								</label>
								<div class="col-md-8">
									<input type="text" required placeholder="Intimation Type Name"
										id="intimationtypeName" class="form-control" name="intimationtypeName"
										value = "<%=intimationTypeList == null ? "" : intimationTypeList.getIntimationType()%>">
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-offset-4 col-md-8">
									<%
									if(intimationTypeList != null){
									%>
									<input type="hidden" value="<%=intimationTypeList.getIntimationId()%>" id="intimationId"
										name="intimationId">
									<button class="btn btn-info" id="editIntimationTypesubmit"
										onClick="return updateIntimationType();" type="button">Update</button>
									<a href="${pageContext.request.contextPath}/intimationType/pending"
										class="btn btn-danger">Back</a>
									<%
									}else{
									%> 
									<button class="btn btn-info" id="addIntimationTypesubmit"
										onClick="return addIntimationType();" type="button">Add Intimation</button>
									<button class="btn btn-danger" type="reset" value="">Clear</button>
									<%
									}
									%>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!--<?php } ?>-->
<div class="row">
	<div class="col-xs-12 col-sm-12">
		<div class="portlet box">
			<div class="portlet-title">
				<div class="caption">
					<i class="icon-users font-green-sharp"></i> <span
						class="caption-subject font-green-sharp sbold">Pending
						Intimation</span>
				</div>
				<div class="actions">
					<div class="btn-group">
						<a href="${pageContext.request.contextPath}/intimation/add"
							data-toggle="tooltip" title="Add" data-original-title="Add New"
							class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip"
							style="margin-right: 5px;"> <i class="fa fa-plus"></i>
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
							<table id="pending_group_list"
								class="table table-striped table-bordered table-hover table-checkable dataTable data-tbl">
								<thead>
									<tr class="tbl_head_bg">
										<th class="head1 no-sort">#</th>
										<th class="head1 no-sort">Intimation Type Name</th>
										<th class="head1 no-sort">Created Date</th>
										<th class="head1 no-sort">Status</th>
										<th class="head1 no-sort">Action</th>
									</tr>
								</thead>
								<tfoot>
									<tr class="tbl_head_bg">
										<th class="head2 no-sort"></th>
										<th class="head2 no-sort"></th>
										<th class="head2 no-sort"></th>
										<th class="head2 no-sort">Status</th>
										<th class="head2 no-sort"></th>
									</tr>
								</tfoot>
								<tbody>
									<%
									if (pending_list != null) {

									  for (IntimationTypeList list_intimationType : pending_list) {
									%>
									<tr>
										<td><%=list_intimationType.getSrNo()%></td>
										<td><%=list_intimationType.getIntimationType()%></td>
										<td><%=list_intimationType.getCreatedDate()%></td>										
										<td><span class="label label-sm label-danger">Pending</span></td>											
										<td>
											<a href="${pageContext.request.contextPath}/intimationType/pending?intimationtypeName=<%=list_intimationType.getIntimationType() %>&intimationId=<%=list_intimationType.getIntimationId() %>" 
												data-toggle="tooltip" title="Edit" class="btn btn-primary btn-xs">
												<i class="glyphicon glyphicon-edit"></i>
							   		  		</a>
									   		
									   		<a href="javascript:;" data-toggle="tooltip" title="Active" onClick="return updateIntimationTypeStatus('<%=list_intimationType.getIntimationId()%>',1,<%=allow_statusChg %>);" 
									   		  	class="btn btn-success btn-xs"><i class="glyphicon glyphicon-ok-circle"></i>
								   		  	</a>
									   		
									   		<a href="#" data-toggle="tooltip" title="Delete" onClick="return deleteIntimationType('<%=list_intimationType.getIntimationId()%>',<%=allow_delete %>);" 
									   		   	class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-remove"></i>
								   		   	</a>  
										</td>

									</tr>

									<%
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
$(document).ready(function() 
{
	var i = 0;
	$('#pending_group_list tfoot th').each(function() {
		if (i == 1) {
			$(this).html('<input type="text" class="form-control" placeholder="" />');
		}
		i++;
	});
	
	// DataTable
	var table = $('#pending_group_list').DataTable();
	
	// Apply the search
	table.columns().every(function() {
		var that = this;
		$('input', this.footer()).on('keyup change',function() {
			if (that.search() !== this.value) {
				that.search(this.value)
						.draw();
			}
		});
		$('select', this.footer()).on('change',function() {
			if (that.search() !== this.value) {
				that.search(this.value).draw();
			}
		});
	});
});

function addIntimationType() {
	<%if(!user_permission.contains("investigationType/add")){%>
		toastr.error("Access Denied","Error");
		return false;
	<%}%>
	var IntimationtypeName = $('#add_intimation_type #intimationtypeName').val();
	if (IntimationtypeName == '') {
		toastr.error('Intimation Type Name Cannot be empty', 'Error');
		return false;
	}
	var formdata = {'intimationtypeName' : IntimationtypeName};
	$.ajax({
		type : "POST",
		url : '${pageContext.request.contextPath}/intimationType/addIntimationType',
		data : formdata,
		beforeSend : function() {
			$("#addIntimationTypesubmit")
				.html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
			$("#addIntimationTypesubmit").prop('disabled', true);
		},
		success : function(data) {
			if (data == "****") {
				$("#addIntimationTypesubmit").html('Add Intimation Type');
				$("#addIntimationTypesubmit").prop('disabled', false);
				toastr.success('Intimation Type Added successfully.','Success');
				$('#add_intimation_type #intimationtypeName').val('');
				location.reload();
			} else {
				toastr.error(data, 'Error');
				$("#addIntimationTypesubmit").html('Add Intimation Type');
				$("#addIntimationTypesubmit").prop('disabled', false);
			}
		}
	});
}

function updateIntimationType() {
	<%if(!user_permission.contains("intimationType/add")){%>
		toastr.error("Access Denied","Error");
		return false;
	<%}%>
	var IntimationtypeName = $('#add_intimation_type #intimationtypeName').val();
	var IntimationId = $('#add_intimation_type #intimationId').val();
	if (IntimationtypeName == '') {
		toastr.error('Intimation Type Name Cannot be empty', 'Error');
		return false;
	}	
	var formdata = {'intimationtypeName' : IntimationtypeName,'intimationId' : IntimationId};
		$.ajax({
			type : "POST",
			url : '${pageContext.request.contextPath}/intimationType/updateIntimationType',
			data : formdata,
			beforeSend : function() {
				$("#editIntimationTypesubmit")
						.html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
				$("#editIntimationTypesubmit").prop('disabled', true);
			},
			success : function(data) {
				if (data == "****") {
					$("#editIntimationTypesubmit").html('Update');
					$("#editIntimationTypesubmit").prop('disabled', false);
					toastr.success('Intimation Type Updated successfully.','Success');
					location.href ="${pageContext.request.contextPath}/intimationType/pending";
				} else {
					toastr.error(data, 'Error');
					$("#editIntimationTypesubmit").html('Update');
					$("#editIntimationTypesubmit").prop('disabled', false);
				}
			}
		});
}
</script>
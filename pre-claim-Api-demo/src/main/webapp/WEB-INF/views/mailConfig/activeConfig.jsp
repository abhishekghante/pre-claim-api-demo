<%@page import="java.util.List"%>
<%@page import="com.preclaim.models.MailConfigList"%>
<%
List<MailConfigList> active_config = (List<MailConfigList>) session.getAttribute("activeConfig");
session.removeAttribute("activeConfig");
List<String> user_permission=(List<String>)session.getAttribute("user_permission");
boolean allow_statusChg = user_permission.contains("mailConfig/status");
boolean allow_delete = user_permission.contains("mailConfig/delete");
%>
<link href="${pageContext.request.contextPath}/resources/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/resources/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<div class="row">
	<div class="col-xs-12 col-sm-12">
		<div class="portlet box">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-inbox font-green-sharp" style = "font-size:20px"></i> <span
						class="caption-subject font-green-sharp sbold">Active Mail Config
						</span>
				</div>
				<div class="actions">
					<div class="btn-group">
						<a href="${pageContext.request.contextPath}/mailConfig/pending"
							data-toggle="tooltip" title="Add"
							class="btn green-haze btn-outline btn-xs pull-right"
							data-toggle="tooltip" title="" style="margin-right: 5px;"
							data-original-title="Add New"> <i class="fa fa-plus"></i>
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
							<table id="active_config_list"
								class="table table-striped table-bordered table-hover table-checkable dataTable data-tbl">
								<thead>
									<tr class="tbl_head_bg">
										<th class="head1 no-sort">#</th>
										<th class="head1 no-sort">Username</th>
										<th class="head1 no-sort">Password</th>
										<th class="head1 no-sort">Outgoing SMTP Server</th>
										<th class="head1 no-sort">Outgoing SMTP Port</th>
										<th class="head1 no-sort">Outgoing Encryption</th>
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
										<th class="head2 no-sort"></th>
										<th class="head2 no-sort"></th>
									</tr>
								</tfoot>
								<tbody>
									<%
									if (active_config != null) {
										int i = 1;
										for (MailConfigList list_config : active_config) {
									%>
									<tr>
										<td><%=i++%></td>
										<td><%= list_config.getUsername() %></td>
										<td><%= list_config.getPassword() %></td>
										<td><%= list_config.getOutgoingServer() %></td>
										<td><%= list_config.getOutgoingPort() %></td>
										<td><%= list_config.getEncryptionType() %></td>
										<td>
										<% if(list_config.getStatus() == 1) {%>
										<span class="label label-sm label-success">Active</span>
										<%}else{ %>
										<span class="label label-sm label-danger">Inactive</span>
										<%} %>
										</td>
										<td>
										   <a href="${pageContext.request.contextPath}/mailConfig/edit/<%=list_config.getMailConfigId() %>" 										   										   
										   		data-toggle="tooltip" title="Edit" class="btn btn-primary btn-xs">
										   		<i class="glyphicon glyphicon-edit"></i>
									   		</a>
									   		<% if(list_config.getStatus() == 1) {%>
											<a href="#" data-toggle="tooltip" title="Inactive" onClick="return updateConfigStatus(<%=list_config.getMailConfigId() %>,2,<%=allow_statusChg%>);"
											    class="btn btn-warning btn-xs"><i class="glyphicon glyphicon-ban-circle"></i></a> 
											<%}else{ %>
											<a href="#" data-toggle="tooltip" title="Active" onClick="return updateConfigStatus(<%=list_config.getMailConfigId() %>,1,<%=allow_statusChg%>);"
											    class="btn btn-success btn-xs"><i class="glyphicon glyphicon-ok-circle"></i></a> 
											<%} %>
											<a href="#" data-toggle="tooltip" title="Delete" onClick="return deleteConfig('<%=list_config.getMailConfigId()%>',<%=allow_delete %>);"
										        class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-remove"></i></a>
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
$(document).ready(function() {
	var i = 0;
	$('#active_config_list tfoot th').each(function() {
						
		if (i == 1 || i == 2 || i == 3 || i == 4) {
			$(this).html('<input type="text" class="form-control" placeholder="" />');
		}
		else if(i == 5)
		{
			var select_box = "<select class = 'form-control'>" + 
				"<option value = ''>All</option>" +
				"<option value = 'TLS'>TLS</option>" +
				"<option value = 'SSL'>SSL</option>" +
			 	"</select>";
			$(this).html(select_box);
		}
		else if(i == 6)
		{
			var select_box = "<select class = 'form-control'>" +
				"<option value = ''>All</option>" +
				"<option value = 'Active'>Active</option>" +
			 	"<option value = 'Inactive'>Inactive</option>" +
			 "</select>";
			$(this).html(select_box);
		}
		i++;
	});

	// DataTable
	var table = $('#active_config_list').DataTable();

	// Apply the search
	table.columns().every(function() {						
		var that = this;
		$('input', this.footer()).on('keyup change',function() {
			if (that.search() !== this.value) {
				that.search(this.value).draw();
			}
		});
		$('select', this.footer()).on('change',function() {
			if (that.search() !== this.value) {
				that.search(this.value).draw();
			}
		});
	});
});
</script>
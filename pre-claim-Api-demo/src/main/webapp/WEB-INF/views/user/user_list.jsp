<%@page import = "java.util.List" %>
<%@page import = "com.preclaim.models.UserList" %>
<%@page import = "com.preclaim.models.UserRole" %>
<% 
List<UserList> user_list = (List<UserList>) session.getAttribute("user_list");
session.removeAttribute("user_list");
List<UserRole> user_role = (List<UserRole>) session.getAttribute("role_list");
session.removeAttribute("role_list");
List<String> user_permission=(List<String>)session.getAttribute("user_permission");
boolean allow_statusChg = user_permission.contains("users/status");
boolean allow_delete = user_permission.contains("users/delete");
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
            <i class="icon-user font-green-sharp"></i>
            <span class="caption-subject font-green-sharp sbold">Manage Users</span>
        </div>
        <div class="actions">
            <div class="btn-group">
              <a href="${pageContext.request.contextPath}/user/add_user" data-toggle="tooltip" title="Add" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Add New">
                <i class="fa fa-plus"></i>
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
                  <table id="adminuser_list" class="table table-striped table-bordered table-hover table-checkable dataTable data-tbl">
                    <thead>
                      <tr class="tbl_head_bg">
                        <th width="5%" class="head1 no-sort">#</th>
                        <th width="5%" class="head1 no-sort">Name</th>
                        <th width="5%" class="head1 no-sort">User Type</th>
                        <th width="5%" class="head1 no-sort">User Name</th>
                        <th width="5%" class="head1 no-sort">Email</th>
                        <th width="5%" class="head1 no-sort">Password</th>
                        <th width="5%" class="head1 no-sort">Status</th>
                        <th width="5%" class="head1 no-sort">Action</th>
                      </tr>
                    </thead>
                    <tfoot>
                      <tr class="tbl_head_bg">
                        <th class="head2 no-sort"></th>
                        <th class="head2 no-sort"></th>
                        <th class="head2 no-sort">User Type</th>
                        <th class="head2 no-sort"></th>
                        <th class="head2 no-sort">Email</th>
                        <th class="head2 no-sort"></th>
                        <th class="head2 no-sort">Status</th>
                        <th class="head2 no-sort"></th>
                      </tr>
                    </tfoot>
                    <tbody>
                    	<%if(user_list != null)
                    		{int i = 1;
                    		for(UserList items:user_list)
                    		{%>
                    		<tr>
                    			<td><%=i %></td>
                    			<td><%= items.getFull_name()%></td>
                    			<td><%= items.getAccount_type()%></td>
                    			<td><%= items.getUsername()%></td>
                    			<td><%= items.getUser_email()%></td>
                    			<td><%= items.getPassword()%></td>
                    			<td>
                    				<% if(items.getUser_status()== 1) {%>
                    					<span class="label label-sm label-success">Active</span>
									<%}else{ %>
										<span class="label label-sm label-danger">Inactive</span>									
									<%} %>								
								</td>                    			
                    			<td>
                    				<a href="${pageContext.request.contextPath}/user/edit/<%=items.getUser_id() %>" 
                    					data-toggle="tooltip" title="Edit" class="btn btn-primary btn-xs">
                    					<i class="glyphicon glyphicon-edit"></i>
                   					</a>
                    				<% if(items.getUser_status() == 1) {%>
									<a href="javascript:;" data-toggle="tooltip" title="Inactive" 
										onClick="return updateUserStatus(<%=items.getUser_id() %>,0,<%=allow_statusChg%>);" 
										class="btn btn-warning btn-xs">
										<i class="glyphicon glyphicon-ban-circle"></i>
									</a>
									<%}else{ %>
									<a href="javascript:;" data-toggle="tooltip" title="Active" 
										onClick="return updateUserStatus(<%=items.getUser_id() %>,1,<%=allow_statusChg%>);"
										class="btn btn-success btn-xs">
										<i class="glyphicon glyphicon-ok-circle"></i>
									</a>
									<%} %>
									<a href="#" data-toggle="tooltip" title="Delete" 
                    					onClick="return deleteAdminUser('<%=items.getUser_id() %>',<%=allow_delete %>);" 
                    					class="btn btn-danger btn-xs">
                    					<i class="glyphicon glyphicon-remove"></i>
                   					</a>                    				
                    			</td>
                   			</tr>
                   			<%
                   			i++;
                   			}                    		
                    		} %>
                    </tbody>
                    
                  </table>
                </div>
              <div class="clearfix"></div>
            </div>
          </div>
        <div class="clearfix"></div>
      </div><!-- panel body -->
    </div>
  </div><!-- content -->
</div>
<script type="text/javascript">
$(document).ready(function() {
  var start = '';
  var end = '';
  
  var table = $('#adminuser_list').DataTable();
  
  var i = 0;
  $('#adminuser_list tfoot th').each( function () {
    if( i == 1 || i == 3 || i == 4 ){
      $(this).html( '<input type="text" class="form-control" placeholder="" />' );
    }else if(i == 2){
    	var tech_selectbox = '<select name="user_type" id="user_type" class="form-control">'
            +'<option value="">All</option>';
		<%
			if(user_role != null)
			{
				for(UserRole role : user_role)
				{			
		%>
            
            tech_selectbox += '<option value ="<%=role.getRole()%>"><%=role.getRole()%></option>';
        <%
        		}
			}
		%>
		tech_selectbox += '</select>';
		$(this).html(tech_selectbox);
    }else if(i == 6){
      var status_selectbox = '<select name="status_type" id="status_type" class="form-control">'
                            +'<option value="">All</option>'
                            +'<option value="Active">Active</option>'
                            +'<option value="Inactive">Inactive</option>'
                            +'</select>';
      $(this).html( status_selectbox );
    }
    i++;
  });

  // Apply the search
  table.columns().every( function () {
    var that = this;
    $( 'input', this.footer() ).on( 'keyup change', function () {
      if ( that.search() !== this.value ) {
        that
          .search( this.value )
          .draw();
      }
    });
    $( 'select', this.footer() ).on( 'change', function () {
      if ( that.search() !== this.value ) {
        that
          .search( this.value )
          .draw();
      }
    });
  });
});
</script>
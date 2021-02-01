<%@page import = "java.util.List" %>
<%
List<String> user_permission=(List<String>)session.getAttribute("user_permission");
boolean allow_delete = user_permission.contains("role/delete");
%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
#imgspecialization { display:none;}
</style>
<div class="row">
  <div class="col-xs-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
            <i class="icon-user font-green-sharp"></i>
            <span class="caption-subject font-green-sharp sbold">Manage User Role</span>
        </div>
        <div class="actions">
            <div class="btn-group">
            </div>
        </div>
      </div>
    </div>

    <div class="box box-primary">
      <div class="box-body">
          <div class="row">
            <div class="col-xs-12 col-sm-12">
              <div class="portlet">
                <div class="portlet-body form">
                    <form novalidate="" id="role_form" role="form" method="post" class="form-horizontal">
                        <div class="form-body" id="add_role_form">
                            <div class="form-group">
                              <label class="col-md-2 col-sm-2 control-label" for="role">Role Name <span class="text-danger">*</span></label>
                              <div class="col-md-4 col-sm-4">
                                <input type="text" required="" maxlength="30" placeholder="Enter Role Name" id="role" class="form-control" name="role">
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="col-md-2 col-sm-2 control-label" for="role_code">Role Code</label>
                              <div class="col-md-4 col-sm-4">
                                <input type="text" required="" maxlength="10" placeholder="Enter Role Code" id="role_code" class="form-control username" name="role_code">
                              </div>
                            </div>
                            <div class="col-md-offset-2 col-md-4 col-sm-4 text-right">
                              <button class="btn btn-sm btn-success" id="addrolesubmit" onClick="return addRole();" type="button">Add</button>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="box-body" id="update_role_form">
                        	<jsp:include page="edit_role.jsp"></jsp:include>
                        </div>
                    </form>
                </div>
              </div>
            </div>
          </div>
        <div class="clearfix"></div>
      </div>

      <div class="box-body">
        <div class="row">
            <div class="col-md-12 table-container">
                <div class="box-body no-padding">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Role Name</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody id="role_lists">
                        <c:forEach var="role_list" items="${role_list}">
                			<tr>
	                			<td>${role_list.role}</td>
	                			<td>
		                			<a class="btn btn-warning btn-xs" href="javascript:;" 
		                				onclick="return edit_role( '${role_list.roleId}',
		                				'${role_list.role}','${role_list.role_code}');">
		                				<i class="fa fa-edit"></i>
		               				</a>
		               				<a class="btn btn-danger btn-xs" href="javascript:;" 
		               					onclick="return deleteRole( '${role_list.roleId}', <%=allow_delete %>);">
		               					<i class="fa fa-trash"></i>
		           					</a>
		           					<a class="btn btn-success btn-xs" 
		           						href="${pageContext.request.contextPath}/user/permission/${role_list.role_code}">
		           						Permission
		           						<i class="fa fa-plus"></i>
		          					</a>                             
	                			</td>
                			</tr>
                		</c:forEach>
                        
                    </tbody>
                </table>
                </div>
              <div class="clearfix"></div>
            </div>
          </div>
      </div>
    </div>
  </div><!-- content -->
</div>
<script>
$(document).ready(function(){
	
	$( '#add_role_form').show();
    $( '#update_role_form').hide();
	
});
</script>
<script type="text/javascript">
    //Role Validation
    function addRole() {
    	<%if(!user_permission.contains("role/add")){%>
    		toastr.error("Access Denied", "Error");
    		return false;
   		<%}%>
      var role      = $.trim($('#role_form #role').val());
      $('#role').removeClass('has-error-2');
      if( role == "" ){
        $('#role').addClass('has-error-2');
        $('#role').focus();
        return false;
      }
      var data    = $( "#role_form" ).find( "select, textarea, input" ).serialize();
      $.ajax({
          type    : 'POST',
          url     : 'addRole',
          data    : data,
          beforeSend: function() { 
            $("#addrolesubmit").html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
            $("#addrolesubmit").prop('disabled', true);
          },
          success : function( msg ) {
              if( msg == "****" ) {
                  toastr.success('User Role Added Successfully.','Success');
                  location.reload();
              } else {
                  toastr.error(msg,'Error');
              }
              $("#addrolesubmit").html('Add');
              $("#addrolesubmit").prop('disabled', false);
          }
      });
        return false;
    }
    //Edit Role
    function edit_role( roleId, role, roleCode ) {
    	$( '#add_role_form').hide();
        $( '#update_role_form').show();
        $("#edit_role").val(role);
    	$("#edit_role_code").val(roleCode);
    	$("#edit_roleId").val(roleId);
    	console.log(role, roleCode, roleId);
    }
</script>
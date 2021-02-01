<div class="row">
	<div class="col-xs-12 col-sm-12">
    	<div class="portlet">
        	<div class="portlet-body form">          
				<div class="form-body">
					<div class="form-group">
					    <label class="col-md-2 col-sm-2 control-label" for="edit_role">Role Name <span class="text-danger">*</span></label>
					    <div class="col-md-4 col-sm-4">
					      <input type="text" required="" maxlength="30" placeholder="Enter Role Name" id="edit_role" 
					      	class="form-control" name="edit_role">
					    </div>
					</div>
					<div class="form-group">
					    <label class="col-md-2 col-sm-2 control-label" for="edit_role_code">Role Code</label>
					    <div class="col-md-4 col-sm-4">
					      <input type="text" required="" maxlength="10" placeholder="Enter Role Code" id="edit_role_code" 
							class="form-control username" name="edit_role_code">
					    </div>
					</div>
					<div class="col-md-offset-2 col-md-4 col-sm-4 text-right">
					    <input type="hidden" name="edit_roleId" id="edit_roleId">
					    <button class="btn btn-sm btn-primary" id="updaterolesubmit" onclick="return updateRole();" 
					    	type="button">Update</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="clearfix"></div>
<script type="text/javascript">
    function updateRole() {
        var role = $.trim($('#update_role_form #edit_role').val());
        $('#edit_role').removeClass('has-error-2');
        if( role == "" ){
            $('#edit_role').addClass('has-error-2');
            $('#edit_role').focus();
            return false;
        }
        var data    = $( "#role_form" ).find( "select, textarea, input" ).serialize();
        console.log(data);
        $.ajax({
            type    : 'POST',
            url     : 'updateRole',
            data    : data,
            beforeSend: function() { 
                $("#updaterolesubmit").html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
                $("#updaterolesubmit").prop('disabled', true);
            },
            success : function( msg ) {
                if( msg == "****" ) {
                    toastr.success('Role updated Successfully.','Success');
                    location.reload();
                } else {
                    toastr.error(msg,'Error');
                }
                $("#updaterolesubmit").html('Update');
                $("#updaterolesubmit").prop('disabled', false);
            }
        });
        return false;
    }
</script>
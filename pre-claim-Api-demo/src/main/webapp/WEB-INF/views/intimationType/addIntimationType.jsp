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
          <span class="caption-subject font-green-sharp sbold">Add Intimation Type</span>
        </div>
        <div class="actions">
          <div class="btn-group">
            <a href="${pageContext.request.contextPath}/intimationType/pending" data-toggle="tooltip" title="Back" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Back">
              <i class="fa fa-reply"></i>
            </a>
          </div>
        </div>
      </div>
    </div>
    <div class="box box-primary">
      <!-- form start -->
      <div id="message_account"></div>
      <form novalidate="" id="add_intimation_type" role="form" method="post" class="form-horizontal">
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="intimationtypeName">Intimation Type <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required="" placeholder="Intimation Name" id="intimationtypeName" class="form-control" name="intimationtypeName">
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <div class="col-md-offset-2 col-md-10">
            <button class="btn btn-info" id="addIntimationTypesubmit" onClick="return addIntimationType();" type="button">Add Intimation</button>
            <button class="btn btn-danger" type="reset" value="">Clear</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
function addIntimationType() {
	<%if(!user_permission.contains("intimationType/add")){%>
		toastr.error("Access Denied","Error");
		return false;
	<%}%>

	var IntimationtypeName = $( '#add_intimation_type #intimationtypeName' ).val(); 
	if(IntimationtypeName == ''){
	  toastr.error('Intimation Type Cannot be empty','Error');
	  return false;
	}
	var formdata ={'intimationtypeName':IntimationtypeName};
	$.ajax({
	  type: "POST",
	  url: 'addIntimationType',
	  data: formdata,
	  beforeSend: function() { 
	      $("#addIntimationTypesubmit").html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
	      $("#addIntimationTypesubmit").prop('disabled', true);
	  },
	  success: function( data ) {
	    if(data == "****"){
	      $("#addIntimationTypesubmit").html('Add Intimation Type');
	      $("#addIntimationTypesubmit").prop('disabled', false);
	      toastr.success( 'Intimation Type Added successfully.','Success' );
	      $( '#add_intimation_type #intimationtypeName' ).val(''); 
	      /*setTimeout( function() {
	        window.location.href = adminurl + 'groups';
	      }, 2000 );*/
	    }else{
	      toastr.error( data,'Error' );
	      $("#addIntimationTypesubmit").html('Add Intimation Type');
	      $("#addIntimationTypesubmit").prop('disabled', false);
	    }
	  }
	});
     
}
</script>
<%@page import="java.util.List"%>
<%
List<String> user_permission = (List<String>)session.getAttribute("user_permission");
%>
<style type="text/css">
.placeImg { display:none !important;}
</style>

<div class="row">
  <div class="col-md-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
          <i class="icon-users font-green-sharp"></i>
          <span class="caption-subject font-green-sharp sbold">Add Investigation Type</span>
        </div>
        <div class="actions">
          <div class="btn-group">
            <a href="${pageContext.request.contextPath}/investigationType/pendingInvestigationType" data-toggle="tooltip" 
            	title="Back" class="btn green-haze btn-outline btn-xs pull-right" style="margin-right: 5px;" 
            	data-original-title="Back">
              <i class="fa fa-reply"></i>
            </a>
          </div>
        </div>
      </div>
    </div>
    <div class="box box-primary">
      <!-- form start -->
      <div id="message_category"></div>
      <form novalidate id="add_investigation_type" role="form" method="post" class="form-horizontal">
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="investigationType">Investigation Type <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required placeholder="Investigation Name" id="investigationType" maxlength="40" class="form-control" name="investigationType">
                </div>
              </div>             
            </div>   
          </div>
        </div>
        <div class="box-footer">
          <div class="col-md-offset-2 col-md-10">
            <button class="btn btn-info" id="addInvestigation()" type="button"
            	onclick = "return addInvestigationType()">Add Investigation</button>
            <button class="btn btn-danger" type="reset" value="">Clear</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script>
function addInvestigationType() 
{
	console.log(<%=user_permission.contains("investigationType/add")%>);
	<%if(!user_permission.contains("investigationType/add")){%>	
		toastr.error("Access Denied","Error");
		return false;
	<%}%>
	var investigationType = $('#add_investigation_type #investigationType').val();
    
	if(investigationType == '')
    {
      toastr.error('Investigation Type cannot be blank','Error');
      return false;
    }
        
    var formdata = {"investigationType":investigationType}
   	$.ajax({
         type: "POST",
         url: 'addInvestigation',
         data: formdata,
         beforeSend: function() 
         { 
             $("#addInvestigationTypesubmit").html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
             $("#addInvestigationTypesubmit").prop('disabled', true);
             $('#add_investigation_type').css("opacity",".5");
         },
         success: function( data ) 
         {
        	 $("#addInvestigationTypesubmit").html('Add Investigation');
             $("#addInvestigationTypesubmit").prop('disabled', false);           
             if(data == "****")
	         {
	             toastr.success( 'Investigation Type added successfully.','Success' );
	             $("form#add_investigation_type").trigger("reset");
	         }
           	 else
	             toastr.error( data,'Error' );
             $('#add_investigation_type').css("opacity","");
         }
       });
}
</script>
<%@page import="java.util.List" %>
<%@page import="com.preclaim.models.InvestigationTypeList" %>
<%@page import="com.preclaim.models.InvestigationType" %>
<%
List<InvestigationTypeList>pending_list = (List<InvestigationTypeList>)session.getAttribute("pendingInvestigationType");
session.removeAttribute("pendingInvestigationType");
List<String>user_permission = (List<String>)session.getAttribute("user_permission");
boolean allow_statusChg = user_permission.contains("investigationType/status");
boolean allow_delete = user_permission.contains("investigationType/delete");
InvestigationType editInvestigation = (InvestigationType)session.getAttribute("editInvestigation");
session.removeAttribute("editInvestigation");
%>

<style type="text/css">
.placeImg { display:none !important;}
.form-group { margin-bottom: 5px; }
</style>
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
          <%=editInvestigation == null ? "Add " : "Update "%> Investigation Type</span>
        </div>
      </div>
    </div>
    <div class="portlet light bordered">
      <div class="portlet-body">
        <div id="message_category"></div>
        <form novalidate id="add_category_form" role="form" method="post" class="form-horizontal">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="investigationType">Investigation Type <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required id="investigationType" name="investigationType" maxlength="40" class="form-control" 
                  	placeholder="Investigation Type"
                  value = "<%= editInvestigation == null ? "" : editInvestigation.getInvestigationType()%>">
                </div>
              </div>
            </div>
            <div class="col-md-12">
              <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
               
                 <%if(editInvestigation != null){%>
                    <input type="hidden" value=<%=editInvestigation.getInvestigationId()%> id="investigationId" name="investigationId">
                    <button class="btn btn-info" id="editcategorysubmit" type="submit">Update</button>
                    <a href="${pageContext.request.contextPath}/category/pending_category" class="btn btn-danger">Back</a>
                  <%}else{%> 
                    <button class="btn btn-info" id="addcategorysubmit" type="submit">Add Investigation</button>
                    <button class="btn btn-danger" type="reset" value="">Clear</button>
                  <%}%>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<div class="row">
  <div class="col-xs-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
            <i class="icon-users font-green-sharp"></i>
            <span class="caption-subject font-green-sharp sbold">Pending investigations</span>
        </div>
        <div class="actions">
            <div class="btn-group">
              <a href="${pageContext.request.contextPath}/investigationType/addInvestigationType" data-toggle="tooltip" title="Add" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Add New">
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
                  <table id="pending_category_list" class="table table-striped table-bordered table-hover table-checkable dataTable data-tbl">
                    <thead>
                      <tr class="tbl_head_bg">
                        <th class="head1 no-sort">#</th>
                        <th class="head1 no-sort">Investigation Name</th>
                        <th class="head1 no-sort">Status</th>
                        <th class="head1 no-sort">Action</th>
                      </tr>
                    </thead>
                    <tfoot>
                      <tr class="tbl_head_bg">
                        <th class="head2 no-sort"></th>
                        <th class="head2 no-sort"></th>
                        <th class="head2 no-sort">Status</th>
                        <th class="head2 no-sort"></th>
                      </tr>
                    </tfoot>
                    <tbody>
                             <%
                             	if(pending_list!=null){ 
                                	for(InvestigationTypeList list_category : pending_list){
                             %>
                            	<tr>
                            	<td><%=list_category.getSrNo() %></td>
                            	<td><%=list_category.getInvestigationType() %></td>
                            	<td><span class="label label-sm label-danger">Pending</span></td>
                            	<td>
                            		<a href="${pageContext.request.contextPath}/investigationType/pendingInvestigationType?investigationId=<%=list_category.getInvestigationId()%>&investigationType=<%=list_category.getInvestigationType() %>" data-toggle="tooltip" title="Edit" 
                            	         class="btn btn-primary btn-xs"><i class="glyphicon glyphicon-edit"></i></a>
                            	        
                            	    <a href="javascript:;" data-toggle="tooltip" title="Active" onClick="return updateInvestigationTypeStatus('<%=list_category.getInvestigationId() %>',1,<%=allow_statusChg%>);" 
                            	    	  class="btn btn-success btn-xs"><i class="glyphicon glyphicon-ok-circle"></i></a>    
                            	        
                            	    <a href="javascript:;" data-toggle="tooltip" title="Delete" onClick="return deleteInvestigationType('<%=list_category.getInvestigationId() %>',<%=allow_delete%>);" 
                            	    	   class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-remove"></i></a>  
                            	        </td>
                            	        
                            	</tr> 
                            	 
                            <%	 
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
  var i = 0;
  $('#pending_category_list tfoot th').each( function () {
    if( i == 1 || i == 2 ){
      $(this).html( '<input type="text" class="form-control" placeholder="" />' );
    }
    i++;
  });

  // DataTable
  var table = $('#pending_category_list').DataTable();

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
<script>
$(document).ready(function(){
  $("#add_category_form").on('submit', function(e){
    e.preventDefault();
    var investigationId = $('#add_category_form #investigationId').val();
    var investigationType = $('#add_category_form #investigationType').val(); 
    if(investigationType == '')
    {
      toastr.error('Investigation Type cannot be blank','Error');
      return false;
    }
      if(investigationId){
        $.ajax({
          type: "POST",
          url: '${pageContext.request.contextPath}/investigationType/updateInvestigation',
          data: new FormData(this),
          contentType: false,
          cache: false,
          processData:false,
          beforeSend: function() { 
              $("#editcategorysubmit").html('<img src="{pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
              $("#editcategorysubmit").prop('disabled', true);
              $('#add_category_form').css("opacity",".5");
          },
          success: function( data ) {
            if(data == "****")
            {
              $("#editcategorysubmit").html('Update');
              $("#editcategorysubmit").prop('disabled', false);
              toastr.success( 'investigations Updated successfully.','Success' );
              location.reload();
            }
            else
            {
              toastr.error( data,'Error' );
              $("#editcategorysubmit").html('Update');
              $("#editcategorysubmit").prop('disabled', false);
            }
            $('#add_category_form').css("opacity","");
          }
        });
      }
    else
    {
        $.ajax({
          type: "POST",
          url: '${pageContext.request.contextPath}/investigationType/addInvestigation',
          data: new FormData(this),
          contentType: false,
          cache: false,
          processData:false,
          beforeSend: function() { 
              $("#addcategorysubmit").html('<img src="{pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
              $("#addcategorysubmit").prop('disabled', true);
              $('#add_category_form').css("opacity",".5");
          },
          success: function( data ) {
        	  $("#addcategorysubmit").html('Add investigations');
              $("#addcategorysubmit").prop('disabled', false);
        	  if(data == "****")
        	  {
	              toastr.success('Investigation Type added successfully.','Success' );
	              location.reload();
        	  }
            else
              toastr.error( data,'Error' );;
            $('#add_category_form').css("opacity","");
          }
        });
      }
  });
});
</script>
<%@page import = "java.util.List" %>
<%@page import = "java.util.ArrayList" %>
<%@page import = "com.preclaim.models.CaseDetailList"%>
<%@page import = "com.preclaim.models.IntimationType" %>
<%@page import = "com.preclaim.models.InvestigationType" %>
<%
List<String>user_permission=(List<String>)session.getAttribute("user_permission");
boolean allow_statusChg = user_permission.contains("messages/status");
boolean allow_delete = user_permission.contains("messages/delete");
List<CaseDetailList> pendingCaseDetailList = (List<CaseDetailList>)session.getAttribute("pendingCaseList");
session.removeAttribute("pendingCaseList");
List<InvestigationType> investigationList = (List<InvestigationType>) session.getAttribute("investigation_list");
session.removeAttribute("investigation_list");
List<IntimationType> intimationTypeList = (List<IntimationType>) session.getAttribute("intimation_list");
session.removeAttribute("intimation_list");
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
            <i class="icon-users font-green-sharp"></i>
            <span class="caption-subject font-green-sharp sbold">Case Lists</span>
        </div>
        <div class="actions">
            <div class="btn-group">
              <a href="${pageContext.request.contextPath}/resources/messages/add" data-toggle="tooltip" title="Add" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Add New">
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
                  <div class="table-responsive">
                    <table id="pending_case_list" class="table table-striped table-bordered table-hover table-checkable dataTable data-tbl">
                      <thead>
                        <tr class="tbl_head_bg">
                          <th class="head1 no-sort"><input type="checkbox" id="chk-all" name="chk-all"/></th>
                          <th class="head1 no-sort">Case ID</th>
                          <th class="head1 no-sort">Policy No</th>
                          <th class="head1 no-sort">Name of Insured</th>
                          <th class="head1 no-sort">Type of Investigation</th>
                          <th class="head1 no-sort">Zone</th>
                          <th class="head1 no-sort">Sum Assured</th>
                          <th class="head1 no-sort">Type of Intimation</th>
                          <th class="head1 no-sort">View history</th>
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
                          <th class="head2 no-sort"></th>
                          <th class="head2 no-sort"></th>
                          <th class="head2 no-sort"></th>
                        </tr>
                      </tfoot>
                      <tbody>
                        <%if(pendingCaseDetailList!=null){
                        	for(CaseDetailList list_case :pendingCaseDetailList){%>                       
                          
                          <tr>
                  				<td><input type="checkbox" name = "selectCase"></td>
                  				<td><%=list_case.getSrNo()%></td>
                  			   	<td><%=list_case.getPolicyNumber()%></td>
                  				<td><%=list_case.getInsuredName()%></td>
                  				<td><%=list_case.getInvestigationCategory()%></td>
                  				<td><%=list_case.getClaimantZone()%></td>
                                <td><%=list_case.getSumAssured()%></td>
                                <td><%=list_case.getIntimationType()%></td>
                                <td>Case Details</td>
                                <td><span class="label label-sm label-warning">Pending</span></td>
                                <td>
                             <a href="${pageContext.request.contextPath}/message/edit?caseId=<%=list_case.getCaseId()%>" data-toggle="tooltip" title="Edit" 
                         		 class="btn btn-primary btn-xs"><i class="glyphicon glyphicon-edit"></i>
                         	 </a>
           
                             <a href="javascript:;" data-toggle="tooltip" title="Assign case" onClick="return updateMessageStatus('<%=list_case.getCaseId()%>','ARM',<%=allow_statusChg%>);" 
                         		 class="btn btn-success btn-xs"><i class="glyphicon glyphicon-ok-circle"></i>
                       		 </a>
                       		  
                             <a href="javascript:;" data-toggle="tooltip" title="Delete" onClick="return deleteMessage('<%=list_case.getCaseId() %>',<%=allow_statusChg%>);" 
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
                     <div class="text-center">
   						 <a class="btn btn-danger" id="assignCase" >Assign Case</a>
				   </div>
                  </div>                 
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
  //DataTable  
  var table = $('#pending_case_list').DataTable();

   $('#pending_case_list tfoot th').each( function () {
    if( i == 1 || i == 2 || i == 3 || i == 6){
      $(this).html( '<input type="text" class="form-control" placeholder="" />' );
    }
    else if(i == 4)
    {
      var cat_selectbox = '<select name="category" id="category" class="form-control">'
                              +'<option value="">All</option>';
		<%if(investigationList != null){
			for(InvestigationType investigation : investigationList)
			{
		%>
		cat_selectbox += "<option value = <%= investigation.getInvestigationType()%>><%= investigation.getInvestigationType()%></option>";	
        <%}}%>
		cat_selectbox += '</select>';
        $(this).html( cat_selectbox );
    }
    else if(i == 5)
    {
      var cat_selectbox = '<select name="zone" id="zone" class="form-control">'
                              +'<option value="">All</option>';
		cat_selectbox += "<option value = North>North</option>";
		cat_selectbox += "<option value = West>West</option>";
		cat_selectbox += "<option value = East>East</option>";
		cat_selectbox += "<option value = South>South</option>";
		cat_selectbox += '</select>';
        $(this).html( cat_selectbox );
    }
    else if(i == 7)
    {
      var cat_selectbox = '<select name="intimation" id="intimation" class="form-control">'
                              +'<option value="">All</option>';
		<%if(intimationTypeList != null){
			for(IntimationType intimation : intimationTypeList)
			{
		%>
		cat_selectbox += "<option value = <%= intimation.getIntimationType()%>><%= intimation.getIntimationType()%></option>";	
		<%}}%>
      cat_selectbox += '</select>';
      $(this).html( cat_selectbox );
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
<script>
$('#chk-all').click(function(event) {
    if(this.checked) {
        // Iterate each checkbox
        $(':checkbox').each(function() {
            this.checked = true;                        
        });
    } else {
        $(':checkbox').each(function() {
            this.checked = false;                       
        });
    }
});
</script>
<script>
$("#assignCase").click(function(){
	var caseList = [];
	$("#pending_case_list td input[type=checkbox]:checked").each(function(){
		var row = $(this).closest("tr")[0];
		caseList.push(row.cells[2].innerHTML);
	});
	if(caseList == "")
	{
		toastr.error("No cases selected", "Error");
		return;
	}
 	$.ajax({
      type: "POST",
      url:"assignToRM",
      data: {"caseList":caseList},
      beforeSend: function() { 
          $("#assignCase").html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
          $("#assignCase").prop('disabled', true);
      },
      success: function( data ) 
      {
    	  $("#assignCase").html('Assign Case');
          $("#assignCase").prop('disabled', false);
          if(data == "****")
          {
	          toastr.success( 'Case Assigned successfully.','Success' );
	          location.reload();
          }
          else
          	toastr.error( data,'Error' );    
      }
    });
});
</script>

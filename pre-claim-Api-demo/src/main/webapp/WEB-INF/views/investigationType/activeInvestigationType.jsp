<%@page import="java.util.List" %>
<%@page import="com.preclaim.models.InvestigationTypeList"%>
<%
List<InvestigationTypeList> activeList =(List<InvestigationTypeList>)session.getAttribute("active_list"); 
List<String>user_permission=(List<String>)session.getAttribute("user_permission");
boolean allow_statusChg = user_permission.contains("investigationType/status");
boolean allow_delete = user_permission.contains("investigationType/delete");
%>

<script src="${pageContext.request.contextPath}/resources/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/resources/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/resources/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<style type="text/css">
.move_td:hover{ cursor: move; }
</style>
<div class="row">
  <div class="col-xs-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
            <i class="icon-users font-green-sharp"></i>
            <span class="caption-subject font-green-sharp sbold">Active Investigation Types</span>
        </div>
        <div class="actions">
            <div class="btn-group">
              <a href="${pageContext.request.contextPath}/investigationType/addInvestigationType" data-toggle="tooltip" title="Add" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Add New">
                <i class="fa fa-plus"></i>
              </a>
            <!-- <?php } ?>
              <?php } ?> -->  
            </div>
        </div>
      </div>
    </div>
    <div class="box box-primary">
      <div class="box-body">
          <div class="row">
            <div class="col-md-12 table-container">
                <div class="box-body no-padding">
                  <table id="active_category_list" class="table table-striped table-bordered table-hover table-checkable dataTable data-tbl">
                    <thead>
                      <tr class="tbl_head_bg">
                        <th class="no-sort">#</th>
                        <th class="no-sort">Investigation Name</th>
                        <th class="no-sort">Status</th>
                        <th class="no-sort">Action</th>
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
                    <tbody class="row_position">
                     <%
                     	if(activeList!=null){
                           for(InvestigationTypeList list_category :activeList){
                     %>                   	 
                            <tr>
                               <td><%=list_category.getSrNo()%></td>
                               <td><%=list_category.getInvestigationType()%></td> 
                              <%if(list_category.getStatus() == 1){ %>
                            	   <td><span class="label label-sm label-success">Active</span></td>
                              <%}else{%>
                            	   <td><span class="label label-sm label-danger">Inactive</span></td>
                              <%}%>
                              <td>
	                           		<a href="${pageContext.request.contextPath}/investigationType/pendingInvestigationType?investigationId=<%=list_category.getInvestigationId()%>&investigationType=<%=list_category.getInvestigationType() %>" data-toggle="tooltip" title="Edit"	
	                           			class="btn btn-primary btn-xs"><i class="glyphicon glyphicon-edit"></i></a>
                               <%if(list_category.getStatus() == 1){%>
                                  <a href="javascript:;" data-toggle="tooltip" title="Inactive" onClick="return updateInvestigationTypeStatus('<%=list_category.getInvestigationId() %>',2,<%=allow_statusChg%>);" 
                                  	  class="btn btn-warning btn-xs"><i class="glyphicon glyphicon-ban-circle"></i></a> 
                              <%}else{ %>
                                  <a href="javascript:;" data-toggle="tooltip" title="Active" onClick="return updateInvestigationTypeStatus('<%=list_category.getInvestigationId() %>',1,<%=allow_statusChg%>);" 
                                  	  class="btn btn-success btn-xs"><i class="glyphicon glyphicon-ok-circle"></i></a>
                              <%} %> 
                                  <a href="javascript:;" data-toggle="tooltip" title="Delete" onClick="return deleteInvestigationType('<%=list_category.getInvestigationId() %>',<%=allow_delete%>);" 
                                  	  class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-remove"></i></a>                    
                              </td>
                                                   
                            </tr>	 
                     <%}}%>
                    
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
$(document).ready(function() 
{
  var i = 0;
  $('#active_category_list tfoot th').each( function () {
    if( i == 1 ){
      $(this).html( '<input type="text" class="form-control" placeholder="">' );
    }
    if(i == 2)
    	status = "";
    i++;
  });

  // DataTable
  var table = $('#active_category_list').DataTable();

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
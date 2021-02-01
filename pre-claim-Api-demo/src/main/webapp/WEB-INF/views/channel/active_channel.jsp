<%@page import="com.preclaim.models.ChannelList"%>
<%@page import="java.util.List"%>
<%
List<ChannelList>active_list=(List<ChannelList>)session.getAttribute("active_list");
session.removeAttribute("active_list");
List<String> user_permission=(List<String>)session.getAttribute("user_permission");
boolean allow_statusChg = user_permission.contains("channels/status");
boolean allow_delete = user_permission.contains("channels/delete");
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
            <span class="caption-subject font-green-sharp sbold">Active Channels</span>
        </div>
        <div class="actions">
            <div class="btn-group">
            <!--   <?php if( in_array( 'channels/add', $permission_arr ) ) { ?>
              <?php if($this->session->userdata(SYS_SESSION_ID) == SUPER_ADMIN_ID) { ?>  -->
              <a href="${pageContext.request.contextPath}/channel/add_channel" data-toggle="tooltip" title="Add" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Add New">
                <i class="fa fa-plus"></i>
              </a>
            <!--   <?php } ?>
              <?php } ?>  -->
            </div>
        </div>
      </div>
    </div>

    <div class="box box-primary">
      <div class="box-body">
          <div class="row">
            <div class="col-md-12 table-container">
                <div class="box-body no-padding">
                  <table id="active_channel_list" class="table table-striped table-bordered table-hover table-checkable dataTable data-tbl">
                    <thead>
                      <tr class="tbl_head_bg">
                        <th class="head1 no-sort">#</th>
                        <th class="head1 no-sort">Channel Name</th>
                        <th class="head1 no-sort">Channel Code</th>
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
                        <th class="head2 no-sort"></th>
                        <th class="head2 no-sort"></th>
                        <th class="head2 no-sort"></th>
                      </tr>
                    </tfoot>
                    <body>
                        <%
                    if(active_list!=null){
                    	
                    	for(ChannelList list_channel : active_list){
                         %>
                    		<tr>
                    			<td><%=list_channel.getSrNo() %></td>
                    		    <td><%=list_channel.getChannelName() %></td>
                    	   	    <td><%=list_channel.getChannelCode()%></td>
                    		    <td><%=list_channel.getCreatedDate() %></td>
                    		    <td>
	                    		    <% if(list_channel.getStatus()==1){ %> 
	                    		    	<span class="label label-sm label-success">Active</span>
	                    		    <%}else{%>
	                    		    	<span class="label label-sm label-danger">Inactive</span>
	                    		   <%} %>
                    		    </td>
	                            <td>
	                           		 <a href="${pageContext.request.contextPath}/channel/pending_channel?channelName=<%=list_channel.getChannelName() %>&channelCode=<%=list_channel.getChannelCode() %>&channelId=<%=list_channel.getChannelId() %>" 
                           			 	data-toggle="tooltip" title="Edit" class="btn btn-primary btn-xs"><i class="glyphicon glyphicon-edit"></i>
	                            	 </a>
	                            <% if(list_channel.getStatus()==1){ %> 
	                      			 <a href="javascript:;" data-toggle="tooltip" title="Inactive" onClick="return updateChannelStatus('<%=list_channel.getChannelId() %>',2,<%=allow_statusChg%>);" 
	                            		 class="btn btn-warning btn-xs"><i class="glyphicon glyphicon-ban-circle"></i>
	                            	 </a>
	                            <%}else{%>
	                                 <a href="javascript:;" data-toggle="tooltip" title="Active" onClick="return updateChannelStatus('<%=list_channel.getChannelId() %>',1,<%=allow_statusChg%>);" 
	                            		 class="btn btn-success btn-xs"><i class="glyphicon glyphicon-ok-circle"></i>
	                            	 </a>
	                             <%} %>	 	 
	                                 <a href="javascript:;" data-toggle="tooltip" title="Delete" onClick="return deleteChannel('<%=list_channel.getChannelId() %>',<%=allow_delete %>);" 
	                            	 	 class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-remove"></i>
	                            	 </a>
	                            	 
	                            </td>
                    		</tr>
                    		
                    		<%
                    	     	}
                             }
                            %>
                    
                    
                    </body>
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
  $('#active_channel_list tfoot th').each( function () {
    if( i == 1 || i == 2 ){
      $(this).html( '<input type="text" class="form-control" placeholder="" />' );
    }
    i++;
  });

  // DataTable
  var table = $('#active_channel_list').DataTable();

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
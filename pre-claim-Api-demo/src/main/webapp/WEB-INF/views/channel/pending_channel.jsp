<%@page import="com.preclaim.models.ChannelList"%>
<%@page import="java.util.List"%>
<%
List<ChannelList> pending_list = (List<ChannelList>) session.getAttribute("pending_channel");
session.removeAttribute("pending_channel");
ChannelList channel = (ChannelList) session.getAttribute("channel");
session.removeAttribute("channel");
List<String> user_permission=(List<String>)session.getAttribute("user_permission");
boolean allow_statusChg = user_permission.contains("channels/status");
boolean allow_delete = user_permission.contains("channels/delete");
%>
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
          <span class="caption-subject font-green-sharp sbold"><%=channel == null ? "Add" : "Update" %> Channel</span>
        </div>
      </div>
    </div>
    <div class="portlet light bordered">
      <div class="portlet-body">
        <div id="message_account"></div>
        <form novalidate id="add_channel_form" role="form" method="post" class="form-horizontal">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="channelName">Channel Name <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required id="channelName" name="channelName" maxlength="40" class="form-control" placeholder="Channel Name" 
                  	value = "<%=channel == null ? "" : channel.getChannelName()%>">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="channelCode">Channel Code <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required id="channelCode" name="channelCode" maxlength="10" class="form-control username" placeholder="Channel Code" 
                  	value = "<%= channel == null ? "" : channel.getChannelCode()%>">
                </div>
              </div>
              <div class="form-group">
                <div class="col-md-offset-4 col-md-8">
                	<% if(channel != null){ %>
                    <input type="hidden" id="channelId" name="channelId" value = "<%= channel == null ? "" : channel.getChannelId()%>">                    
                    <button class="btn btn-info" id="editchannelsubmit" onClick="return updateChannel();" type="button">Update</button>
                    <a href="${pageContext.request.contextPath}/channel/pending_channel" class="btn btn-danger">Back</a>
                    <% }else{ %>
                    <button class="btn btn-info" id="addchannelsubmit" onClick="return addChannel();" type="button">Add Channel</button>
                    <button class="btn btn-danger" type="reset" value="">Clear</button>
                	<% } %>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
 <!--<?php } ?> --> 
<div class="row">
  <div class="col-xs-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
            <i class="icon-users font-green-sharp"></i>
            <span class="caption-subject font-green-sharp sbold">Pending Channels</span>
        </div>
        <div class="actions">
            <div class="btn-group">
              <a href="${pageContext.request.contextPath}/channel/add_channel" data-toggle="tooltip" title="Add" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Add New">
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
                  <table id="pending_channel_list" class="table table-striped table-bordered table-hover table-checkable dataTable data-tbl">
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
					<tbody>
						<%
						if (pending_list != null) {
		
							for (ChannelList list_channel : pending_list) {
						%>
						<tr>
							<td><%=list_channel.getSrNo()%></td>
							<td><%=list_channel.getChannelName()%></td>
							<td><%=list_channel.getChannelCode()%></td>
							<td><%=list_channel.getCreatedDate()%></td>										
							<td><span class="label label-sm label-danger">Pending</span></td>											
							<td>
								<a href="${pageContext.request.contextPath}/channel/pending_channel?channelName=<%=list_channel.getChannelName() %>&channelCode=<%=list_channel.getChannelCode() %>&channelId=<%=list_channel.getChannelId() %>"
									data-toggle="tooltip" title="Edit" class="btn btn-primary btn-xs">
									<i class="glyphicon glyphicon-edit"></i>
				   		  		</a>
						   		<a href="javascript:;" data-toggle="tooltip" title="Active" onClick="return updateChannelStatus('<%=list_channel.getChannelId() %>',1,<%=allow_statusChg %>);" 
						   		class="btn btn-success btn-xs"><i class="glyphicon glyphicon-ok-circle"></i></a>
						   		
						   		<a href="#" data-toggle="tooltip" title="Delete" onClick="return deleteChannel('<%=list_channel.getChannelId() %>',<%=allow_delete %>);" 
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
      </div><!-- panel body -->
    </div>
  </div><!-- content -->
</div>
<script type="text/javascript">
$(document).ready(function() {
  var i = 0;
  $('#pending_channel_list tfoot th').each( function () {
    if( i == 1 || i == 2 ){
      $(this).html( '<input type="text" class="form-control" placeholder="" />' );
    }
    i++;
  });

  // DataTable
  var table = $('#pending_channel_list').DataTable();

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
function addChannel() {
	<%if(!user_permission.contains("channels/add")){%>
		toastr.error("Access Denied","Error");
		return false;
	<%}%>	
  	var channelName = $( '#add_channel_form #channelName' ).val();
	var channelCode = $( '#add_channel_form #channelCode' ).val();
	if(channelName == ''){
	  toastr.error('Channel Name Cannot be empty','Error');
	  return false;
	}
	if(channelCode == ''){
	  toastr.error('Channel Code Cannot be empty','Error');
	  return false;
	}
	if(channelName && channelCode){
	    var formdata = {'channelName':channelName,'channelCode':channelCode};
	    $.ajax({
	      type: "POST",
	      url: 'addChannel',
	      data: formdata,
	      beforeSend: function() { 
	          $("#addchannelsubmit").html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
	          $("#addchannelsubmit").prop('disabled', true);
	      },
	      success: function( data ) {
	        if(data == "****"){
	          $("#addchannelsubmit").html('Add Channel');
	          $("#addchannelsubmit").prop('disabled', false);
	          toastr.success( 'Channel Added successfully.','Success' );
	          $( '#add_channel_form #channelName' ).val('');
	          $( '#add_channel_form #channelCode' ).val('');
	          location.reload();
	        }else{
	          toastr.error( data,'Error' );
	          $("#addchannelsubmit").html('Add Channel');
	          $("#addchannelsubmit").prop('disabled', false);
	        }
	      }
	    });
	}   
}
function updateChannel() {
	<%if(!user_permission.contains("channels/add")){%>
		toastr.error("Access Denied","Error");
		return false;
	<%}%>
	var channelName = $( '#add_channel_form #channelName' ).val();
	var channelId   = $( '#add_channel_form #channelId' ).val();
	var channelCode = $( '#add_channel_form #channelCode' ).val();
	if(channelName == ''){
	  toastr.error('Channel Name Cannot be empty','Error');
	  return false;
	}
	if(channelCode == ''){
	  toastr.error('Channel Code Cannot be empty','Error');
	  return false;
	}
	if(channelName && channelCode){
	    var formdata = {'channelName':channelName,'channelCode':channelCode,'channelId':channelId};
	    $.ajax({
	      type: "POST",
	      url: '${pageContext.request.contextPath}/channel/updateChannel',
	      data: formdata,
	      beforeSend: function() { 
	          $("#editchannelsubmit").html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
	          $("#editchannelsubmit").prop('disabled', true);
	      },
	      success: function( data ) {
	        if(data == "****"){
	          $("#editchannelsubmit").html('Update');
	          $("#editchannelsubmit").prop('disabled', false);
	          toastr.success( 'Channel Updated successfully.','Success' );
	          location.reload();
	        }else{
	          toastr.error( data,'Error' );
	          $("#editchannelsubmit").html('Update');
	          $("#editchannelsubmit").prop('disabled', false);
	        }
	      }
	    });
	}   
}
</script>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.preclaim.models.AppUserList"%>
<%@page import="com.preclaim.models.Region"%>
<%@page import="com.preclaim.models.Channel"%>
<%
List<AppUserList> appUserList = (List<AppUserList>) session.getAttribute("AppUserList");
session.removeAttribute("AppUserList");
List<String> user_permission = (ArrayList<String>)session.getAttribute("user_permission");
if(user_permission == null)
	user_permission = new ArrayList<String>();
boolean allowDelete = user_permission.contains("appUsers/delete");
boolean allowStatusChg = user_permission.contains("appUsers/status");
List<Region> regionList = (List<Region>) session.getAttribute("region_list");
List<Channel> channelList = (List<Channel>) session.getAttribute("channel_list");
session.removeAttribute("region_list");
session.removeAttribute("channel_list");
if(regionList == null)
	regionList = new ArrayList<Region>();
if(channelList == null)
	channelList = new ArrayList<Channel>();
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
            <span class="caption-subject font-green-sharp sbold">Manage App Users</span>
        </div>
        <div class="actions">
            <div class="btn-group">
              <a href="#" data-toggle="tooltip" onclick = "checkImportAuth()" title="Import"
              	class="btn green-haze btn-outline btn-xs pull-right" style="margin-right: 5px;"
              	data-original-title="Add New">
                <i class="fa fa-plus"></i></a>
              <a href="#" onclick="checkDeleteAuth()" data-toggle="tooltip" title="Delete old users" 
              	class="btn red-haze btn-outline btn-xs pull-right" style="margin-right: 5px;"
              	data-original-title="Delete old users">
                <i class="fa fa-remove"></i>
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
                  <table id="app_user_list" class="table table-striped table-bordered table-hover table-checkable dataTable data-tbl">
                    <thead>
                      <tr class="tbl_head_bg">
                        <th class="head1 no-sort">#</th>
                        <th class="head1 no-sort">User Name</th>
                        <th class="head1 no-sort">Agent Name</th>
                        <th class="head1 no-sort">Channel Code</th>
                        <th class="head1 no-sort">Channel</th>
                        <th class="head1 no-sort">Region</th>
                        <th class="head1 no-sort">Password</th>
                        <th class="head1 no-sort">lat</th>
                        <th class="head1 no-sort">lng</th>
                        <th class="head1 no-sort">Zipcode</th>
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
                        <th class="head2 no-sort"></th>
                      </tr>
                    </tfoot>
                    <tbody>
                    	<%if(appUserList != null) 
                    	{
                    		for(AppUserList appuser: appUserList)
                    		{
                    	%>
                    	<tr>
                    		<td><%= appuser.getSrno()%></td>
                    		<td><%= appuser.getUsername()%></td>
                    		<td><%= appuser.getAgentname()%></td>
                    		<td><%= appuser.getChannelcode1()%></td>
                    		<td><%= appuser.getChannelname1()%></td>
                    		<td><%= appuser.getRegion()%></td>
                    		<td><%= appuser.getPassword()%></td>
                    		<td><%= appuser.getLatitude()%></td>
                    		<td><%= appuser.getLongitude()%></td>
                    		<td><%= appuser.getZipcode()%></td>
                    		<td>                    			
                    			<% if(appuser.getStatus() == 1) {%>
                    				<span class="label label-sm label-success">Active</span>
                   				<%}else{ %>
                   					<span class="label label-sm label-danger">Inactive</span>
                   				<%} %>
                   			</td>
                    		<td>
                    			<% if(appuser.getStatus() == 1) {%>
                    			<a href="javascript:;" data-toggle="tooltip" title="Inactive" 
                    				onClick="return updateAppUserStatus(<%=appuser.getAppuserId() %>,2,
                    				<%=allowStatusChg %>);" class="btn btn-warning btn-xs">
                    				<i class="glyphicon glyphicon-ban-circle"></i>
                   				</a>
                   				<%}else{ %>
                   				<a href="javascript:;" data-toggle="tooltip" title="Acctive" 
                    				onClick="return updateAppUserStatus(<%=appuser.getAppuserId() %>,1,
                    				<%=allowStatusChg %>);" class="btn btn-success btn-xs">
                    				<i class="glyphicon glyphicon-ok-circle"></i>
                   				</a>
                   				<%} %>
                  				<a href="javascript:;" data-toggle="tooltip" title="Delete" 
                  					onClick="return deleteAppUser(<%=appuser.getAppuserId() %>,
                  					<%=allowDelete %>);" class="btn btn-danger btn-xs">
                  					<i class="glyphicon glyphicon-remove"></i>
               					</a>                    		
                    		</td>
                    	</tr>
                    	<%}} %>
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
  var i = 0;
  // DataTable
  var table = $('#app_user_list').DataTable();

  $('#app_user_list tfoot th').each( function () {
    if( i == 1 || i == 2 ){
      $(this).html( '<input type="text" class="form-control" placeholder="" />' );
    } else if(i == 3){
      var tech_selectbox = '<select name="channelCode" id="channelCode" class="form-control">'
                              +'<option value="">All</option>';
        <%for(Channel channel : channelList) {%>
        tech_selectbox += "<option value = ''<%=channel.getChannelCode()%>''><%=channel.getChannelCode()%></option>"
        <%}%>
        tech_selectbox += '</select>';
        $(this).html( tech_selectbox );
    } else if(i == 4){
      var tech_selectbox = '<select name="channelName" id="channelName" class="form-control">'
                              +'<option value="">All</option>';
        <%for(Channel channel : channelList) { %>
        	tech_selectbox += "<option value = '<%=channel.getChannelCode()%>'><%=channel.getChannelName()%></option>"
        <%}%>
        tech_selectbox += '</select>';
        $(this).html( tech_selectbox );
    } else if(i == 5){
      var tech_selectbox = '<select name="region_id" id="region_id" class="form-control">'
                              +'<option value="">All</option>';
        <%for(Region region : regionList) {%>
        	tech_selectbox += "<option value = '<%=region.getRegionId()%>'><%=region.getRegionName()%></option>"
        <%}%>      	
        tech_selectbox += '</select>';
        $(this).html( tech_selectbox );
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
function checkImportAuth()
{
	<%if(!user_permission.contains("appUsers/import")){%>
		toastr.error("Access Denied", "Error");
	<%}else{%>
		location.href = "${pageContext.request.contextPath}/app_user/import";
	<%}%>
}
function checkDeleteAuth()
{
	<%if(!user_permission.contains("appUsers/delete")){%>
		toastr.error("Access Denied", "Error");
	<%}else{%>
		var response = confirm("Are you sure you want to delete");
		if(response)
			location.href = "${pageContext.request.contextPath}/app_user/deleteAll";
	<%}%>
}
</script>
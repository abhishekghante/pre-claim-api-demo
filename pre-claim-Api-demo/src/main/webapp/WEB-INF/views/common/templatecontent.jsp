<%@page import="com.preclaim.config.Config" %>
<%@page import = "java.time.LocalDateTime" %>
<%@page import = "java.time.format.DateTimeFormatter" %>
<%@page import="com.preclaim.models.ScreenDetails" %>
<%
String W0DATE = LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd MMMM yyyy hh:mm:ss a"));
ScreenDetails details = (ScreenDetails) session.getAttribute("ScreenDetails");
%>
<jsp:include page="templateheader.jsp"/>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <!-- BEGIN PAGE HEADER-->
        <!-- BEGIN PAGE BAR -->
        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>
                    <a href="${pageContext.request.contextPath}/dashboard">Home</a>
                    <i class="fa fa-circle"></i>
                </li>
                <%if (!details.getSub_menu2().equals(""))
                	{ %>
               	<li>
               		<a href = "${pageContext.request.contextPath}<%=details.getSub_menu2_path() %>">
               			<%=details.getSub_menu2() %>
               		</a>
               		<i class = "fa fa-circle"></i>
              	</li>
              	<%} %>
                <li class = "active">
                	<%=details.getScreen_title() %>
               	</li>                	               
            </ul>
            <ul class="page-breadcrumb" style="margin-left: 20px;">
                <li><small><%=Config.version %></small></li>
            </ul>
            <div class="page-toolbar">
                <div id="dashboard-report-range" class="pull-right tooltips btn btn-sm" data-container="body" data-placement="bottom" data-original-title="<%=W0DATE %>" aria-describedby="tooltip324660">
                    <i class="icon-calendar"></i>&nbsp;
                    <span class="thin uppercase hidden-xs"><%=W0DATE %></span>&nbsp;
                </div>
            </div>
        </div>
        <!-- END PAGE BAR -->
        <!-- BEGIN PAGE TITLE-->
        <!-- END PAGE TITLE-->
        <!-- END PAGE HEADER-->
        <div class="row">
        <% 
        if(!details.getError_message1().equals("")) { %>
            <script>
                toastr.error("<%=details.getError_message1()%>",'Error');
            </script>
        <%  
        }
        if(!details.getSuccess_message1().equals("")) { %>
            <script>
                toastr.success("<%=details.getSuccess_message1()%>",'Success');
            </script>
        <% 
        } %>
        </div>
        <div class="row">
        <%
        if(!details.getError_message1().equals("")) { %>
            <div class="col-xs-12 col-sm-12 margin_t10">
                <div class="alert alert-danger">
                    <%=details.getError_message2()%>
                </div>
            </div>
        <%}
        if(!details.getError_message1().equals("")) { %>
            <div class="col-xs-12 col-sm-12 margin_t10">
                <div class="alert alert-success">
                    <%=details.getSuccess_message2()%>
                </div>
            </div>
        <% 
        } %>
        </div>
        <jsp:include page="<%=details.getScreen_name() %>"/>
    </div> 
    <!-- END CONTENT BODY -->
</div>
<!-- END CONTENT -->
<jsp:include page="templatefooter.jsp"/>
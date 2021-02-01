<%@page import="com.preclaim.controller.LoginController"%>
<%@page import="com.preclaim.models.ScreenDetails" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%
ScreenDetails details = (ScreenDetails) session.getAttribute("ScreenDetails");
ArrayList<String> user_permission = (ArrayList<String>)session.getAttribute("user_permission");
%>
<!-- BEGIN SIDEBAR -->
<div class="page-sidebar-wrapper">
    <!-- BEGIN SIDEBAR -->
    <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
    <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
    <div class="page-sidebar navbar-collapse collapse">
        <!-- BEGIN SIDEBAR MENU -->
        <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
        <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
        <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
        <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
        <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
        <ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="">
            <!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
            <li class="sidebar-toggler-wrapper hide">
                <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                <div class="sidebar-toggler"> </div>
                <!-- END SIDEBAR TOGGLER BUTTON -->
            </li>
            <li class="nav-item start <%if(details.getMain_menu().equals("Dashboard")){%>active open<%}%>">
                <a href="${pageContext.request.contextPath}/dashboard" class="nav-link">
                    <i class="icon-home"></i>
                    <span class="title">Dashboard</span>
                </a>
            </li>
            
            <%if(user_permission.contains("appUsers")) {%>
            <li class="nav-item start <%if(details.getMain_menu().equals("App Users Management")){%>active open<%}%>">
                <a href="${pageContext.request.contextPath}/app_user/app_user" class="nav-link">
                    <i class="icon-user"></i>
                    <span class="title">App Users Management</span>
                </a>
            </li>
            <%} %> 
            <li class="nav-item <%if(details.getMain_menu().equals("Live Tracking")){%>active open<%}%>">
                <a href="${pageContext.request.contextPath}/livetracking/index" class="nav-link">
                    <i class="icon-pointer"></i>
                    <span class="title">Live Tracking</span>
                </a>
            </li>
            <%if(user_permission.contains("messages")){ %>
            <li class="nav-item <%if(details.getMain_menu().equals("Case Management")){%>active open<%}%>">
              <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="icon-envelope-letter"></i>
                  <span class="title">Case Management </span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">
                
                <li class="nav-item <%if(details.getSub_menu1().equals("Bulk case uploads")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/message/import_case" 
                  	class="nav-link nav-toggle">
                    <i class="icon-plus"></i> Bulk case uploads
                  </a>
                </li>
                <%if(user_permission.contains("messages/add")){ %>
                <li class="nav-item <%if(details.getSub_menu1().equals("Create Case")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/message/add_message" 
                  	class="nav-link nav-toggle">
                    <i class="icon-plus"></i> Create Case
                  </a>
                </li>
                  <%} %>
                  
                <li class="nav-item <%if(details.getSub_menu1().equals("RCU Pending Cases")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/message/pending_message" 
                  	class="nav-link nav-toggle">
                    <i class="icon-clock"></i> Pending Cases
                  </a>
                </li>
                <li class="nav-item <%if(details.getSub_menu1().equals("RCU Active Cases")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/message/active_message" 
                  	class="nav-link nav-toggle">
                    <i class="icon-check"></i> Active Cases
                  </a>
                </li>
                <li class="nav-item <%if(details.getSub_menu1().equals("RCU Assigned Cases")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/message/assigned_message" 
                  	class="nav-link nav-toggle">
                    <i class="icon-check"></i> Assigned Cases
                  </a>
                </li>
              </ul>
            </li>
            <%} %>
			<%if(user_permission.contains("regionalManager")){ %>
            <li class="nav-item <%if(details.getMain_menu().equals("Regional Manager")){%>active open<%}%>">
              <a href="#" class="nav-link nav-toggle">
                  <i class="icon-user"></i>
                  <span class="title">Regional Manager</span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">
                    
                <li class="nav-item <%if(details.getSub_menu1().equals("RM Pending Cases")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/regionalManager/pending" class="nav-link nav-toggle">
                    <i class="icon-clock"></i> Pending Cases
                  </a>
                </li>
                
                <li class="nav-item <%if(details.getSub_menu1().equals("RM Assigned Cases")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/regionalManager/assigned" class="nav-link nav-toggle">
                    <i class="icon-check"></i> Assigned Cases
                  </a>
                </li>
              </ul>
            </li>
             <%} %>
            <%if(user_permission.contains("agencySupervisor")){ %>
            <li class="nav-item <%if(details.getMain_menu().equals("Agency Supervisor")){%>active open<%}%>">
              <a href="#" class="nav-link nav-toggle">
                  <i class="icon-user"></i>
                  <span class="title">Agency Supervisor</span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">
                    
                <li class="nav-item <%if(details.getSub_menu1().equals("AS Pending Cases")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/supervisor/pending" class="nav-link nav-toggle">
                    <i class="icon-clock"></i> Pending Cases
                  </a>
                </li>
                
                <li class="nav-item <%if(details.getSub_menu1().equals("AS Assigned Cases")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/supervisor/assigned" class="nav-link nav-toggle">
                    <i class="icon-check"></i> Assigned Cases
                  </a>
                </li>
              </ul>
            </li>
             <%} %>
            <li class="heading">
                <h3 class="uppercase">Settings</h3>
            </li>
            <%if(user_permission.contains("users")){ %>
            <li class="nav-item <%if(details.getMain_menu().equals("Users")){%>active open<%}%>">
              <a href="${pageContext.request.contextPath}/users" class="nav-link nav-toggle">
                  <i class="icon-user"></i>
                  <span class="title">Users</span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">
                
                 <%if(user_permission.contains("users/add")){ %>
                <li class="nav-item <%if(details.getSub_menu1().equals("Add User")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/user/add_user" class="nav-link nav-toggle">
                    <i class="icon-user-follow"></i> Add User
                  </a>
                </li>
                 <%} %>
                 
                <li class="nav-item <%if(details.getSub_menu1().equals("User Lists")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/user/user_list" class="nav-link nav-toggle">
                    <i class="icon-user-follow"></i> User Lists
                  </a>
                </li>
                
                <li class="nav-item <%if(details.getSub_menu1().equals("User Role")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/user/role" class="nav-link nav-toggle">
                    <i class="icon-user-following"></i> User Role
                  </a>
                </li>
              </ul>
            </li>
             <%} %>
             <%if(user_permission.contains("intimationType")){ %>
            <li class="nav-item <%if(details.getMain_menu().equals("Intimation Type")){%>active open<%}%>">
              <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="fa fa-exclamation-triangle" style = "color:white"></i>
                  <span class="title">Intimation Type</span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">
                <%if(user_permission.contains("intimationType/add")){ %>
                <li class="nav-item <%if(details.getSub_menu1().equals("Add Intimation Type")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/intimationType/add" class="nav-link nav-toggle">
                    <i class="icon-plus"></i> Add Intimation Type
                  </a>
                </li>
                 <%} %>
                 <%if(user_permission.contains("intimationType/index")){ %>
                <li class="nav-item <%if(details.getSub_menu1().equals("Pending Intimation")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/intimationType/pending" class="nav-link nav-toggle">
                    <i class="icon-clock"></i> Pending Intimation
                  </a>
                </li>
                <%} %>
				<%if(user_permission.contains("intimationType/index")){ %>
                <li class="nav-item <%if(details.getSub_menu1().equals("Active Intimation")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/intimationType/active" class="nav-link nav-toggle">
                    <i class="icon-check"></i> Active Intimation
                  </a>
                </li>
                <%} %>
              </ul>
            </li>
            <%} %>
            <%if(user_permission.contains("location")){ %>
            <li class="nav-item <%if(details.getMain_menu().equals("Location")){%>active open<%}%>">
              <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="icon-pointer" style = "color:white"></i>
                  <span class="title">Location</span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">
                <%if(user_permission.contains("location/add")){ %>
                <li class="nav-item <%if(details.getSub_menu1().equals("Add Location")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/location/add" class="nav-link nav-toggle">
                    <i class="icon-plus"></i> Add Location
                  </a>
                </li>
                 <%} %>
                 <%if(user_permission.contains("location/index")){ %>
                <li class="nav-item <%if(details.getSub_menu1().equals("Pending Location")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/location/pending" class="nav-link nav-toggle">
                    <i class="icon-clock"></i> Pending Location
                  </a>
                </li>
                <%} %>
				<%if(user_permission.contains("location/index")){ %>
                <li class="nav-item <%if(details.getSub_menu1().equals("Active Location")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/location/active" class="nav-link nav-toggle">
                    <i class="icon-check"></i> Active Location
                  </a>
                </li>
                <%} %>
              </ul>
            </li>
            <%} %>
            <%if(user_permission.contains("mailConfig")){ %>
            <li class="nav-item <%if(details.getMain_menu().equals("Mail Config")){%>active open<%}%>">
              <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="fa fa-inbox" style = "color:white"></i>
                  <span class="title">Mail Config</span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">
                <%if(user_permission.contains("mailConfig/add")){ %>
                <li class="nav-item <%if(details.getSub_menu1().equals("Add Mail Config")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/mailConfig/add" class="nav-link nav-toggle">
                    <i class="icon-plus"></i> Add Mail Config
                  </a>
                </li>
                 <%} %>
                 <%if(user_permission.contains("mailConfig/index")){ %>
                <li class="nav-item <%if(details.getSub_menu1().equals("Pending Mail Config")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/mailConfig/pending" class="nav-link nav-toggle">
                    <i class="icon-clock"></i> Pending Mail Config
                  </a>
                </li>
                <%} %>
				<%if(user_permission.contains("mailConfig/index")){ %>
                <li class="nav-item <%if(details.getSub_menu1().equals("Active Mail Config")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/mailConfig/active" class="nav-link nav-toggle">
                    <i class="icon-check"></i> Active Mail Config
                  </a>
                </li>
                <%} %>
              </ul>
            </li>
            <%} %>
            <%if(user_permission.contains("channels")){ %>
            <li class="nav-item <%if(details.getMain_menu().equals("Channels")){%>active open<%}%>">
              <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="icon-support"></i>
                  <span class="title">Channels</span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">
                <li class="nav-item <%if(details.getSub_menu1().equals("Add Channel")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/channel/add_channel" class="nav-link nav-toggle">
                    <i class="icon-plus"></i> Add Channel
                  </a>
                </li>
                <li class="nav-item <%if(details.getSub_menu1().equals("Pending Channels")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/channel/pending_channel" class="nav-link nav-toggle">
                    <i class="icon-clock"></i> Pending Channels
                  </a>
                </li>
                <li class="nav-item <%if(details.getSub_menu1().equals("Active Channels")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/channel/active_channel" class="nav-link nav-toggle">
                    <i class="icon-check"></i> Active Channels
                  </a>
                </li>
              </ul>
            </li>
            <%} %>
            <%if(user_permission.contains("regions")){ %>
            <li class="nav-item <%if(details.getMain_menu().equals("Regions")){%>active open<%}%>">
              <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="icon-pointer"></i>
                  <span class="title">Regions</span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">
                
                <li class="nav-item <%if(details.getSub_menu1().equals("Add Region")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/region/add_region" class="nav-link nav-toggle">
                    <i class="icon-plus"></i> Add Region
                  </a>
                </li>
                
                <li class="nav-item <%if(details.getSub_menu1().equals("Pending Regions")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/region/pending_region" class="nav-link nav-toggle">
                    <i class="icon-clock"></i> Pending Regions
                  </a>
                </li>
                <li class="nav-item <%if(details.getSub_menu1().equals("Active Regions")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/region/active_region" class="nav-link nav-toggle">
                    <i class="icon-check"></i> Active Regions
                  </a>
                </li>
              </ul>
            </li>
            <%} %>
            <%if(user_permission.contains("investigationType")){ %>
            <li class="nav-item <%if(details.getMain_menu().equals("Investigation Type")){%>active open<%}%>">
              <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="icon-grid"></i>
                  <span class="title">Investigation Types</span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">
                <%if(user_permission.contains("investigationType/add")){ %>
                <li class="nav-item <%if(details.getSub_menu1().equals("Add Investigation Type")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/investigationType/addInvestigationType" class="nav-link nav-toggle">
                    <i class="icon-plus"></i> Add Investigation Type
                  </a>
                </li>
                <%} %>
				<%if(user_permission.contains("investigationType/index")){ %>
                <li class="nav-item <%if(details.getSub_menu1().equals("Pending Investigation Type")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/investigationType/pendingInvestigationType" class="nav-link nav-toggle">
                    <i class="icon-clock"></i> Pending Investigation Type
                  </a>
                </li>
                <%} %>
                <%if(user_permission.contains("investigationType/index")){ %>
                <li class="nav-item <%if(details.getSub_menu1().equals("Active Investigation Type")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/investigationType/activeInvestigationType" class="nav-link nav-toggle">
                    <i class="icon-check"></i> Active Investigation Type
                  </a>
                </li>
                <%} %>
              </ul>
            </li>
            <%} %>
            <%if(user_permission.contains("mapping")){ %>
            <li class="nav-item <%if(details.getMain_menu().equals("Mapping")){%>active open<%}%>">
              <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="icon-shuffle"></i>
                  <span class="title">Mapping</span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">
                <li class="nav-item <%if(details.getSub_menu1().equals("Add Mapping")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/mapping/add_mapping" class="nav-link nav-toggle">
                    <i class="icon-plus"></i> Add Mapping
                  </a>
                </li>
                <li class="nav-item <%if(details.getSub_menu1().equals("Mapping List")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/mapping/mapping_list" class="nav-link nav-toggle">
                    <i class="icon-list"></i> Mapping List
                  </a>
                </li>
              </ul>
            </li>
            <%} %>
            <li class="heading">
                <h3 class="uppercase">----</h3>
            </li>
            <%if(user_permission.contains("report")){ %> 
            <li class="nav-item <%if(details.getMain_menu().equals("Report")){%>active open<%}%>">
              <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="icon-folder-alt"></i>
                  <span class="title">Report</span>
                  <span class="arrow"></span>
              </a>
              <ul class="sub-menu">
                <li class="nav-item <%if(details.getSub_menu1().equals("All investigations")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/report/messages_status" class="nav-link nav-toggle">
                    <i class="icon-bar-chart"></i> All investigations 

                  </a>
                </li>

                <li class="nav-item <%if(details.getSub_menu1().equals("Assigned Investigators cases")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/report/read_message" class="nav-link nav-toggle">
                    <i class="icon-envelope-open"></i>  Assigned Investigators cases
                  </a>
                </li>

                <li class="nav-item <%if(details.getSub_menu1().equals("Investigators matched/unmatched client")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/report/like_message" class="nav-link nav-toggle">
                    <i class="icon-like"></i> Investigators matched/unmatched client
                  </a>
                </li>
                
                <li class="nav-item <%if(details.getSub_menu1().equals("Billing Reports")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/report/favourite_message" class="nav-link nav-toggle">
                    <i class="icon-docs"></i> Billing Reports
                  </a>
                </li>
                
                <li class="nav-item <%if(details.getSub_menu1().equals("Export data")){%>active<%}%>">
                  <a href="${pageContext.request.contextPath}/report/login_details" class="nav-link nav-toggle">
                    <i class="icon-user-follow"></i> Export data
                  </a>
                </li>
                
              </ul>
            </li>
           <%} %>
            <li class="nav-item <%if(details.getMain_menu().equals("Billing Management")){%>active open<%}%>">
              <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="icon-grid"></i>
                  <span class="title">Billing management</span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">
                <li class="nav-item <%if(details.getSub_menu1().equals("Update billing")){%>active<%}%>">
                  <a href="#" class="nav-link nav-toggle">
                    <i class="icon-plus"></i> Update billing
                  </a>
                </li>
                <li class="nav-item <%if(details.getSub_menu1().equals("Payment")){%>active<%}%>">
                  <a href="#" class="nav-link nav-toggle">
                    <i class="icon-clock"></i> Payment
                  </a>
                </li>
                <li class="nav-item <%if(details.getSub_menu1().equals("Capturing payment details")){%>active<%}%>">
                  <a href="#" class="nav-link nav-toggle">
                    <i class="icon-check"></i> Capturing payment details
                  </a>
                </li>
              </ul>
            </li>

            
        </ul>
        <!-- END SIDEBAR MENU -->
    </div>
    <!-- END SIDEBAR -->
</div>
<!-- END SIDEBAR -->
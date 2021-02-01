<%@page import="com.preclaim.config.Config" %>

<div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <h3 class="page-title">Dashboard
            <small><%=Config.version %></small>
        </h3>
    </div>

    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="dashboard-stat blue">
            <div class="visual">
                <i class="fa fa-comments"></i>
            </div>
            <div class="details">
                <div class="number">
                    <span data-counter="counterup" data-value="1349">47</span>
                </div>
                <div class="desc"> Claim investigation </div>
            </div>
            <a class="more" href="javascript:;"> 
                <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo2">View more</button>
                <div id="demo2" class="collapse">
                    <p>14-06-2020&nbsp;&nbsp;&nbsp;&nbsp;43&nbsp;&nbsp;&nbsp;&nbsp;Active</p>
                </div>
            </a>
        </div>
    </div>

    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="dashboard-stat red">
            <div class="visual">
                <i class="fa fa-comments"></i>
            </div>
            <div class="details">
                <div class="number">
                    <span data-counter="counterup" data-value="12,5">1</span></div>
                <div class="desc"> New Cases </div>
            </div>
            <a class="more" href="javascript:;"> 
                <a href="${pageContext.request.contextPath}/category/activelist" 
                	class="btn btn-info">View more</a>
            </a>
        </div>
    </div>

    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="dashboard-stat green">
            <div class="visual">
                <i class="fa fa-users"></i>
            </div>
            <div class="details">
                <div class="number">
                    <span data-counter="counterup" data-value="549">2486</span>
                </div>
                <div class="desc"> Assigned Cases </div>
            </div>
            <a class="more" href="javascript:;"> 
                <a href="${pageContext.request.contextPath}/category/pendinglist" class="btn btn-info">View more</a>
            </a>
        </div>
    </div>

    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="dashboard-stat purple">
            <div class="visual">
                <i class="fa fa-globe"></i>
            </div>
            <div class="details">
                <div class="number">
                    <span data-counter="counterup" data-value="89">5</span></div>
                <div class="desc"> Assigned investigation </div>
            </div>
            <a class="more" href="javascript:;"> 
                <button onClick="return showAssignGraph();" type="button" class="btn btn-info">View more</button>
                <div id="demo5" class="collapse">
                    <p>14-06-2020&nbsp;&nbsp;&nbsp;&nbsp;43&nbsp;&nbsp;&nbsp;&nbsp;Active</p>
                </div>
            </a>
        </div>
    </div>

    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="dashboard-stat red">
            <div class="visual">
                <i class="fa fa-comments"></i>
            </div>
            <div class="details">
                <div class="number">
                    <span data-counter="counterup" data-value="12,5">1</span></div>
                <div class="desc"> PIV/PIRV/LIVE Pending </div>
            </div>
            <a class="more" href="javascript:;"> 
                <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo6">View more</button>
                <div id="demo6" class="collapse">
                    <p>14-06-2020&nbsp;&nbsp;&nbsp;&nbsp;43&nbsp;&nbsp;&nbsp;&nbsp;Active</p>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="dashboard-stat red">
            <div class="visual">
                <i class="fa fa-comments"></i>
            </div>
            <div class="details">
                <div class="number">
                    <span data-counter="counterup" data-value="12,5">1</span></div>
                <div class="desc"> Claim Document pickup/ Claim Investigation pending cases </div>
            </div>
            <a class="more" href="javascript:;"> 
                <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo7">View more</button>
                <div id="demo7" class="collapse">
                    <p>14-06-2020&nbsp;&nbsp;&nbsp;&nbsp;43&nbsp;&nbsp;&nbsp;&nbsp;Active</p>
                </div>
            </a>
        </div>
    </div>
</div>
<div class="row">
<div class="col-md-6 col-sm-6">
    <div class="portlet light bordered">
        <div class="portlet-title tabbable-line">
            <div class="caption">
                <i class="icon-envelope-letter font-green"></i>
                <span class="caption-subject font-green bold uppercase">Active Cases</span>
            </div>
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#tab_actions_pending" data-toggle="tab"> Work in Progress Cases </a>
                </li>
                <li>
                    <a href="#tab_actions_completed" data-toggle="tab"> Investigation Billing Cases </a>
                </li>
            </ul>
        </div>
        <div class="portlet-body">
            <div class="tab-content" id="dash_message_lists">
                <jsp:include page="dash_message_lists.jsp"></jsp:include>
            </div>
        </div>
    </div>
</div>
<div class="col-md-6 col-sm-6">
    <div class="portlet light bordered">
        <div class="portlet-title tabbable-line">
            <div class="caption">
                <i class="icon-envelope-letter font-green"></i>
                <span class="caption-subject font-green bold uppercase">New Investigations</span>
            </div>
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#tab_cat_pending" data-toggle="tab"> Pending </a>
                </li>
                <li>
                    <a href="#tab_cat_completed" data-toggle="tab"> Active </a>
                </li>
            </ul>
        </div>
        <div class="portlet-body">
            <div class="tab-content" id="dash_category_lists">
                <jsp:include page="dash_category_lists.jsp"></jsp:include>
            </div>
        </div>
    </div>
</div>
</div>

<div id="testmodal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body" style="height: 430px;">
                <div class="col-md-12 col-sm-12">
                    <figure class="highcharts-figure">
                        <div id="container1"></div>
                    </figure>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-more.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script type="text/javascript">
function showAssignGraph(){
  $("#testmodal").modal('show');
}

Highcharts.chart('container1', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'Assigned investigation'
    },
    subtitle: {
        text: 'Last Six Months'
    },
    xAxis: {
        categories: [
            'Dec',
            'Jan',
            'Feb',
            'Mar',
            'April',
            'Jun'
        ],
        crosshair: true
    },
    yAxis: {
        min: 0,
        title: {
            text: 'Likes'
        }
    },
    tooltip: {
        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
        footerFormat: '</table>',
        shared: true,
        useHTML: true
    },
    plotOptions: {
        column: {
            pointPadding: 0.2,
            borderWidth: 0
        }
    },
    series: [{
        name: 'Report awaited',
        data: [135.6, 148.5, 216.4, 194.1, 95.6, 54.4]

    }, {
        name: 'Further requirement raised',
        data: [105.0, 104.3, 91.2, 83.5, 106.6, 92.3]

    }, {
        name: 'Sent for reinvestigation',
        data: [59.0, 59.6, 52.4, 65.2, 59.3, 51.2]

    }, {
        name: 'Review awaited',
        data: [57.4, 60.4, 47.6, 39.1, 46.8, 51.1]

    }, {
        name: 'Awaiting opinion',
        data: [105.0, 104.3, 91.2, 83.5, 106.6, 92.3]

    }, {
        name: 'Closed cases',
        data: [57.4, 60.4, 47.6, 39.1, 46.8, 51.1]

    }]
});
</script>
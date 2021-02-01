<style type="text/css">
#imgAccount { display:none;}
</style>
<div class="row">
  <div class="col-md-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
            <i class="icon-user font-green-sharp"></i>
            <span class="caption-subject font-green-sharp sbold">Live tracking for Investigator</span>
        </div>
        <div class="actions"></div>
      </div>
    </div>
    <div class="box box-primary">
      <div class="box-body">
        <div class="row">
          <div class="col-md-12">
            <div id="map" style="width: 100%; height: 500px;"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>
<script type="text/javascript">
  var locations = [
    ['<a href="${pageContext.request.contextPath}/messages/activelist"  title="View All Cases" class="btn red-haze btn-outline btn-xs">View All Cases</a>', 19.213294, 72.969636, 17],
    ['<a href="${pageContext.request.contextPath}/messages/activelist"  title="View All Cases" class="btn red-haze btn-outline btn-xs">View All Cases</a>', 19.322390, 73.049720, 16],
    ['<a href="${pageContext.request.contextPath}/messages/activelist"  title="View All Cases" class="btn red-haze btn-outline btn-xs">View All Cases</a>', 19.047799, 73.015760, 15],
    ['<a href="${pageContext.request.contextPath}/messages/activelist" title="View All Cases" class="btn red-haze btn-outline btn-xs">View All Cases</a>', 19.071675, 72.998091, 14],
    ['<a href="${pageContext.request.contextPath}/messages/activelist" title="View All Cases" class="btn red-haze btn-outline btn-xs">View All Cases</a>', 18.557052, 73.806058, 13],
    ['<a href="${pageContext.request.contextPath}/messages/activelist" title="View All Cases" class="btn red-haze btn-outline btn-xs">View All Cases</a>', 18.512867, 73.895197, 12],
    ['<a href="${pageContext.request.contextPath}/messages/activelist" title="View All Cases" class="btn red-haze btn-outline btn-xs">View All Cases</a>', 19.224475, 73.097742, 11],
    ['<a href="${pageContext.request.contextPath}/messages/activelist" title="View All Cases" class="btn red-haze btn-outline btn-xs">View All Cases</a>', 19.233373, 73.145929, 10],
    ['<a href="${pageContext.request.contextPath}/messages/activelist" title="View All Cases" class="btn red-haze btn-outline btn-xs">View All Cases</a>', 19.317462, 73.073492, 9],
    ['<a href="${pageContext.request.contextPath}/messages/activelist" title="View All Cases" class="btn red-haze btn-outline btn-xs">View All Cases</a>', 19.247312, 72.982981, 8],
    ['<a href="${pageContext.request.contextPath}/messages/activelist" title="View All Cases" class="btn red-haze btn-outline btn-xs">View All Cases</a>', 19.256622, 72.972612, 7],
    ['<a href="${pageContext.request.contextPath}/messages/activelist" title="View All Cases" class="btn red-haze btn-outline btn-xs">View All Cases</a>', 19.130165, 72.877781, 6],
    ['<a href="${pageContext.request.contextPath}/messages/activelist" title="View All Cases" class="btn red-haze btn-outline btn-xs">View All Cases</a>', 19.056038, 72.888566, 5],
    ['<a href="${pageContext.request.contextPath}/messages/activelist" title="View All Cases" class="btn red-haze btn-outline btn-xs">View All Cases</a>', 19.117959, 72.931643, 4],
    ['<a href="${pageContext.request.contextPath}/messages/activelist"  title="View All Cases" class="btn red-haze btn-outline btn-xs">View All Cases</a>', 19.051644, 72.897039, 3],
    ['<a href="${pageContext.request.contextPath}/messages/activelist"  title="View All Cases" class="btn red-haze btn-outline btn-xs">View All Cases</a>', 19.130736, 72.853587, 2],
    ['<a href="${pageContext.request.contextPath}/messages/activelist"  title="View All Cases" class="btn red-haze btn-outline btn-xs">View All Cases</a>', 19.205124, 72.831257, 1]
  ];

  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 10,
    center: new google.maps.LatLng(19.112998, 72.8758992),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

  var infowindow = new google.maps.InfoWindow();

  var marker, i;

  for (i = 0; i < locations.length; i++) {  
    marker = new google.maps.Marker({
      position: new google.maps.LatLng(locations[i][1], locations[i][2]),
      map: map
    });

    google.maps.event.addListener(marker, 'click', (function(marker, i) {
      return function() {
        infowindow.setContent(locations[i][0]);
        infowindow.open(map, marker);
      }
    })(marker, i));
  }
</script>
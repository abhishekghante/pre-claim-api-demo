<!-- <?php
defined('BASEPATH') OR exit('No direct script access allowed');
$assetUrl   = $this->config->item( 'base_url' );
global $permission_arr;
?> -->
<link href="${pageContext.request.contextPath}/resources/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/resources/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<!-- <?php if( in_array( 'mapping/add', $permission_arr ) ) { ?>  -->
<div class="row">
  <div class="col-md-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
          <i class="icon-users font-green-sharp"></i>
          <span class="caption-subject font-green-sharp sbold">Assign The Channel To Investigations</span>
        </div>
      </div>
    </div>
    <div class="portlet light bordered">
      <div class="portlet-body">
        <div id="message_account"></div>
        <form novalidate="" action="mapping/addMapping" id="add_mapping_form" role="form" method="post" class="form-horizontal">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group selectDiv">
                <label class="col-md-4 control-label" for="msgChannel">Select Channel <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <select name="msgChannel[]" id="msgChannel" multiple class="form-control select2" tabindex="-1">
                   <!--  <?php 
                    if($channelLists){
                      foreach ($channelLists as $channelInfo) {
                        ?><option value="<?php echo $channelInfo->channelId; ?>"><?php echo $channelInfo->channelName; ?> (<?php echo $channelInfo->channelCode; ?>)</option><?php
                      }
                    }
                    ?> -->
                  </select>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group selectDiv">
                <label class="col-md-4 control-label" for="msgCategory">Select Investigations <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <select name="msgCategory[]" id="msgCategory" multiple class="form-control select2" tabindex="-1">
                    <!-- <?php 
                    if($categoryLists){
                      foreach ($categoryLists as $categoryInfo) {
                        ?><option value="<?php echo $categoryInfo->categoryId; ?>"><?php echo $categoryInfo->categoryNameEn; ?></option><?php
                      }
                    }
                    ?> -->
                  </select>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <div class="col-md-offset-4 col-md-10">
                  <button class="btn btn-info" id="addchannelsubmit" onClick="return addMapping();" type="submit">Add Mapping</button>
                  <button class="btn btn-danger" type="reset" value="">Clear</button>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<!-- <?php } ?> -->
<div class="row">
  <div class="col-xs-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
            <i class="icon-users font-green-sharp"></i>
            <span class="caption-subject font-green-sharp sbold">Mapping Lists</span>
        </div>
        <div class="actions">
            <div class="btn-group">
              <!-- <?php if( in_array( 'mapping/add', $permission_arr ) ) { ?>
              <?php if($this->session->userdata(SYS_SESSION_ID) == SUPER_ADMIN_ID) { ?> -->
              <a href="<?php echo base_url(); ?>mapping/add" data-toggle="tooltip" title="Add" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Add New">
                <i class="fa fa-plus"></i>
              </a>
              <!-- <?php } ?>
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
                  <table id="mapping_list" class="table table-striped table-bordered table-hover table-checkable dataTable data-tbl">
                    <thead>
                      <tr class="tbl_head_bg">
                        <th class="head1 no-sort">#</th>
                        <th class="head1 no-sort">Mapping ID</th>
                        <th class="head1 no-sort">Channel Name</th>
                        <th class="head1 no-sort">Investigation Name</th>
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
  var csrf_test_name = '<?php echo $this->security->get_csrf_token_name(); ?>';
  var csrf_hash  = '<?php echo $this->security->get_csrf_hash(); ?>';
  /*
  table = $('#mapping_list').DataTable({
      language: {
        processing: "<img src='${pageContext.request.contextPath}/resources/img/loading.gif'>",
      },
      "processing": true, //Feature control the processing indicator.
      "serverSide": true, //Feature control DataTables' server-side processing mode.
      "order": [], //Initial no order.
      'autoWidth': false,
      "ajax": {
          "data": function(d) {
            d.csrf_test_name = csrf_hash;
          },
          "url": "<?php echo site_url('/mapping/mappingTableResponse')?>",
          "type": "POST"
      },
      "dom": "fB lrt<'row' <'col-sm-5' i><'col-sm-7' p>>",
      "lengthMenu": [[10, 25, 50, 100, 1000, -1], [10, 25, 50, 100, 1000, "All"]],
      //Set column definition initialisation properties.
      "columnDefs": [{
          "targets": [0,5],
          "orderable": false, //set not orderable
      },
      {
          "targets": [0,5],
          "searchable": false, //set orderable
      } ],
      buttons: []
  });
  */
  var i = 0;
  $('#mapping_list tfoot th').each( function () {
  });

  // DataTable
  var table = $('#mapping_list').DataTable();

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
function addMapping() {
  var channelName = $( '#add_mapping_form #msgChannel' ).val();
  var msgCategory = $( '#add_mapping_form #msgCategory' ).val();
  if(channelName == '' || channelName == null){
    toastr.error('Channel Name Cannot be empty','Error');
    return false;
  }
  if(msgCategory == '' || msgCategory == null){
    toastr.error('Investigation Name Cannot be empty','Error');
    return false;
  }
  return true;  
}
</script>
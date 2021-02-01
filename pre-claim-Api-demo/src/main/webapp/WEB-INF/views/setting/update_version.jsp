<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$assetUrl  = $this->config->item( 'base_url' );
?>
<div class="row">
  <div class="col-md-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
            <i class="icon-users font-green-sharp"></i>
            <span class="caption-subject font-green-sharp sbold">Update System Version</span>
        </div>
        <div class="actions">
          <div class="btn-group">
            <a href="<?php echo base_url(); ?>setting" data-toggle="tooltip" title="Back" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Back">
              <i class="fa fa-reply"></i>
            </a>
          </div>
        </div>
      </div>
    </div>
    <div class="box box-primary">
      <!-- form start -->
      <div id="message_account"></div>
      <form novalidate="" id="update_version_form" role="form" method="post" class="form-horizontal">
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="version">Version <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" value="<?= $settingInfo->system_version; ?>" placeholder="Version" id="version" maxlength="50" class="form-control" name="version">
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <div class="col-md-offset-2 col-md-10">
            <button class="btn btn-info" id="updateversionsubmit" onClick="return updateVersion();" type="button">Update Version</button>
            <a href="<?php echo base_url(); ?>setting" class="btn btn-danger" type="reset" value="">Back</a>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
function updateVersion() {
  var version = $( '#update_version_form #version' ).val();
  if(version == ''){
    toastr.error('Channel Name Cannot be empty','Error');
    return false;
  }
  var csrf_test_name = '<?php echo $this->security->get_csrf_token_name(); ?>';
  var csrf_hash  = '<?php echo $this->security->get_csrf_hash(); ?>';
  if(version){
      var formdata = {csrf_test_name:csrf_hash,'version':version};
      $.ajax({
        type: "POST",
        url: adminurl + 'setting/updateVersion',
        data: formdata,
        beforeSend: function() { 
            $("#updateversionsubmit").html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
            $("#updateversionsubmit").prop('disabled', true);
        },
        success: function( data ) {
          if(data == 1){
            window.location.href = adminurl+'setting';
          }else{
            toastr.error( data,'Error' );
            $("#updateversionsubmit").html('Update Version');
            $("#updateversionsubmit").prop('disabled', false);
          }
        }
      });
  }   
}
</script>
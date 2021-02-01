<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$assetUrl  = $this->config->item( 'base_url' );
?>
<style type="text/css">
#userImage { display:none;}
</style>
<div class="row">
  <div class="col-md-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
            <i class="icon-user font-green-sharp"></i>
            <span class="caption-subject font-green-sharp sbold">Edit Setting</span>
        </div>
      </div>
    </div>
    <div class="box box-primary">
      <div id="message_account"></div>
      <div class="portlet light bordered">
        <div class="portlet-body">
            <h4>System Version</h4>
            <div class="margin-top-10 margin-bottom-10 clearfix">
                <table class="table table-bordered table-striped">
                    <tbody>
                    <tr>
                        <td>
                            <div id="pulsate-once-target" style="padding:5px;"><?= $settingInfo->system_version; ?></div>
                        </td>
                        <td>
                          <a href="<?php echo base_url(); ?>setting/update_version" class="btn green" id="pulsate-once">Edit</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
      <!-- /.box-header -->
    </div>
  </div>
</div>
<script type="text/javascript">
</script>
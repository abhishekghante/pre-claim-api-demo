<div class="row">
  <div class="col-md-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
          <i class="icon-users font-green-sharp"></i>
          <span class="caption-subject font-green-sharp sbold">Add Mapping</span>
        </div>
        <div class="actions">
          <div class="btn-group">
            <a href="${pageContext.request.contextPath}/mapping/mapping_list" data-toggle="tooltip" 
            	title="Back" class="btn green-haze btn-outline btn-xs pull-right" style="margin-right: 5px;" data-original-title="Back">
              <i class="fa fa-reply"></i>
            </a>
          </div>
        </div>
      </div>
    </div>
    <div class="box box-primary">
      <!-- form start -->
      <div id="message_account"></div>
      <form novalidate="" action="<?php echo base_url(); ?>mapping/addMapping" id="add_mapping_form" role="form" method="post" class="form-horizontal">
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group selectDiv">
                <label class="col-md-4 control-label" for="msgChannel">Select Channel <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <select name="msgChannel[]" id="msgChannel" multiple class="form-control select2" tabindex="-1">
                 <!--   <?php 
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
                 <!--    <?php 
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
          </div>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <div class="col-md-offset-2 col-md-10">
            <button class="btn btn-info" id="addchannelsubmit" onClick="return addMapping();" type="submit">Add Mapping</button>
            <button class="btn btn-danger" type="reset" value="">Clear</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
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
  /*var csrf_test_name = '<?php echo $this->security->get_csrf_token_name(); ?>';
  var csrf_hash  = '<?php echo $this->security->get_csrf_hash(); ?>';
  if(channelName){
      var formdata = {csrf_test_name:csrf_hash,'channelName':channelName};
      $.ajax({
        type: "POST",
        url: adminurl + 'channels/addChannel',
        data: formdata,
        beforeSend: function() { 
            $("#addchannelsubmit").html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
            $("#addchannelsubmit").prop('disabled', true);
        },
        success: function( data ) {
          if(data == 1){
            $("#addchannelsubmit").html('Add Channel');
            $("#addchannelsubmit").prop('disabled', false);
            toastr.success( 'Channel Added successfully.','Success' );
            $( '#add_mapping_form #channelName' ).val(''); 
          }else{
            toastr.error( data,'Error' );
            $("#addchannelsubmit").html('Add Channel');
            $("#addchannelsubmit").prop('disabled', false);
          }
        }
      });
  }*/   
}
</script>
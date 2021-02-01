<style type="text/css">
#imgAccount { display:none;}
</style>
<div class="row">
  <div class="col-md-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
            <i class="icon-user font-green-sharp"></i>
            <span class="caption-subject font-green-sharp sbold">Import App Users</span>
        </div>
        <div class="actions">
            <div class="btn-group">
              <a href="${pageContext.request.contextPath}/app_user/app_user" data-toggle="tooltip" title="Back" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Back">
                <i class="fa fa-reply"></i>
              </a>
            </div>
        </div>
      </div>
    </div>
    <div class="box box-primary">
      <!-- /.box-header -->
      <!-- form start -->
      <div id="message_account"></div>
      <div class="box-body">
        <div class="row">
          <div class="col-md-12">
            <form method = "post" action = "importData" id="import_user_form" class="form-horizontal" enctype="multipart/form-data">
              <div class="form-group">
                <label class="col-md-4 padding-left-0 col-xs-4 control-label">Import Data</label>
                <div class="col-md-6 padding-left-0 col-xs-6">
                  <input type="file" name="userfile" id="userfile" class="form-control" required>
                  <note>Kindly upload .xls/.xlsx file only</note>
                </div>
                <div class="col-md-2 padding-left-0 col-xs-2">
                  <input type="submit" value="Import" class="btn btn-info btn-sm" name="importfile" />
                </div>
                <div class="col-md-12 text-center">
                  <div><a style="display: inline-block;" href="../uploads/importAppUsers.xlsx">Click to download sample "Excel" file</a></div>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- <?php
defined('BASEPATH') OR exit('No direct script access allowed');
global $permission_arr;
?> -->
<div class="tab-pane active" id="tab_actions_pending">
    <!-- BEGIN: Actions -->
    <div class="mt-actions">
        <div class="mt-action">
            <div class="mt-action-body">
                <!-- <?php 
                if($pendingMsglist){
                    foreach ($pendingMsglist as $key => $pMsglist) {
                        $groupInfo   = $this->Groupmodel->groupInfo($pMsglist->msgGroup);
                        $groupName   = (($groupInfo)? $groupInfo->groupName : '');
                        $categoryInfo= $this->Categorymodel->categoryInfo($pMsglist->msgCategory);
                        $categoryNameEn = (($categoryInfo)? $categoryInfo->categoryNameEn : '');
                        $channelInfo = $this->Channelmodel->channelInfo($pMsglist->msgChannel);
                        $channelName   = (($channelInfo)? $channelInfo->channelName : '');
                    ?> -->
                    <div class="mt-action-row">
                        <div class="mt-action-info ">
                            <div class="mt-action-details ">
                                <span class="mt-action-author"><!-- <?= strlen($pMsglist->msgTitleEn) > 50 ? substr($pMsglist->msgTitleEn,0,50)."..." : $pMsglist->msgTitleEn; ?> --></span>
                                <p class="mt-action-desc"><!--Group Name: <?= $groupName; ?>, Category: <?= $categoryNameEn; ?>, Channel Name : <?= $channelName; ?>--></p>
                            </div>
                        </div>
                        <div class="mt-action-datetime ">
                            <span class="mt-action-date"><!-- <?= date('d M',strtotime($pMsglist->createdDate)); ?> --></span>
                            <span class="mt-action-dot bg-green"></span>
                            <span class="mt=action-time"><!--<?= date('h:i:s A',strtotime($pMsglist->createdDate)); ?>--></span>
                        </div>
                        <div class="mt-action-buttons ">
                            <div class="btn-group btn-group-circle">
                              <!--   <?php if( in_array( 'messages/status', $permission_arr ) ) { ?>  -->
                                <button type="button" onClick="return updateDashMessageStatus(<?=$pMsglist->msgId; ?>,1);" class="btn btn-outline green btn-sm">Appove</button>
                                <button type="button" onClick="return updateDashMessageStatus(<?=$pMsglist->msgId; ?>,2);" class="btn btn-outline red btn-sm">Reject</button>
                               <!--  <?php } ?> -->
                            </div>
                        </div>
                    </div>
                  <!--  <?php
                   }
                }else{ ?> --> 
                    <div class="mt-action-row">
                        <div class="mt-action-info ">
                            <div class="mt-action-details ">
                                <p class="mt-action-desc">No Message Found</p>
                            </div>
                        </div>
                    </div>
                <!-- <?php
                }
                ?> -->
            </div>
        </div>
    </div>
    <!-- END: Actions -->
</div>
<div class="tab-pane" id="tab_actions_completed">
    <!-- BEGIN:Completed-->
    <div class="mt-actions">
        <div class="mt-action">
            <div class="mt-action-body">
                <!-- <?php 
                if($activeMsglist){
                    foreach ($activeMsglist as $key => $aMsglist) {
                        $groupInfo   = $this->Groupmodel->groupInfo($aMsglist->msgGroup);
                        $categoryInfo= $this->Categorymodel->categoryInfo($aMsglist->msgCategory);
                        $channelInfo = $this->Channelmodel->channelInfo($aMsglist->msgChannel);
                    ?> -->
                    <div class="mt-action-row">
                        <div class="mt-action-info ">
                            <div class="mt-action-details ">
                                <span class="mt-action-author"><!-- <?= strlen($aMsglist->msgTitleEn) > 50 ? substr($aMsglist->msgTitleEn,0,50)."..." : $aMsglist->msgTitleEn; ?> --></span>
                                <p class="mt-action-desc"><!-- Group Name: <?= $groupInfo->groupName; ?>, Category: <?= $categoryInfo->categoryNameEn; ?>, Channel Name : <?= $channelInfo->channelName; ?> --></p>
                            </div>
                        </div>
                        <div class="mt-action-datetime">
                            <span class="mt-action-date"><!-- <?= date('d M',strtotime($aMsglist->createdDate)); ?> --></span>
                            <span class="mt-action-dot bg-green"></span>
                            <span class="mt=action-time"><!--<?= date('h:i:s A',strtotime($aMsglist->createdDate)); ?>--></span>
                        </div>
                    </div>
                   <!--  <?php
                    }
                }else{ ?> -->
                    <div class="mt-action-row">
                        <div class="mt-action-info ">
                            <div class="mt-action-details ">
                                <p class="mt-action-desc">No Message Found</p>
                            </div>
                        </div>
                    </div>
                <!-- <?php
                }
                ?> -->
            </div>
        </div>
        <!-- END: Completed -->
    </div>
</div>
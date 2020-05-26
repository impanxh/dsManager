<div class="withdraw-wrap color-white-bg fn-clear">
  <input type="hidden"   id="r" value=""/>
  
  <div class="tabs"> 
  
 	 <@security.authorize ifAnyGranted="ht_bs_8,ht_bs_7,ht_bs_6,ht_bs_5,ht_bs_4,ht_bs_2,ht_bs_3,ht_bs_1">
    <a href="${rc.contextPath}/SQ/sq_task" class="${_reportActive?if_exists}"> 
    报审流程 <span id="orderTaskCount"></span>
       <span id="t0" class="newflag"></span>
    </a>
    <#--
    <a href="${rc.contextPath}/SQ/task_list2" class="${_reportSpeActive?if_exists}">
    特批流程<span id="planOrders"></span>
       <span id="t1" class="newflag"></span>
    </a>-->
    </@security.authorize>
    
	<@security.authorize ifAnyGranted="ht_shj_1,ht_shj_2,ht_shj_3,ht_shj_4,ht_shj_5,ht_shj_6,ht_shj_7,ht_shj_8">
    <a href="${rc.contextPath}/SQ/dsheet_task"  class="${_designActive?if_exists}">
    设计单<span id="dsheetCount"></span>
       <span id="_dsheetCount" class="newflag">0</span>
    </a>
     </@security.authorize>

     <@security.authorize ifAnyGranted="ht_design_1,ht_design_2,ht_design_3,ht_design_4,ht_design_5,ht_design_6,ht_design_7,ht_design_8,ht_design_9,ht_design_10,ht_design_11">
    <a href="${rc.contextPath}/SQ/production_task" class="${_productionActive?if_exists}">
    制作单<span id="productionCount"></span>
       <span id="_productionCount" class="newflag">0</span>
    </a>
    </@security.authorize>
     <@security.authorize ifAnyGranted="ht_bigimg_6,ht_bigimg_5,ht_bigimg_4,ht_bigimg_3,ht_bigimg_2,ht_bigimg_1">
      <a href="${rc.contextPath}/SQ/bigimg_task" class="${_bigimgActive?if_exists}" >
    大样工作单<span id="productionCount"></span>
       <span id="_bigimgCount" class="newflag">0</span>
    </a>
    </@security.authorize>
    
     

    <@security.authorize ifAnyGranted="ht_problemk_1,ht_problemk_2,ht_problemk_3,ht_problemk_4,ht_problemk_5,ht_problemk_6,ht_problemk_40,ht_problemk_41,ht_problemk_42">
      <a href="${rc.contextPath}/qstsVerify/qstsM_task" class="${_qstsMedia?if_exists}"> 
    问题核实单<span id="problemmjCount"></span>
       <span id="_qstsMediaCount" class="newflag">0</span>
    </a>
    </@security.authorize>

    <@security.authorize ifAnyGranted="ht_problemx_5,ht_problemx_4,ht_problemx_3,ht_problemx_2,ht_problemx_1">
      <a href="${rc.contextPath}/reprint/task" class="${_reprintActive?if_exists}"> 
    丢失补印单<span id="reprintCount"></span>
       <span id="_reprintCount" class="newflag">0</span>
    </a>
    </@security.authorize>
     <@security.authorize ifAnyGranted="sk_confirm_1,sk_confirm_2,sk_confirm_3,sk_confirm_4,sk_confirm_5,sk_confirm_6,sk_confirm_7,sk_confirm_8,sk_confirm_9,sk_confirm_10,sk_confirm_11,sk_confirm_12,sk_confirm_13">
         <a href="${rc.contextPath}/SQ/psheet_task"  class="${_skQrActive?if_exists}">
             上刊确认单<span id="skQrCount"></span>
             <span id="_skQrCount" class="newflag">0</span>
         </a>
     </@security.authorize>
    <@security.authorize ifAnyGranted="sk_detail_1,sk_detail_2,sk_detail_3,sk_detail_4,sk_detail_5">
      <a href="${rc.contextPath}/xkmanagement/xkdetail_task" class="${_skDetailActive?if_exists}"> 
    下刊明细表<span id="skDetailCount"></span>
       <span id="_skDetailCount" class="newflag">0</span>
    </a>
    </@security.authorize>    
    <@security.authorize ifAnyGranted="sk_offworknote_1,sk_offworknote_2,sk_offworknote_3,sk_offworknote_4,sk_offworknote_5">
      <a href="${rc.contextPath}/xkmanagement/xksheet_task" class="${_skOffworknoteActive?if_exists}"> 
    下刊派工单<span id="skOffworknoteCount"></span>
       <span id="_skOffworknoteCount" class="newflag">0</span>
    </a>
    </@security.authorize> 
    <@security.authorize ifAnyGranted="xk_cancel_1,xk_cancel_2,xk_cancel_3,xk_cancel_4,xk_cancel_5,xk_cancel_6,xk_cancel_7">
      <a href="${rc.contextPath}/xkmanagement/tasksheetcancel" class="${_taskcancelActive?if_exists}"> 
    下刊终止单<span id="skCancelCount"></span>
       <span id="_skCancelCount" class="newflag">0</span>
 
    </a>
    </@security.authorize> 
   
    
    <!--详见task.js -->
   
  </div>
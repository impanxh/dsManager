   
   <script src="${rc.contextPath}/js/jquery.cookie.js"></script>
   
   <input type="hidden" name="UID" id="UID" value="<@security.authentication property="principal.username" />" />
   
   
<footer class="m-tabbar tabbar-fixed" style="background-color: white;">
    <a href="javascript:setTypeCookie('${rc.contextPath}/hyList','normal');" class="tabbar-item">
        <span class="tabbar-icon">
            <i class="icon-home-outline"></i>
        </span>
        <span class="tabbar-txt">首页</span>
    </a>
    <#if Session.SPRING_SECURITY_CONTEXT.authentication.principal.userDetail.utype?? &&
         Session.SPRING_SECURITY_CONTEXT.authentication.principal.userDetail.utype == "admin">
     <a href="javascript:setTypeCookie('/placeManage?_from=foot','normal');"   id="plist" class="tabbar-item">
        <span class="tabbar-icon">
            <i class="icon-type"></i>
        </span>
        <span class="tabbar-txt">单位管理</span>
    </a>
    </#if>

     <#if Session.SPRING_SECURITY_CONTEXT.authentication.principal.userDetail.r?? &&
         Session.SPRING_SECURITY_CONTEXT.authentication.principal.userDetail.r == "place">
     <a href="javascript:setTypeCookie('/placeManage?_from=foot','share');"   id="plist" class="tabbar-item">
        <span class="tabbar-icon">
            <i class="icon-shield-outline"></i>
        </span>
        <span class="tabbar-txt">  跨辖区单位</span>
    </a>
    </#if>


      <#if Session.SPRING_SECURITY_CONTEXT.authentication.principal.userDetail.utype?? &&
           Session.SPRING_SECURITY_CONTEXT.authentication.principal.userDetail.utype?index_of("-")!=-1 >
     <a href="/inspection/InspGrid?unit=<@security.authentication property='principal.userDetail.utype' />"
        id="rd" class="tabbar-item">
        <span class="tabbar-icon">
            <i class="icon-type"></i>
        </span>
        <span class="tabbar-txt">检查记录</span>
    </a>
      </#if>


     <a href="/updateMyInfo?u=<@security.authentication property='principal.username' />" class="tabbar-item">
        <span class="tabbar-icon">
            <i class="icon-ucenter-outline"></i>
        </span>
        <span class="tabbar-txt">个人中心</span>
    </a>
</footer>

<script type="text/javascript">
 function setTypeCookie(url,type){
  		$.cookie('_f2', type);
        window.location = url;

  }

</script>



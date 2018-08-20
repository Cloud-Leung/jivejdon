<%@ page session="false"  %>
<%@ taglib uri="struts-logic" prefix="logic" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="/WEB-INF/MultiPagesREST.tld" prefix="MultiPagesREST" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<bean:define id="threadList" name="threadListForm" property="list" />
<logic:empty name="threadListForm" property="oneModel">
  <% 
  response.sendError(404);  
  %>
</logic:empty>
<bean:define id="forum" name="threadListForm" property="oneModel"/>
<bean:define id="title" name="forum" property="name" />
<bean:define id="pagestart" name="threadListForm" property="start" />
<bean:define id="pagecount" name="threadListForm" property="count" />
<bean:define id="lastModifiedDate" name="forum" property="modifiedDate2"/>
<%

int pagestartInt = ((Integer)pageContext.getAttribute("pagestart")).intValue();
int pagecountInt = ((Integer)pageContext.getAttribute("pagecount")).intValue();
int currentPageNo = 1;
if (pagecountInt > 0) {
	currentPageNo = (pagestartInt / pagecountInt) + 1;
}
String titleStr = (String)pageContext.getAttribute("title");
if (currentPageNo > 1){
	titleStr = titleStr + "  - 第"+ currentPageNo + "页";
	int expire =5 * 24 * 60 *60;
	long modelLastModifiedDate = com.jdon.jivejdon.presentation.action.util.ForumUtil.getForumsLastModifiedDate(this.getServletContext()).getModifiedDate2();
	if (!com.jdon.jivejdon.util.ToolsUtil.checkHeaderCache(expire, modelLastModifiedDate, request, response)) {
		return ;
	}

}
pageContext.setAttribute("title", titleStr);
%>
<%@ include file="../common/IncludeTop.jsp" %>
<link rel="alternate" type="application/rss+xml" title="<bean:write name="title" /> " href="/rss" /> 
<script>
 if(top !== self) top.location = self.location;
  contextpath = "<%=request.getContextPath()%>";
 </script> 
<script language="javascript" src="<html:rewrite page="/forum/js/threadList.js"/>"></script> 

	 <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- 自动调整尺寸 -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-7573657117119544"
     data-ad-slot="9040920314"
     data-ad-format="auto"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
<!-- /////////////////////////////////////////Content -->
<div id="page-content" class="single-page container">
		<div class="row">
			<!-- /////////////////左边 -->
			<div id="main-content" class="col-md-12">
				<div class="box">	
			 <logic:empty name="forum" property="forumId">
					<ul class="nav nav-tabs">
  <li class="active"><a href="#">按时间排序</a></li>
  <li><a href="<%=request.getContextPath()%>/forum/maxPopThreads">按回复数排</a></li>
  <li><a href="<%=request.getContextPath()%>/query/threadViewQuery.shtml">更多查询</a></li> 
	               <div class="tres" style="float: right;">
     
          <MultiPagesREST:pager actionFormName="threadListForm" page="/threads" >
            <MultiPagesREST:prev name=" 上一页 " />
            <MultiPagesREST:index displayCount="3" />
            <MultiPagesREST:next  name=" 下一页 " />
          </MultiPagesREST:pager>
        </logic:empty>
        <logic:notEmpty name="forum" property="forumId">
			<div class="tres" style="float: right;">
          <MultiPagesREST:pager actionFormName="threadListForm" page="/forum" paramId="forum" paramName="forum" paramProperty="forumId">
            <MultiPagesREST:prev name=" 上一页 " />
            <MultiPagesREST:index displayCount="3" />
            <MultiPagesREST:next  name=" 下一页 " />
          </MultiPagesREST:pager>
        </logic:notEmpty>
         有<b>
        <bean:write name="threadListForm" property="allCount"/>
        </b>贴
        <div id="tooltip_content_go"  style="display:none">
          <div class="tooltip_content">
            <div class="title">前往下页:</div>
            <div class="form">
              <input type="text" style="width: 50px;" id="pageToGo">
              <input type="button" value=" Go " onClick="goToAnotherPage('<html:rewrite page="/forum.jsp" paramId="forum" paramName="forum" paramProperty="forumId"/>','<bean:write name="threadListForm" property="count" />');" > </div>
          </div>
        </div>
      </div>
	</ul>          
                   <%@ include file="threadListCore.jsp" %>
      
	    	         <div class="tres">
                    <logic:empty name="forum" property="forumId">
                      <MultiPagesREST:pager actionFormName="threadListForm" page="/threads" >
                        <MultiPagesREST:prev name=" 上一页 " />
                        <MultiPagesREST:index displayCount="3" />
                        <MultiPagesREST:next  name=" 下一页 " />
                      </MultiPagesREST:pager>
                    </logic:empty>
                    <logic:notEmpty name="forum" property="forumId">
                      <MultiPagesREST:pager actionFormName="threadListForm" page="/forum" paramId="forum" paramName="forum" paramProperty="forumId">
                        <MultiPagesREST:prev name=" 上一页 " />
                        <MultiPagesREST:index displayCount="3" />
                        <MultiPagesREST:next  name=" 下一页 " />
                      </MultiPagesREST:pager>
                    </logic:notEmpty>
                  </div>
				</div>
            </div>	
	</div>
</div>
	 <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- 自动调整尺寸 -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-7573657117119544"
     data-ad-slot="9040920314"
     data-ad-format="auto"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
<%@include file="../common/IncludeBottom.jsp"%>
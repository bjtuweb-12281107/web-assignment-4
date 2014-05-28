<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="beans.*"%>
<%@ page import="db.*"%>
<%@ page import="java.util.*"%>
<%
DBCtrol dbctrol = new DBCtrol();
Role role = dbctrol.getRoleById(1);
%>
<HTML>
	<HEAD>
		<TITLE><%=role.getSitename()%>--投票首页</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<link href="css.css" rel="stylesheet" type="text/css">
	</HEAD>

	<script language="JavaScript" type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}//-->
</script>

<BODY background="bg.jpg" topmargin="0" leftmargin="150" rightmargin="150" link="#000000" vlink="#000000" alink="#000000" oncopy="return false;" oncut="return false;" onselectstart="return false">
		<Script Language=javascript> 
   function Click(){ 
   alert('????(C)2005 westlife????'); 
   window.event.returnValue=false; 
   } 
   document.oncontextmenu=Click; 
   </Script>
   <br>
		<TABLE  width="250" border="0" align="center" cellpadding="2" cellspacing="0">
			<TR>
				<TD  height="75">
					<h1><%=role.getSitename() %></h1>
				</TD>
			</TR>
	<hr><a href="adminn.jsp" align="right"><strong>管理员</strong></a>
<%
int check= role.getChecks();
String taction = request.getParameter("action");
String action = (taction == null)?"no":taction;
String items = request.getParameter("items");
if (check==0 && action.equals("tou")){

if (session.getAttribute("times")==null){
if(items != null){
dbctrol.updataVcountById(items);
session.setAttribute("times","do");
out.print("<script>alert('投票成功,谢谢支持!');history.back();</script>");
}else{
out.print("<script>alert('您没有选择任何投票项目，请返回后重新输入!!');history.back();</script>");
}
}else{
out.print("<script>alert('您已经投过票,请不要重复投票!');history.back();</script>");
}
}
%>
			<form method="post" action="index.jsp?action=tou">
			<TR>
				<TD class="css">
					<%
List list = dbctrol.getVoteList();
if(list!= null){
for(int i=0;i<list.size();i++){
Vote vote = (Vote)list.get(i);
%>
					<input type="radio" name="items" value="<%=vote.getId()%>">
					<%=vote.getVname()%>
					<br>
					<%
}
}
%>
			</TR>
			<TR>
				
				<TD align="left">
					<br>
					<input type="submit" value="提交" class="button">
					&nbsp;&nbsp;&nbsp;
					<input type="button" value="查看" onClick="MM_openBrWindow('vote.jsp','dd','scrollbars=yes,width=500,height=230')" class="button">
					
				</TD>

				</form>
			</TR>

		</TABLE>
		<br><hr>
	</BODY>
</HTML>

<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="beans.*"%>
<%@ page import="db.*"%>
<%@ page import="biz.*"%>
<%@ page import="java.util.*"%>
<%
VoteBiz vb = new VoteBiz();
List list = vb.getVoteList();
%>
<HTML>
<HEAD>
<TITLE> main </TITLE>
<meta http-equiv="content-type" content="text/html; charset=gb2312">
<link href="css.css" rel="stylesheet" type="text/css">
<script language="javascript">

function openWindow(theURL,winName,features) { 
  window.open(theURL,winName,features);
}
</script>
</HEAD>
<BODY background="bg.jpg">
<TABLE width="50%" border="0" cellpadding="2" cellspacing="0" bordercolordark="#ffffff" bordercolorlight="#cccccc">
<tr>
<td class="css" align="center">
<TABLE width="487" border="0" cellpadding="2" cellspacing="0">
        <TR>
	<TD class="css" align="center" bgcolor="#f7f7f7" height="27">���</TD>
	<TD class="css" align="center" bgcolor="#f7f7f7" height="27">��Ŀ����</TD>
	<TD class="css" align="center" bgcolor="#f7f7f7" height="27">ͶƱ��</TD>
	<TD class="css" align="center" bgcolor="#f7f7f7" height="27">�޸�</TD>
	<TD class="css" align="center" bgcolor="#f7f7f7" height="27">ɾ��</TD>
</TR>
<%
if(list != null){
for(int i=0;i<list.size();i++){
Vote vote = (Vote)list.get(i);
%>
<tr>
	<td class="css" align="center"><%=vote.getId()%></td>
	<td class="css"><%=vote.getVname()%></td>
	<td class="css" align="center"><%=vote.getVcount()%></td>
	<td class="css" align="center"><a href="#" onClick="openWindow('editvote.jsp?id=<%=vote.getId()%>','dd','scrollbars=yes,width=500,height=150')">�޸�</a></td>
	<td class="css" align="center"><a href="main.jsp?action=delxx&idd=">ɾ��</a></td>
</tr>

<%
}
}
String action = request.getParameter("action");
if(action!= null&&action.equals("addvote")){
String name = request.getParameter("vname");
vb.insertVote(name);
out.print("<script>alert('������ݳɹ�!');window.close();</script>");
}
%>

<tr><form method="post" action="mainvote.jsp?action=addvote">
<td class="css" colspan="5">���ͶƱ��Ŀ��<input type="text" name="vname" class="inputt">&nbsp;<input type="submit" 

value="���" class="buttonn"></td>
</form>
</tr>
</TABLE>
</td></tr>
</table>

</BODY>
</HTML>
<%@ page contentType="text/html;charset=gb2312"%>
<%
if (session.getAttribute("admins")==null){
response.sendRedirect("adminn.jsp");
}
%>
<HTML>
<HEAD>
<TITLE> left </TITLE>
<meta http-equiv="content-type" content="text/html; charset=gb2312">
<link href="css.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY>
<center>
<TABLE width="100%" border="0" cellpadding="2" cellspacing="0" >
<TR>
	<TD class="css" bgcolor="#f7f7f7" height="27" align="center"><b>��̨����</b></TD>
</TR>
<TR>
	<TD class="css" align="center"><a href="main.jsp?action=vset" target="main">ϵͳ����</a></TD>
</TR>
<TR>
	<TD class="css" align="center"><a href="mainvote.jsp" target="main">ͶƱ����</a></TD>
</TR>

<TR>
	<TD class="css" align="center"><a href="adminn.jsp?action=logout" target="_parent">�˳�����</a></TD>
</TR>
</TABLE></center>
</BODY>
</HTML>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="beans.*"%>
<%@ page import="db.*"%>
<%@ page import="java.util.*"%>
<HTML>
	<HEAD>
		<TITLE>Manager</TITLE>
		<meta http-equiv="content-type" content="text/html; charset=gb2312">
		<link href="css.css" rel="stylesheet" type="text/css">
	</HEAD>
	<BODY background="bg.jpg">
		<%DBCtrol dbctrol = new DBCtrol();
			String action = request.getParameter("action");
			if ((action != null) && action.equals("login")) {
				String admins = request.getParameter("admins");
				String pass = request.getParameter("passs");
				boolean flag = dbctrol.checkRole(admins, pass);
				if (flag) {
					session.setAttribute("admins", "admin");
					response.sendRedirect("admin_index.jsp");
				} else {
					out.print("<script>alert('wrong name or password，please write again!')</script>");
                    session.setAttribute("admins", null);
				}
			}
		%>
		<br>
		
			<TABLE align="center" border="0" width="50%" cellpadding="2" cellspacing="0">
				<tr>
					<TD class="css" colspan="2" align="center" bgcolor="#f7f7f7">
						<b>manager</b>
					</TD>
				</tr>
				<tr>
					<td>
					<a href="index.jsp"><strong>back</strong></a>
					</td>
				</tr>
				<form method="post" action="adminn.jsp?action=login">
				<tr>					
					<TD class="css" align="center">
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspname:
					
						&nbsp&nbsp&nbsp<input type="text" name="admins" class="inputt" >
					</TD>
				</tr>
				<tr>
					<TD class="css" align="center">
						password:
					
						&nbsp&nbsp&nbsp<input type="password" name="passs" class="inputt">
					</TD>
				</tr>
				<tr>
					<br>
					<TD colspan="2" class="css" align="center">
						<br><input type="submit" value="login" class="buttonn">
						&nbsp;&nbsp;
						<input type="reset" value="reset" class="buttonn">
					</TD>
				</tr>
				</form>
			</TABLE>
		
	</BODY>
</HTML>

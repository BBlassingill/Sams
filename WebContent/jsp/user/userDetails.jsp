<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="uta.sams.beans.UserBean,uta.sams.controller.ProgramController,java.util.ArrayList"%>
<%@ page import = "java.lang.reflect.*" %>
<%--
   The taglib directive below imports the JSTL library. If you uncomment it,
   you must also add the JSTL library to the project. The Add Library... action
   on Libraries node in Projects view can be used to add the JSTL 1.1 library.
   --%>
<%--
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
   --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   
   <%UserBean ub = (UserBean)session.getAttribute("user"); %>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>User Details</title>
   </head>
   <body>
      <table valign="top" cellpadding="0"align="center" cellspacing="0" width='759'>
         <tr>
            <td>
               <jsp:include page="/jsp/commons/header.jsp"/>
            </td>
         </tr>
      </table>
   		<%if (ub != null)  {
   		
   		String username = ub.getUsername();
   		String role = ub.getRole();%>
   		
   		<!--  <table width="100%" border="0" cellspacing="5" name="formTable">
		  <caption align="top" class="style1">
		  <tr >
		     <td  width="50%" bgcolor="#FFFFFF" ><span class="style1">Welcome </span><span class="style2">.</span> </td>
		     <td  width="50%" bgcolor="#FFFFFF" align="right" class="style1"><a href="/Sams1/logoff">Sign Out </a></td>
		  </tr>
		  <tr>
		     <td height="1" bgcolor="#990000" colspan="2"></td>
		  </tr>
		  <tr>
		     <td class="style1" colspan="2">Welcome to OIE Program Management</td>
		  </tr>
		  <tr>
		     <td colspan="2">&nbsp;</td>
		  </tr>
		  <td class="formtable" colspan="2">Please use the left Navigation menu for Program Management</td>
		  </tr>
		  <tr>
		     <td colspan="2">&nbsp;</td>
		  </tr>
		  <tr>
		     <td colspan="2"><img src="login_images/map.jpg" width="460"></img></td>
		  </tr>
	</table>-->
	
		<table width="100%" border="0" cellspacing="5" name="formTable">
		<tr>
			
			<th height="1" bgcolor="#990000" colspan="2">Username</th>
			<th height="1" bgcolor="#990000" colspan="2">Role</th>
		</tr>
		<tr>
			<th colspan="2"><%=username %></th>
			<th colspan="2"><%=role %></th>
		</tr>
		</table>
   		
   		<%}
   		
   		else { %>
   		<table width="100%" border="0" cellspacing="5"  name="formTable">
	       <tr><td align="center"><img src="login_images/oops.jpg" ></img></td></tr>
	       <tr><td align="center" class="errorcode">Sorry user not found!</td></tr>
   		</table>
   		<%}%>
   		
   		
      <table align="center" cellpadding="0" cellspacing="0">
         <tr>
            <td>
               <jsp:include page="/jsp/commons/footer.jsp"/>
            </td>
         </tr>
      </table>
   </body>
</html>
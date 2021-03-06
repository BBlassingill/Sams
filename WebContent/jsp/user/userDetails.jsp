<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="uta.sams.beans.UserBean,uta.sams.controller.ProgramController,java.util.ArrayList"%>
<%@ page import = "java.lang.reflect.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   
   <%UserBean ub = (UserBean)session.getAttribute("user"); %>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>User Details</title>
      <style type="text/css">

		.formtable {
			font-family: Arial, Helvetica, sans-serif;
			font-size: 12px;
			color: #333333;
			font-weight: bold;
		}
		.width1 {
			font-family: Arial, Helvetica, sans-serif;
			font-size: 12px;
			font-weight: normal;
			width: 180px;
		}
		.errorcode {
			font-family: Arial, Helvetica, sans-serif;
			font-size: 16px;
			font-weight: bold;
			color: #FF0000;
		}
		.previousvalues {
			font-family: Arial, Helvetica, sans-serif;
			font-size: 12px;
			font-weight: bold;
			color: #009900;
		}
		.style1 {font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: #333333; font-weight: bold; }

	</style>
   </head>
   <body>
      <table valign="top" cellpadding="0"align="center" cellspacing="0" width='759'>
         <tr>
            <td>
               <jsp:include page="/jsp/commons/header.jsp"/>
            </td>
         </tr>
      </table>
      
      <table valign="top" align="center" width="759" cellspacing="0" cellpadding="0">
   <tr>
      <td style="border-right: 1px solid rgb(255, 255, 255);" bgcolor="#666666" height="92" valign="top" width="330">
         <script type="text/javascript" src="/jsp/commons/sams/fsmenu.js"></script>
         <jsp:include page="/jsp/commons/left.jsp"/>
      </td>
      <td style="padding-left:5px" height="425">
         <% if(ub!=null){
         	String username = ub.getUsername();
         	String role = ub.getRole();%>
         <table width="100%" border="0" cellspacing="5" name="formTable">
            <caption align="top" class="style1">
            <tr >
               <% String name=""; 
                  if(session.getAttribute("user")!=null)name=((UserBean)session.getAttribute("user")).getUsername(); 
                           %>
               <td  width="50%" bgcolor="#FFFFFF" ><span class="style1">Username: <%=username%></span></td>
               <td  width="50%" bgcolor="#FFFFFF" align="right" class="style1"><a href="/Sams1/logoff">Sign Out </a></td>
            </tr>
            <tr>
               <td height="1" bgcolor="#990000" colspan="2"></td>
            </tr>
            <tr>
               <td class="style1" colspan="2">Role: <%=role %></td>
            </tr>
            <tr>
               <td colspan="2">&nbsp;</td>
            </tr>
            <td class="formtable" colspan="2">Above are the results for your user search.</td>
            </tr>
            <tr>
               <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
               <td colspan="2"><img src="login_images/map.jpg" width="460"></img></td>
            </tr>
         </table>
         <%}else{%>
         <table width="100%" border="0" cellspacing="5"  name="formTable">
            <tr>
               <td align="center"><img src="login_images/oops.jpg" ></img></td>
            </tr>
            <tr>
               <td align="center" class="errorcode">The user details were not found!</td>
            </tr>
         </table>
         <%}%>
      </td>
   </tr>
</table>
   		
   		
      <table align="center" cellpadding="0" cellspacing="0">
         <tr>
            <td>
               <jsp:include page="/jsp/commons/footer.jsp"/>
            </td>
         </tr>
      </table>
   </body>
</html>
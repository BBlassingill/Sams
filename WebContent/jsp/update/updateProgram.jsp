<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="uta.sams.beans.*,uta.sams.controller.ProgramController,java.util.ArrayList"%>
<jsp:useBean id="programbean" scope="request" class="uta.sams.beans.ProgramBean" />
<jsp:setProperty name="programbean" property="*"/>


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
 
        <%
   ProgramController programcontroller=new ProgramController();
   String msg=programcontroller.updateProgram(programbean);
           
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Results</title>
		       <style type="text/css">
<!--
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
	font-size: 12px;
	font-weight: bold;
	color: #FF0000;
}
.previousvalues {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-weight: bold;
	color: #333333;
}
.style1 {font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: #333333; font-weight: bold; }
.normalstyle {font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: #333333; }
-->
</style>
    </head>
    
    <script>
        function yesFunction()
        {
        
        window.location.href = "../add/uploadImage_Form.jsp?prg=<%= programbean.getProgramName()%>&term=<%= programbean.getTerm()%>";
        
        
        }
        
        function noFunction()
        {
        
        window.location.href = "../../jsp/user/welcome.jsp";
        
        }
    </script>
    <body>
<table valign="top" cellpadding="0"align="center" cellspacing="0" width='759'>
    <tr><td>
          <jsp:include page="/jsp/commons/header.jsp"/>
    </td></tr>
</table>    
 <table valign="top" align="center" width="759" cellspacing="0" cellpadding="0"><tr>
<td style="border-right: 1px solid rgb(255, 255, 255);" bgcolor="#666666" height="92" valign="top" width="331">
 <script type="text/javascript" src="/jsp/commons/sams/fsmenu.js"></script>
              <jsp:include page="/jsp/commons/left.jsp"/>
            
 </td>
<td style="padding-left:5px">
   
    
    <%--
    This example uses JSTL, uncomment the taglib directive above.
    To test, display the page like this: index.jsp?sayHello=true&name=Murphy
    --%>
    <%--
    <c:if test="${param.sayHello}">
        <!-- Let's welcome the user ${param.name} -->
        Hello ${param.name}!
    </c:if>
    --%>
    
     <table width="100%" border="0" cellspacing="5" name="formTable">
    <caption align="top" class="style1">
       <tr >
            <% String name=""; 
			if(session.getAttribute("user")!=null)name=((UserBean)session.getAttribute("user")).getUsername(); 
            //name=request.getRemoteUser();
            %>
        <td  width="50%" bgcolor="#FFFFFF" ><span class="style1">Welcome <%=name%></span><span class="style2">.</span> </td>
        <td  width="50%" bgcolor="#FFFFFF" align="right" class="style1"><a href="/Sams/jsp/user/logoff.jsp">Sign Out </a></td>
      </tr>
	  <tr>
	     <td height="1" bgcolor="#990000" colspan="2"></td>
	  </tr>

    <tr><td align="center" colspan="2" class="style1">
      Update Program 
      </td></tr>
       <tr>
	     <td height="1" bgcolor="#990000" colspan="2"></td>
	  </tr>
    </caption>
    
<tr><td colspan=2 class="previousvalues"><b>Following Program <%=msg%></b></td></tr> 
       <%
             if(!programbean.getStatus().equals("deactive")){
      %>
      
      <tr>
	     <td colspan="2">&nbsp;</td>
	  </tr>
        <tr>
                 <td class="formtable" width="60%">Program Name:                 </td>
                 <td class="normalstyle"><%= programbean.getProgramName() %></td>
        </tr>

        <tr>
                 <td class="formtable" width="60%">   Program Type :              </td>
                 <td class="normalstyle"><%= programbean.getProgramType() %></td>
        </tr>
        
        <tr>
                 <td class="formtable" width="60%">Term of Study :                </td>
                 <td class="normalstyle"><%= programbean.getTerm() %></td>
        </tr>
        
        <tr>
                 <td class="formtable" width="60%"> Languages :                </td>
                 <td class="normalstyle"><% for(int i=0;i<programbean.getLanguages().length;i++){%><%= programbean.getLanguages()[i] %>&nbsp;&nbsp;<%}%></td>
        </tr>
        
        <tr>
                 <td class="formtable" width="60%">      Region :           </td>
                 <td class="normalstyle"><%= programbean.getRegion() %></td>
        </tr>
        <tr>
                 <td class="formtable" width="60%"> Country :                </td>
                 <td class="normalstyle"><%= programbean.getCountry() %></td>
        </tr>

        
        <tr>
                 <td class="formtable" width="60%"> Department :                </td>
                     <td class="normalstyle"><% for(int i=0;i<programbean.getSubjects().length;i++){%><%= programbean.getSubjects()[i] %> &nbsp;&nbsp; <%}%> 
                     </td>
        </tr>
        
        <tr>
                 <td class="formtable" width="60%">      Description :           </td>
                 <td class="normalstyle"><%= programbean.getDescription() %></td>
        </tr>
        
        <tr>
                 <td class="formtable" width="60%"> Fees :                </td>
                 <td class="normalstyle"><%= programbean.getFee() %></td>
        </tr>
        <tr>
                 <td class="formtable" width="60%"> Housing :                </td>
                 <td class="normalstyle"><%= programbean.getHousing() %></td>
        </tr>
        <tr>
                 <td class="formtable" width="60%"> Status :                </td>
                 <td class="normalstyle"><%= programbean.getStatus() %></td>
        </tr>
        <tr>
	     <td colspan="2">&nbsp;</td>
	  </tr>
          <tr>
	     <td height="1" bgcolor="#990000" colspan="2"></td>
	  </tr>

<tr>
        <td colspan="2" class="style1">
        <b>Do you want to Update Images?? </b>
        </td>
        </tr>
        <tr>
        <td align="center">
        <input type="button" value="Yes" onclick="yesFunction();">
</td>
<td align="left">
<input type="button" value="No" onclick="noFunction();">
</td>
        </tr>
      <%}%>
               
    </table>
    </td></tr>
</table>
    <table align="center" cellpadding="0" cellspacing="0"><tr><td>
    <jsp:include page="/jsp/commons/footer.jsp"/>
    </td></tr></table>

    
    </body>
</html>

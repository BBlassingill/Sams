<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Register User</title>
        
        <script type="text/javascript">
	        function countit() {
	            formcontent = document.getElementById('password').value;
	            if (formcontent.length < 6) {
	                alert("password cannot be less than six characters");
	                return false;
	            } else
	                return true;
	
	        }
    </script>
    
    </head>

    <body>
        <table valign="top" cellpadding="0" align="center" cellspacing="0" width='759'>
            <tr>
                <td>
                    <jsp:include page="/jsp/commons/header.jsp" />
                </td>
            </tr>
        </table>

		<table valign="top" align="center" width="759" height="425" cellspacing="0" cellpadding="0">
		
        <tr>
            <td style="border-right: 1px solid rgb(255, 255, 255);" bgcolor="#666666" height="92" valign="top" width="331">
                <script type="text/javascript" src="/jsp/commons/sams/fsmenu.js"></script>

            </td>
            <td style="padding-left:5px" valign="middle">

                <table width="350" height="128" border="1" cellpadding=0 cellspacing=0 bordercolor="#990000">
                    <tr>

                        <td height="21" colspan=2 bgcolor="#990000">&nbsp;</td>

                    </tr>
                    <tr bordercolor="#ffffff">
                        <td bgcolor="#FFFFFF"><img src="<%=request.getContextPath()%>/jsp/user/login_images/login_image.jpg" width="169" height="194"> </td>
                        <td>
                            <form name="register" action=# method="post" onsubmit="return(countit());">
                                <table width="200" border="0" cellpadding="5" cellspacing="0" bordercolor="#666666">
                                    <tr bordercolor="#ffffff">
                                    <tr><td><h3 class="heading" style="width:92px; height:4vh; position:relative; right:-9vh;">Register a new user</h3></td></tr>
                                        <td class="heading" align="right">Username</td>
                                        <td width="10"><b>:</b></td>
                                        <td width="124" bgcolor="#FFFFFF">
                                            <input type="text" name="username" size="15">
                                        </td>
                                    </tr>
                                    <tr bordercolor="#ffffff">
                                        <td class="heading" align="right">Password</td>
                                        <td width="10"><b>:</b></td>
                                        <td>
                                            <input type="password" id="password" name="password" size="15">
                                        </td>
                                    </tr>
                                    <tr bordercolor="#ffffff">
                                        <td colspan="3" align="center">
                                            <input type="submit" class="buttonclass" name="login" value="Register"> 
                                        </td>

                                    </tr>
                                </table>
                            </form>
                        </td>
                    </tr>
                </table>

            </td>
        </tr>
    </table>
		
        <table align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <jsp:include page="/jsp/commons/footer.jsp" />
                </td>
            </tr>
        </table>

    </body>

    </html>
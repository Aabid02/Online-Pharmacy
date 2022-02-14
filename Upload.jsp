<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Prescription</title>
<link rel="stylesheet" href="css/Index.css">
</head>
<body>
<div class="main">
	<div class="topbar1"></div>
	<div class="topbar2">
		<div class="container1">
			<div class="logout-btn">
				<a href="Logout.jsp">Logout</a>
			</div>
		</div>
	</div>
	<div class="header">
		<div class="container2">
			<div class="navbar">
				<a href="Homepage.jsp">Back</a>
				
			</div>
		</div>
	</div>
</div>
    <center>
        <h1>Please fill the below deatails...</h1>
        <h2>To get approval!!</h2>
        <form method="post" action="FileUploadDBServlet" enctype="multipart/form-data">
            <table border="0">
                <tr>
                    <td>First Name: </td>
                    <td><input type="text" name="firstName" size="50"/></td>
                </tr>
                <tr>
                    <td>Last Name: </td>
                    <td><input type="text" name="lastName" size="50"/></td>
                </tr>
                <tr>
                    <td>Prescription Letter: </td>
                    <td><input type="file" name="photo" size="50"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Save">
                    </td>
                </tr>
            </table>
        </form>
    </center>
    <div class="active">
	<%@ page import="java.sql.*" %>
	<%@ page import="javax.sql.*" %>
	
	<%
	HttpSession httpSession = request.getSession();
    String guid=(String)httpSession.getAttribute("currentuser");
    %>
    
    <div class="filler"></div>
    <h2>Welcome <%=guid%></h2>
    
    <%
	ResultSet rs=null;
	PreparedStatement ps=null;
	java.sql.Connection conn=null;
	String query="select fname,uid,address,phno,email from customer where uid=?";
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase","root","Manish1995@");
		ps=conn.prepareStatement(query);
		ps.setString(1,guid);
		rs=ps.executeQuery();
		if(rs.next())
		{
			
		%>
		<div class="filler2"></div>
			<div class="card">
  				<img src="images/User.png" class="Avatar" width=234 height=234>
  				<div class="container">
    			 <div class="space1"><b><%=rs.getString("fname") %></b></div>
    			 <div class="filler3"></div>
   					<div class="space"><b>ID: </b><%=rs.getString("uid") %></div>
   					<div class="space"><b>Address: </b><%=rs.getString("address") %></div>
   					<div class="space"><b>Phone: </b><%=rs.getString("phno") %></div>
   					<div class="space"><b>Email: </b><%=rs.getString("email") %></div>
  				</div>
			</div>
		<%
		
		}
	}
	catch(Exception e)
	{
		out.println("error: "+e);
	}
	finally {
	    try { if (rs != null) rs.close(); } catch (Exception e) {};
	    try { if (ps != null) ps.close(); } catch (Exception e) {};
	    try { if (conn != null) conn.close(); } catch (Exception e) {};
	}
	%>
	
</div>

    
</body>
</html>
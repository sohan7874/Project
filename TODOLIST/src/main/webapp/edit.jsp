<%@page import="org.hibernate.Transaction"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.*,org.hibernate.*,com.entities.*"%>
<%@page import="jdk.nashorn.internal.runtime.regexp.JoniRegExp.Factory"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="all_css_js.jsp"%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EDIT</title>
</head>
<body>
	<div class="container-fluid p-o m-0 ">
		<%@include file="navbar.jsp"%>


		<h1 class="text-uppercase">EDIT PAGE</h1>

		<%
			int noteid = Integer.parseInt(request.getParameter("note_id").trim());

			Session s = FactoryProvider.getfactory().openSession();
			Transaction tr = s.beginTransaction();
			
			Note note = s.get(Note.class,noteid);
			
			
		%>



		<form action="UpdateServvlet" method="post">

			<input
				value="<%=note.getId()%>" name ="noteID" type="hidden"/>
		
  <div class="mb-3">
    <label for="title" class="form-label">Note Title</label>
    <input type="text" 
     class="form-control"
      id="title"
      name = "title" 
      required
      value="<%=note.getTitle() %>"
				placeholder="Enter  Here" aria-describedby="emailHelp">
	</div>
	<div class="form-group">
		<label id="content">Note Content</label>
		<textarea id="content" class="form-control" required name="content"
			style="" placeholder="Enter Your Content Here">
       <%=note.getContent() %></textarea>
	</div>

	<div class="container text-center">
		<button type="submit" class="btn btn-success">SAVE YOUR NOTE</button>

	</div>
	</form>
</body>
</html>
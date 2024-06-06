<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="jdk.nashorn.internal.runtime.regexp.JoniRegExp.Factory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%@include file="all_css_js.jsp"%>

<title>All Notes:Note Tacker</title>
</head>
<body>
	<div class="container-fluid p-o m-0 ">
		<%@include file="navbar.jsp"%>

		<h1 class="text-uppercase">>ALL NOTES</h1>




		<div class="row">

			<div class=col-12>





				<%
					Session s = FactoryProvider.getfactory().openSession();
					Query q = s.createQuery("from Note");
					List<Note> list = q.list();

					for (Note note : list) {
				%>

				<div class="card m-3">
					<img src="IMG/open-book.png " style="width: 100px"
						class="card-img-top m-4 mx-auto" alt="...">
					<div class="card-body">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text"><%=note.getContent()%></p>
						<p class ="text-danger"> <%=note.getAddedDate() %></p>
						<div class="container text-center">

							<a href="deleteservlet?note_id=<%=note.getId()%>"
								class="btn btn-danger">DELETE</a> <a
								href="edit.jsp?note_id=<%=note.getId()%>"
								class="btn btn-primary">UPDATE</a>

						</div>
					</div>
				</div>

				<%
					}

					s.close();
				%>





			</div>


		</div>
</body>

</html>
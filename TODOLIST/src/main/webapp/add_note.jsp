<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<%@include file="all_css_js.jsp"%>

<title>ADD NOTE</title>
</head>
<body>

	<div class="container-fluid p-o m-0 ">
		<%@include file="navbar.jsp"%>
		
		<h1>Please Fill Your Note Details</h1>
		
		<BR>
		<!-- forms  -->
		
		<form action="SaveNoteServvlet" method="post">
  <div class="mb-3">
    <label for="title" class="form-label">Note Title</label>
    <input type="text" 
     class="form-control"
      id="title"
      name = "title" 
      required
      placeholder="Enter  Here"
      aria-describedby="emailHelp">
  </div>
  <div class="form-group">
    <label id ="content" >Note Content</label>
    <textarea  id="content"
    class="form-control"
    required
    name = "content"
    style="hight = 300px"
     placeholder="Enter Your Content Here"></textarea>
  </div>
  
 <div class="container text-center">
    <button type="submit" class="btn btn-primary">ADD</button>
 
 </div>
</form>
	</div>
	
		
	
</body>
</html>
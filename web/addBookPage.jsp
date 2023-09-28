<%@ page import="java.util.ArrayList" %>
<%@ page import="book_store.db.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Books</title>
  <link rel="stylesheet" type="text/css" href="/css/bootstrap.css">
</head>
<body>

<%@include file="common/navbar.jsp" %>

  <div class="container mt-5">
    <div class="row">
      <div class="col-6 mx-auto">
        <%@include file="common/addForm.jsp"%>
      </div>
    </div>
  </div>
</body>
</html>

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
        <form action="/add-news" method="post">
          <div class="row">
            <div class="col-12">
              <label>Title</label>
            </div>
          </div>
          <div class="row mt-2">
            <div class="col-12">
              <input type="text" class="form-control" name="title" required placeholder="Insert Title">
            </div>
          </div>

          <div class="row mt-3">
            <div class="col-12">
              <label>Content</label>
            </div>
          </div>
          <div class="row mt-2">
            <div class="col-12">
              <textarea class="form-control" name="content" placeholder="Insert Content" required rows="10">

              </textarea>
            </div>
          </div>

          <div class="row mt-3">
            <div class="col-12">
              <button class="btn btn-success">Add News</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</body>
</html>

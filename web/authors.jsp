<%@ page import="java.util.ArrayList" %>
<%@ page import="book_store.db.Author" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Authors</title>
    <%@include file="common/head.jsp"%>
</head>
<body>
  <%@include file="common/navbar.jsp"%>
  <div class="container mt-3">

    <div class="row mt-3">
      <div class="col-12">
        <%
          if(currentUser!=null){
        %>
          <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#addAuthor">
            + Add Author
          </button>

          <div class="modal fade" id="addAuthor" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Add Author</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form action="/add-author" method="post">

                  <div class="row mt-3">
                    <div class="col-12">
                      <label>First Name:</label>
                    </div>
                  </div>
                  <div class="row mt-2">
                    <div class="col-12">
                      <input type="text" class="form-control" name="author_first_name">
                    </div>
                  </div>

                  <div class="row mt-3">
                    <div class="col-12">
                      <label>Last Name:</label>
                    </div>
                  </div>
                  <div class="row mt-2">
                    <div class="col-12">
                      <input type="text" class="form-control" name="author_last_name">
                    </div>
                  </div>

                  <div class="row mt-3">
                    <div class="col-12">
                      <label>Instagram:</label>
                    </div>
                  </div>
                  <div class="row mt-2">
                    <div class="col-12">
                      <input type="text" class="form-control" name="author_instagram">
                    </div>
                  </div>

                  <div class="row mt-3">
                    <div class="col-12">
                      <button class="btn btn-success">Add Author</button>
                    </div>
                  </div>

                </form>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

              </div>
            </div>
          </div>
        </div>
        <%
          }
        %>
      </div>
    </div>

    <div class="row">
      <table class="table table-striped table-hover">
        <thead>
            <tr>
              <th>ID</th>
              <th>FIRST NAME</th>
              <th>LAST NAME</th>
              <th>INSTAGRAM</th>
              <th style="width: 10%">Details</th>
            </tr>
        </thead>
        <tbody>
          <%
            ArrayList<Author> authors = (ArrayList<Author>) request.getAttribute("authors");
            if(authors!=null){
              for(Author author: authors){
          %>
            <tr>
              <td><%=author.getId()%></td>
              <td><%=author.getFirst_name()%></td>
              <td><%=author.getLast_name()%></td>
              <td><%=author.getInstagram()%></td>
              <td><a class="btn btn-success btn-sm" href="/author-details?author_id=<%=author.getId()%>">Details</a></td>
            </tr>
          <%
              }
            }
          %>
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>

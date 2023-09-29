<%@ page import="java.util.ArrayList" %>
<%@ page import="book_store.db.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Books</title>
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
          <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#addBook">
            + Add Book
          </button>

          <div class="modal fade" id="addBook" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
              <div class="modal-content">
                <div class="modal-header">
                  <h1 class="modal-title fs-5" id="exampleModalLabel">Add Book</h1>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <%@include file="common/addForm.jsp"%>
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
              <th>NAME</th>
              <th>AUTHOR</th>
              <th>GENRE</th>
              <th>PRICE</th>
              <th style="width: 10%">Details</th>
            </tr>
        </thead>
        <tbody>
          <%
            ArrayList<Book> books = (ArrayList<Book>) request.getAttribute("books");
            if(books!=null){
              for(Book book: books){
          %>
            <tr>
              <td><%=book.getId()%></td>
              <td><%=book.getName()%></td>
              <td><%=book.getAuthor().getLast_name() + " "+ book.getAuthor().getFirst_name()%></td>
              <td><%=book.getGenre()%></td>
              <td><%=book.getPrice()%> KZT</td>
              <td><a class="btn btn-success btn-sm" href="/details?book_id=<%=book.getId()%>">Details</a></td>
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

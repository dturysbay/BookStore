<%@ page import="java.util.ArrayList" %>
<%@ page import="book_store.db.Book" %>
<%@ page import="book_store.db.Author" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Books</title>
  <%@include file="common/head.jsp"%>
</head>
<body>

<%@include file="common/navbar.jsp" %>

    <div class="container mt-5">
      <%%>
      <%
        Book book = (Book)request.getAttribute("book");
        if(book!=null){
      %>
      <div class="row">
        <div class="col-6 mx-auto">
            <div class="row mt-3">
              <div class="col-12">
                <label>Name:</label>
              </div>
            </div>
            <div class="row mt-2">
              <div class="col-12">
                <input type="text" class="form-control" name="book_name" readonly value="<%=book.getName()%>">
              </div>
            </div>

            <div class="row mt-3">
              <div class="col-12">
                <label>Author:</label>
              </div>
            </div>
            <div class="row mt-2">
              <div class="col-12">
                <input type="text" class="form-control" name="book_author" readonly value="<%=book.getAuthor().getFirst_name() + " " + book.getAuthor().getLast_name()%>">
              </div>
            </div>

            <div class="row mt-3">
              <div class="col-12">
                <label>Genre:</label>
              </div>
            </div>
            <div class="row mt-2">
              <div class="col-12">
                <input type="text" class="form-control" name="book_genre" readonly value="<%=book.getGenre()%>">
              </div>
            </div>

            <div class="row mt-3">
              <div class="col-12">
                <label>Price:</label>
              </div>
            </div>
            <div class="row mt-2">
              <div class="col-12">
                <input type="text" class="form-control" name="book_price" readonly value="<%=book.getPrice()%> KZT">
              </div>
            </div>

          <div class="row mt-3">
            <div class="col-12">
              <label>Description:</label>
            </div>
          </div>
          <div class="row mt-2">
            <div class="col-12">
              <textarea class="form-control" readonly rows="10"><%=book.getDescription()%></textarea>
            </div>
          </div>

            <div class="row mt-3">
              <div class="col-12">
                  <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editBook">
                      Edit Book
                  </button>

                  <button type="button" class="btn btn-danger btn-sm ms-2" data-bs-toggle="modal" data-bs-target="#deleteBook">
                      Delete Book
                  </button>
              </div>
            </div>

            <!--Delete Book Modal -->
            <div class="modal fade" id="deleteBook" tabindex="-1" aria-labelledby="deleteBookModal" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="/delete-book" method="post">
                            <input type="hidden" name="book_id" value="<%=book.getId()%>">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="deleteBookModal">Confirm delete</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <h5 class="text-center">Are you sure?</h5>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                                <button class="btn btn-danger">Yes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!--Edit Book Modal -->
            <div class="modal fade" id="editBook" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Edit Book</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="/save-book" method="post">
                                <input type="hidden" name="book_id" value="<%=book.getId()%>">
                                <div class="row mt-3">
                                    <div class="col-12">
                                        <label>Name:</label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <input type="text"
                                               class="form-control"
                                               name="book_name"
                                               value="<%=book.getName()%>">
                                    </div>
                                </div>

                                <div class="row mt-3">
                                    <div class="col-12">
                                        <label>Author:</label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <select class="form-select" name="book_author">
                                            <%
                                                ArrayList<Author> authors = (ArrayList<Author>) request.getAttribute("authors");
                                                if(authors!=null){
                                                    for(Author author:authors){
                                            %>
                                            <option <%=(author.getId() == book.getAuthor().getId()?"selected":"")%> value="<%=author.getId()%>">
                                                <%=author.getFirst_name()+" "+author.getLast_name()%>
                                            </option>
                                            <%
                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>

                                <div class="row mt-3">
                                    <div class="col-12">
                                        <label>Genre:</label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <select name="book_genre" class="form-select">
                                            <option <%=(book.getGenre().equals("Fantasy")?"selected":"")%>>Fantasy</option>
                                            <option <%=(book.getGenre().equals("Roman")?"selected":"")%>>Roman</option>
                                            <option <%=(book.getGenre().equals("Biography")?"selected":"")%>>Biography</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="row mt-3">
                                    <div class="col-12">
                                        <label>Price:</label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <select name="book_price" class="form-select">
                                            <%
                                                for(int i=0;i<=100000;i+=1000){
                                            %>
                                            <option <%=(i == book.getPrice()?"selected":"")%>><%=i%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>

                                <div class="row mt-3">
                                    <div class="col-12">
                                        <label>Description:</label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <textarea name="book_description" rows="5" class="form-control">
                                            <%=book.getDescription()%>
                                        </textarea>
                                    </div>
                                </div>

                                <div class="row mt-3">
                                    <div class="col-12">
                                        <button class="btn btn-primary">Save Book</button>
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

        </div>
      </div>
      <%
        }else{
      %>
        <h3 class="text-center">Book not found</h3>
      <%
        }
      %>
    </div>
</body>
</html>

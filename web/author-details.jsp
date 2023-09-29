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
        Author author = (Author) request.getAttribute("author");
        if(author!=null){
    %>
    <div class="row">
        <div class="col-6 mx-auto">
            <div class="row mt-3">
                <div class="col-12">
                    <label>First Name:</label>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-12">
                    <input type="text" class="form-control" name="author_first_name" readonly value="<%=author.getFirst_name()%>">
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-12">
                    <label>Last Name:</label>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-12">
                    <input type="text" class="form-control" name="author_first_name" readonly value="<%=author.getLast_name()%>">
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-12">
                    <label>Instagram:</label>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-12">
                    <input type="text" class="form-control" name="author_first_name" readonly value="<%=author.getInstagram()%>">
                </div>
            </div>



            <div class="row mt-3">
                <div class="col-12">
                    <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editAuthor">
                        Edit Author
                    </button>

                    <button type="button" class="btn btn-danger btn-sm ms-2" data-bs-toggle="modal" data-bs-target="#deleteAuthor">
                        Delete Author
                    </button>
                </div>
            </div>

            <!--Delete Book Modal -->
            <div class="modal fade" id="deleteAuthor" tabindex="-1" aria-labelledby="deleteBookModal" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="/delete-author" method="post">
                            <input type="hidden" name="author_id" value="<%=author.getId()%>">
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
            <div class="modal fade" id="editAuthor" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Edit Author</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="/update-author" method="post">
                                <input type="hidden" name="author_id" value="<%=author.getId()%>">
                                <div class="row mt-3">
                                    <div class="col-12">
                                        <label>First Name:</label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <input type="text"
                                               class="form-control"
                                               name="author_first_name"
                                               value="<%=author.getFirst_name()%>">
                                    </div>
                                </div>

                                <div class="row mt-3">
                                    <div class="col-12">
                                        <label>Last Name:</label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <input type="text"
                                               class="form-control"
                                               name="author_last_name"
                                               value="<%=author.getLast_name()%>">
                                    </div>
                                </div>

                                <div class="row mt-3">
                                    <div class="col-12">
                                        <label>Instagram:</label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <input type="text"
                                               class="form-control"
                                               name="instagram"
                                               value="<%=author.getInstagram()%>">
                                    </div>
                                </div>

                                <div class="row mt-3">
                                    <div class="col-12">
                                        <button class="btn btn-primary">Save Author</button>
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

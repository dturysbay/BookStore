<%@ page import="java.util.ArrayList" %>
<%@ page import="book_store.db.Book" %>
<%@ page import="book_store.db.News" %>
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
          ArrayList<News> news = (ArrayList<News>) request.getAttribute("news");
          if(news!=null){
            for(News n: news){
        %>
        <div class="p-5 mb-3" style="background-color: #DEE1DF">
          <a href="/news-details?id=<%=n.getId()%>">
            <h3><%=n.getTitle()%></h3>
          </a>
          <p><%=n.getContent()%></p>
          <p>
            Posted by: <strong><%=n.getUser().getFullName()%></strong>
            At <strong><%=n.getPostDate()%></strong>
          </p>
          <%
            if(currentUser!=null && currentUser.getId()==n.getUser().getId()){
          %>

              <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editNewsModal">
                Edit
              </button>

              <div class="modal fade" id="editNewsModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                    <form action="/edit-news" method="post">

                      <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Edit News </h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
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
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                      </div>

                    </form>
                  </div>
                </div>
              </div>
          <%
            }
          %>
        </div>
        <%
           }
          }
        %>
      </div>
    </div>
  </div>
</body>
</html>

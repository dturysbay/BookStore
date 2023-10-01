<%@ page import="java.util.ArrayList" %>
<%@ page import="book_store.db.Book" %>
<%@ page import="book_store.db.News" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>News Details</title>
    <%@include file="common/head.jsp"%>
</head>
<body>

  <%@include file="common/navbar.jsp"%>
  <div class="container mt-3">
    <div class="row mt-3">
      <div class="col-12">
        <%
          News news = (News)request.getAttribute("news");

          if(news!=null){
        %>
        <div class="p-5 mb-3" style="background-color: #DEE1DF">
            <h3><%=news.getTitle()%></h3>
          <p><%=news.getContent()%></p>
          <p>
            Posted by: <strong><%=news.getUser().getFullName()%></strong>
            At <strong><%=news.getPostDate()%></strong>
          </p>
        </div>
        <%
          }else{
        %>
        <div>no new</div>
        <%
          }
        %>
      </div>
    </div>
  </div>
</body>
</html>

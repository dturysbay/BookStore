<%@ page import="book_store.db.Author" %>
<form action="/add-book" method="post">

    <div class="row mt-3">
        <div class="col-12">
            <label>Name:</label>
        </div>
    </div>
    <div class="row mt-2">
        <div class="col-12">
            <input type="text" class="form-control" name="book_name">
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
                    <option value="<%=author.getId()%>">
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
                <option>Fantasy</option>
                <option>Roman</option>
                <option>Biography</option>
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
                <option><%=i%></option>
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
            <textarea name="book_description" rows="5" class="form-control"></textarea>
        </div>
    </div>

    <div class="row mt-3">
        <div class="col-12">
            <button class="btn btn-success">Add Book</button>
        </div>
    </div>

</form>
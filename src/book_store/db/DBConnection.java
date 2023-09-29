package book_store.db;

import java.sql.*;
import java.util.ArrayList;

public class DBConnection {

    private static Connection connection;

    static {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:8889/book_store_db","root","root");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static ArrayList<Book> getBooks(){
        ArrayList<Book> books = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT bo.id, bo.name, bo.genre, bo.description, bo.price, bo.author_id, " +
                    "au.first_name, au.last_name, au.instagram " +
                    "FROM books AS bo " +
                    "INNER JOIN authors au ON bo.author_id = au.id " +
                    "ORDER BY bo.price DESC");

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                Book book = new Book();

                book.setId(resultSet.getInt("id"));
                book.setName(resultSet.getString("name"));
                book.setGenre(resultSet.getString("genre"));
                book.setPrice(resultSet.getDouble("price"));
                book.setDescription(resultSet.getString("description"));

                Author author = new Author();
                author.setId(resultSet.getInt("author_id"));
                author.setFirst_name(resultSet.getString("first_name"));
                author.setLast_name(resultSet.getString("last_name"));
                author.setInstagram(resultSet.getString("instagram"));
                book.setAuthor(author);

                books.add(book);
            }

            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }

        return books;
    }

    public static void addBook(Book book){
        try{
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO books (name,author_id,genre,price,description) " +
                            "VALUES (?,?,?,?,?)"
            );

            statement.setString(1,book.getName());
            statement.setInt(2,book.getAuthor().getId());
            statement.setString(3,book.getGenre());
            statement.setDouble(4,book.getPrice());
            statement.setString(5,book.getDescription());

            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static Book getBook(int id){
        Book book = null;
        try{
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT bo.id, bo.name, bo.genre, bo.description, bo.price, bo.author_id, " +
                            "au.first_name, au.last_name, au.instagram " +
                            "FROM books AS bo " +
                            "INNER JOIN authors au ON bo.author_id = au.id " +
                            "WHERE bo.id = ?"
            );
            statement.setInt(1,id);

            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                book = new Book();
                book.setId(resultSet.getInt("id"));
                book.setName(resultSet.getString("name"));
                book.setGenre(resultSet.getString("genre"));
                book.setPrice(resultSet.getDouble("price"));
                book.setDescription(resultSet.getString("description"));

                Author author = new Author();
                author.setId(resultSet.getInt("author_id"));
                author.setFirst_name(resultSet.getString("first_name"));
                author.setLast_name(resultSet.getString("last_name"));
                author.setInstagram(resultSet.getString("instagram"));
                book.setAuthor(author);
            }

            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return book;
    }

    public static void updateBook(Book book){
        try{
            PreparedStatement statement = connection.prepareStatement(
                    "UPDATE books " +
                            "SET name = ?, " +
                            "author_id = ?," +
                            "genre = ?," +
                            "price = ?," +
                            "description = ?" +
                            "WHERE id = ?"
            );

            statement.setString(1,book.getName());
            statement.setInt(2,book.getAuthor().getId());
            statement.setString(3,book.getGenre());
            statement.setDouble(4,book.getPrice());
            statement.setString(5,book.getDescription());
            statement.setInt(6,book.getId());
            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void deleteBook(int id){
        ArrayList<Author> authors = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "DELETE FROM books WHERE id = ?"
            );
            statement.setInt(1,id);
            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static ArrayList<Author> getAuthors(){
        ArrayList<Author> authors = new ArrayList<>();
        try{
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM authors ORDER BY first_name ASC"
            );

            ResultSet resultSet = statement.executeQuery();
            while(resultSet.next()){
                Author author = new Author();
                author.setId(resultSet.getInt("id"));
                author.setFirst_name(resultSet.getString("first_name"));
                author.setLast_name(resultSet.getString("last_name"));
                author.setInstagram(resultSet.getString("instagram"));

                authors.add(author);
            }
            statement.close();
        }catch (Exception e){

        }

        return authors;
    }

    public static Author getAuthor(int id){
        Author author = null;
        try{
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM authors WHERE id = ?");
            statement.setInt(1,id);

            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                author = new Author();
                author.setLast_name(resultSet.getString("last_name"));
                author.setFirst_name(resultSet.getString("first_name"));
                author.setInstagram(resultSet.getString("instagram"));
                author.setId(resultSet.getInt("id"));
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }

        return author;
    }

    public static void addAuthor(Author author){
        try{
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO authors (first_name,last_name,instagram) " +
                        "VALUES (?,?,?)");

            statement.setString(1,author.getFirst_name());
            statement.setString(2,author.getLast_name());
            statement.setString(3,author.getInstagram());
            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void deleteAuthor(int id){
        try {
            PreparedStatement statement = connection.prepareStatement("DELETE FROM authors WHERE id = ?");
            statement.setInt(1,id);
            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void updateAuthor(Author author){
        try {
            PreparedStatement statement = connection.prepareStatement("UPDATE authors " +
                    "SET first_name = ?, " +
                    "last_name = ?, " +
                    "instagram = ?" +
                    "WHERE id = ?");
            statement.setString(1,author.getFirst_name());
            statement.setString(2,author.getLast_name());
            statement.setString(3,author.getInstagram());
            statement.setInt(4,author.getId());
            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}

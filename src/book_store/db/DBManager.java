package book_store.db;

import java.util.ArrayList;

public class DBManager {
    private static final ArrayList<Book> books = new ArrayList<>();
    private static int id = 6;
//    static {
//        books.add(
//                new Book(1,
//                        "Harry Potter and Philosophy Stone",
//                        "Joanne Rowling",
//                        "fantasy",
//                        5000,
//                        "Harry Potter survives after Voldemort`s attack"
//                )
//        );
//        books.add(
//                new Book(2,
//                        "Harry Potter and Azkaban Prizon",
//                        "Joanne Rowling",
//                        "fantasy",
//                        6000,
//                        "Sirius Black escaped from Azkaban and he is Godfather of Harry Potter"
//                )
//        );
//    }

    public static ArrayList<Book> getBooks(){
        return books;
    }

    public static void addBook(Book book){
        book.setId(id);
        books.add(book);
        id++;
    }

    public static Book getBook(int id){
        return books
                .stream()
                .filter(book -> book.getId() == id)
                .findFirst()
                .orElse(null);
    }

    public static void updateBook(Book updatingBook){
        for(int i=0;i<books.size();i++){
            if(books.get(i).getId() == updatingBook.getId()){
                books.set(i,updatingBook);
                break;
            }
        }
    }

    public static void deleteBook(int id){
        for (int i = 0;i<books.size();i++){
            if(books.get(i).getId() == id){
                books.remove(i);
                break;
            }
        }
    }
}

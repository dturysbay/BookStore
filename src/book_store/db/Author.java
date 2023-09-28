package book_store.db;

public class Author {
    private int id;
    private String first_name;
    private String last_name;
    private String instagram;

    public Author() {
    }

    public Author(int id, String first_name, String last_name, String instagram) {
        this.id = id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.instagram = instagram;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getInstagram() {
        return instagram;
    }

    public void setInstagram(String instagram) {
        this.instagram = instagram;
    }
}
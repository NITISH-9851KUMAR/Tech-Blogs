package entities;

public class User {
    private int userId;
    private String user_name;
    private String email;
    private String gender;
    private String password;
    private String blog_date;
    private String image;


    public User(){}

    public User(String uName, String email, String gender, String pass, String blog_date, String image){
        this.user_name= uName;
        this.email= email;
        this.gender= gender;
        this.blog_date= blog_date;
        this.password= pass;
        this.image= image;
        // Call the SignupDetailsDao class for store data into database;
    }

    public void setUserId(int userId){
        this.userId = userId;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setBlog_date(String blog_date) {
        this.blog_date = blog_date;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setImage(String image){
        this.image= image;
    }

    public int getUserId(){
        return this.userId;
    }

    public String getUser_name() {
        return user_name;
    }

    public String getEmail() {
        return email;
    }

    public String getGender() {
        return gender;
    }

    public String getBlog_date() {
        return blog_date;
    }

    public String getPassword() {
        return password;
    }

    public String getImage(){
        return this.image;
    }

}

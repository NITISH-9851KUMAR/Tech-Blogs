package entities;

public class SignupDetails {

    private String user_name;
    private String email;
    private String gender;
    private String blog_date;

    public SignupDetails(){}

    public SignupDetails(String uName, String email, String gender, String blog_date){
        this.user_name= uName;
        this.email= email;
        this.gender= gender;
        this.blog_date= blog_date;
    }

}

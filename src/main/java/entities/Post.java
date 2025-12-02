package entities;

import java.sql.Timestamp;

public class Post {
    private int id;
    private String pTitle;
    private String pContent;
    private String pPic;
    private Timestamp pDate;
    private int catId;

    public Post() {}

    public Post(int id, String pTitle, String pContent, String pPic, Timestamp pDate, int catId) {
        this.id = id;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catId = catId;
    }
    public Post(String pTitle, String pContent, String pPic, Timestamp pDate, int catId) {
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catId = catId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return pTitle;
    }

    public void setTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getContent() {
        return pContent;
    }

    public void setContent(String pContent) {
        this.pContent = pContent;
    }

    public String getPic() {
        return pPic;
    }

    public void setPic(String pPic) {
        this.pPic = pPic;
    }

    public Timestamp getDate() {
        return pDate;
    }

    public void setDate(Timestamp pDate) {
        this.pDate = pDate;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }
}


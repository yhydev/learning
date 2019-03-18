package priv.yanyang.example.mybatis.viewmodel;

public class SimplePost {
    private String id;
    private String title;
    private Long createTime;
    private String authorId;
    private String authorName;

    @Override
    public String toString() {
        return "SimplePost{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", createTime=" + createTime +
                ", authorId='" + authorId + '\'' +
                ", authorName='" + authorName + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Long getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Long createTime) {
        this.createTime = createTime;
    }

    public String getAuthorId() {
        return authorId;
    }

    public void setAuthorId(String authorId) {
        this.authorId = authorId;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }
}

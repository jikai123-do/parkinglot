package parking.pojo;

import org.springframework.stereotype.Repository;

@Repository
public class Parkingnew {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column parkingnew.id
     *
     * @mbggenerated Wed Oct 23 16:47:18 CST 2019
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column parkingnew.title
     *
     * @mbggenerated Wed Oct 23 16:47:18 CST 2019
     */
    private String title;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column parkingnew.content
     *
     * @mbggenerated Wed Oct 23 16:47:18 CST 2019
     */
    private String content;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column parkingnew.id
     *
     * @return the value of parkingnew.id
     *
     * @mbggenerated Wed Oct 23 16:47:18 CST 2019
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column parkingnew.id
     *
     * @param id the value for parkingnew.id
     *
     * @mbggenerated Wed Oct 23 16:47:18 CST 2019
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column parkingnew.title
     *
     * @return the value of parkingnew.title
     *
     * @mbggenerated Wed Oct 23 16:47:18 CST 2019
     */
    public String getTitle() {
        return title;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column parkingnew.title
     *
     * @param title the value for parkingnew.title
     *
     * @mbggenerated Wed Oct 23 16:47:18 CST 2019
     */
    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column parkingnew.content
     *
     * @return the value of parkingnew.content
     *
     * @mbggenerated Wed Oct 23 16:47:18 CST 2019
     */
    public String getContent() {
        return content;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column parkingnew.content
     *
     * @param content the value for parkingnew.content
     *
     * @mbggenerated Wed Oct 23 16:47:18 CST 2019
     */
    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}
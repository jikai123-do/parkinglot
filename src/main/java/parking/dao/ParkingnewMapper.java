package parking.dao;

import java.util.List;



import org.apache.ibatis.annotations.Param;
import parking.pojo.Parkingnew;
import parking.pojo.ParkingnewExample;

public interface ParkingnewMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table parkingnew
     *
     * @mbggenerated Wed Oct 23 16:47:18 CST 2019
     */
    int countByExample(ParkingnewExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table parkingnew
     *
     * @mbggenerated Wed Oct 23 16:47:18 CST 2019
     */
    int deleteByExample(ParkingnewExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table parkingnew
     *
     * @mbggenerated Wed Oct 23 16:47:18 CST 2019
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table parkingnew
     *
     * @mbggenerated Wed Oct 23 16:47:18 CST 2019
     */
    int insert(Parkingnew record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table parkingnew
     *
     * @mbggenerated Wed Oct 23 16:47:18 CST 2019
     */
    int insertSelective(Parkingnew record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table parkingnew
     *
     * @mbggenerated Wed Oct 23 16:47:18 CST 2019
     */
    List<Parkingnew> selectByExample(ParkingnewExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table parkingnew
     *
     * @mbggenerated Wed Oct 23 16:47:18 CST 2019
     */
    Parkingnew selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table parkingnew
     *
     * @mbggenerated Wed Oct 23 16:47:18 CST 2019
     */
    int updateByExampleSelective(@Param("record") Parkingnew record, @Param("example") ParkingnewExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table parkingnew
     *
     * @mbggenerated Wed Oct 23 16:47:18 CST 2019
     */
    int updateByExample(@Param("record") Parkingnew record, @Param("example") ParkingnewExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table parkingnew
     *
     * @mbggenerated Wed Oct 23 16:47:18 CST 2019
     */
    int updateByPrimaryKeySelective(Parkingnew record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table parkingnew
     *
     * @mbggenerated Wed Oct 23 16:47:18 CST 2019
     */
    int updateByPrimaryKey(Parkingnew record);
}
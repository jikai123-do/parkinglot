package parking.pojo;

import org.springframework.stereotype.Repository;

@Repository
public class Parking {
    private Integer id;
    private Integer areaCode;
    private Integer sectionCode;
    private String sectionName;
    private Integer totalBerth;
    private Integer emptyBerth;
    private Double longitude;
    private Double latitude;
    private String part;

    public Parking() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(Integer areaCode) {
        this.areaCode = areaCode;
    }

    public Integer getSectionCode() {
        return sectionCode;
    }

    public void setSectionCode(Integer sectionCode) {
        this.sectionCode = sectionCode;
    }

    public String getSectionName() {
        return sectionName;
    }

    public void setSectionName(String sectionName) {
        this.sectionName = sectionName;
    }

    public Integer getTotalBerth() {
        return totalBerth;
    }

    public void setTotalBerth(Integer totalBerth) {
        this.totalBerth = totalBerth;
    }

    public Integer getEmptyBerth() {
        return emptyBerth;
    }

    public void setEmptyBerth(Integer emptyBerth) {
        this.emptyBerth = emptyBerth;
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public String getPart() {
        return part;
    }

    public void setPart(String part) {
        this.part = part;
    }
}

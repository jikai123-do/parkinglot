package parking.pojo;

import java.util.List;

public class ParkingE {
    private Integer cantonCode;
    private Integer areaCode;
    private String areaName;
    private List<Parking> sysSectionDataList;

    public ParkingE() {
    }

    public Integer getCantonCode() {
        return cantonCode;
    }

    public void setCantonCode(Integer cantonCode) {
        this.cantonCode = cantonCode;
    }

    public Integer getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(Integer areaCode) {
        this.areaCode = areaCode;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public List<Parking> getSysSectionDataList() {
        return sysSectionDataList;
    }

    public void setSysSectionDataList(List<Parking> sysSectionDataList) {
        this.sysSectionDataList = sysSectionDataList;
    }
}

package parking.pojo;

import java.util.List;

public class ParkingCustom {
    private Integer cantonCode;
    private Integer parentCode;
    private String cantonName;
    private Integer totalBerth;
    private Integer emptyBerth;
    private List<ParkingE> sysAreaDataList;
    private Double longitude;
    private Double latidute;
    
    public Double getLongitude() {
		return longitude;
	}

	public Double getLatidute() {
		return latidute;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public void setLatidute(Double latidute) {
		this.latidute = latidute;
	}

	public ParkingCustom() {
    }

    public Integer getCantonCode() {
        return cantonCode;
    }

    public void setCantonCode(Integer cantonCode) {
        this.cantonCode = cantonCode;
    }

    public Integer getParentCode() {
        return parentCode;
    }

    public void setParentCode(Integer parentCode) {
        this.parentCode = parentCode;
    }

    public String getCantonName() {
        return cantonName;
    }

    public void setCantonName(String cantonName) {
        this.cantonName = cantonName;
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

    public List<ParkingE> getSysAreaDataList() {
        return sysAreaDataList;
    }

    public void setSysAreaDataList(List<ParkingE> sysAreaDataList) {
        this.sysAreaDataList = sysAreaDataList;
    }
}

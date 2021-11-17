package parking.pojo;





import java.util.ArrayList;
import java.util.List;

public class VirtulData {
//    private Parking parking;
//    private ParkingE parkingE;
    private ParkingCustom parkingCustom;
    private List<ParkingE> parkingEList;
    private List<Parking> parkings;
    private static VirtulData vd = null;
    public static synchronized VirtulData getInstance() {
        if (vd == null) {
            vd = new VirtulData();
        }
        return vd;
    }
    private VirtulData() {
        parkingCustom = new ParkingCustom();//ParkingE的拓展类
        parkingCustom.setLongitude(121.435633);
        parkingCustom.setLatidute(31.292646);
        parkingCustom.setCantonCode(7);//行政区
        parkingCustom.setCantonName("闸北");//行政区
        parkingCustom.setTotalBerth(8);//总车位数
        parkingCustom.setEmptyBerth(8);//空车位数
        parkingCustom.setParentCode(4201);
        parkingEList = new ArrayList<ParkingE>();//区块
        ParkingE parkingE = new ParkingE();
        parkingE.setAreaCode(76);
        parkingE.setCantonCode(7);
        parkingE.setAreaName("闸北");
        parkings = new ArrayList<Parking>();

        Parking parking = new Parking();
        parking.setId(1);
        parking.setAreaCode(76);
        parking.setSectionCode(76001);
        parking.setSectionName("海同停车场");
        parking.setTotalBerth(4);
        parking.setEmptyBerth(4);
        parking.setPart(new String("0000"));
        parking.setLongitude(121.435633);
        parking.setLatitude(31.292646);


        Parking parking2 = new Parking();
        parking2.setId(2);
        parking2.setAreaCode(76);
        parking2.setSectionCode(76001);
        parking2.setSectionName("市北高新智慧园停车场");
        parking2.setTotalBerth(4);
        parking2.setEmptyBerth(4);
        parking2.setPart(new String("0000"));
        parking2.setLongitude(121.438909);
        parking2.setLatitude(31.291842);


        parkings.add(parking);
        parkings.add(parking2);
        parkingE.setSysSectionDataList(parkings);
        parkingEList.add(parkingE);
        parkingCustom.setSysAreaDataList(parkingEList);
    }

    public ParkingCustom getParkingCustom() {
        return parkingCustom;
    }

    public void setParkingCustom(ParkingCustom parkingCustom) {
        this.parkingCustom = parkingCustom;
    }

    public List<ParkingE> getParkingEList() {
        return parkingEList;
    }

    public void setParkingEList(List<ParkingE> parkingEList) {
        this.parkingEList = parkingEList;
    }

    public List<Parking> getParkings() {
        return parkings;
    }

    public void setParkings(List<Parking> parkings) {
        this.parkings = parkings;
    }
    public Parking findByName(String name) {
    	Parking pf=null;
    	for (Parking p : parkings) {
			if(name.equals(p.getSectionName())) {
				pf=p;
				
			}
		}
    	return pf;
    }
}

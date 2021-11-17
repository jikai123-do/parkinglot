package parking.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import parking.pojo.Parking;
import parking.pojo.ParkingCustom;
import parking.pojo.ParkingE;
import parking.pojo.VirtulData;


@Controller
public class MapController {

	private VirtulData vd=VirtulData.getInstance();
    /**
     * ajax响应方法
     */
    @RequestMapping("/ParkingMap/testAjax.action")
    //前端接收数据的对象是一个object对象，可直接点出相应的属性
//    后台接收数据,前台书写的Key，必须和对应接收的参数类型中的属性相对应
    public @ResponseBody
    ParkingCustom testAjax() {
//        System.out.println("执行了");
        return vd.getParkingCustom();
    }

}

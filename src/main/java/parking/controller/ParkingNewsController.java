package parking.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import parking.pojo.Parkingnew;
import parking.service.ParkingNewService;


@Controller
public class ParkingNewsController {

	@Autowired
	ParkingNewService  parkingNewService;
	@ModelAttribute("parkingnewList")
	public  List<Parkingnew> findAllParkingnew(HttpSession session) throws Exception{
		  List<Parkingnew> list = parkingNewService.findAllParkingnew();
		   session.setAttribute("parkingnewList", list);
		  return list;
		
	}
	
	
	@RequestMapping("indexOpen")
	
	public String indexOpen(){
		
		return"index.jsp";
		
		
	}
	
	
	
	
	
	
	
	
}

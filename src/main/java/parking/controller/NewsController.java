package parking.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import parking.pojo.News;
import parking.pojo.Notice;
import parking.pojo.Parkingnew;
import parking.pojo.VirtulData;
import parking.service.NewsService;
import parking.service.NoticeService;
import parking.service.ParkingNewService;



@Controller
public class NewsController {
	private VirtulData vd=VirtulData.getInstance();
	@Autowired
	NewsService newsService;
	@Autowired
    NoticeService noticeService;
	@Autowired
	ParkingNewService  parkingNewService;
  @ModelAttribute("newsList")
   public List<News> findAllNews(HttpSession session) throws Exception{
	   
	 List<News> list =newsService.findAllNews();
	 session.setAttribute("newsList", list);
	   return list;
   }
  @ModelAttribute("noticeList")
  public List<Notice> findAllNotice(HttpSession session)throws Exception{
	 List<Notice> list=noticeService.findAllNotice();
	session.setAttribute("noticeList",list);
	 return list;
 }
  @ModelAttribute("parkingnewList")
	public  List<Parkingnew> findAllParkingnew(HttpSession session) throws Exception{
		  List<Parkingnew> list = parkingNewService.findAllParkingnew();
		   session.setAttribute("parkingnewList", list);
		  return list;
		
	}
   
 @RequestMapping("Index")
 public String index(HttpSession session){
 System.out.println(1);
 	Integer emptyBerth = vd.getParkingCustom().getEmptyBerth();
 	session.setAttribute("emptynum", emptyBerth);
	 return"Index.jsp";
	 
 }
 
 
}

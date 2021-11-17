package parking.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

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
	@Resource
	NewsService newsServiceImpl;
	@Resource
    NoticeService noticeServiceImpl;
	@Resource
	ParkingNewService  parkingNewServiceImpl;
  @ModelAttribute("newsList")
   public List<News> findAllNews(HttpSession session) throws Exception{
	   
	 List<News> list =newsServiceImpl.findAllNews();
	 session.setAttribute("newsList", list);
	   return list;
   }
  @ModelAttribute("noticeList")
  public List<Notice> findAllNotice(HttpSession session)throws Exception{
	 List<Notice> list=noticeServiceImpl.findAllNotice();
	session.setAttribute("noticeList",list);
	 return list;
 }
  @ModelAttribute("parkingnewList")
	public  List<Parkingnew> findAllParkingnew(HttpSession session) throws Exception{
		  List<Parkingnew> list = parkingNewServiceImpl.findAllParkingnew();
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

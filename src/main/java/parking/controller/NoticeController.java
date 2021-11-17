package parking.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import parking.pojo.Notice;
import parking.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
    NoticeService noticeService;
	
	@ModelAttribute("noticeList")
	  public List<Notice> findAllNotice(HttpSession session)throws Exception{
		 List<Notice> list=noticeService.findAllNotice();
		session.setAttribute("noticeList",list);
		 return list;
	 }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

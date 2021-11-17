package parking.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import parking.pojo.Notice;
import parking.service.NoticeService;
import parking.service.impl.NoticeServiceImpl;
@Controller
public class NoticeController {
	@Resource
    NoticeService noticeServiceImpl;
	
	@ModelAttribute("noticeList")
	  public List<Notice> findAllNotice(HttpSession session)throws Exception{
		 List<Notice> list=noticeServiceImpl.findAllNotice();
		session.setAttribute("noticeList",list);
		 return list;
	 }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

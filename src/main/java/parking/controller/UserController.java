package parking.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import parking.pojo.User;
import parking.service.UserService;

@Controller
public class UserController {
@Autowired
	UserService userService;

	
	
	@RequestMapping("/login")
	public String login(User user,HttpSession session,HttpServletRequest request) throws Exception{
		
		User loginUser = userService.findUserByUsernameAndPassword(user);
	
		if(loginUser!=null){
			 session.setAttribute("user", loginUser);
			 return "redirect:/Index.jsp";
			
			
		}else{
			return "redirect:/HomePage/Login.jsp";
		}
	}
	
	


	
	@RequestMapping("/regist")
	public String regist(User user,HttpSession session,HttpServletRequest request) throws Exception{
		
		String result = userService.save(user);
		
		if(result.equals("�ɹ�")){
			User loginUser=userService.findUserByUsernameAndPassword(user);
			 session.setAttribute("user", loginUser);
			 
			 return "redirect:/Index.jsp";
			
			
		}else{
			request.setAttribute("inputuser", user);
			session.setAttribute("erroMsg", "��Ϣ�ѱ�ʹ��");
			
			return "redirect:/HomePage/Sign.jsp";
		}
		
	}
	
	public List<User> findAllUser() throws Exception {
		
		List<User> list = userService.findAllUser();
		for (User user : list) {
			System.out.println(user.getUsername());
		}
		return list;
	}
	
	@RequestMapping("/recharge")

	public String recharge(String rechargeprice,HttpSession session,Model model) throws Exception{
		User user = (User) session.getAttribute("user");
		if(user!=null){
		double price=Double.parseDouble(rechargeprice);
		user.setBalance(user.getBalance()+price);
		 boolean b = userService.changeBlance(user);
		 return "redirect:/ParkingService/Recharge.jsp";
		}else{
			model.addAttribute("erromsg", "���ȵ�¼");
			return "/ParkingService/ErroMsg.jsp";
		}
	}
	@RequestMapping("/out")
	public String getout(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws Exception{
		 session.removeAttribute("user");
	
		 return "redirect:/Index.jsp";
	}

	
	

	
}

package parking.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import parking.pojo.Parking;
import parking.pojo.User;
import parking.pojo.VirtulData;
import parking.service.UserService;
@Controller
public class ParkController {
	@Resource
	UserService userServiceImpl;
	private VirtulData vd=VirtulData.getInstance();
	@RequestMapping("test")
	public String test(Model model,HttpServletRequest request) throws Exception {
		
		
		String parameter = request.getParameter("code");
		parameter = new String(parameter.getBytes("iso-8859-1"),"utf-8");
		Parking p = vd.findByName(parameter);
		String str = p.getPart();
		ArrayList<Integer> a=new ArrayList<Integer>();
		for (int i = 0; i < str.length(); i++) {
			a.add(Integer.valueOf(str.charAt(i)));
		}
		System.out.println(parameter);
		model.addAttribute("test", a);
		model.addAttribute("name", parameter);
		return "forward:test.jsp";
	}
	@RequestMapping("parkcar")
	public String parkcar(Model model,HttpServletRequest request,HttpSession session) throws Exception {
		
		User user = (User) session.getAttribute("user");
		if(user.getBalance()<10||null!=user.getOd()) {
			model.addAttribute("error", "账户余额不足请及时充值或您已有预定停车位");
		}else {
			
			user.setBalance(user.getBalance()-10);
			String code = request.getParameter("code");
			String name = request.getParameter("name");
			user.setOd(code);
			userServiceImpl.changeBlance(user);
			 session.setAttribute("user", user);
			name = new String(name.getBytes("iso-8859-1"),"utf-8");
			
			Parking p = vd.findByName(name);
			String part = p.getPart();
			StringBuilder sb=new StringBuilder();
			sb=sb.append(part);
			sb.setCharAt(Integer.parseInt(code)-1, '1');
			p.setPart(sb.toString());
			p.setEmptyBerth(p.getEmptyBerth()-1);
			Integer berth = vd.getParkingCustom().getEmptyBerth();
			vd.getParkingCustom().setEmptyBerth(berth-1);
			String str = p.getPart();
			ArrayList<Integer> a=new ArrayList<Integer>();
			for (int i = 0; i < str.length(); i++) {
				a.add(Integer.valueOf(str.charAt(i)));
			}
			model.addAttribute("test", a);
			model.addAttribute("name", name);
			session.setAttribute("emptynum", vd.getParkingCustom().getEmptyBerth());
		}
		return "forward:test.jsp";
	}
}

package test;

import org.junit.Test;


import cc.eguid.charsocr.PlateRecognition;
import parking.pojo.User;
import parking.service.UserService;


public class UserServiceImplTest {
	
//	@Test
//	public void test() throws Exception {
//		User user=new User("tom","123");
//		ApplicationContext  context=new ClassPathXmlApplicationContext("bean_base.xml");
//		UserService us =  (UserService) context.getBean("userServiceImpl");
//		User user2 = us.findUserByUsernameAndPassword(user);
//		if(user2!=null){
//		System.out.println(user2.getId()+","+user2.getUsername()+","+user2.getPassword());
//		}else{
//			System.out.println("meiyou");
//		}
//	}
//
	
	
	@Test
	public void test2() throws Exception {
		PlateRecognition p=new PlateRecognition();
		String plate = p.getPlate();
		System.out.println(plate);
		}
	

}

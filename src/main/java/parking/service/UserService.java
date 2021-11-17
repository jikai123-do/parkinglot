package parking.service;

import java.util.List;

import parking.pojo.User;


public interface UserService {

	public User findUserByUsernameAndPassword(User user)throws Exception;
	public String save(User user)throws Exception;
	public User findUserByPhoneNumber(String phoneNumber)throws Exception;
	public User findUserByEmail(String email)throws Exception;
	public List<User>findAllUser()throws Exception;
	public boolean changeBlance(User user) throws Exception;
	public User update(User user) throws Exception;
}

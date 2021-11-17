package parking.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import parking.dao.UserMapper;
import parking.pojo.User;
import parking.pojo.UserExample;
import parking.service.UserService;

import javax.annotation.Resource;
import java.util.List;


@Transactional
public class UserServiceImpl implements UserService {
	@Autowired
    UserMapper userMapper;


	public User findUserByUsernameAndPassword(User user) throws Exception {
		UserExample example = new UserExample();
		UserExample.Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(user.getUsername());
		criteria.andPasswordEqualTo(user.getPassword());
		List<User> list = userMapper.selectByExample(example);

		return list.size() > 0 ? list.get(0) : null;

	}

	public String save(User user) throws Exception {
		List<User> list = findAllUser();
		for (User user2 : list) {
			if (user.getPhone().equals(user2.getPhone()) || user.getEmail().equals(user2.getEmail())) {

				return "ʧ��";

			}
		}
		int count = userMapper.insertSelective(user);
		if (count > 0) {

			return "�ɹ�";
		} else {
			return "ʧ��";
		}

	}


	public User findUserByPhoneNumber(String phoneNumber) throws Exception {
		UserExample example = new UserExample();
		UserExample.Criteria criteria = example.createCriteria();
		criteria.andPhoneEqualTo(phoneNumber);
		List<User> list = userMapper.selectByExample(example);
		return list.size() > 0 ? list.get(0) : null;
	}

	public User findUserByEmail(String email) throws Exception {
		UserExample example = new UserExample();
		UserExample.Criteria criteria = example.createCriteria();
		criteria.andEmailEqualTo(email);
		List<User> list = userMapper.selectByExample(example);
		return list.size() > 0 ? list.get(0) : null;
	}

	public List<User> findAllUser() throws Exception {
		List<User> list = userMapper.selectByExample(null);

		return list;
	}
	public boolean changeBlance(User user) throws Exception {
		int count = userMapper.updateByPrimaryKeySelective(user);
		System.out.println(count);
		if(count>0){
			
			return true;
		}else{
			return false;
		}
	}

	public User update(User user) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}

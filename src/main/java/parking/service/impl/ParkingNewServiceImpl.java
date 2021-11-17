package parking.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import parking.dao.ParkingnewMapper;
import parking.pojo.Parkingnew;
import parking.service.ParkingNewService;

@Transactional
public class ParkingNewServiceImpl implements ParkingNewService {
    @Autowired
	ParkingnewMapper  parkingnewMapper;
	   public List<Parkingnew> findAllParkingnew() throws Exception {
		 
		List<Parkingnew> list = parkingnewMapper.selectByExample(null);
		
		return list;
		
	}
	

}

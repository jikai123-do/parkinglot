package parking.service;

import java.util.List;

import org.springframework.stereotype.Service;

import parking.pojo.Parkingnew;

public interface ParkingNewService {

	public List<Parkingnew> findAllParkingnew()throws Exception;

	
}

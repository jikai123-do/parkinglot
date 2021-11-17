package parking.service;

import java.util.List;

import org.springframework.stereotype.Service;

import parking.pojo.Notice;



public interface NoticeService {
	public List<Notice> findAllNotice()throws Exception;
}

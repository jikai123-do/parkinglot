package parking.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import parking.dao.NoticeMapper;
import parking.pojo.Notice;
import parking.service.NoticeService;

@Transactional
public class NoticeServiceImpl implements NoticeService {

  	 @Autowired
	    NoticeMapper noticeMapper;
	
	public List<Notice> findAllNotice() throws Exception {
	
		List<Notice> list = noticeMapper.selectByExample(null);
		return list;
	}

}

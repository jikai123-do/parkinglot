package parking.service.impl;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import parking.dao.NewsMapper;
import parking.pojo.News;
import parking.service.NewsService;

@Transactional
public class NewsServiceImpl implements NewsService{
	@Autowired
	NewsMapper newsMapper;
	
	public List<News> findAllNews() {
		List<News> list = newsMapper.selectByExample(null);
		for (News news : list) {
			System.out.println(news.getContent());	
			}
		return list;
	}

}

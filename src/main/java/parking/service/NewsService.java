package parking.service;

import java.util.List;

import org.springframework.stereotype.Service;

import parking.pojo.News;

public interface NewsService {

	
	public List<News> findAllNews()throws Exception;
	
	
	
}

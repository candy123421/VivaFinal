package web.controller;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import web.service.face.BoardNoticeService;
import web.service.impl.BoardNoticeServiceImpl;

@Configuration
public class AppConfig {
	
	@Bean
	public BoardNoticeService boardNoticeService() {
		return new BoardNoticeServiceImpl();
	}
}

package web.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Pack;
import web.dto.PackImgInfo;
import web.dto.Source;
import web.dto.SourceFileInfo;
import web.dto.Tag;
import web.service.face.FileUploadService;

@Controller
public class FileUploadController {
	
	@Autowired FileUploadService fileUploadService;
	
	
	
	//로그객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("/file/guide")
	public void guide() {
		
	}
	
	@RequestMapping("/file/sourcelist")
	public void sourceview(Model model) {
		logger.info("/file/sourcelist GET");
		
		List<Map<String, Object>> list = fileUploadService.getSourceList();
		model.addAttribute("list", list);
		logger.info("list의 값 : {} ",list);
	}
	
	@RequestMapping("/file/packlist")
	public void packview(Model model) {
		logger.info("/file/packlist GET");
		
		List<Map<String, Object>> list = fileUploadService.getPackList();
		model.addAttribute("list", list);
		logger.info("list의 값 : {} ",list);
	}
	
	
	@GetMapping("/file/fileupsource")
	public void FileUpSource() {
		logger.info("/file/fileupsource [GET]");
		
	}
	
	@PostMapping("/file/fileupsource")
	public String FileUpSourcePost(
			MultipartFile imgfile,
			MultipartFile file,
			@RequestParam(defaultValue = "no")String genre,
			@RequestParam(defaultValue = "no")String instrument,
			@RequestParam(defaultValue = "no")String detail,
			@RequestParam(defaultValue = "no")String scape,
			@RequestParam(defaultValue = "no")String fx,
			@RequestParam(defaultValue = "no")String key,
			String sourceName,
			String sourceTime,
			@RequestParam(defaultValue = "0") int bpm
			) {
		logger.info("/file/fileupsource [Post]");
		
		logger.info("genre {}", genre);
		
		
		//첫번째 방법
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonObject = null;
		
		Tag tag = null;
		
		try {
			jsonObject = (JSONArray) jsonParser.parse(genre);
			genre = ((JSONObject) jsonObject.get(0)).get("value").toString();
			
			jsonObject = (JSONArray) jsonParser.parse(instrument);
			instrument = ((JSONObject) jsonObject.get(0)).get("value").toString();

			jsonObject = (JSONArray) jsonParser.parse(detail);
			detail = ((JSONObject) jsonObject.get(0)).get("value").toString();
			
			jsonObject = (JSONArray) jsonParser.parse(scape);
			scape = ((JSONObject) jsonObject.get(0)).get("value").toString();
			
			if(fx.isEmpty()) {
				fx="no";
			} else {
				jsonObject = (JSONArray) jsonParser.parse(fx);
				fx = ((JSONObject) jsonObject.get(0)).get("value").toString();
			}
			
			

			
			//tag에다가 위에 있는 값 집어넣기 
			//int형은 뭘 넣든간에 insert가 되는 값으로 들어가는거같음 
			tag = new Tag(0, instrument, genre, scape, detail, fx);
			
		} catch (ParseException e ) {
			e.printStackTrace();
		}
		
		
		Source source = null;
		
		try {
			jsonObject = (JSONArray) jsonParser.parse(key);
			key = ((JSONObject) jsonObject.get(0)).get("value").toString();
			
			source = new Source(0,sourceName,bpm,key,0,0,0,0,sourceTime);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		


		logger.info("tag {}", tag);
		logger.info("*******key의 값 입니다! : {}",key);
		logger.info("*******source의 값 : {}",source);
		fileUploadService.SourceUpload(tag,source,imgfile,file);
		
//		
		
		return "redirect:/source/sound";
		
	}
	

	@GetMapping("/file/fileuppack")
	public void FileUpPack() {
		logger.info("/file/fileuppack [GET]");
		
	}
	
	@PostMapping("/file/fileuppack")
	public String FileUpPackPost(
			String genre,
			String instrument,
			String scape,
			String detail,
			String fx,
			Pack pack,
			MultipartFile packImg,
			Source source,
			List<MultipartFile> packFileList,
			HttpSession session
			) {
		logger.info("/file/fileuppack [Post]");
		
		source.setUserNo((int)session.getAttribute("userNo"));
		
		//Tag Json 파싱하기 
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonObject = null;
		
		Tag tag = null;
		
		try {
			jsonObject = (JSONArray) jsonParser.parse(genre);
			genre = ((JSONObject) jsonObject.get(0)).get("value").toString();
			
			jsonObject = (JSONArray) jsonParser.parse(instrument);
			instrument = ((JSONObject) jsonObject.get(0)).get("value").toString();

			//tag에다가 위에 있는 값 집어넣기 
			//int형은 뭘 넣든간에 insert가 되는 값으로 들어가는거같음(잘은모르겠지만 일단됨 )
			tag = new Tag(0, instrument, genre, scape, detail, fx);
			
			
			
		} catch (ParseException e) {
			e.printStackTrace();
		}

		logger.info("파싱 된 tag의값 : {}", tag);
		
		fileUploadService.uploadPack(tag,pack,packImg,source,packFileList);
		
		
		return "redirect:/source/sound";
	}
	


	

}

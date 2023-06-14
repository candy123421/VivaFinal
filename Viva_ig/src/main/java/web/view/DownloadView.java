package web.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import web.dto.Credit;
import web.dto.SourceFileInfo;
import web.service.face.CreditService;

public class DownloadView extends AbstractView{
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired ServletContext context;
	@Autowired CreditService creditService;
	
	@Override
	protected void renderMergedOutputModel(
			Map<String, Object> model, 
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		logger.info("응답 테스트..............");
		
		// 모델 값 ( 파일정보) 가져오기
		SourceFileInfo down = (SourceFileInfo) model.get("down");
		
		// 저장된 파일의 폴더 (upload) 
		String path = context.getRealPath("upload");
		
		// 실제 업로드된 파일 이름 ( Stored Name )
		String sourceName = down.getFileStoredname();
		
		// 실제 파일 객체
		File download = new File(path, sourceName);
		
		logger.info("업로드된 파일 확인 {}", download);
		logger.info("존재확인 {}", download.exists());
		
		// 파일 전송 Content Type 지정
		response.setContentType("application/octet-stream");
		
		// 응답 데이터 인코딩 설정
		response.setCharacterEncoding("UTF-8");
		
		// 브라우저에서 다운로드할 파일이름
		String downloadName = URLEncoder.encode(down.getFileOriginname(),"UTF-8");
		
		downloadName = downloadName.replace("+","%20");
		downloadName = downloadName+".wav";
		logger.info(downloadName);
		
		response.setHeader("Content-Disposition","attachment; filename=\"" + downloadName + "\"");
		
		// --- 응답 메시지의 BODY 영역 설정
		// 서버 File -> FileInputStream 입력 -> HTTP Response OutputStream 출력
		
		// 서버 파일 입력 스트림
		FileInputStream in = new FileInputStream(download);
		
		// 클라이언트 응답 출력 스트림
		OutputStream out = response.getOutputStream();
		
		// 서버 -> 클라이언트 파일 복사
		FileCopyUtils.copy(in, out);
		
		
	}

}

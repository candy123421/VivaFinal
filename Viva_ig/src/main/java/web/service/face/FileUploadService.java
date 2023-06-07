package web.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Pack;
import web.dto.Source;
import web.dto.Tag;


public interface FileUploadService {
	
	/**
	 * source테이블 전체 출력하기 
	 * @return
	 */
	public List<Map<String, Object>> getSourceList();
	
	/**
	 * pack insert된거 list
	 * @return
	 */
	public List<Map<String, Object>> getPackList();
	
	/**
	 * Source 업로드 부분
	 * @param tag - Tag(instrument,genre,scape,detail,fx) 
	 * @param source-source(source_name,BPM,Key,tag_no,pack_no,user_no) insert
	 * @param imgfile - 소스 이미지 파일 부분 (sourceImgInfo 테이블)
	 * @param file - 소스 음원 파일 부분 (sourceFileInfo 테이블)
	 */
	public void SourceUpload(Tag tag,Source source,MultipartFile imgfile,MultipartFile file);


	/**
	 * pack 업로드부분 
	 * @param tag - Tag(instrument,genre,scape,detail,fx) 
	 * @param pack - pack(pack_no, pack_name, pack_content, pack_date, tag_no)
	 * @param packImg - 팩 이미지 파일 부분 (packimginfo 테이블사용)
	 * @param source - source(source_name,BPM,Key,tag_no,pack_no,user_no) insert 팩이라서 bpm,key,time은 null로 들어감
	 * @param packFileList - 음원소스 파일 여러개(pack)  (SourceFileInfo 테이블사용) 
	 */
	public void uploadPack(Tag tag, Pack pack, MultipartFile packImg, Source source, List<MultipartFile> packFileList);





}

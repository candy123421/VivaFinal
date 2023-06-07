package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Pack;
import web.dto.PackImgInfo;
import web.dto.Source;
import web.dto.SourceFileInfo;
import web.dto.SourceImgInfo;
import web.dto.Tag;

public interface FileUploadDao {

	/**
	 * Source list 조회 
	 * @return
	 */
	public List<Map<String, Object>> selectAllSourceList();

	/**
	 * pack list 조회
	 * @return
	 */
	public List<Map<String, Object>> selectAllPackList();
	
	/**
	 * Tag 테이블 정보 삽입 
	 * tag(tag_no,instrument,genre,scape,detail,fx) insert
	 * @param tag
	 */
	public void TagInsert(Tag tag);
	
	/**
	 * Source 테이블 정보 삽입 
	 *  source(source_name,BPM,Key,tag_no,pack_no,user_no,source_time) insert
	 * @param source
	 */
	public void SourceInsertSource(Source source);

	
	/**
	 * SourceImgInfo 테이블 정보 삽입 
	 * sourceImgInfo (소스 이미지파일 insert)
	 * @param sourceImgInfo ( 소스 이미지 파일 imgorigin,imgstored)
	 */
	public void SourceInsertImg(SourceImgInfo sourceImgInfo);
	
	/**
	 * SourceFileInfo 테이블 정보 삽입 
	 * sourceFileInfo (소스 음원파일 insert)
	 * @param sourceFileInfo ( 소스 음원 파일 origin,stored)
	 */
	public void SourceInsertFile(SourceFileInfo sourceFileInfo);

	
	//--------------------------------------------------------
	//팩 업로드 시작부분 
	
	/**
	 * 팩 업로드 Pack 테이블 정보 삽입 
	 * @param pack - (pack_no , pack_name , pack_content ,pack_date , tag_no)
	 */
	public void packInsert(Pack pack);

	/**
	 * 팩 이미지 업로드 PackImgInfo 테이블 정보 삽입 
	 * @param packImgInfo - (pack_no, pack_img_originname, pack_img_storedname)
	 */
	public void PackImgInsert(PackImgInfo packImgInfo);

	/**
	 * 팩의 source 정보 insert
	 * @param source -(source_no,source_name,bpm,key,source_price,tag_no,pack_no,user_no,source_time)
	 */
	public void PackSourceInsert(Source source);



	

}

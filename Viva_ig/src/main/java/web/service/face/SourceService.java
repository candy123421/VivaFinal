package web.service.face;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import web.dto.Pack;
import web.dto.PackLike;
import web.dto.Source;
import web.dto.SourceFileInfo;
import web.dto.SourceLike;
import web.dto.Tag;
import web.util.Paging;

public interface SourceService {

	/**
	 * 같은 장르에 포함된 Instrument Tag를 가져온다
	 * 
	 * @param genre - 클라이언트가 선택한 장르
	 * @return
	 */
	public List<Tag> getTag(Tag genre);

	/**
	 * 
	 * 같은 장르에 포함된 Scape Tag를 가져온다
	 * 
	 * @param genre - 클라이언트가 선택한 장르
	 * @return - 태그 조회 결과
	 */
	public List<Tag> getTagScape(Tag genre);

	/**
	 * 같은 장르에 포함된 Detail Tag를 가져온다
	 * 
	 * @param genre - 클라이언트가 선택한 장르
	 * @return - 태그 조회 결과
	 */
	public List<Tag> getTagDetail(Tag genre);

	/**
	 * 같은 장르에 포함된 Fx Tag를 가져온다
	 * 
	 * @param genre - 클라이언트가 선택한 장르
	 * @return - 태그 조회 결과
	 */
	public List<Tag> getTagFx(Tag genre);

	/**
	 * 클라이언트가 선택한 장르의 음원소스 정보를 모두 가져온다
	 * 
	 * @param genre - 클라이언트가 선택한 장르
	 * @param session 
	 * @return - 장르별 음원소스의 집합
	 */
	public List<Map<String, Object>> getSourceByGenre(Tag genre, HttpSession session);

	/**
	 * Like를 추가, 클라이언트가 좋아요를 눌렀을 때
	 * @param userNo - userno 사용자 정보
	 * @param sourceNo - sourceno 음원소스 정보
	 */
	public void sourceLike(SourceLike like);

	/**
	 * 좋아요를 누른 이력이 있는지 확인한다
	 * @param like - 좋아요를 누른 객체 정보
	 * @return - 이력이 있으면 true, 없으면 false
	 */
	public boolean chkLike(SourceLike like);

	/**
	 * 좋아요를 삭제한다
	 * 
	 * @param like - 좋아요를 누른 객체 정보
	 */
	public void sourceDestLike(SourceLike like);

	/**
	 * 다운로드를 하기 위한 파일의 정보를 조회한다
	 * @param down - 다운로드 요청 파일의 sourceNo가 담긴 객체
	 * @return - 해당 sourceNo를 가진 음원소스 정보
	 */
	public SourceFileInfo getFile(SourceFileInfo down);

	/**
	 * inst페이지에서 필요한 태그(Genre)를 조회한다
	 * instrument나 detail을 가진 태그를 추출한다
	 * @param instrument - 같은 악기, 디테일에 포함된 태그를 불러온다
	 * @return
	 */
	public List<Tag> getTagGenre(Tag instrument);

	/**
	 * Instrument의 detail을 선택한 경우 detail에 해당하는 악기를 지정해 반환
	 * @param instrument - detail만 들어있는 객체
	 * @return - 조회된 instrument의 detail이 포함된 객체
	 */
	public Tag getInst(Tag instrument);

	/**
	 * 같은 Instrument를 가진 scape태그를 조회한다
	 * @param instrument - 지정된 악기가 있는 태그 객체
	 * @return - 지정된 악기가 있는 scape 태그 조회결과
	 */
	public List<Tag> getTagScapeforInst(Tag instrument);

	/**
	 * 같은 Instrument를 가진 Fx태그를 조회한다
	 * @param instrument - 지정된 악기가 있는 태그 객체
	 * @return - 지정된 악기가 있는 Fx 태그 조회 결과
	 */
	public List<Tag> getTagFxforInst(Tag instrument);

	/**
	 * instrument만 선택했을 경우 Detail 태그를 조회한다
	 * @param instrument - inst만 들어있는 태그 객체
	 * @return - detail 태그 조회 결과
	 */
	public List<Tag> getTagDetailforInst(Tag instrument);

	/**
	 * 클라이언트가 선택한 Instrument, Detail에 맞는 
	 * 음원소스 리스트를 불러온다
	 * 
	 * @param instrument - inst 또는 inst,Detail 만 담겨있는 객체
	 * @param session 
	 * @return - 조건에 맞는 음원소스 조회 결과
	 */
	public List<Map<String, Object>> getSourceByInstDetail(Tag instrument, HttpSession session);

	/**
	 * Souud 화면에서 최신 팩 정보를 가져온다
	 * @return - 업로드 순서로 최상위 10개의 정보를 가져온다
	 */
	public List<Map<String, Object>> getPack();

	/**
	 * Sound 화면에서 좋아요가 많은 순서대로 팩 정보를 가져온다 
	 * @return - 좋아요가 많은 순서로 최대 10개를 가져온다
	 */
	public List<Map<String, Object>> getLikePack();

	/**
	 * PackNo를 이용해 해당 Pack의 세부 페이지로 이동한다
	 * 이 때 PackNo 조건에 맞는 특정 Pack의 모든 정보를 조회한다
	 * 또한, tag를 선택한 경우 조건을 추가해 조회한다
	 * 
	 * @param pack - 조회할 PackNo
	 * @param tag - 조회 조건이 추가된 Tag 정보
	 * @return
	 */
	public List<Map<String, Object>> getPackByPackNo(int packNo, Tag tag);

	/**
	 * packNo를 이용해 해당 Pack 단일 정보를 조회한다
	 * 이름, 사진, 설명을 가져온다
	 * 
	 * @param packNo - 단일 정보 조회 요청 객체
	 * @return - 단일 pack 정보 객체
	 */
	public Map<String, Object> getPackInfo(int packNo);

	/**
	 * Pack 상세 조회 시 해당 팩이 가진 Genre Tag 전부를
	 * 중복 없이 가져온다
	 * @param packNo - 조회 요청 PackNo
	 * @return - 조회 결과
	 */
	public List<Map<String, Object>> getTagGenreForPack(int packNo);

	/**
	 * Pack 상세 조회 시 해당 팩이 가진 Inst Tag 전부를
	 * 중복 없이 가져온다
	 * @param packNo - 조회 요청 PackNo
	 * @return - 조회 결과
	 */
	public List<Map<String, Object>> getTagInstForPack(int packNo);

	/**
	 * Pack 상세 조회 시 해당 팩이 가진 Detail Tag 전부를
	 * 중복 없이 가져온다
	 * @param packNo - 조회 요청 PackNo
	 * @return - 조회 결과
	 */
	public List<Map<String, Object>> getTagDetailForPack(int packNo);

	/**
	 * Pack 상세 조회 시 해당 팩이 가진 Scape Tag 전부를
	 * 중복 없이 가져온다
	 * @param packNo - 조회 요청 PackNo
	 * @return - 조회 결과
	 */
	public List<Map<String, Object>> getTagScapeForPack(int packNo);

	/**
	 * Pack 상세 조회 시 해당 팩이 가진 Fx Tag 전부를
	 * 중복 없이 가져온다
	 * @param packNo - 조회 요청 PackNo
	 * @return - 조회 결과
	 */
	public List<Map<String, Object>> getTagFxForPack(int packNo);

	/**
	 * Pack 좋아요를 한 이력이 있는 지 조회한다
	 * @param like - Pack 좋아요 요청 정보
	 * @return - true : 좋아요 추가 불가, false : 좋아요 추가 가능
	 */
	public boolean chkPackLike(PackLike like);

	/**
	 * 좋아요를 눌렀을 때 기존 이력이 있는 경우
	 * 삭제를 한다
	 * 
	 * @param like - 좋아요를 누른 pack정보
	 */
	public void packDestLike(PackLike like);

	/**
	 * 좋아요를 눌렀을 때 기존 이력이 없는 경우 
	 * 추가한다
	 * 
	 * @param like - 좋아요를 누른 pack 정보
	 */
	public void packLike(PackLike like);

	/**
	 * Pack 세부 페이지에서 좋아요 이력을 확인한다
	 * @param session - 로그인한 사용자 정보
	 * @param pack - 조회한 Pack 정보
	 * @return - true: 좋아요 했음 , false: 좋아요 안했음
	 */
	public boolean tracePackLike(HttpSession session, Pack pack);

	/**
	 * Pack의 좋아요 Cnt를 조회한다
	 * @param like - packNo
	 * @return - 좋아요 수
	 */
	public int getPackLikeCnt(PackLike like);

	/**
	 * Pack 단위로 보여주는 페이지에서 보여줄
	 * Pack들의 정보를 모두 조회한다
	 * 
	 * 장르 또는 악기별로 조회할 수 있다
	 * @param tag -조회 조건 ( 장르, 악기 )
	 * @return - 등록된 Pack 정보
	 */
	public List<Map<String, Object>> getPackInfos(Tag tag);

	/**
	 * Pack 단위로 보여주는 장르 페이지에서 보여줄
	 * pack들의 악기 태그를 가져온다
	 * 
	 * @param tag - 장르가 들어간 Tag
	 * @return - 조회 결과
	 */
	public List<Tag> getPackTag(Tag tag);

	/**
	 * Pack 단위로 보여주는 악기 페이지에서
	 * 보여줄 Pack들의 장르 태그를 가져온다
	 * 
	 * @param tag - 악기가 들어간 Tag
	 * @return - 조회 결과
	 */
	public List<Tag> getPackInfosInst(Tag tag);

	/**
	 * 로그인 된 회원이 가지고 있는 
	 * 나의 음원소스 정보를 모두 조회한다
	 * 
	 * @param userNo - 마이페이지에서 접속한 회원
	 * @return - 음원소스 조회 결과
	 */
	public List<Map<String, Object>> getMySource(int userNo);



}

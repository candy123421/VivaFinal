package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Pack;
import web.dto.PackLike;
import web.dto.SourceFileInfo;
import web.dto.SourceLike;
import web.dto.Tag;

public interface SourceDao {

	/**
	 * 해당 장르가 가지고 있는 Instrument 태그를 전체 조회한다
	 * @param genre - 클라이언트가 선택한 장르
	 * @return - 태그 조회 결과
	 */
	public List<Tag> selectTagByGenre(Tag genre);

	/**
	 * 해당 장르가 가지고 있는 Scape태그를 전체 조회한다
	 * @param genre - 클라이언트가 선택한 장르
	 * @return - 태그 조회 결과
	 */
	public List<Tag> selectTagByGenreforScape(Tag genre);

	/**
	 * 해당 장르가 가지고 있는  Detail태그를 전체 조회한다
	 * @param genre - 클라이언트가 선택한 장르
	 * @return - 태그 조회 결과
	 */
	public List<Tag> selectTagByGenreforDetail(Tag genre);

	/**
	 * 해당 장르가 가지고 있는 Fx태그를 전체 조회한다
	 * @param genre - 클라이언트가 선택한 장르
	 * @return - 태그 조회 결과
	 */
	public List<Tag> selectTagByGenreforFx(Tag genre);

	/**
	 * 클라이언트가 선택한 장르를 토대로 음원소스 정보를 조회한다
	 * 
	 * @param list - 클라이언트가 선택한 태그(장르 + @ )
	 * @return - 선택한 장르의 음원소스 집합
	 */
	public List<Map<String, Object>> selectSourceByGenre(Map<String, Object> list);

	/**
	 * DB에 Like를 삽입한다
	 * 
	 * @param userNo - 좋아요 누른 회원
	 * @param sourceNo - 좋아요 눌린 음원소스
	 */
	public void insertSourceLike(SourceLike like);

	/**
	 * 누른 음원소스에 대한 좋아요 이력을 확인한다
	 * 
	 * @param like - 좋아요를 누른 객체 정보
	 * @return - 조회된 행 수
	 */
	public int selectByLike(SourceLike like);

	/**
	 * 눌렀던 음원 소스에 대한 좋아요 이력을 삭제한다
	 * @param like - 삭제할 좋아요 정보
	 */
	public void deleteByLike(SourceLike like);

	/**
	 * 클라이언트가 요청한 다운로드 파일의 정보를 조회한다
	 * @param down - 다운로드를 요청한 sourceNo를 가진 객체
	 * @return - 요청한 다운로드 파일 정보
	 */
	public SourceFileInfo selectBySourceNoforFile(SourceFileInfo down);

	/**
	 * 해당 악기 또는 디테일 태그를 가진 
	 * 장르 태그를 검색한다
	 * 
	 * @param instrument - instrument 또는 detail이 들어간 태그
	 * @return - instrumnet, detail이 들어간 장르 태그 List
	 */
	public List<Tag> selectTagByInstDetail(Tag instrument);

	/**
	 * 해당 악기 또는 디테일 태그를 가진
	 * scape를 검색한다
	 * @param instrument - instrument나 detail이 들어간 태그
	 * @return - nstrumnet, detail이 들어간 악기 태그 List
	 */
	public List<Tag> selectScapeByInstDetail(Tag instrument);

	/**
	 * 해당 악기 또는 디테일 태그를 가진
	 * Fx 태그를 검색한다
	 * @param instrument - instrument나 detail이 들어간 태그
	 * @return - nstrumnet, detail이 들어간 효과음 태그 List
	 */
	public List<Tag> selectFxByInstDetail(Tag instrument);

	/**
	 * 악기만 선택한 경우에 디테일 태그를 조회한다
	 * @param instrument - inst만 선택한 객체
	 * @return - detail 태그 List
	 */
	public List<Tag> selectDetailByInst(Tag instrument);

	/**
	 * 사용자가 선택한 Inst 또는 Inst와 Detail에 맞는
	 * 음원소스 조회 결과를 반환한다
	 *
	 * 
	 * @param list - inst / inst,Detail 이 들어있는 객체
	 * @return - 조회 결과
	 */
	public List<Map<String, Object>> selectSourceByInstDetail(Map<String, Object> list);

	/**
	 * Sound 초기 화면의 최신 업로드 순의 Pack 정보 10개를 가져온다
	 * @return - 최신 업로드 10개 Pack 자료
	 */
	public List<Map<String, Object>> selectPackForSound();

	/**
	 * Sound 초기 화면의 최다 좋아요 순의 Pack 정보를 10개 가져온다
	 * @return - 최다 좋아요 10개 Pack 자료
	 */
	public List<Map<String, Object>> selectLikePackForSound();

	/**
	 * PackNo에 맞는 Pack 세부 페이지로 이동을 할 때
	 * 필요한 모든 정보를 DB에서 조회한다
	 * 또한, 태그 클릭 시 조건을 추가한 정보를 조회횐다
	 * 
	 * @param list - 조회하려는 PackNo와, Tag 조건을 가진 객체
	 * @return
	 */
	public List<Map<String, Object>> selectPackByPackNo(Map<String, Object> list);

	/**
	 * PackNo에 맞는 Pack의 단일(1개) 세부 정보를 조회한다
	 * 이름, 사진, 설명을 조회한다
	 * 
	 * @param packNo - 정보 조회 요청 객체
	 * @return - 조회된 요청 정보
	 */
	public Map<String, Object> selectPackInfoByPackNo(int packNo);

	/**
	 * packNo를 이용 해당 Pack이 가진 Genre를 중복 없이 조회한다
	 * @param packNo - 요청 PackNo
	 * @return - 조회결과
	 */
	public List<Map<String, Object>> selectPackGenreByPackNo(int packNo);

	/**
	 * packNo를 이용 해당 Pack이 가진 Inst를 중복 없이 조회한다
	 * @param packNo - 요청 PackNo
	 * @return - 조회 결과
	 */
	public List<Map<String, Object>> selectPackInstByPackNo(int packNo);

	/**
	 * packNo를 이용 해당 pack이 가진 Detail을 중복 없이 조회한다
	 * @param packNo - 요청 PackNo
	 * @return - 조회 결과
	 */
	public List<Map<String, Object>> selectPackDetailByPackNo(int packNo);

	/**
	 * packNo를 이용 해당 pack이 가진 Scape를 중복 없이 조회한다
	 * @param packNo - 요청 packNo
	 * @return - 조회 결과
	 */
	public List<Map<String, Object>> selectPackScapeByPackNo(int packNo);

	/**
	 * packNo를 이용 해당 pack이 가진 Fx를 중복 없이 조회한다
	 * @param packNo - 요청 packNo
	 * @return -  조회결과
	 */
	public List<Map<String, Object>> selectPackFxByPackNo(int packNo);

	/**
	 * Pack 좋아요를 눌렀을 때 
	 * 기존에 좋아요를 누른 이력이 있는지 확인한다
	 * 
	 * @param like
	 * @return 1이상 : 이력있음, 0 : 없음
	 */
	public int selectByPackLike(PackLike like);

	/**
	 * Pack 좋아요 이력을 삭제한다
	 * 
	 * @param like - 좋아요를 누른 pack정보
	 */
	public void deleteByPackLike(PackLike like);

	/**
	 * Pack 좋아요를 추가한다
	 * @param like - 좋아요를 누른 Pack 정보
	 */
	public void insertPackLike(PackLike like);

	/**
	 * Pack이 가지고 있는 좋아요 수를 조회한다
	 * @param like - 좋아요 조회 요청 Pack 정보
	 * @return - 좋아요 int형 숫자
	 */
	public int selectPackLikeCnt(PackLike like);

	/**
	 * Pack단위로 보여주는 페이지에서 
	 * 조회할 모든 Pack의 정보를 조회한다
	 * 
	 * 장르, 악기별로 가능
	 * @param tag - 조회 조건 ( 악기, 장르 )
	 * 
	 * @return - 조회된 Pack 정보 
	 */
	public List<Map<String, Object>> selectPackInfos(Tag tag);

	/**
	 * 로그인 된 회원이 가지고 있는
	 * 음원소스를 DB에서 조회한다
	 * 
	 * @param userNo - 조회를 요청한 회원정보
	 * @return - 조회 결과
	 */
	public List<Map<String, Object>> selectMySourcebyUserNo(int userNo);




}

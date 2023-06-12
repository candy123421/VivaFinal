package web.dao.face;


import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import web.dto.UserProfile;
import web.dto.Users;

public interface UsersDao {

	/**
	 * id/pw가 일치하는 사용자 수를 반환한다
	 * 	-> 로그인 인증에 활용한다
	 * 
	 * @param member - 조회할 id/pw를 가진 객체
	 * @return 조회된 행 수
	 */
	public int selectCntMember(Users users);

	/**
	 * id을 이용하여 nick을 조회한다
	 * 
	 * @param member - 조회하려는 회원의 id를 가진 객체
	 * @return 조회된 nick
	 */
	public String selectNickByMember(Users users);

	/**
	 * 회원 id가 존재하는 값인지 확인한다
	 * 중복된 id인지 확인
	 * 
	 * @param member - 조회하려는 회원의 id를 가진 객체
	 * @return 존재 여부 (0 - 없음, 1 - 있음)
	 */
	public int selectCntById(Users users);

	/**
	 * 신규 회원의 정보를 새롭게 삽입한다
	 * 
	 * @param member - 신규 회원 정보
	 */
	public void insert(Users users);

	/**
	 * 회원 아이디 조회
	 * 
	 * @param users
	 * @return
	 */
	public Users getUserNo(Users users);


	/**
	 * DB에 카카오 Id들어가있으면 1, 아니면 0 반환
	 * 
	 * @param users
	 * @return
	 */
	public int selectByKakaoId(Users users);


	/**
	 * DB에 카카오 Id없으면 회원가입시키기
	 * 
	 * @param users
	 */
	public void insertkakao(Users users);

	/**
	 * DB에 사용자 아이디 존재여부 확인
	 * 
	 * @param users
	 * @return
	 */
	public int checkUserId(Users users);

	/**
	 * DB에 사용자 닉네임 존재여부 확인
	 * 
	 * 
	 * @param users
	 * @return
	 */
	public int checkUserNick(Users users);

	/**
	 * 회원 번호  조회
	 * 
	 * @param users
	 * @return
	 */
	public int selectAllInfo(Users users);

	/**
	 * 아이디 찾기 - 사용자 이름과 이메일 존재여부 
	 * 
	 * @param users
	 * @return
	 */
	public Users checkUserNameEmail(Users users);

	/**
	 * 비밀번호 찾기 - 사용자 아이디와 이메일 존재여부
	 * 
	 * @param users
	 * @return
	 */
	public Users checkUserIdEmail(Users users);


	/**
	 * 비밀번호 찾기 - 새로운 비밀번호 설정하기
	 * 
	 * @param users
	 */
	public void updatePw(Users users);

	/**
	 * 회원 모든 정보 저장
	 * 
	 * @param userNo
	 * @return 
	 */
	public Users selectUserAll(int userNo);

	/**
	 * 유저번호로 회원탈퇴하기
	 * 
	 * @param userno
	 */
	public void deleteInfo(int userno);

	/**
	 * 수정 페이지에서 기존에 등록된 프로필 사진을 조회한다
	 * @param users - 조회할 사용자 정보
	 * @return - 사용자에 맞는 프로필 이미지 정보
	 */
	public Map<String, Object> selectProfile(Users users);

	/**
	 * 회원정보 수정 - 프로필사진 삽입
	 * 
	 * @param file
	 */
	public void insertUserProfile(UserProfile file);

	/**
	 * 회원정보 수정 - 비밀번호, 닉네임 수정
	 * 
	 * @param profile
	 */
	public void insertUserInfo(Users users);

	/**
	 * db에 프로필 사진번호 존재유무 확인
	 * 
	 * @param users
	 * @return
	 */
	public int selectCntProfile(Users users);

	/**
	 * 회원정보 수정 - 프로필사진 업데이트
	 * 
	 * @param file
	 */
//	public void updateUserProfile(UserProfile file);


	/**
	 * 기존에 프로필 사진이 있는 경우 삭제한다
	 * 
	 * @param userNo - 프로필 사진을 삭제할 회원정보
	 */
	public void deleteProfile(int userNo);

	/**
	 * 메인 프로필사진 저장
	 * 
	 * @param userNo
	 * @return 
	 */
	public String selectStoredName(int userNo);

	/**
	 * 회원정보 수정 - 닉네임 중복검사를 위해 닉네임 가져오기
	 * 
	 * @param users
	 * @return 
	 */
	public String selectUpdateNick(Users users);

}

package web.service.face;


import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import web.dto.UserProfile;
import web.dto.Users;

public interface UsersService {

	/**
	 * 로그인 인증 처리
	 * 
	 * @param member - 입력한 ID/PW 정보
	 * @return 로그인 인증 결과
	 */
	public boolean login(Users users);

	/**
	 * 회원의 닉네임 조회
	 * 
	 * @param member - 닉네임을 조회하려는 사용자의 정보
	 * @return 사용자의 닉네임
	 */
	public String getNick(Users users);

	/**
	 * 신규 회원 가입
	 * 
	 * @param member - 신규 회원의 정보
	 * @return 회원가입 결과
	 */
	public boolean join(Users users);

	/**
	 * 유저 아이디 조회
	 * 
	 * @param users
	 * @return
	 */
	public Users getNo(Users users);

	/**
	 * 카카오 ID 있으면 true값
	 * 
	 * @param userInfo
	 */
	public boolean getkakaoId(Users users);


	/**
	 * 카카오 정보를 받아와서 회원가입
	 * 
	 * @param users
	 * @return
	 */
	public void kakaojoin(Users users);

	/**
	 * 중복 아이디 검사
	 * 
	 * @param users
	 * @return
	 */
	public int idCheck(Users users);

	/**
	 * 중복 닉네임 검사
	 * 
	 * @param users
	 * @return
	 */
	public int nickCheck(Users users);

	/**
	 * 회원 정보 조회
	 * 
	 * @param users
	 * @return
	 */
	public int selectAll(Users users);

	/**
	 * 아이디찾기 - 사용자 이름과 이메일 존재여부
	 * 
	 * @param users
	 * @return
	 */
	public Users nameEmailCheck(Users users);

	/**
	 * 비밀번호 찾기 - 사용자 아이디와 이메일 존재여부
	 * 
	 * @param users
	 * @return
	 */
	public Users idEmailCheck(Users users);

	/**
	 * 비밀번호 찾기 - 새로운 비밀번호 설정하기
	 * 
	 * @param users
	 */
	public void update(Users users);

	/**
	 * 회원탈퇴하기
	 * 
	 * @param userno
	 */
	public void deleteInfo(int userno);

	/**
	 * 회원 모든 정보 저장
	 * 
	 * @param userNo
	 * @return 
	 */
	public Users selectAllInfo(int userNo);

	/**
	 * userno로 프로필사진정보 조회
	 * 
	 * @param users
	 * @return
	 */
	public Map<String, Object> profileInfo(Users users);

	/**
	 * 마이페이지 수정하기 버튼을 누르면
	 * 프로필 insert ( 파일 업로드 )
	 * 회원정보수정이 진행된다 ( 비밀번호, 닉네임 )
	 * 
	 * @param users - 회원정보수정 요청한 사용자
	 * @param profile - 회원이 업데이트 하려는 프로필사진
	 */
	public void insertProfile(Users users, MultipartFile profile);

	/**
	 * 프로필번호 존재하는지 확인
	 * 
	 * @param users
	 * @return
	 */
	public boolean selectFileNo(Users users);

	/**
	 * 회원정보 수정 - 프로필 update
	 * 
	 * @param users
	 * @param profile
	 */
	public void updateProfile(Users users, MultipartFile profile);

	/**
	 * 회원정보 수정- 프로필사진 올리지않으면 비밀번호,닉네임만 수정
	 * 
	 * @param users
	 * @param profile
	 */
	public void updateIdPw(Users users, MultipartFile profile);

	/**
	 * 프로필사진 가져오기
	 * 
	 * @param userNo
	 */
	public String selectStoredName(int userNo);

	/**
	 * 회원정보 수정 - 닉네임중복검사
	 * 
	 * @param users
	 * @return
	 */
	public boolean updateNickCheck(Users users);


}

package web.service.face;

import web.dto.Admin;

public interface AdminService {

	/**
	 * admin 로그인 id , pw일치하는지 
	 * @param admin
	 * @return
	 */
	public boolean adminLogin(Admin admin);

	/**
	 * admin 번호 알아오기
	 * @param admin
	 * @return 
	 */
	public Admin getAdminNo(Admin admin);

	

}

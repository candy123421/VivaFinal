package web.dao.face;

import web.dto.Admin;

public interface AdminDao {

	/**
	 * admin-id와 pw가 일치하는지 count로 알아내기
	 * @param admin
	 * @return
	 */
	public int selectCntByAdminIdPw(Admin admin);

	/**
	 * adminNo 알아오기
	 * @param admin
	 * @return 
	 */
	public Admin selectAdminNo(Admin admin);



}

package web.service.face;

public interface MailSendService {

	/**
	 * 이메일 인증 api
	 *
	 * @param email
	 */
	public int joinEmail(String email);

}

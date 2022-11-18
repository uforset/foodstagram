ackage com.circle.foodstagram.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{

	private static final long serialVersionUID = -8711503667562197576L;
	
	private String userid;
	private String userpwd;
	private String username;
	private String gender;
	private java.sql.Date birth_date;
	private String email;
	private String loginok;
	private String useradmin;
	
	public Member() {}

	public Member(String userid, String userpwd, String username, String gender, Date birth_date, String email,
			String loginok, String useradmin) {
		super();
		this.userid = userid;
		this.userpwd = userpwd;
		this.username = username;
		this.gender = gender;
		this.birth_date = birth_date;
		this.email = email;
		this.loginok = loginok;
		this.useradmin = useradmin;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public java.sql.Date getBirth_date() {
		return birth_date;
	}

	public void setBirth_date(java.sql.Date birth_date) {
		this.birth_date = birth_date;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLoginok() {
		return loginok;
	}

	public void setLoginok(String loginok) {
		this.loginok = loginok;
	}

	public String getUseradmin() {
		return useradmin;
	}

	public void setUseradmin(String useradmin) {
		this.useradmin = useradmin;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Member [userid=" + userid + ", userpwd=" + userpwd + ", username=" + username + ", gender=" + gender
				+ ", birth_date=" + birth_date + ", email=" + email + ", loginok=" + loginok + ", useradmin="
				+ useradmin + "]";
	}
	
}
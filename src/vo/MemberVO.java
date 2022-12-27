package vo;

public class MemberVO {

	private String id;
	private String pw;
	private String name;
	private int sex;
	private int birthDate;
	private String phone;
	private String email;
	/////////////////////////////////////////////////////////////

	public MemberVO() {
	}

	public MemberVO(String id, String pw, String name, int sex, int birthDate, String phone, String email) {

		this.id = id;
		this.pw = pw;
		this.name = name;
		this.sex = sex;
		this.birthDate = birthDate;
		this.phone = phone;
		this.email = email;
	}

	/////////////////////////////////////////////////////////////
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public int getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(int birthDate) {
		this.birthDate = birthDate;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	/////////////////////////////////////////////////////////////

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pw=" + pw + ", name=" + name + ", sex=" + sex + ", birthDate=" + birthDate
				+ ", phone=" + phone + ", email=" + email + "]";
	}

}
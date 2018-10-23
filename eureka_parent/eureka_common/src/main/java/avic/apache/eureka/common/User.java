package avic.apache.eureka.common;

import java.io.Serializable;
import java.util.Date;

/**
 * 测试对象类
 * 
 * @author Liang
 *
 */
public class User implements Serializable {

	private static final long serialVersionUID = 290114224086980273L;

	private String name;

	private Long age;

	private Date birthday;

	private String sex;

	private String nation;

	private String birthAddress;

	private String polity;

	private Date workDate;

	private String title;

	private String degree;

	private String education;

	private String mobile;

	private String officeTel;

	private String fax;

	private String email;

	private String workSpace;

	private String roomNo;

	private String homeAddress;

	private String homeZip;

	private String homeTel;

	public User() {
		super();
	}

	public User(String name, Long age) {
		super();
		this.name = name;
		this.age = age;
	}

	public User(String name, Long age, String sex, String nation, String birthAddress, String polity, String title,
			String degree, String education, String mobile, String officeTel, String fax, String email,
			String workSpace, String roomNo, String homeAddress, String homeZip, String homeTel, Date birthday,
			Date workDate) {
		super();
		this.name = name;
		this.age = age;
		this.birthday = birthday;
		this.sex = sex;
		this.nation = nation;
		this.birthAddress = birthAddress;
		this.polity = polity;
		this.workDate = workDate;
		this.title = title;
		this.degree = degree;
		this.education = education;
		this.mobile = mobile;
		this.officeTel = officeTel;
		this.fax = fax;
		this.email = email;
		this.workSpace = workSpace;
		this.roomNo = roomNo;
		this.homeAddress = homeAddress;
		this.homeZip = homeZip;
		this.homeTel = homeTel;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getAge() {
		return age;
	}

	public void setAge(Long age) {
		this.age = age;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getBirthAddress() {
		return birthAddress;
	}

	public void setBirthAddress(String birthAddress) {
		this.birthAddress = birthAddress;
	}

	public String getPolity() {
		return polity;
	}

	public void setPolity(String polity) {
		this.polity = polity;
	}

	public Date getWorkDate() {
		return workDate;
	}

	public void setWorkDate(Date workDate) {
		this.workDate = workDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getOfficeTel() {
		return officeTel;
	}

	public void setOfficeTel(String officeTel) {
		this.officeTel = officeTel;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getWorkSpace() {
		return workSpace;
	}

	public void setWorkSpace(String workSpace) {
		this.workSpace = workSpace;
	}

	public String getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}

	public String getHomeAddress() {
		return homeAddress;
	}

	public void setHomeAddress(String homeAddress) {
		this.homeAddress = homeAddress;
	}

	public String getHomeZip() {
		return homeZip;
	}

	public void setHomeZip(String homeZip) {
		this.homeZip = homeZip;
	}

	public String getHomeTel() {
		return homeTel;
	}

	public void setHomeTel(String homeTel) {
		this.homeTel = homeTel;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((age == null) ? 0 : age.hashCode());
		result = prime * result + ((birthAddress == null) ? 0 : birthAddress.hashCode());
		result = prime * result + ((birthday == null) ? 0 : birthday.hashCode());
		result = prime * result + ((degree == null) ? 0 : degree.hashCode());
		result = prime * result + ((education == null) ? 0 : education.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((fax == null) ? 0 : fax.hashCode());
		result = prime * result + ((homeAddress == null) ? 0 : homeAddress.hashCode());
		result = prime * result + ((homeTel == null) ? 0 : homeTel.hashCode());
		result = prime * result + ((homeZip == null) ? 0 : homeZip.hashCode());
		result = prime * result + ((mobile == null) ? 0 : mobile.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((nation == null) ? 0 : nation.hashCode());
		result = prime * result + ((officeTel == null) ? 0 : officeTel.hashCode());
		result = prime * result + ((polity == null) ? 0 : polity.hashCode());
		result = prime * result + ((roomNo == null) ? 0 : roomNo.hashCode());
		result = prime * result + ((sex == null) ? 0 : sex.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + ((workDate == null) ? 0 : workDate.hashCode());
		result = prime * result + ((workSpace == null) ? 0 : workSpace.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (age == null) {
			if (other.age != null)
				return false;
		} else if (!age.equals(other.age))
			return false;
		if (birthAddress == null) {
			if (other.birthAddress != null)
				return false;
		} else if (!birthAddress.equals(other.birthAddress))
			return false;
		if (birthday == null) {
			if (other.birthday != null)
				return false;
		} else if (!birthday.equals(other.birthday))
			return false;
		if (degree == null) {
			if (other.degree != null)
				return false;
		} else if (!degree.equals(other.degree))
			return false;
		if (education == null) {
			if (other.education != null)
				return false;
		} else if (!education.equals(other.education))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (fax == null) {
			if (other.fax != null)
				return false;
		} else if (!fax.equals(other.fax))
			return false;
		if (homeAddress == null) {
			if (other.homeAddress != null)
				return false;
		} else if (!homeAddress.equals(other.homeAddress))
			return false;
		if (homeTel == null) {
			if (other.homeTel != null)
				return false;
		} else if (!homeTel.equals(other.homeTel))
			return false;
		if (homeZip == null) {
			if (other.homeZip != null)
				return false;
		} else if (!homeZip.equals(other.homeZip))
			return false;
		if (mobile == null) {
			if (other.mobile != null)
				return false;
		} else if (!mobile.equals(other.mobile))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (nation == null) {
			if (other.nation != null)
				return false;
		} else if (!nation.equals(other.nation))
			return false;
		if (officeTel == null) {
			if (other.officeTel != null)
				return false;
		} else if (!officeTel.equals(other.officeTel))
			return false;
		if (polity == null) {
			if (other.polity != null)
				return false;
		} else if (!polity.equals(other.polity))
			return false;
		if (roomNo == null) {
			if (other.roomNo != null)
				return false;
		} else if (!roomNo.equals(other.roomNo))
			return false;
		if (sex == null) {
			if (other.sex != null)
				return false;
		} else if (!sex.equals(other.sex))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (workDate == null) {
			if (other.workDate != null)
				return false;
		} else if (!workDate.equals(other.workDate))
			return false;
		if (workSpace == null) {
			if (other.workSpace != null)
				return false;
		} else if (!workSpace.equals(other.workSpace))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "User [name=" + name + ", age=" + age + ", birthday=" + birthday + ", sex=" + sex + ", nation=" + nation
				+ ", birthAddress=" + birthAddress + ", polity=" + polity + ", workDate=" + workDate + ", title="
				+ title + ", degree=" + degree + ", education=" + education + ", mobile=" + mobile + ", officeTel="
				+ officeTel + ", fax=" + fax + ", email=" + email + ", workSpace=" + workSpace + ", roomNo=" + roomNo
				+ ", homeAddress=" + homeAddress + ", homeZip=" + homeZip + ", homeTel=" + homeTel + "]";
	}
}

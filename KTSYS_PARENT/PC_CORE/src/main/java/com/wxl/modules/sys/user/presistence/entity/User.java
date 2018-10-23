package com.wxl.modules.sys.user.presistence.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.wxl.common.provider.singletable.presistence.entity.SingleTableEntity;
import com.wxl.common.utils.Collections3;
import com.wxl.common.utils.excel.annotation.ExcelField;
import com.wxl.common.utils.excel.fieldtype.RoleListType;
import com.wxl.modules.sys.office.presistence.entity.Office;
import com.wxl.modules.sys.role.presistence.entity.Role;

/**
 * 用户Entity
 * 
 * 
 * @author wxl
 * 
 * @date 2017年7月28日 下午2:36:14
 */
public class User extends SingleTableEntity {

	private static final long serialVersionUID = 1L;

	/** 工号 */
	private String no;

	/** 姓名 */
	private String name;

	/** 归属公司 */
	private Office company;

	/** 归属部门 */
	private Office office;

	/** 登录名 */
	private String loginName;

	/** 密码 */
	private String password;

	/** 邮箱 */
	private String email;

	/** 电话 */
	private String phone;

	/** 手机 */
	private String mobile;

	/** 用户类型 */
	private String userType;

	/** 头像 */
	private String photo;

	/** 拥有角色列表 */
	private List<Role> roleList = new ArrayList<>();

	/** 性别 */
	private String gender;

	/** 身份证号 */
	private String idcard;

	/** 出生年月 */
	private Date birthday;

	/** 民族 */
	private String nation;

	/** qq */
	private String qq;

	public User() {
		super();
		this.userType = "";
	}

	public User(String id) {
		this.id = id;
	}

	public User(String id, String loginName) {
		this.id = id;
		this.loginName = loginName;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@ExcelField(title = "ID", type = 1, align = 2, sort = 1)
	public String getId() {
		return id;
	}

	// @JsonIgnore
	@ExcelField(title = "归属公司", align = 2, sort = 3)
	public Office getCompany() {
		return company;
	}

	public void setCompany(Office company) {
		this.company = company;
	}

	// @JsonIgnore
	@ExcelField(title = "归属部门", align = 2, sort = 4)
	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}

	@ExcelField(title = "登录名", type = 1, align = 2, sort = 30)
	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	@JsonIgnore
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@ExcelField(title = "姓名", align = 2, sort = 5, fieldType = String.class)
	public String getName() {
		return name;
	}

	@ExcelField(title = "工号", align = 2, sort = 6, fieldType = String.class)
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public void setName(String name) {
		this.name = name;
	}

	@ExcelField(title = "邮箱", align = 1, sort = 19, fieldType = String.class)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@ExcelField(title = "电话", align = 2, sort = 17, fieldType = String.class)
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@ExcelField(title = "手机", align = 2, sort = 18, fieldType = String.class)
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	@ExcelField(title = "备注", type = 1, align = 1, sort = 900)
	public String getRemarks() {
		return remarks;
	}

	@ExcelField(title = "用户类型", type = 1, align = 2, sort = 80, dictType = "sys_user_type")
	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	@ExcelField(title = "创建时间", type = 1, align = 1, sort = 90)
	public Date getCreateDate() {
		return createDate;
	}

	@JsonIgnore
	@ExcelField(title = "拥有角色", type = 1, align = 1, sort = 800, fieldType = RoleListType.class)
	public List<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}

	@JsonIgnore
	public List<String> getRoleIdList() {
		List<String> roleIdList = new ArrayList<>();
		for (Role role : roleList) {
			roleIdList.add(role.getId());
		}
		return roleIdList;
	}

	@JsonIgnore
	public String getRoleIds() {
		return StringUtils.join(getRoleIdList(), ",");
	}

	public void setRoleIdList(List<String> roleIdList) {
		roleList = new ArrayList<>();
		for (String roleId : roleIdList) {
			Role role = new Role();
			role.setId(roleId);
			roleList.add(role);
		}
	}

	/**
	 * 用户拥有的角色名称字符串, 多个角色名称用','分隔.
	 */
	public String getRoleNames() {
		return Collections3.extractToString(roleList, "name", ",");
	}

	public boolean isAdmin() {
		return isAdmin(this.id);
	}

	public static boolean isAdmin(String id) {
		return id != null && ("1".equals(id) || "admin".endsWith(id));
	}

	@ExcelField(title = "身份证号", align = 2, sort = 10, fieldType = String.class)
	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	@ExcelField(title = "性别", align = 2, sort = 7, fieldType = String.class)
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@ExcelField(title = "出生年月", align = 2, sort = 9, fieldType = String.class)
	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	@ExcelField(title = "民族", align = 2, sort = 8, fieldType = String.class)
	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	@ExcelField(title = "QQ", align = 2, sort = 20, fieldType = String.class)
	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	@Override
	public String toString() {
		return this.name;
	}
}
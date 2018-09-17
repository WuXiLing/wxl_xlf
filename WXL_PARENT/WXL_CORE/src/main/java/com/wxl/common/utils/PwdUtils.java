package com.wxl.common.utils;

import com.wxl.common.security.Digests;

/**
 * 密碼工具類
 * 
 * @author wxl
 * 
 * @date 2017年7月29日 上午10:42:49
 */
public class PwdUtils {

	public static final String HASH_ALGORITHM = "SHA-1";

	/** 迭代次数 */
	public static final int HASH_INTERATIONS = 1024;

	/** 加盐值大小 */
	public static final int SALT_SIZE = 8;

	/**
	 * 生成安全的密码，生成随机的16位salt并经过1024次 sha-1 hash
	 * 
	 * @param plainPassword
	 *            明文密码
	 * @return 加密后的密文密码
	 */
	public static String entryptPassword(String plainPassword) {
		byte[] salt = Digests.generateSalt(SALT_SIZE);
		byte[] hashPassword = Digests.sha1(plainPassword.getBytes(), salt, HASH_INTERATIONS);
		return Encodes.encodeHex(salt) + Encodes.encodeHex(hashPassword);
	}

	/**
	 * 验证密码
	 * 
	 * @param plainPassword
	 *            明文密码
	 * @param password
	 *            密文密码
	 * @return 验证成功返回true
	 */
	public static boolean validatePassword(String plainPassword, String password) {
		byte[] salt = Encodes.decodeHex(password.substring(0, 16));
		byte[] hashPassword = Digests.sha1(plainPassword.getBytes(), salt, HASH_INTERATIONS);
		return password.equals(Encodes.encodeHex(salt) + Encodes.encodeHex(hashPassword));
	}
}

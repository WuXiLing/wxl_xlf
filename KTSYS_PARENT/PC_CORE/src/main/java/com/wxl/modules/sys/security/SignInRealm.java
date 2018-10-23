package com.wxl.modules.sys.security;

import org.apache.shiro.cas.CasRealm;
import org.springframework.stereotype.Service;

/**
 * 单点登录认证
 *
 * @author wxl
 * @date 2018年2月3日 下午7:53:49
 * @version 1.0
 * @since JDK 1.8
 */
@Service
public class SignInRealm extends CasRealm {

	/**
	 * 构造函数
	 */
	public SignInRealm() {
		super();
	}
}

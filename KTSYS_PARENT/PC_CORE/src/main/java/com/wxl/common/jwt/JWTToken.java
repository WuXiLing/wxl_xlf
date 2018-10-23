package com.wxl.common.jwt;

import org.apache.shiro.authc.AuthenticationToken;

/**
 * JWTtoken
 * 
 * @author Liang
 *
 */
public class JWTToken implements AuthenticationToken {

	private static final long serialVersionUID = -7552210116069905335L;
	
	// 密钥
    private String token;

    public JWTToken(String token) {
        this.token = token;
    }

    @Override
    public Object getPrincipal() {
        return token;
    }

    @Override
    public Object getCredentials() {
        return token;
    }
}

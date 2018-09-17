package com.wxl.common.security.shiro.session;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.eis.AbstractSessionDAO;
import org.springframework.beans.factory.annotation.Autowired;

import com.wxl.common.security.shiro.cache.RedisManager;

/**
 * Redis的session管理Dao
 * 
 * @author Liang
 *
 */
public class RedisSessionDao extends AbstractSessionDAO implements SessionDAO{

	@Autowired
	private RedisManager redisManager;

	@Override
	public void update(Session session) throws UnknownSessionException {
		if (session == null || session.getId() == null) {
			System.out.println("Session is null");
			return;
		}
		Serializable sessionId = session.getId();
		redisManager.hadd(sessionId.toString(), session);
	}

	@Override
	public void delete(Session session) {
		if (session == null || session.getId() == null) {
			System.out.println("Session is null");
			return;
		}
		redisManager.hdelete(session.getId().toString());
	}

	@Override
	public Collection<Session> getActiveSessions() {
		List<Session> list = redisManager.hmget();
		return list;
	}

	@Override
	protected Serializable doCreate(Session session) {
		Serializable sessionId = generateSessionId(session);
		assignSessionId(session, sessionId);
		// 添加进redis
		redisManager.hadd(sessionId.toString(), session);

		return sessionId;
	}

	@Override
	protected Session doReadSession(Serializable sessionId) {
		return redisManager.hget(sessionId.toString());
	}

	@Override
	public Collection<Session> getActiveSessions(boolean includeLeave) {
		return redisManager.hmget();
	}

	@Override
	public Collection<Session> getActiveSessions(boolean includeLeave, Object principal, Session filterSession) {
		return redisManager.hmget();
	}
}

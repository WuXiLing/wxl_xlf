package com.wxl.common.exception;

/**
 * redis设置的超时时间超出合理范围
 * <pre>
 *   <ol>
 *      <li>时间小于等于0</li>
 *      <li>时间不等于-1</li>
 *   <ol>
 * </pre>
 * 
 * 
 * @author Liang
 *
 */
public class RedisExpireOutOfRangeException extends RuntimeException{

	private static final long serialVersionUID = -3009817256838417376L;

	/**
     * Constructs a {@code RedisExpireOutOfRangeException} with no detail message.
     */
    public RedisExpireOutOfRangeException() {
        super();
    }

    /**
     * Constructs a {@code RedisExpireOutOfRangeException} with the specified
     * detail message.
     *
     * @param   s   the detail message.
     */
    public RedisExpireOutOfRangeException(String s) {
        super(s);
    }
}

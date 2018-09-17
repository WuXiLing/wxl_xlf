package com.wxl.common.interceptor.dialect.db;

import org.apache.commons.lang3.StringUtils;

import com.wxl.common.provider.utils.BasePage;

/**
 * SQLServer2005数据库方言
 *
 * @author wxl
 * @date 2018年1月20日 上午2:41:16
 * @version 1.0
 * @since JDK 1.8
 */
public class SQLServer2005Dialect extends AbstractDbDialect  {

    /**
     * Add a LIMIT clause to the given SQL SELECT
     * <p/>
     * The LIMIT SQL will look like:
     * <p/>
     * WITH query AS
     * (SELECT TOP 100 percent ROW_NUMBER() OVER (ORDER BY CURRENT_TIMESTAMP) as __row_number__, * from table_name)
     * SELECT *
     * FROM query
     * WHERE __row_number__ BETWEEN :offset and :lastRows
     * ORDER BY __row_number__
     *
     * @param querySqlString   The SQL statement to base the limit query off of.
     * @param offset           Offset of the first row to be returned by the query (zero-based)
     * @param limit            Maximum number of rows to be returned by the query
     * @param limitPlaceholder limitPlaceholder
     * @return A new SQL statement with the LIMIT clause applied.
     */
	public String getLimitString(String querySqlString, int offset, int limit, String limitPlaceholder) {
        StringBuilder pagingBuilder = new StringBuilder();
        String orderby = getOrderByPart(querySqlString);
        String distinctStr = "";

        String loweredString = querySqlString.toLowerCase();
        String sqlPartString = querySqlString;
        if (loweredString.trim().startsWith("select")) {
            int index = 6;
            if (loweredString.startsWith("select distinct")) {
                distinctStr = "DISTINCT ";
                index = 15;
            }
            sqlPartString = sqlPartString.substring(index);
        }
        pagingBuilder.append(sqlPartString);

        // if no ORDER BY is specified use fake ORDER BY field to avoid errors
        if (StringUtils.isEmpty(orderby)) {
            orderby = "ORDER BY CURRENT_TIMESTAMP";
        }

        StringBuilder result = new StringBuilder();
        result.append("WITH query AS (SELECT ")
                .append(distinctStr)
                .append("TOP 100 PERCENT ")
                .append(" ROW_NUMBER() OVER (")
                .append(orderby)
                .append(") as __row_number__, ")
                .append(pagingBuilder)
                .append(") SELECT * FROM query WHERE __row_number__ BETWEEN ")
                .append(offset).append(" AND ").append(offset + limit)
                .append(" ORDER BY __row_number__");

        return result.toString();
    }

    static String getOrderByPart(String sql) {
        String loweredString = sql.toLowerCase();
        int orderByIndex = loweredString.indexOf("order by");
        if (orderByIndex != -1) {
            // if we find a new "order by" then we need to ignore
            // the previous one since it was probably used for a subquery
            return sql.substring(orderByIndex);
        } else {
            return "";
        }
    }

	/* (non-Javadoc)
	 * @see com.wxl.common.interceptor.dialect.DbDialect#buildPageSql(com.wxl.common.provider.utils.BasePage, java.lang.String)
	 */
	@Override
	public String buildPageSql(BasePage page, String sql) {
		// TODO Auto-generated method stub
		return null;
	}
}

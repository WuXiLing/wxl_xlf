package init;

import java.util.Map.Entry;
import java.util.Set;

import com.alibaba.fastjson.JSONObject;

public class Test {
	
	public static void main(String[] args) {
		
		JSONObject jsStr = JSONObject.parseObject("{\"swagger\":\"2.0\",\"info\":{\"description\":\"接口信息\",\"version\":\"1.1.0\",\"title\":\"巫溪灵接口列表 v1.0\",\"termsOfService\":\"http://honghu.com\",\"contact\":{\"email\":\"WuXiLing\"}},\"host\":\"127.0.0.1:8082\",\"basePath\":\"/wxl\",\"tags\":[{\"name\":\"rest-user-controller\",\"description\":\"Rest User Controller\"}],\"paths\":{\"/rest/user/{id}\":{\"get\":{\"tags\":[\"rest-user-controller\"],\"summary\":\"get\",\"operationId\":\"getUsingGET\",\"consumes\":[\"application/json\"],\"produces\":[\"*/*\"],\"parameters\":[{\"name\":\"id\",\"in\":\"path\",\"description\":\"id\",\"required\":true,\"type\":\"string\"}],\"responses\":{\"200\":{\"description\":\"OK\",\"schema\":{\"type\":\"string\"}},\"401\":{\"description\":\"Unauthorized\"},\"403\":{\"description\":\"Forbidden\"},\"404\":{\"description\":\"Not Found\"}}}}}}");
		
		Set<Entry<String,Object>> obj =  jsStr.entrySet();
		
		for(Entry<String,Object> entry : obj) {
			System.out.println(entry.getKey());
			System.out.println(entry.getValue());
		}
//		jsStr.containsKey("swagger");

	}

}

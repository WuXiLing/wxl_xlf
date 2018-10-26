package init;

import java.util.Map.Entry;
import java.util.Set;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.parser.Feature;
import com.alibaba.fastjson.serializer.SerializerFeature;

public class Test {
	
	public static void main(String[] args) {
		
		 String str ="{\"meta\":{\"$ref\":\"#/definitions/user\"}}";
		 
		JSONObject jsStr = JSONObject.parseObject(str,Feature.DisableCircularReferenceDetect);
		Set<Entry<String,Object>> obj =  jsStr.entrySet();
		jsStr.getShortValue("a");
		for(Entry<String,Object> entry : obj) {
			System.out.println(entry.getKey() + ":" + entry.getValue());
		}
//		jsStr.containsKey("swagger");

	}

}

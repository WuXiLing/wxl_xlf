package com.wxl.modules.sys.dict.util;

import java.util.HashMap;
import java.util.List;

import com.wxl.common.utils.CacheUtils;
import com.wxl.common.utils.SpringContextHolder;
import com.wxl.modules.sys.dict.presistence.entity.DictItem;
import com.wxl.modules.sys.dict.service.DictItemService;

public class DictUtil {

	public final static String WXL_DICT_TYPE_KEY = "WXL_DICT_TYPE_KEY_";

	public final static String WXL_DICT_ITEM_KEY = "WXL_DICT_ITEM_KEY_";

	public final static String WXL_DICT_ITEM_NAME = "WXL_DICT_ITEM_NAME_";

	private static DictItemService dictItemService = SpringContextHolder.getBean(DictItemService.class);

	public static List<DictItem> getDictItem(String type) {

		List x = CacheUtils.getList(WXL_DICT_TYPE_KEY + type);
		if (x == null || x.isEmpty()) {
			x = dictItemService.selectListByDictType(new HashMap<String, Object>() {
				private static final long serialVersionUID = -4320623901915654906L;
				{
					put("code", type);
				}
			});
			if (x != null && !x.isEmpty()) {
				CacheUtils.putList(WXL_DICT_TYPE_KEY + type, x);
			}
		}
		return x;
	}

	public static Object getItem(String key) {
		Object x = CacheUtils.get(WXL_DICT_ITEM_KEY + key);
		if (x == null) {
			x = dictItemService.get(key);
			if (x != null) {
				CacheUtils.put(WXL_DICT_ITEM_KEY + key, x);
			}
		}
		return x;
	}

	public static Object getItemByName(String code, String name) {
		Object x = CacheUtils.get(WXL_DICT_ITEM_NAME + name);
		if (x == null) {
			List<DictItem> y = dictItemService.getByDictTypeName(new HashMap<String, Object>() {
				private static final long serialVersionUID = -6472657580938476102L;

				{
					put("code", code);
					put("name", name);
				}
			});
			if (y != null && !y.isEmpty()) {
				x = y.get(0);
				CacheUtils.put(WXL_DICT_ITEM_NAME + name, x);
			}
		}
		return x;
	}
}

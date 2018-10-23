package com.wxl.modules.sys.realtimeinfo.controller;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wxl.modules.sys.realtimeinfo.RuntimeUtils;

<<<<<<< HEAD
/**
 * 系统信息
 * 
 * @author Liang
 *
 */
=======
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
@Controller
@RequestMapping(value = "${adminPath}/sys/realtime/info")
public class SystemRealTimeInfoController {

<<<<<<< HEAD
	//cpu信息
=======
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
	@ResponseBody
	@RequestMapping(value = "cpuInfo")
	public Map<String, Object> cpuInfo() {

		Map<String, Object> map = new ConcurrentHashMap<String, Object>() {

			private static final long serialVersionUID = 1L;
			{
				put("datas", RuntimeUtils.getCPUInfo());
			}
		};
		return map;
	}

<<<<<<< HEAD
	//内存信息
=======
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
	@ResponseBody
	@RequestMapping(value = "memeryInfo")
	public Map<String, Object> memeryInfo() {

		Map<String, Object> map = new ConcurrentHashMap<String, Object>() {

			private static final long serialVersionUID = 1L;
			{
				put("datas", RuntimeUtils.getMemeryInfo());
			}
		};
		return map;
	}

<<<<<<< HEAD
	//jvm信息
=======
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
	@ResponseBody
	@RequestMapping(value = "jvmInfo")
	public Map<String, Object> jvmInfo() {

		Map<String, Object> map = new ConcurrentHashMap<String, Object>() {

			private static final long serialVersionUID = 1L;
			{
				put("datas", RuntimeUtils.getJvmInfo());
			}
		};
		return map;
	}

<<<<<<< HEAD
	//系统信息
=======
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
	@ResponseBody
	@RequestMapping(value = "sysInfo")
	public Map<String, Object> sysInfo() {

		return RuntimeUtils.getSysInfo();
	}
}

package com.wxl.modules.sys.realtimeinfo.controller;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wxl.modules.sys.realtimeinfo.RuntimeUtils;

@Controller
@RequestMapping(value = "${adminPath}/sys/realtime/info")
public class SystemRealTimeInfoController {

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

	@ResponseBody
	@RequestMapping(value = "sysInfo")
	public Map<String, Object> sysInfo() {

		return RuntimeUtils.getSysInfo();
	}
}

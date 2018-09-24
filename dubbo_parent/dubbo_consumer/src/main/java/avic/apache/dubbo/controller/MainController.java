package avic.apache.dubbo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import avic.apache.dubbo.provider.ListService;
import avic.apache.dubbo.provider.ObjectService;
import avic.apache.dubbo.provider.StringService;

@RestController
@RequestMapping("/")
public class MainController {

	@Autowired
    private ListService listService;
	
	@Autowired
    private ObjectService objectService;
	
	@Autowired
    private StringService stringService;
	
    @RequestMapping("/getList")
    public Object getList(){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("data", listService.getMsg(""));
        return map;
    }
    
    @RequestMapping("/getString")
    public Object getString(){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("data", stringService.getMsg(""));
        return map;
    }
    
    @RequestMapping("/getObject")
    public Object getObject(){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("data", objectService.getMsg(""));
        return map;
    }
}

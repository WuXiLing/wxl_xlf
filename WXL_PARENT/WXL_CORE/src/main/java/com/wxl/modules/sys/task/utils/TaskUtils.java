package com.wxl.modules.sys.task.utils;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wxl.common.utils.SpringContextHolder;
import com.wxl.modules.sys.task.presistence.entity.ScheduleJob;
import com.wxl.modules.sys.task.presistence.entity.Task;
import com.wxl.modules.sys.task.service.TaskService;

public class TaskUtils {

	public final static Logger log = LoggerFactory.getLogger(TaskUtils.class);


	  /**
	   * 通过反射调用scheduleJob中定义的方法
	   * 
	   * @param scheduleJob
	   */
	  @SuppressWarnings("unchecked")
	  public static void invokMethod(ScheduleJob scheduleJob) {
	    Object object = null;
	    Class clazz = null;
	    boolean flag = true;
	    if (StringUtils.isNotBlank(scheduleJob.getSpringId())) {
	    	object = SpringContextHolder.getBean(scheduleJob.getSpringId());
	    } else if (StringUtils.isNotBlank(scheduleJob.getBeanClass())) {
	      try {
	        clazz = Class.forName(scheduleJob.getBeanClass());
	        object = clazz.newInstance();
	      } catch (Exception e) {
	        flag = false;
	        TaskService taskService = SpringContextHolder.getBean(TaskService.class);
	        Task tlog = new Task();
//	        tlog.setId(UUIDUtil.getUUID());
//	        tlog.setCreateDate(new Date());
//	        tlog.setJobId(scheduleJob.getJobId().toString());
//	        tlog.setReason("未找到"+scheduleJob.getBeanClass()+"对应的class");
//	        tlog.setState("fail");
	        taskService.insert(tlog);
	        e.printStackTrace();
	      }


	    }
	    if (object == null) {
	      flag = false;
	      log.error("任务名称 = [" + scheduleJob.getJobName() + "]---------------未启动成功，请检查是否配置正确！！！");
	      TaskService taskService = SpringContextHolder.getBean(TaskService.class);
	      Task tlog = new Task();
	     /* tlog.setId(UUIDUtil.getUUID());
	      tlog.setCreateDate(new Date());
	      tlog.setJobId(scheduleJob.getJobId().toString());
	      tlog.setReason("未找到"+scheduleJob.getBeanClass()+"对应的class");
	      tlog.setState("fail");
	      sTimetaskLogService.insertSelective(tlog);*/
	      return;
	    }
	    clazz = object.getClass();
	    Method method = null;
	    try {
	      method = clazz.getDeclaredMethod(scheduleJob.getMethodName(), new Class[] { String.class });
	    } catch (NoSuchMethodException e) {
	      flag = false;
	      log.error("任务名称 = [" + scheduleJob.getJobName() + "]---------------未启动成功，方法名设置错误！！！");
	      TaskService taskService = SpringContextHolder.getBean(TaskService.class);
	      Task tlog = new Task();
	      /*tlog.setId(UUIDUtil.getUUID());
	      tlog.setCreateDate(new Date());
	      tlog.setJobId(scheduleJob.getJobId().toString());
	      tlog.setReason("未找到"+scheduleJob.getBeanClass()+"类下"+scheduleJob.getMethodName()+"对应的方法");
	      tlog.setState("fail");
	      sTimetaskLogService.insertSelective(tlog);*/
	    } catch (SecurityException e) {
	      // TODO Auto-generated catch block
	      e.printStackTrace();
	    }
	    if (method != null) {
	      try {
	        method.invoke(object, scheduleJob.getJobData());
	      } catch (IllegalAccessException e) {
	        flag = false;
	        TaskService taskService = SpringContextHolder.getBean(TaskService.class);
		      Task tlog = new Task();
	       /* tlog.setId(UUIDUtil.getUUID());
	        tlog.setCreateDate(new Date());
	        tlog.setJobId(scheduleJob.getJobId().toString());
	        tlog.setReason("未找到"+scheduleJob.getBeanClass()+"类下"+scheduleJob.getMethodName()+"对应的方法参数设置错误");
	        tlog.setState("fail");
	        sTimetaskLogService.insertSelective(tlog);*/
	        e.printStackTrace();
	      } catch (IllegalArgumentException e) {
	        flag = false;
	        TaskService taskService = SpringContextHolder.getBean(TaskService.class);
		      Task tlog = new Task();
	        e.printStackTrace();
	      } catch (InvocationTargetException e) {
	    	  TaskService taskService = SpringContextHolder.getBean(TaskService.class);
		      Task tlog = new Task();
	        e.printStackTrace();
	      }
	    }
	    if(flag){
	      System.out.println("任务名称 = [" + scheduleJob.getJobName() + "]----------启动成功");
	      TaskService taskService = SpringContextHolder.getBean(TaskService.class);
	      Task tlog = new Task();
	    }
	    
	  }
}

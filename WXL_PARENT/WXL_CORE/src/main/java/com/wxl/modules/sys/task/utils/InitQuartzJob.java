package com.wxl.modules.sys.task.utils;

import java.util.List;

import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.TriggerBuilder;
import org.quartz.TriggerKey;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;

import com.wxl.modules.sys.task.presistence.entity.Task;
import com.wxl.modules.sys.task.service.TaskService;

public class InitQuartzJob implements ApplicationContextAware {

	private static final Logger logger = LoggerFactory.getLogger(InitQuartzJob.class);

	private static ApplicationContext appCtx;

	public static SchedulerFactoryBean schedulerFactoryBean = null;

	static TaskService taskService;

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		if (this.appCtx == null) {
			this.appCtx = applicationContext;
		}
		taskService = appCtx.getBean(TaskService.class);
	}

	public static void init() {
		schedulerFactoryBean = (SchedulerFactoryBean) appCtx.getBean(SchedulerFactoryBean.class);
		Scheduler scheduler = schedulerFactoryBean.getScheduler();
		// 这里从数据库中获取任务信息数据
		List<Task> list = taskService.selectAll(null);

		for (Task job : list) {
			try {
				addJob(job);
			} catch (SchedulerException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 添加任务
	 * 
	 * @param scheduleJob
	 * @throws SchedulerException
	 */
	public static void addJob(Task job) throws SchedulerException {
		/*if (job == null || !ScheduleJob.STATUS_RUNNING.equals(job.getJobStatus())) {
			return;
		}*/

		Scheduler scheduler = schedulerFactoryBean.getScheduler();
		logger.debug(scheduler + "...........................................add");
		TriggerKey triggerKey = TriggerKey.triggerKey(job.getJobName(), job.getJobGroup());

		CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);

		// 不存在，创建一个
		if (null == trigger) {
			Class clazz = "1".equals(job.getIsConcurrent()) ? QuartzJobFactory.class
					: QuartzJobFactoryDisallowConcurrentExecution.class;
			JobDetail jobDetail = JobBuilder.newJob(clazz).withIdentity(job.getJobName(), job.getJobGroup())
					.usingJobData("data", job.getJobData()).build();

			jobDetail.getJobDataMap().put("scheduleJob", job);

			CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(job.getCronExpression());

			trigger = TriggerBuilder.newTrigger().withDescription(job.getId().toString())
					.withIdentity(job.getJobName(), job.getJobGroup()).withSchedule(scheduleBuilder).build();

			scheduler.scheduleJob(jobDetail, trigger);
		} else {
			// Trigger已存在，那么更新相应的定时设置
			CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(job.getCronExpression());

			// 按新的cronExpression表达式重新构建trigger
			trigger = trigger.getTriggerBuilder().withIdentity(triggerKey).usingJobData("data", job.getJobData())
					.withSchedule(scheduleBuilder).build();

			// 按新的trigger重新设置job执行
			scheduler.rescheduleJob(triggerKey, trigger);
		}
	}
}

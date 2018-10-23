package com.wxl.modules.sys.task.presistence.entity;

import java.util.Date;

import com.wxl.common.provider.singletable.presistence.entity.SingleTableEntity;

/**
 * 任务Entity
 * 
 * @author wxl
 *
 */
public class Task extends SingleTableEntity {

	private static final long serialVersionUID = -6871321280300587770L;

	/**
	 * 任务名称
	 */
	private String jobName;

	/**
	 * 任务分组
	 */
	private String jobGroup;

	/**
	 * 任务状态 是否启动任务
	 */
	private String jobStatus;

	/**
	 * cron表达式
	 */
	private String cronExpression;

	/**
	 * 描述
	 */
	private String description;

	/**
	 * 任务执行时调用哪个类的方法 包名+类名
	 */
	private String beanClass;

	/**
	 * 任务是否有状态
	 */
	private String isConcurrent;

	/**
	 * spring bean
	 */
	private String springId;

	/**
	 * 任务调用的方法名
	 */
	private String methodName;

	/** 参数 */
	private String jobData;

	/** 开始时间 */
	private Date beginTime;

	/** 结束时间 */
	private Date endTime;

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getJobGroup() {
		return jobGroup;
	}

	public void setJobGroup(String jobGroup) {
		this.jobGroup = jobGroup;
	}

	public String getJobStatus() {
		return jobStatus;
	}

	public void setJobStatus(String jobStatus) {
		this.jobStatus = jobStatus;
	}

	public String getCronExpression() {
		return cronExpression;
	}

	public void setCronExpression(String cronExpression) {
		this.cronExpression = cronExpression;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getBeanClass() {
		return beanClass;
	}

	public void setBeanClass(String beanClass) {
		this.beanClass = beanClass;
	}

	public String getIsConcurrent() {
		return isConcurrent;
	}

	public void setIsConcurrent(String isConcurrent) {
		this.isConcurrent = isConcurrent;
	}

	public String getSpringId() {
		return springId;
	}

	public void setSpringId(String springId) {
		this.springId = springId;
	}

	public String getMethodName() {
		return methodName;
	}

	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}

	public String getJobData() {
		return jobData;
	}

	public void setJobData(String jobData) {
		this.jobData = jobData;
	}

	public Date getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
}

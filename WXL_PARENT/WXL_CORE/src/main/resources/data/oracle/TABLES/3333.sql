prompt PL/SQL Developer Export User Objects for user WXL@WXL
prompt Created by Liang on 2018年4月25日
set define off
spool 3333.log

prompt
prompt Creating table ACT_RE_DEPLOYMENT
prompt ================================
prompt
create table ACT_RE_DEPLOYMENT
(
  id_          VARCHAR2(64 CHAR) not null,
  name_        VARCHAR2(255 CHAR),
  category_    VARCHAR2(255 CHAR),
  tenant_id_   VARCHAR2(255 CHAR),
  deploy_time_ DATE default SYSDATE not null
)
;
alter table ACT_RE_DEPLOYMENT
  add constraint PRIMARY_14 primary key (ID_)
  disable
  novalidate;

prompt
prompt Creating table ACT_GE_BYTEARRAY
prompt ===============================
prompt
create table ACT_GE_BYTEARRAY
(
  id_            VARCHAR2(64 CHAR) not null,
  rev_           NUMBER(10),
  name_          VARCHAR2(255 CHAR),
  deployment_id_ VARCHAR2(64 CHAR),
  bytes_         BLOB,
  generated_     NUMBER(3)
)
;
create index ACT_FK_BYTEARR_DEPL on ACT_GE_BYTEARRAY (DEPLOYMENT_ID_);
alter table ACT_GE_BYTEARRAY
  add constraint PRIMARY primary key (ID_)
  disable
  novalidate;
alter table ACT_GE_BYTEARRAY
  add constraint ACT_GE_BYTEARRAY_IBFK_1 foreign key (DEPLOYMENT_ID_)
  references ACT_RE_DEPLOYMENT (ID_)
  disable
  novalidate;

prompt
prompt Creating table ACT_GE_PROPERTY
prompt ==============================
prompt
create table ACT_GE_PROPERTY
(
  name_  VARCHAR2(64 CHAR) not null,
  value_ VARCHAR2(300 CHAR),
  rev_   NUMBER(10)
)
;
alter table ACT_GE_PROPERTY
  add constraint PRIMARY_49 primary key (NAME_)
  disable
  novalidate;

prompt
prompt Creating table ACT_HI_ACTINST
prompt =============================
prompt
create table ACT_HI_ACTINST
(
  id_                VARCHAR2(64 CHAR) not null,
  proc_def_id_       VARCHAR2(64 CHAR) not null,
  proc_inst_id_      VARCHAR2(64 CHAR) not null,
  execution_id_      VARCHAR2(64 CHAR) not null,
  act_id_            VARCHAR2(255 CHAR) not null,
  task_id_           VARCHAR2(64 CHAR),
  call_proc_inst_id_ VARCHAR2(64 CHAR),
  act_name_          VARCHAR2(255 CHAR),
  act_type_          VARCHAR2(255 CHAR) not null,
  assignee_          VARCHAR2(255 CHAR),
  start_time_        DATE not null,
  end_time_          DATE,
  duration_          NUMBER(24),
  tenant_id_         VARCHAR2(255 CHAR)
)
;
create index ACT_IDX_HI_ACT_INST_END on ACT_HI_ACTINST (END_TIME_);
create index ACT_IDX_HI_ACT_INST_EXEC on ACT_HI_ACTINST (EXECUTION_ID_, ACT_ID_);
create index ACT_IDX_HI_ACT_INST_PROCINST on ACT_HI_ACTINST (PROC_INST_ID_, ACT_ID_);
create index ACT_IDX_HI_ACT_INST_START on ACT_HI_ACTINST (START_TIME_);
alter table ACT_HI_ACTINST
  add constraint PRIMARY_2 primary key (ID_);

prompt
prompt Creating table ACT_HI_ATTACHMENT
prompt ================================
prompt
create table ACT_HI_ATTACHMENT
(
  id_           VARCHAR2(64 CHAR) not null,
  rev_          NUMBER(10),
  user_id_      VARCHAR2(255 CHAR),
  name_         VARCHAR2(255 CHAR),
  description_  VARCHAR2(4000 CHAR),
  type_         VARCHAR2(255 CHAR),
  task_id_      VARCHAR2(64 CHAR),
  proc_inst_id_ VARCHAR2(64 CHAR),
  url_          VARCHAR2(4000 CHAR),
  content_id_   VARCHAR2(64 CHAR)
)
;
alter table ACT_HI_ATTACHMENT
  add constraint PRIMARY_3 primary key (ID_);

prompt
prompt Creating table ACT_HI_COMMENT
prompt =============================
prompt
create table ACT_HI_COMMENT
(
  id_           VARCHAR2(64 CHAR) not null,
  type_         VARCHAR2(255 CHAR),
  time_         DATE not null,
  user_id_      VARCHAR2(255 CHAR),
  task_id_      VARCHAR2(64 CHAR),
  proc_inst_id_ VARCHAR2(64 CHAR),
  action_       VARCHAR2(255 CHAR),
  message_      VARCHAR2(4000 CHAR),
  full_msg_     BLOB
)
;
alter table ACT_HI_COMMENT
  add constraint PRIMARY_4 primary key (ID_);

prompt
prompt Creating table ACT_HI_DETAIL
prompt ============================
prompt
create table ACT_HI_DETAIL
(
  id_           VARCHAR2(64 CHAR) not null,
  type_         VARCHAR2(255 CHAR) not null,
  proc_inst_id_ VARCHAR2(64 CHAR),
  execution_id_ VARCHAR2(64 CHAR),
  task_id_      VARCHAR2(64 CHAR),
  act_inst_id_  VARCHAR2(64 CHAR),
  name_         VARCHAR2(255 CHAR) not null,
  var_type_     VARCHAR2(255 CHAR),
  rev_          NUMBER(10),
  time_         DATE not null,
  bytearray_id_ VARCHAR2(64 CHAR),
  double_       FLOAT,
  long_         NUMBER(24),
  text_         VARCHAR2(4000 CHAR),
  text2_        VARCHAR2(4000 CHAR)
)
;
create index ACT_IDX_HI_DETAIL_ACT_INST on ACT_HI_DETAIL (ACT_INST_ID_);
create index ACT_IDX_HI_DETAIL_NAME on ACT_HI_DETAIL (NAME_);
create index ACT_IDX_HI_DETAIL_PROC_INST on ACT_HI_DETAIL (PROC_INST_ID_);
create index ACT_IDX_HI_DETAIL_TASK_ID on ACT_HI_DETAIL (TASK_ID_);
create index ACT_IDX_HI_DETAIL_TIME on ACT_HI_DETAIL (TIME_);
alter table ACT_HI_DETAIL
  add constraint PRIMARY_5 primary key (ID_);

prompt
prompt Creating table ACT_HI_IDENTITYLINK
prompt ==================================
prompt
create table ACT_HI_IDENTITYLINK
(
  id_           VARCHAR2(64 CHAR) not null,
  group_id_     VARCHAR2(255 CHAR),
  type_         VARCHAR2(255 CHAR),
  user_id_      VARCHAR2(255 CHAR),
  task_id_      VARCHAR2(64 CHAR),
  proc_inst_id_ VARCHAR2(64 CHAR)
)
;
create index ACT_IDX_HI_IDENT_LNK_PROCINST on ACT_HI_IDENTITYLINK (PROC_INST_ID_);
create index ACT_IDX_HI_IDENT_LNK_TASK on ACT_HI_IDENTITYLINK (TASK_ID_);
create index ACT_IDX_HI_IDENT_LNK_USER on ACT_HI_IDENTITYLINK (USER_ID_);
alter table ACT_HI_IDENTITYLINK
  add constraint PRIMARY_6 primary key (ID_);

prompt
prompt Creating table ACT_HI_PROCINST
prompt ==============================
prompt
create table ACT_HI_PROCINST
(
  id_                        VARCHAR2(64 CHAR) not null,
  proc_inst_id_              VARCHAR2(64 CHAR) not null,
  business_key_              VARCHAR2(255 CHAR),
  proc_def_id_               VARCHAR2(64 CHAR) not null,
  start_time_                DATE not null,
  end_time_                  DATE,
  duration_                  NUMBER(24),
  start_user_id_             VARCHAR2(255 CHAR),
  start_act_id_              VARCHAR2(255 CHAR),
  end_act_id_                VARCHAR2(255 CHAR),
  super_process_instance_id_ VARCHAR2(64 CHAR),
  delete_reason_             VARCHAR2(4000 CHAR),
  tenant_id_                 VARCHAR2(255 CHAR)
)
;
create index ACT_IDX_HI_PRO_INST_END on ACT_HI_PROCINST (END_TIME_);
create index ACT_IDX_HI_PRO_I_BUSKEY on ACT_HI_PROCINST (BUSINESS_KEY_);
alter table ACT_HI_PROCINST
  add constraint PRIMARY_7 primary key (ID_);
alter table ACT_HI_PROCINST
  add constraint PROC_INST_ID_ unique (PROC_INST_ID_);

prompt
prompt Creating table ACT_HI_TASKINST
prompt ==============================
prompt
create table ACT_HI_TASKINST
(
  id_             VARCHAR2(64 CHAR) not null,
  proc_def_id_    VARCHAR2(64 CHAR),
  task_def_key_   VARCHAR2(255 CHAR),
  proc_inst_id_   VARCHAR2(64 CHAR),
  execution_id_   VARCHAR2(64 CHAR),
  name_           VARCHAR2(255 CHAR),
  parent_task_id_ VARCHAR2(64 CHAR),
  description_    VARCHAR2(4000 CHAR),
  owner_          VARCHAR2(255 CHAR),
  assignee_       VARCHAR2(255 CHAR),
  start_time_     DATE not null,
  claim_time_     DATE,
  end_time_       DATE,
  duration_       NUMBER(24),
  delete_reason_  VARCHAR2(4000 CHAR),
  priority_       NUMBER(10),
  due_date_       DATE,
  form_key_       VARCHAR2(255 CHAR),
  category_       VARCHAR2(255 CHAR),
  tenant_id_      VARCHAR2(255 CHAR)
)
;
alter table ACT_HI_TASKINST
  add constraint PRIMARY_8 primary key (ID_);

prompt
prompt Creating table ACT_HI_VARINST
prompt =============================
prompt
create table ACT_HI_VARINST
(
  id_                VARCHAR2(64 CHAR) not null,
  proc_inst_id_      VARCHAR2(64 CHAR),
  execution_id_      VARCHAR2(64 CHAR),
  task_id_           VARCHAR2(64 CHAR),
  name_              VARCHAR2(255 CHAR) not null,
  var_type_          VARCHAR2(100 CHAR),
  rev_               NUMBER(10),
  bytearray_id_      VARCHAR2(64 CHAR),
  double_            FLOAT,
  long_              NUMBER(24),
  text_              VARCHAR2(4000 CHAR),
  text2_             VARCHAR2(4000 CHAR),
  create_time_       DATE,
  last_updated_time_ DATE
)
;
create index ACT_IDX_HI_PROCVAR_NAME_TYPE on ACT_HI_VARINST (NAME_, VAR_TYPE_);
create index ACT_IDX_HI_PROCVAR_PROC_INST on ACT_HI_VARINST (PROC_INST_ID_);
alter table ACT_HI_VARINST
  add constraint PRIMARY_9 primary key (ID_);

prompt
prompt Creating table ACT_ID_GROUP
prompt ===========================
prompt
create table ACT_ID_GROUP
(
  id_   VARCHAR2(64 CHAR) not null,
  rev_  NUMBER(10),
  name_ VARCHAR2(255 CHAR),
  type_ VARCHAR2(255 CHAR)
)
;
alter table ACT_ID_GROUP
  add constraint PRIMARY_10 primary key (ID_);

prompt
prompt Creating table ACT_ID_INFO
prompt ==========================
prompt
create table ACT_ID_INFO
(
  id_        VARCHAR2(64 CHAR) not null,
  rev_       NUMBER(10),
  user_id_   VARCHAR2(64 CHAR),
  type_      VARCHAR2(64 CHAR),
  key_       VARCHAR2(255 CHAR),
  value_     VARCHAR2(255 CHAR),
  password_  BLOB,
  parent_id_ VARCHAR2(255 CHAR)
)
;
alter table ACT_ID_INFO
  add constraint PRIMARY_11 primary key (ID_);

prompt
prompt Creating table ACT_ID_USER
prompt ==========================
prompt
create table ACT_ID_USER
(
  id_         VARCHAR2(64 CHAR) not null,
  rev_        NUMBER(10),
  first_      VARCHAR2(255 CHAR),
  last_       VARCHAR2(255 CHAR),
  email_      VARCHAR2(255 CHAR),
  pwd_        VARCHAR2(255 CHAR),
  picture_id_ VARCHAR2(64 CHAR)
)
;
alter table ACT_ID_USER
  add constraint PRIMARY_13 primary key (ID_);

prompt
prompt Creating table ACT_ID_MEMBERSHIP
prompt ================================
prompt
create table ACT_ID_MEMBERSHIP
(
  user_id_  VARCHAR2(64 CHAR) not null,
  group_id_ VARCHAR2(64 CHAR) not null
)
;
create index ACT_FK_MEMB_GROUP on ACT_ID_MEMBERSHIP (GROUP_ID_);
alter table ACT_ID_MEMBERSHIP
  add constraint PRIMARY_12 primary key (USER_ID_, GROUP_ID_);
alter table ACT_ID_MEMBERSHIP
  add constraint ACT_ID_MEMBERSHIP_IBFK_1 foreign key (GROUP_ID_)
  references ACT_ID_GROUP (ID_);
alter table ACT_ID_MEMBERSHIP
  add constraint ACT_ID_MEMBERSHIP_IBFK_2 foreign key (USER_ID_)
  references ACT_ID_USER (ID_);

prompt
prompt Creating table ACT_RE_MODEL
prompt ===========================
prompt
create table ACT_RE_MODEL
(
  id_                           VARCHAR2(64 CHAR) not null,
  rev_                          NUMBER(10),
  name_                         VARCHAR2(255 CHAR),
  key_                          VARCHAR2(255 CHAR),
  category_                     VARCHAR2(255 CHAR),
  create_time_                  DATE,
  last_update_time_             DATE,
  version_                      NUMBER(10),
  meta_info_                    VARCHAR2(4000 CHAR),
  deployment_id_                VARCHAR2(64 CHAR),
  editor_source_value_id_       VARCHAR2(64 CHAR),
  editor_source_extra_value_id_ VARCHAR2(64 CHAR),
  tenant_id_                    VARCHAR2(255 CHAR)
)
;
create index ACT_FK_MODEL_DEPLOYMENT on ACT_RE_MODEL (DEPLOYMENT_ID_);
create index ACT_FK_MODEL_SOURCE on ACT_RE_MODEL (EDITOR_SOURCE_VALUE_ID_);
create index ACT_FK_MODEL_SOURCE_EXTRA on ACT_RE_MODEL (EDITOR_SOURCE_EXTRA_VALUE_ID_);
alter table ACT_RE_MODEL
  add constraint PRIMARY_15 primary key (ID_)
  disable
  novalidate;
alter table ACT_RE_MODEL
  add constraint ACT_RE_MODEL_IBFK_1 foreign key (DEPLOYMENT_ID_)
  references ACT_RE_DEPLOYMENT (ID_)
  disable
  novalidate;
alter table ACT_RE_MODEL
  add constraint ACT_RE_MODEL_IBFK_2 foreign key (EDITOR_SOURCE_VALUE_ID_)
  references ACT_GE_BYTEARRAY (ID_)
  disable
  novalidate;

prompt
prompt Creating table ACT_RE_PROCDEF
prompt =============================
prompt
create table ACT_RE_PROCDEF
(
  id_                 VARCHAR2(64 CHAR) not null,
  rev_                NUMBER(10),
  category_           VARCHAR2(255 CHAR),
  name_               VARCHAR2(255 CHAR),
  key_                VARCHAR2(255 CHAR) not null,
  version_            NUMBER(10) not null,
  deployment_id_      VARCHAR2(64 CHAR),
  resource_name_      VARCHAR2(4000 CHAR),
  dgrm_resource_name_ VARCHAR2(4000 CHAR),
  description_        VARCHAR2(4000 CHAR),
  has_start_form_key_ NUMBER(3),
  suspension_state_   NUMBER(10),
  tenant_id_          VARCHAR2(255 CHAR)
)
;
alter table ACT_RE_PROCDEF
  add constraint PRIMARY_16 primary key (ID_)
  disable
  novalidate;
alter table ACT_RE_PROCDEF
  add constraint ACT_UNIQ_PROCDEF unique (KEY_, VERSION_, TENANT_ID_)
  disable
  novalidate;

prompt
prompt Creating table ACT_RU_EXECUTION
prompt ===============================
prompt
create table ACT_RU_EXECUTION
(
  id_               VARCHAR2(64 CHAR) not null,
  rev_              NUMBER(10),
  proc_inst_id_     VARCHAR2(64 CHAR),
  business_key_     VARCHAR2(255 CHAR),
  parent_id_        VARCHAR2(64 CHAR),
  proc_def_id_      VARCHAR2(64 CHAR),
  super_exec_       VARCHAR2(64 CHAR),
  act_id_           VARCHAR2(255 CHAR),
  is_active_        NUMBER(3),
  is_concurrent_    NUMBER(3),
  is_scope_         NUMBER(3),
  is_event_scope_   NUMBER(3),
  suspension_state_ NUMBER(10),
  cached_ent_state_ NUMBER(10),
  tenant_id_        VARCHAR2(255 CHAR)
)
;
create index ACT_FK_EXE_PARENT on ACT_RU_EXECUTION (PARENT_ID_);
create index ACT_FK_EXE_PROCDEF on ACT_RU_EXECUTION (PROC_DEF_ID_);
create index ACT_FK_EXE_PROCINST on ACT_RU_EXECUTION (PROC_INST_ID_);
create index ACT_FK_EXE_SUPER on ACT_RU_EXECUTION (SUPER_EXEC_);
create index ACT_IDX_EXEC_BUSKEY on ACT_RU_EXECUTION (BUSINESS_KEY_);
alter table ACT_RU_EXECUTION
  add constraint PRIMARY_18 primary key (ID_);
alter table ACT_RU_EXECUTION
  add constraint ACT_RU_EXECUTION_IBFK_1 foreign key (PARENT_ID_)
  references ACT_RU_EXECUTION (ID_);
alter table ACT_RU_EXECUTION
  add constraint ACT_RU_EXECUTION_IBFK_2 foreign key (PROC_DEF_ID_)
  references ACT_RE_PROCDEF (ID_)
  disable
  novalidate;

prompt
prompt Creating table ACT_RU_EVENT_SUBSCR
prompt ==================================
prompt
create table ACT_RU_EVENT_SUBSCR
(
  id_            VARCHAR2(64 CHAR) not null,
  rev_           NUMBER(10),
  event_type_    VARCHAR2(255 CHAR) not null,
  event_name_    VARCHAR2(255 CHAR),
  execution_id_  VARCHAR2(64 CHAR),
  proc_inst_id_  VARCHAR2(64 CHAR),
  activity_id_   VARCHAR2(64 CHAR),
  configuration_ VARCHAR2(255 CHAR),
  created_       DATE default SYSDATE not null,
  proc_def_id_   VARCHAR2(64 CHAR),
  tenant_id_     VARCHAR2(255 CHAR)
)
;
create index ACT_FK_EVENT_EXEC on ACT_RU_EVENT_SUBSCR (EXECUTION_ID_);
create index ACT_IDX_EVENT_SUBSCR_CONFIG_ on ACT_RU_EVENT_SUBSCR (CONFIGURATION_);
alter table ACT_RU_EVENT_SUBSCR
  add constraint PRIMARY_17 primary key (ID_);
alter table ACT_RU_EVENT_SUBSCR
  add constraint ACT_RU_EVENT_SUBSCR_IBFK_1 foreign key (EXECUTION_ID_)
  references ACT_RU_EXECUTION (ID_);

prompt
prompt Creating table ACT_RU_TASK
prompt ==========================
prompt
create table ACT_RU_TASK
(
  id_               VARCHAR2(64 CHAR) not null,
  rev_              NUMBER(10),
  execution_id_     VARCHAR2(64 CHAR),
  proc_inst_id_     VARCHAR2(64 CHAR),
  proc_def_id_      VARCHAR2(64 CHAR),
  name_             VARCHAR2(255 CHAR),
  parent_task_id_   VARCHAR2(64 CHAR),
  description_      VARCHAR2(4000 CHAR),
  task_def_key_     VARCHAR2(255 CHAR),
  owner_            VARCHAR2(255 CHAR),
  assignee_         VARCHAR2(255 CHAR),
  delegation_       VARCHAR2(64 CHAR),
  priority_         NUMBER(10),
  create_time_      DATE default SYSDATE not null,
  due_date_         DATE,
  category_         VARCHAR2(255 CHAR),
  suspension_state_ NUMBER(10),
  tenant_id_        VARCHAR2(255 CHAR)
)
;
create index ACT_FK_TASK_EXE on ACT_RU_TASK (EXECUTION_ID_);
create index ACT_FK_TASK_PROCDEF on ACT_RU_TASK (PROC_DEF_ID_);
create index ACT_FK_TASK_PROCINST on ACT_RU_TASK (PROC_INST_ID_);
create index ACT_IDX_TASK_CREATE on ACT_RU_TASK (CREATE_TIME_);
alter table ACT_RU_TASK
  add constraint PRIMARY_21 primary key (ID_);
alter table ACT_RU_TASK
  add constraint ACT_RU_TASK_IBFK_1 foreign key (EXECUTION_ID_)
  references ACT_RU_EXECUTION (ID_);
alter table ACT_RU_TASK
  add constraint ACT_RU_TASK_IBFK_2 foreign key (PROC_DEF_ID_)
  references ACT_RE_PROCDEF (ID_)
  disable
  novalidate;

prompt
prompt Creating table ACT_RU_IDENTITYLINK
prompt ==================================
prompt
create table ACT_RU_IDENTITYLINK
(
  id_           VARCHAR2(64 CHAR) not null,
  rev_          NUMBER(10),
  group_id_     VARCHAR2(255 CHAR),
  type_         VARCHAR2(255 CHAR),
  user_id_      VARCHAR2(255 CHAR),
  task_id_      VARCHAR2(64 CHAR),
  proc_inst_id_ VARCHAR2(64 CHAR),
  proc_def_id_  VARCHAR2(64 CHAR)
)
;
create index ACT_FK_IDL_PROCINST on ACT_RU_IDENTITYLINK (PROC_INST_ID_);
create index ACT_FK_TSKASS_TASK on ACT_RU_IDENTITYLINK (TASK_ID_);
create index ACT_IDX_ATHRZ_PROCEDEF on ACT_RU_IDENTITYLINK (PROC_DEF_ID_);
create index ACT_IDX_IDENT_LNK_GROUP on ACT_RU_IDENTITYLINK (GROUP_ID_);
create index ACT_IDX_IDENT_LNK_USER on ACT_RU_IDENTITYLINK (USER_ID_);
alter table ACT_RU_IDENTITYLINK
  add constraint PRIMARY_19 primary key (ID_);
alter table ACT_RU_IDENTITYLINK
  add constraint ACT_RU_IDENTITYLINK_IBFK_1 foreign key (PROC_DEF_ID_)
  references ACT_RE_PROCDEF (ID_)
  disable
  novalidate;
alter table ACT_RU_IDENTITYLINK
  add constraint ACT_RU_IDENTITYLINK_IBFK_2 foreign key (PROC_INST_ID_)
  references ACT_RU_EXECUTION (ID_);
alter table ACT_RU_IDENTITYLINK
  add constraint ACT_RU_IDENTITYLINK_IBFK_3 foreign key (TASK_ID_)
  references ACT_RU_TASK (ID_);

prompt
prompt Creating table ACT_RU_JOB
prompt =========================
prompt
create table ACT_RU_JOB
(
  id_                  VARCHAR2(64 CHAR) not null,
  rev_                 NUMBER(10),
  type_                VARCHAR2(255 CHAR) not null,
  lock_exp_time_       DATE,
  lock_owner_          VARCHAR2(255 CHAR),
  exclusive_           NUMBER(3),
  execution_id_        VARCHAR2(64 CHAR),
  process_instance_id_ VARCHAR2(64 CHAR),
  proc_def_id_         VARCHAR2(64 CHAR),
  retries_             NUMBER(10),
  exception_stack_id_  VARCHAR2(64 CHAR),
  exception_msg_       VARCHAR2(4000 CHAR),
  duedate_             DATE,
  repeat_              VARCHAR2(255 CHAR),
  handler_type_        VARCHAR2(255 CHAR),
  handler_cfg_         VARCHAR2(4000 CHAR),
  tenant_id_           VARCHAR2(255 CHAR)
)
;
create index ACT_FK_JOB_EXCEPTION on ACT_RU_JOB (EXCEPTION_STACK_ID_);
alter table ACT_RU_JOB
  add constraint PRIMARY_20 primary key (ID_);
alter table ACT_RU_JOB
  add constraint ACT_RU_JOB_IBFK_1 foreign key (EXCEPTION_STACK_ID_)
  references ACT_GE_BYTEARRAY (ID_)
  disable
  novalidate;

prompt
prompt Creating table ACT_RU_VARIABLE
prompt ==============================
prompt
create table ACT_RU_VARIABLE
(
  id_           VARCHAR2(64 CHAR) not null,
  rev_          NUMBER(10),
  type_         VARCHAR2(255 CHAR) not null,
  name_         VARCHAR2(255 CHAR) not null,
  execution_id_ VARCHAR2(64 CHAR),
  proc_inst_id_ VARCHAR2(64 CHAR),
  task_id_      VARCHAR2(64 CHAR),
  bytearray_id_ VARCHAR2(64 CHAR),
  double_       FLOAT,
  long_         NUMBER(24),
  text_         VARCHAR2(4000 CHAR),
  text2_        VARCHAR2(4000 CHAR)
)
;
create index ACT_FK_VAR_BYTEARRAY on ACT_RU_VARIABLE (BYTEARRAY_ID_);
create index ACT_FK_VAR_EXE on ACT_RU_VARIABLE (EXECUTION_ID_);
create index ACT_FK_VAR_PROCINST on ACT_RU_VARIABLE (PROC_INST_ID_);
create index ACT_IDX_VARIABLE_TASK_ID on ACT_RU_VARIABLE (TASK_ID_);
alter table ACT_RU_VARIABLE
  add constraint PRIMARY_22 primary key (ID_);
alter table ACT_RU_VARIABLE
  add constraint ACT_RU_VARIABLE_IBFK_1 foreign key (BYTEARRAY_ID_)
  references ACT_GE_BYTEARRAY (ID_)
  disable
  novalidate;
alter table ACT_RU_VARIABLE
  add constraint ACT_RU_VARIABLE_IBFK_2 foreign key (EXECUTION_ID_)
  references ACT_RU_EXECUTION (ID_);

prompt
prompt Creating table SYS_AREA
prompt =======================
prompt
create table SYS_AREA
(
  id                VARCHAR2(64 CHAR) not null,
  parent_id         VARCHAR2(64 CHAR),
  longcode          VARCHAR2(2000 CHAR),
  name              VARCHAR2(100 CHAR),
  queuenumber       FLOAT,
  code              VARCHAR2(100 CHAR),
  type              CHAR(1 CHAR),
  createuser        VARCHAR2(64 CHAR),
  createdate        DATE,
  lastupdateuser    VARCHAR2(64 CHAR),
  lastupdatedate    DATE,
  remarks           VARCHAR2(255 CHAR),
  del_flag          CHAR(1 CHAR) default '0',
  version           VARCHAR2(45 CHAR),
  lastupdateversion VARCHAR2(45 CHAR),
  lastupdateip      VARCHAR2(45 CHAR),
  depth             CHAR(1 CHAR),
  longname          VARCHAR2(500 CHAR),
  ip                VARCHAR2(45 CHAR),
  sysdata           CHAR(1 CHAR) default '0'
)
;
comment on column SYS_AREA.id
  is '编号';
comment on column SYS_AREA.parent_id
  is '父级编号';
comment on column SYS_AREA.longcode
  is '所有父级编号';
comment on column SYS_AREA.name
  is '名称';
comment on column SYS_AREA.queuenumber
  is '排序';
comment on column SYS_AREA.code
  is '区域编码';
comment on column SYS_AREA.type
  is '区域类型';
comment on column SYS_AREA.createuser
  is '创建者';
comment on column SYS_AREA.createdate
  is '创建时间';
comment on column SYS_AREA.lastupdateuser
  is '更新者';
comment on column SYS_AREA.lastupdatedate
  is '更新时间';
comment on column SYS_AREA.remarks
  is '备注信息';
comment on column SYS_AREA.del_flag
  is '删除标记';
create index SYS_AREA_DEL_FLAG on SYS_AREA (DEL_FLAG);
create index SYS_AREA_PARENT_ID on SYS_AREA (PARENT_ID);
alter table SYS_AREA
  add constraint PRIMARY_23 primary key (ID)
  disable
  novalidate;

prompt
prompt Creating table SYS_DICT
prompt =======================
prompt
create table SYS_DICT
(
  id                VARCHAR2(64 CHAR) not null,
  value             VARCHAR2(100 CHAR) not null,
  label             VARCHAR2(100 CHAR) not null,
  type              VARCHAR2(100 CHAR) not null,
  description       VARCHAR2(100 CHAR) not null,
  sort              FLOAT not null,
  parent_id         VARCHAR2(64 CHAR) default '0',
  createuser        VARCHAR2(64 CHAR) not null,
  createdate        DATE default SYSDATE not null,
  lastupdateuser    VARCHAR2(64 CHAR) not null,
  lastupdatedate    DATE default SYSDATE not null,
  remarks           VARCHAR2(255 CHAR),
  del_flag          CHAR(1 CHAR) default '0' not null,
  lastupdateversion VARCHAR2(45 CHAR),
  lastupdateip      VARCHAR2(45 CHAR),
  version           VARCHAR2(45 CHAR),
  ip                VARCHAR2(45 CHAR),
  sys_data          CHAR(1 CHAR) default '0',
  status            CHAR(2 CHAR)
)
;
comment on column SYS_DICT.id
  is '编号';
comment on column SYS_DICT.value
  is '数据值';
comment on column SYS_DICT.label
  is '标签名';
comment on column SYS_DICT.type
  is '类型';
comment on column SYS_DICT.description
  is '描述';
comment on column SYS_DICT.sort
  is '排序（升序）';
comment on column SYS_DICT.parent_id
  is '父级编号';
comment on column SYS_DICT.createuser
  is '创建者';
comment on column SYS_DICT.createdate
  is '创建时间';
comment on column SYS_DICT.lastupdateuser
  is '更新者';
comment on column SYS_DICT.lastupdatedate
  is '更新时间';
comment on column SYS_DICT.remarks
  is '备注信息';
comment on column SYS_DICT.del_flag
  is '删除标记';
create index SYS_DICT_DEL_FLAG on SYS_DICT (DEL_FLAG);
create index SYS_DICT_LABEL on SYS_DICT (LABEL);
create index SYS_DICT_VALUE on SYS_DICT (VALUE);
alter table SYS_DICT
  add constraint PRIMARY_24 primary key (ID)
  disable
  novalidate;

prompt
prompt Creating table SYS_LOG
prompt ======================
prompt
create table SYS_LOG
(
  id                VARCHAR2(64 CHAR) not null,
  type              CHAR(1 CHAR) default '1',
  title             VARCHAR2(255 CHAR),
  remote_addr       VARCHAR2(255 CHAR),
  user_agent        VARCHAR2(255 CHAR),
  request_uri       VARCHAR2(255 CHAR),
  method            VARCHAR2(5 CHAR),
  params            CLOB,
  exception         CLOB,
  remotearea        CHAR(200 CHAR),
  createdate        DATE default SYSDATE,
  createuser        VARCHAR2(32 CHAR),
  lastupdatedate    DATE default SYSDATE,
  lastupdateuser    VARCHAR2(32 CHAR),
  version           VARCHAR2(20 CHAR),
  lastupdateversion VARCHAR2(20 CHAR),
  ip                VARCHAR2(20 CHAR),
  lastupdateip      VARCHAR2(20 CHAR),
  status            CHAR(2 CHAR) default '0',
  remarks           VARCHAR2(500 CHAR)
)
;
comment on column SYS_LOG.id
  is '编号';
comment on column SYS_LOG.type
  is '日志类型';
comment on column SYS_LOG.title
  is '日志标题';
comment on column SYS_LOG.remote_addr
  is '操作IP地址';
comment on column SYS_LOG.user_agent
  is '用户代理';
comment on column SYS_LOG.request_uri
  is '请求URI';
comment on column SYS_LOG.method
  is '操作方式';
comment on column SYS_LOG.params
  is '操作提交的数据';
comment on column SYS_LOG.exception
  is '异常信息';
comment on column SYS_LOG.remotearea
  is '所属地区';
comment on column SYS_LOG.createdate
  is '创建记录时间';
comment on column SYS_LOG.createuser
  is '创建记录人ID';
comment on column SYS_LOG.lastupdatedate
  is '最后更新时间';
comment on column SYS_LOG.lastupdateuser
  is '最后更新人ID';
comment on column SYS_LOG.version
  is '版本号';
comment on column SYS_LOG.lastupdateversion
  is '最后更新版本号';
comment on column SYS_LOG.ip
  is 'IP';
comment on column SYS_LOG.lastupdateip
  is '最后更新IP';
comment on column SYS_LOG.status
  is '状态。';
comment on column SYS_LOG.remarks
  is '备注';
create index SYS_LOG_CREATE_BY on SYS_LOG (CREATEUSER);
create index SYS_LOG_CREATE_DATE on SYS_LOG (CREATEDATE);
create index SYS_LOG_REQUEST_URI on SYS_LOG (REQUEST_URI);
create index SYS_LOG_TYPE on SYS_LOG (TYPE);
alter table SYS_LOG
  add constraint PRIMARY_25 primary key (ID)
  disable
  novalidate;

prompt
prompt Creating table SYS_LOGIN_HISTORY
prompt ================================
prompt
create table SYS_LOGIN_HISTORY
(
  id                VARCHAR2(32 CHAR) not null,
  user_id           VARCHAR2(32 CHAR),
  loginip           VARCHAR2(20 CHAR),
  logindate         DATE default SYSDATE,
  createdate        DATE default SYSDATE,
  createuser        VARCHAR2(32 CHAR),
  lastupdatedate    DATE default SYSDATE,
  lastupdateuser    VARCHAR2(32 CHAR),
  version           VARCHAR2(20 CHAR),
  lastupdateversion VARCHAR2(20 CHAR),
  ip                VARCHAR2(20 CHAR),
  lastupdateip      VARCHAR2(20 CHAR),
  status            CHAR(2 CHAR) default '0',
  remarks           VARCHAR2(500 CHAR)
)
;
comment on column SYS_LOGIN_HISTORY.id
  is '主键';
comment on column SYS_LOGIN_HISTORY.user_id
  is '用户ID';
comment on column SYS_LOGIN_HISTORY.loginip
  is '登录IP';
comment on column SYS_LOGIN_HISTORY.logindate
  is '登录时间';
comment on column SYS_LOGIN_HISTORY.createdate
  is '创建记录时间';
comment on column SYS_LOGIN_HISTORY.createuser
  is '创建记录人ID';
comment on column SYS_LOGIN_HISTORY.lastupdatedate
  is '最后更新时间';
comment on column SYS_LOGIN_HISTORY.lastupdateuser
  is '最后更新人ID';
comment on column SYS_LOGIN_HISTORY.version
  is '版本号';
comment on column SYS_LOGIN_HISTORY.lastupdateversion
  is '最后更新版本号';
comment on column SYS_LOGIN_HISTORY.ip
  is 'IP';
comment on column SYS_LOGIN_HISTORY.lastupdateip
  is '最后更新IP';
comment on column SYS_LOGIN_HISTORY.status
  is '状态：0、成功；1、失败。';
comment on column SYS_LOGIN_HISTORY.remarks
  is '备注';
alter table SYS_LOGIN_HISTORY
  add constraint PRIMARY_26 primary key (ID)
  disable
  novalidate;

prompt
prompt Creating table SYS_MENU
prompt =======================
prompt
create table SYS_MENU
(
  id                VARCHAR2(64 CHAR) not null,
  parentid          VARCHAR2(64 CHAR),
  longcode          VARCHAR2(2000 CHAR),
  name              VARCHAR2(100 CHAR),
  queuenumber       FLOAT,
  href              VARCHAR2(2000 CHAR),
  target            VARCHAR2(20 CHAR),
  icon              VARCHAR2(100 CHAR),
  is_show           CHAR(1 CHAR),
  permission        VARCHAR2(200 CHAR),
  createuser        VARCHAR2(64 CHAR),
  createdate        DATE,
  lastupdateuser    VARCHAR2(64 CHAR),
  lastupdatedate    DATE,
  remarks           VARCHAR2(255 CHAR),
  del_flag          CHAR(1 CHAR) default '0',
  version           VARCHAR2(45 CHAR),
  lastupdateversion VARCHAR2(45 CHAR),
  ip                VARCHAR2(45 CHAR),
  lastupdateip      VARCHAR2(45 CHAR),
  longname          VARCHAR2(500 CHAR),
  depth             CHAR(2 CHAR),
  sysdata           CHAR(1 CHAR) default '0'
)
;
comment on column SYS_MENU.id
  is '编号';
comment on column SYS_MENU.parentid
  is '父级编号';
comment on column SYS_MENU.longcode
  is '所有父级编号';
comment on column SYS_MENU.name
  is '名称';
comment on column SYS_MENU.queuenumber
  is '排序';
comment on column SYS_MENU.href
  is '链接';
comment on column SYS_MENU.target
  is '目标';
comment on column SYS_MENU.icon
  is '图标';
comment on column SYS_MENU.is_show
  is '是否在菜单中显示';
comment on column SYS_MENU.permission
  is '权限标识';
comment on column SYS_MENU.createuser
  is '创建者';
comment on column SYS_MENU.createdate
  is '创建时间';
comment on column SYS_MENU.lastupdateuser
  is '更新者';
comment on column SYS_MENU.lastupdatedate
  is '更新时间';
comment on column SYS_MENU.remarks
  is '备注信息';
comment on column SYS_MENU.del_flag
  is '删除标记';
create index SYS_MENU_DEL_FLAG on SYS_MENU (DEL_FLAG);
create index SYS_MENU_PARENT_ID on SYS_MENU (PARENTID);
alter table SYS_MENU
  add constraint PRIMARY_27 primary key (ID)
  disable
  novalidate;

prompt
prompt Creating table SYS_OFFICE
prompt =========================
prompt
create table SYS_OFFICE
(
  id                VARCHAR2(64 CHAR) not null,
  parentid          VARCHAR2(64 CHAR),
  long_code         VARCHAR2(2000 CHAR),
  name              VARCHAR2(100 CHAR),
  sort              FLOAT,
  area_id           VARCHAR2(64 CHAR),
  code              VARCHAR2(100 CHAR),
  type              CHAR(1 CHAR),
  grade             CHAR(1 CHAR),
  address           VARCHAR2(255 CHAR),
  zip_code          VARCHAR2(100 CHAR),
  master            VARCHAR2(100 CHAR),
  phone             VARCHAR2(200 CHAR),
  fax               VARCHAR2(200 CHAR),
  email             VARCHAR2(200 CHAR),
  useable           VARCHAR2(64 CHAR),
  primary_person    VARCHAR2(64 CHAR),
  deputy_person     VARCHAR2(64 CHAR),
  createuser        VARCHAR2(64 CHAR),
  createdate        DATE,
  lastupdateuser    VARCHAR2(64 CHAR),
  lastupdatedate    DATE,
  remarks           VARCHAR2(255 CHAR),
  del_flag          CHAR(1 CHAR) default '0',
  queuenumber       VARCHAR2(10 CHAR),
  version           VARCHAR2(45 CHAR),
  ip                VARCHAR2(45 CHAR),
  lastupdateversion VARCHAR2(45 CHAR),
  lastupdateip      VARCHAR2(45 CHAR),
  longname          VARCHAR2(500 CHAR),
  depth             FLOAT,
  sysdata           CHAR(1 CHAR) default '0'
)
;
comment on column SYS_OFFICE.id
  is '编号';
comment on column SYS_OFFICE.parentid
  is '父级编号';
comment on column SYS_OFFICE.long_code
  is '所有父级编号';
comment on column SYS_OFFICE.name
  is '名称';
comment on column SYS_OFFICE.sort
  is '排序';
comment on column SYS_OFFICE.area_id
  is '归属区域';
comment on column SYS_OFFICE.code
  is '区域编码';
comment on column SYS_OFFICE.type
  is '机构类型';
comment on column SYS_OFFICE.grade
  is '机构等级';
comment on column SYS_OFFICE.address
  is '联系地址';
comment on column SYS_OFFICE.zip_code
  is '邮政编码';
comment on column SYS_OFFICE.master
  is '负责人';
comment on column SYS_OFFICE.phone
  is '电话';
comment on column SYS_OFFICE.fax
  is '传真';
comment on column SYS_OFFICE.email
  is '邮箱';
comment on column SYS_OFFICE.useable
  is '是否启用';
comment on column SYS_OFFICE.primary_person
  is '主负责人';
comment on column SYS_OFFICE.deputy_person
  is '副负责人';
comment on column SYS_OFFICE.createuser
  is '创建者';
comment on column SYS_OFFICE.createdate
  is '创建时间';
comment on column SYS_OFFICE.lastupdateuser
  is '更新者';
comment on column SYS_OFFICE.lastupdatedate
  is '更新时间';
comment on column SYS_OFFICE.remarks
  is '备注信息';
comment on column SYS_OFFICE.del_flag
  is '删除标记';
create index SYS_OFFICE_DEL_FLAG on SYS_OFFICE (DEL_FLAG);
create index SYS_OFFICE_PARENT_ID on SYS_OFFICE (PARENTID);
create index SYS_OFFICE_TYPE on SYS_OFFICE (TYPE);
alter table SYS_OFFICE
  add constraint PRIMARY_28 primary key (ID)
  disable
  novalidate;

prompt
prompt Creating table SYS_ROLE
prompt =======================
prompt
create table SYS_ROLE
(
  id                VARCHAR2(64 CHAR) not null,
  office_id         VARCHAR2(64 CHAR),
  name              VARCHAR2(100 CHAR) not null,
  enname            VARCHAR2(255 CHAR),
  role_type         VARCHAR2(255 CHAR),
  data_scope        CHAR(1 CHAR),
  sys_data          CHAR(1 CHAR),
  useable           VARCHAR2(64 CHAR),
  createuser        VARCHAR2(64 CHAR) not null,
  createdate        DATE default SYSDATE not null,
  lastupdateuser    VARCHAR2(64 CHAR) not null,
  lastupdatedate    DATE default SYSDATE not null,
  remarks           VARCHAR2(255 CHAR),
  version           VARCHAR2(45 CHAR),
  lastupdateversion VARCHAR2(45 CHAR),
  ip                VARCHAR2(45 CHAR),
  lastupdateip      VARCHAR2(45 CHAR),
  status            CHAR(2 CHAR)
)
;
comment on column SYS_ROLE.id
  is '编号';
comment on column SYS_ROLE.office_id
  is '归属机构';
comment on column SYS_ROLE.name
  is '角色名称';
comment on column SYS_ROLE.enname
  is '英文名称';
comment on column SYS_ROLE.role_type
  is '角色类型';
comment on column SYS_ROLE.data_scope
  is '数据范围';
comment on column SYS_ROLE.sys_data
  is '是否系统数据,1:是，0：不是';
comment on column SYS_ROLE.useable
  is '是否可用';
comment on column SYS_ROLE.createuser
  is '创建者';
comment on column SYS_ROLE.createdate
  is '创建时间';
comment on column SYS_ROLE.lastupdateuser
  is '更新者';
comment on column SYS_ROLE.lastupdatedate
  is '更新时间';
comment on column SYS_ROLE.remarks
  is '备注信息';
create index SYS_ROLE_ENNAME on SYS_ROLE (ENNAME);
alter table SYS_ROLE
  add constraint PRIMARY_29 primary key (ID)
  disable
  novalidate;

prompt
prompt Creating table SYS_ROLE_MENU
prompt ============================
prompt
create table SYS_ROLE_MENU
(
  role_id VARCHAR2(64 CHAR) not null,
  menu_id VARCHAR2(64 CHAR) not null
)
;
comment on column SYS_ROLE_MENU.role_id
  is '角色编号';
comment on column SYS_ROLE_MENU.menu_id
  is '菜单编号';
alter table SYS_ROLE_MENU
  add constraint PRIMARY_30 primary key (ROLE_ID, MENU_ID)
  disable
  novalidate;

prompt
prompt Creating table SYS_ROLE_OFFICE
prompt ==============================
prompt
create table SYS_ROLE_OFFICE
(
  role_id   VARCHAR2(64 CHAR) not null,
  office_id VARCHAR2(64 CHAR) not null
)
;
comment on column SYS_ROLE_OFFICE.role_id
  is '角色编号';
comment on column SYS_ROLE_OFFICE.office_id
  is '机构编号';
alter table SYS_ROLE_OFFICE
  add constraint PRIMARY_31 primary key (ROLE_ID, OFFICE_ID)
  disable
  novalidate;

prompt
prompt Creating table SYS_USER
prompt =======================
prompt
create table SYS_USER
(
  id                VARCHAR2(64 CHAR) not null,
  company_id        VARCHAR2(64 CHAR),
  office_id         VARCHAR2(64 CHAR),
  login_name        VARCHAR2(100 CHAR) not null,
  password          VARCHAR2(100 CHAR) not null,
  no                VARCHAR2(100 CHAR),
  name              VARCHAR2(100 CHAR),
  email             VARCHAR2(200 CHAR),
  phone             VARCHAR2(200 CHAR),
  mobile            VARCHAR2(200 CHAR),
  user_type         CHAR(1 CHAR),
  photo             VARCHAR2(1000 CHAR),
  createuser        VARCHAR2(64 CHAR),
  createdate        DATE default SYSDATE,
  lastupdateuser    VARCHAR2(64 CHAR),
  lastupdatedate    DATE default SYSDATE,
  remarks           VARCHAR2(255 CHAR),
  login_flag        CHAR(1 CHAR) default '1',
  gender            VARCHAR2(20),
  idcard            CHAR(18 CHAR),
  birthday          DATE,
  nation            VARCHAR2(20),
  qq                VARCHAR2(20),
  version           VARCHAR2(20 CHAR),
  lastupdateversion VARCHAR2(20 CHAR),
  ip                VARCHAR2(20 CHAR),
  lastupdateip      VARCHAR2(20 CHAR),
  status            CHAR(2 CHAR),
  sys_data          CHAR(1 CHAR) default '0'
)
;
comment on column SYS_USER.id
  is '编号';
comment on column SYS_USER.company_id
  is '归属公司';
comment on column SYS_USER.office_id
  is '归属部门';
comment on column SYS_USER.login_name
  is '登录名';
comment on column SYS_USER.password
  is '密码';
comment on column SYS_USER.no
  is '工号';
comment on column SYS_USER.name
  is '姓名';
comment on column SYS_USER.email
  is '邮箱';
comment on column SYS_USER.phone
  is '电话';
comment on column SYS_USER.mobile
  is '手机';
comment on column SYS_USER.user_type
  is '用户类型';
comment on column SYS_USER.photo
  is '用户头像';
comment on column SYS_USER.createuser
  is '创建者';
comment on column SYS_USER.createdate
  is '创建时间';
comment on column SYS_USER.lastupdateuser
  is '更新者';
comment on column SYS_USER.lastupdatedate
  is '更新时间';
comment on column SYS_USER.remarks
  is '备注信息';
comment on column SYS_USER.login_flag
  is '是否允许登录：1、是；0、否';
comment on column SYS_USER.gender
  is '性别';
comment on column SYS_USER.idcard
  is '身份证号';
comment on column SYS_USER.birthday
  is '生日';
comment on column SYS_USER.nation
  is '民族';
comment on column SYS_USER.qq
  is 'QQ';
comment on column SYS_USER.status
  is '状态';
create index SYS_USER_COMPANY_ID on SYS_USER (COMPANY_ID);
create index SYS_USER_DEL_FLAG on SYS_USER (LOGIN_FLAG);
create index SYS_USER_LOGIN_NAME on SYS_USER (LOGIN_NAME);
create index SYS_USER_OFFICE_ID on SYS_USER (OFFICE_ID);
create index SYS_USER_UPDATE_DATE on SYS_USER (LASTUPDATEDATE);
alter table SYS_USER
  add constraint PRIMARY_32 primary key (ID)
  disable
  novalidate;

prompt
prompt Creating table SYS_USER_ROLE
prompt ============================
prompt
create table SYS_USER_ROLE
(
  user_id VARCHAR2(64 CHAR) not null,
  role_id VARCHAR2(64 CHAR) not null
)
;
comment on column SYS_USER_ROLE.user_id
  is '用户编号';
comment on column SYS_USER_ROLE.role_id
  is '角色编号';
alter table SYS_USER_ROLE
  add constraint PRIMARY_33 primary key (USER_ID, ROLE_ID)
  disable
  novalidate;

prompt
prompt Creating table T_WXL_ACTIVITYSIGN
prompt =================================
prompt
create table T_WXL_ACTIVITYSIGN
(
  id       VARCHAR2(32 CHAR) not null,
  activity VARCHAR2(32 CHAR),
  signor   VARCHAR2(45 CHAR),
  signtime DATE,
  signtype CHAR(1 CHAR),
  idcard   VARCHAR2(18 CHAR),
  units    VARCHAR2(100 CHAR),
  phone    VARCHAR2(45 CHAR)
)
;
alter table T_WXL_ACTIVITYSIGN
  add constraint PRIMARY_45 primary key (ID)
  disable
  novalidate;

prompt
prompt Creating table T_WXL_BILLRULE
prompt =============================
prompt
create table T_WXL_BILLRULE
(
  id         VARCHAR2(64 CHAR) not null,
  classname  VARCHAR2(200 CHAR),
  max_value  FLOAT default '0',
  prefix     VARCHAR2(15 CHAR),
  yearmonth  VARCHAR2(15 CHAR),
  allformate VARCHAR2(64 CHAR)
)
;
comment on column T_WXL_BILLRULE.id
  is '主键';
comment on column T_WXL_BILLRULE.classname
  is '类名';
comment on column T_WXL_BILLRULE.max_value
  is '最大值';
comment on column T_WXL_BILLRULE.prefix
  is '前缀';
comment on column T_WXL_BILLRULE.yearmonth
  is '年月';
comment on column T_WXL_BILLRULE.allformate
  is '格式';
alter table T_WXL_BILLRULE
  add constraint PRIMARY_46 primary key (ID);

prompt
prompt Creating table T_WXL_SIGN
prompt =========================
prompt
create table T_WXL_SIGN
(
  id       VARCHAR2(45 CHAR) not null,
  phrase   VARCHAR2(500 CHAR),
  priority VARCHAR2(45 CHAR),
  personid VARCHAR2(45 CHAR)
)
;
alter table T_WXL_SIGN
  add constraint PRIMARY_47 primary key (ID)
  disable
  novalidate;

prompt
prompt Creating table T_WXL_SIGNPHOTO
prompt ==============================
prompt
create table T_WXL_SIGNPHOTO
(
  id       VARCHAR2(45 CHAR) not null,
  photo    BLOB,
  personid VARCHAR2(45 CHAR)
)
;
alter table T_WXL_SIGNPHOTO
  add constraint PRIMARY_48 primary key (ID);

prompt
prompt Creating table T_WXL_STORGE
prompt ===========================
prompt
create table T_WXL_STORGE
(
  id               VARCHAR2(60 CHAR) not null,
  logicalname      VARCHAR2(100 CHAR),
  physicalname     VARCHAR2(100 CHAR),
  filetype         VARCHAR2(45 CHAR),
  filephysicalpath VARCHAR2(300 CHAR),
  logicalmodule    VARCHAR2(100 CHAR),
  delflag          CHAR(1 CHAR) default '0',
  entityid         VARCHAR2(60 CHAR),
  sys              VARCHAR2(45 CHAR),
  type             VARCHAR2(45 CHAR),
  filesize         NUMBER
)
;
comment on column T_WXL_STORGE.sys
  is '系统';
comment on column T_WXL_STORGE.type
  is '类别（模块）';
alter table T_WXL_STORGE
  add constraint PRIMARY_1 primary key (ID);


prompt Done
spool off
set define on

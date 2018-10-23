<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>控制台首页</title>
<meta name="decorator" content="layui" />
<link rel="stylesheet" href="${ctxStatic}/wxl/modules/sys/home/admin.css" media="all" />
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md8">
				<div class="layui-row layui-col-space15">
					<div class="layui-col-md6">
						<div class="layui-card">
							<div class="layui-card-header"><i class="fa fa-plane"></i> 快捷方式</div>
							<div class="layui-card-body">
								<div id="x" class="layui-carousel layadmin-carousel layadmin-shortcut">
									<div carousel-item>
										<ul class="layui-row layui-col-space10">
											<c:set var="count_menu" value="0"></c:set>
										<c:forEach items="${fns:getMenuList()}" var="menu" varStatus="s">
											<c:if test="${not empty menu.href}">
												<c:set var="count_menu" value="${count_menu + 1}"></c:set>
												<li class="layui-col-xs3">
													<a data-url="${menu.href}">
														${menu.icon} <cite>${menu.name}</cite>
													</a>
												</li>
											</c:if>
											<c:if test="${count_menu>0 and count_menu%12 == 0}">
											</ul>
											<ul class="layui-row layui-col-space10">
											</c:if>
										</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="layui-col-md6">
						<div class="layui-card">
							<div class="layui-card-header"><i class="fa fa-hourglass-1"></i> 待办事项</div>
							<div class="layui-card-body">
								<div class="layui-carousel layadmin-carousel layadmin-backlog">
									<div carousel-item>
										<ul class="layui-row layui-col-space10">
											<li class="layui-col-xs6"><a data-url="" class="layadmin-backlog-body">
													<h3>待审评论</h3>
													<p>
														<cite>66</cite>
													</p>
												</a></li>
											<li class="layui-col-xs6"><a data-url="" class="layadmin-backlog-body">
													<h3>待审帖子</h3>
													<p>
														<cite>12</cite>
													</p>
												</a></li>
											<li class="layui-col-xs6"><a data-url="" class="layadmin-backlog-body">
													<h3>待审商品</h3>
													<p>
														<cite>99</cite>
													</p>
												</a></li>
											<li class="layui-col-xs6"><a data-url="" class="layadmin-backlog-body">
													<h3>待发货</h3>
													<p>
														<cite>20</cite>
													</p>
												</a></li>
										</ul>
										<ul class="layui-row layui-col-space10">
											<li class="layui-col-xs6"><a data-url="" class="layadmin-backlog-body">
													<h3>待审友情链接</h3>
													<p>
														<cite style="color: #FF5722;">5</cite>
													</p>
												</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="layui-col-md12">
						<div class="layui-card"> 
							<div class="layui-card-header"><i class="fa fa-line-chart"></i> 实时监控</div>
							<div class="layui-card-body">
								<div class="layui-carousel layadmin-carousel layadmin-dataview" data-anim="fade" lay-filter="LAY-index-dataview">
									<div carousel-item id="LAY-index-dataview">
										<div>
											<div id="mainCpu" style="width:100%;height:100%;"></div>
										</div>
										<div>
											<div id="mainMemery" style="width:100%;height:100%;"></div>
										</div>
										<div>
											<div id="mainJvm" style="width:100%;height:100%;"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="layui-card">
							<div class="layui-tab layui-tab-brief layadmin-latestData">
								<ul class="layui-tab-title">
									<li class="layui-this"><i class="fa fa-fire"></i> 今日热搜</li>
									<li>今日热帖</li>
								</ul>
								<div class="layui-tab-content">
									<div class="layui-tab-item layui-show">
										<table id="LAY-index-topSearch"></table>
									</div>
									<div class="layui-tab-item">
										<table id="LAY-index-topCard"></table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-col-md4">
				<div class="layui-card"> 
					<div class="layui-card-header"><i class="fa fa-soccer-ball-o"></i> 系统信息</div>
					<div class="layui-card-body layui-text">
						<table class="layui-table">
							<colgroup>
								<col width="100">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<td style="text-align:right;width:100px;">IP地址：</td>
									<td><span id='ip'></span></td>
									<td style="text-align:right;width:100px;">主机名：</td>
									<td><span id='hostName'></span></td>
								</tr>
								<tr>
									<td style="text-align:right;">操作系统信息：</td>
									<td><span id='os'></span></td>
									<td style="text-align:right;">java版本：</td>
									<td><span id='jv'></span></td>
								</tr>
								<tr>
									<td style="text-align:right;">CPU核数：</td>
									<td><span id='cpucount'></span></td>
									<td style="text-align:right;">内存：</td>
									<td><span id='memery'></span></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="layui-card">
					<div class="layui-card-header"><i class="fa fa-random"></i> 系统进度</div>
					<div class="layui-card-body layadmin-takerates">
						<ul class="layui-timeline">
							<li class="layui-timeline-item">
								<i class="layui-icon layui-timeline-axis">&#59222;</i>
								<div class="layui-timeline-content layui-text">
								    <h3 class="layui-timeline-title">2018年07月03日</h3>
									<p>UEditor富文本</p>
									<ul>
										<li>基本功能</li>
										<li>文件上传</li>
									</ul>
								</div>
							</li>
							<li class="layui-timeline-item">
								<i class="layui-icon layui-timeline-axis">&#58943;</i>
								<div class="layui-timeline-content layui-text">
								    <h3 class="layui-timeline-title">2018年07月02日</h3>
									<p>树形表单</p>
									<ul>
										<li>ztree转换成树形表格</li>
										<li>增删改刷新</li>
									</ul>
								</div>
							</li>
							<li class="layui-timeline-item">
								<i class="layui-icon layui-timeline-axis">&#58943;</i>
								<div class="layui-timeline-content layui-text">
								    <h3 class="layui-timeline-title">2018年06月19日</h3>
									<p>首页系统设置信息</p>
									<ul>
										<li>图标</li>
										<li>缓存</li>
										<li>锁屏</li>
									</ul>
								</div>
							</li>
							<li class="layui-timeline-item">
								<i class="layui-icon layui-timeline-axis">&#58943;</i>
								<div class="layui-timeline-content layui-text">
								    <h3 class="layui-timeline-title">2018年06月15日</h3>
									<p>首页添加<em>“系统监听”</em>信息</p>
									<ul>
										<li>CPU使用率</li>
										<li>内存占用率</li>
										<li>JVM使用率</li>
									</ul>
								</div>
							</li>
							<li class="layui-timeline-item">
								<i class="layui-icon layui-timeline-axis">&#58943;</i>
								<div class="layui-timeline-content layui-text">
								    <h3 class="layui-timeline-title">2018年06月14日</h3>
									<p>首页添加<em>“系统信息”</em></p>
									<ul>
										<li>用户信息</li>
										<li>java信息</li>
										<li>CPU、内存信息</li>
									</ul>
								</div>
							</li>
							<li class="layui-timeline-item">
								<i class="layui-icon layui-timeline-axis">&#58943;</i>
								<div class="layui-timeline-content layui-text">
								    <h3 class="layui-timeline-title">2018年05月</h3>
									<p>具体模块调整</p>
									<ul>
										<li>用户信息</li>
										<li>组织机构信息</li>
										<li>菜单信息</li>
										<li>角色信息</li>
										<li>数据字典信息：主子表形式</li>
										<li>区域信息</li>
										<li>日志信息</li>
									</ul>
								</div>
							</li>
							<li class="layui-timeline-item">
								<i class="layui-icon layui-timeline-axis">&#58943;</i>
								<div class="layui-timeline-content layui-text">
								    <h3 class="layui-timeline-title">2018年05月</h3>
									<p>调整首页</p>
									<ul>
										<li>菜单导航</li>
										<li>用户信息</li>
										<li>首页信息</li>
									</ul>

								</div>
							</li>
							<li class="layui-timeline-item">
								<i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop layui-timeline-axis"></i>
								<div class="layui-timeline-content layui-text">
								    <h3 class="layui-timeline-title">2018年04月</h3>
									<p>风格升级成<em>Layui</em></p>
									<ul>
										<li>UI组件使用layui</li>
										<li>图表：Echarts</li>
										<li>树：zTree</li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="layui-card">
					<div class="layui-card-header">实时监控</div>
					<div class="layui-card-body layadmin-takerates">
						<div class="layui-progress" lay-showPercent="yes">
							<h3>CPU使用率</h3>
							<div class="layui-progress-bar" lay-percent="58%"></div>
						</div>
						<div class="layui-progress" lay-showPercent="yes">
							<h3>内存占用率</h3>
							<div class="layui-progress-bar layui-bg-red" lay-percent="90%"></div>
						</div>
					</div>
				</div>
				<div class="layui-card">
					<div class="layui-card-header">产品动态</div>
					<div class="layui-card-body">
						<div class="layui-carousel layadmin-carousel layadmin-news" data-autoplay="true" data-anim="fade" lay-filter="news">
							<div carousel-item>
								<!-- <div>
									<a href="http://fly.layui.com/docs/2/" target="_blank" class="layui-bg-red">layuiAdmin 快速上手文档</a>
								</div>
								<div>
									<a href="javascript:;" onclick="layer.msg('等待添加')" target="_blank" class="layui-bg-green">layuiAdmin 集成心得分享</a>
								</div>
								<div>
									<a href="javascript:;" onclick="layer.msg('等待添加')" target="_blank" class="layui-bg-blue">首款 layui 官方后台模板系统正式发布</a>
								</div> -->
							</div>
						</div>
					</div>
				</div>
				<!-- <div class="layui-card">
					<div class="layui-card-header">
						作者心语 <i class="layui-icon layui-icon-tips" lay-tips="要支持的噢" lay-offset="5"></i>
					</div>
					<div class="layui-card-body layui-text layadmin-text">
						<p>一直以来，layui 秉承无偿开源的初心，虔诚致力于服务各层次前后端 Web 开发者，在商业横飞的当今时代，这一信念从未动摇。即便身单力薄，仍然重拾决心，埋头造轮，以尽可能地填补产品本身的缺口。</p>
						<p>在过去的一段的时间，我一直在寻求持久之道，已维持你眼前所见的一切。而 layuiAdmin 是我们尝试解决的手段之一。我相信真正有爱于 layui 生态的你，定然不会错过这一拥抱吧。</p>
						<p>
							子曰：君子不用防，小人防不住。请务必通过官网正规渠道，获得 <a href="http://www.layui.com/admin/" target="_blank">layuiAdmin</a>！
						</p>
						<p>
							—— 贤心（<a href="http://www.layui.com/" target="_blank">layui.com</a>）
						</p>
					</div>
				</div> -->
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${ctxStatic}/wxl/modules/sys/home/index.js"></script>	
	<script type="text/javascript" src="${ctxStatic}/plugins/echarts/build/dist/echarts-all.js"></script>	
	<script type="text/javascript" src="${ctxStatic}/wxl/modules/sys/home/cpu.js"></script>
	<script type="text/javascript" src="${ctxStatic}/wxl/modules/sys/home/memery.js"></script>
	<script type="text/javascript" src="${ctxStatic}/wxl/modules/sys/home/jvm.js"></script>
	<script type="text/javascript" src="${ctxStatic}/wxl/modules/sys/home/sys.js"></script>
</body>
</html>
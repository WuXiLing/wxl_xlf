@echo off
rem /**
rem  * Copyright &copy; 2016-2018 <a href="https://wxl.com">WXL CMS</a> All rights reserved.
rem  *
rem  * Author: liangxiaofeng0615@163.com
rem  */
title %cd%
echo.
echo [信息] 使用Jetty插件运行工程。
echo.
rem pause
rem echo.

cd %~dp0
cd..

set MAVEN_OPTS=%MAVEN_OPTS% -Xms256m -Xmx512m -XX:PermSize=128m -XX:MaxPermSize=256m
call mvn jetty:run

cd bin
pause
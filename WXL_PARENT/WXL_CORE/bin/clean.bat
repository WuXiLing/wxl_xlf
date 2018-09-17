@echo off
rem /**
rem  * Copyright &copy; 2016-2018 <a href="https://wxl.com">WXL CMS</a> All rights reserved.
rem  *
rem  * Author: liangxiaofeng0615@163.com
rem  */
title %cd%
echo.
echo 清理项目
echo.
pause
echo.

cd %~dp0
cd..

call mvn clean

cd bin
pause
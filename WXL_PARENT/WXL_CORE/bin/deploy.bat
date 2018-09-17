@echo off
rem /**
rem  * Copyright &copy; 2016-2018 <a href="https://wxl.com">WXL CMS</a> All rights reserved.
rem  *
rem  * Author: liangxiaofeng0615@163.com
rem  */
title %cd%
echo.
echo ÉÏ´«jar¡¢warµ½²Ö¿â
echo.
pause
echo.

cd %~dp0
cd..

call mvn clean install deploy -e -U -X

cd bin
pause
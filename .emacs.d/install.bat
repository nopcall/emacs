@echo off
@echo 修改注册表
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\GNU\Emacs" /v HOME /d %~dp0 /f
@echo 修改注册表完毕
@echo off&setlocal ENABLEEXTENSIONS
@echo 开始安装字体
for /f %%a in ('dir *.ttf /b') do (
dir %windir%\fonts\%%a>nul 2>nul||(copy %%a %windir%\fonts>nul 2>nul&rundll32.exe gdi32.dll,AddFontResourceA %windir%\fonts\%%a)
)
@echo 安装字体完毕
@echo off
@echo �޸�ע���
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\GNU\Emacs" /v HOME /d %~dp0 /f
@echo �޸�ע������
@echo off&setlocal ENABLEEXTENSIONS
@echo ��ʼ��װ����
for /f %%a in ('dir *.ttf /b') do (
dir %windir%\fonts\%%a>nul 2>nul||(copy %%a %windir%\fonts>nul 2>nul&rundll32.exe gdi32.dll,AddFontResourceA %windir%\fonts\%%a)
)
@echo ��װ�������
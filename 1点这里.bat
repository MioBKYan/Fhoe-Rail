@echo off
setlocal enabledelayedexpansion

REM ���õ�ǰĿ¼Ϊ�������ļ�����Ŀ¼
CD /D "%~dp0"
REM ���ô��ڱ���
TITLE ��Fhoe-Rail��

REM ��������̨���ڴ�С
mode con cols=85 lines=40

REM ��鲢��ȡ����ԱȨ��
>nul 2>&1 REG.exe query "HKU\S-1-5-19" || (
    ECHO Set UAC = CreateObject^("Shell.Application"^) > "%TEMP%\Getadmin.vbs"
    ECHO UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\Getadmin.vbs"
    "%TEMP%\Getadmin.vbs"
    DEL /f /q "%TEMP%\Getadmin.vbs" 2>NUL
    Exit /b
)

:continue

REM ��ʼ������
set "OPTION="

echo.
echo   ������Ϊ��Դ��Ŀħ�ķ�֧����Զ������̳���ͬ����
echo.
echo   �������ֹ�����㡢תת�ȶ���ƽ̨���ۣ������԰�װ�����ѵ����壩���з��ֺ���Ը�
echo.
echo   ���������Լ�д�����ñ��˵Ķ���˵���Լ�д�ĺ�����
echo.
echo   ʹ�ñ�������50%�ĸ��ʱ���ţ�����ִ�����У�������ͬ����ط��������Լ��е�
echo.
echo   ������ѡ�
echo.
echo   [1] �״�����
echo.
echo   [2] ������Ĭ��1-1���޲������Զ�ѡ��
echo.
echo   [3] ��ͼ��ѡ������ͼ��
echo.
echo   [4] ���ã����ú�ѡ��ͼ��
echo.
echo   [5] ¼��
echo.
echo   [6] ���ԣ���ͼ��,F8��ͣ��
echo.

REM �ȴ��û������ʱ
choice /C 123456 /T 30 /D 2 /N >nul

REM �����û�����
if errorlevel 6 (
    color 0C
    echo.
    echo   Tips����F8��ͣ����ͣ��F8��������F9�������е�ǰ��ͼ
    python -i -X utf8 Honkai_Star_Rail.py --dev
    echo.
    pause
    goto :end
) else if errorlevel 5 (
    color 0B
    echo.
    python -i -X utf8 utils/record.py
    echo.
    pause
    goto :end
) else if errorlevel 4 (
    color 0D
    echo.
    python -i -X utf8 Honkai_Star_Rail.py --config
    echo.
    pause
    goto :end
) else if errorlevel 3 (
    color 0E
    echo.
    echo   ������������...
    echo.
    python -i -X utf8 Honkai_Star_Rail.py --debug
    echo.
    pause
    goto :end
) else if errorlevel 2 (
    color 0F
    echo.
    echo   ���ڼ�������...
    echo.
    python -i -X utf8 Honkai_Star_Rail.py
    echo.
    pause
    goto :end
) else (
    color 0A
    echo.
    echo   ���ڼ�鲢��װ����...
    echo.
    python utils/install_requirements.py
    echo.
    goto :start_script
)

:start_script
echo.
echo   ����������ͼѡ��...
echo.
python -i -X utf8 Honkai_Star_Rail.py --debug
echo.
pause
goto :end

:end
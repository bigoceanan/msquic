@echo off
set MSQUIC_ROOT=D:\quic\msquic
set MSQUIC_INC=%MSQUIC_ROOT%\src\inc
set MSQUIC_LIB_DIR=%MSQUIC_ROOT%\artifacts\bin\windows\x64_Debug_openssl

:: 设置Visual Studio环境
::call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"

:: 编译
cl my_sample.c ^
    /I"%MSQUIC_INC%" ^
    /link ^
    /LIBPATH:"%MSQUIC_LIB_DIR%" ^
    msquic.lib ^
    kernel32.lib ^
    user32.lib ^
    advapi32.lib ^
    bcrypt.lib ^
    crypt32.lib ^
    iphlpapi.lib ^
    ntdll.lib ^
    ws2_32.lib

if %errorlevel% equ 0 (
    echo.
    echo Build successful!
    rem echo Run with: my_sample.exe -client -unsecure -target:127.0.0.1
) else (
    echo Build failed!
)

::pause

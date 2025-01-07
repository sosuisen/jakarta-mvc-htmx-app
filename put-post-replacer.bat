@echo off

if "%1"=="pre" (
    echo Converting PUT to POST...
    powershell -Command "Get-ChildItem -Path src\main\webapp\WEB-INF\views -Filter *.jsp -Recurse | ForEach-Object { (Get-Content $_.FullName) -replace 'hx-put', 'hx-vals=''{\""_method\"": \""PUT\""}'' hx-post' | Set-Content $_.FullName }"
) else if "%1"=="post" (
    echo Converting back to PUT...
    powershell -Command "Get-ChildItem -Path src\main\webapp\WEB-INF\views -Filter *.jsp -Recurse | ForEach-Object { (Get-Content $_.FullName) -replace 'hx-vals=''{\""_method\"": \""PUT\""}'' hx-post', 'hx-put' | Set-Content $_.FullName }"
) else (
    echo Usage: %0 {pre^|post}
    exit /b 1
) 
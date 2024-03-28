@echo off
start /B /wait powershell.exe -executionpolicy remotesigned -WindowStyle hidden -File "%cd%/powershell.ps1"
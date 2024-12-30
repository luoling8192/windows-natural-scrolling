#Requires -Version 7.0
#Requires -RunAsAdministrator

<#
.SYNOPSIS
    设置Windows鼠标自然滚动方向。
.DESCRIPTION
    此脚本通过修改注册表来为所有USB鼠标设备启用自然滚动。
    自然滚动与macOS的滚动方向一致，向上滑动触摸板时页面向上滚动。
.NOTES
    文件名: Set-NaturalScrolling.ps1
    作者: Community
    要求: PowerShell 7+, 管理员权限
    版本: 1.0
#>

# 注册表路径
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\HID"

# 获取所有以 VID_ 开头的设备
$devices = Get-ChildItem -Path $regPath | Where-Object { $_.PSChildName -like "VID_*" }

# 初始化计数器
$devicesModified = 0

foreach ($device in $devices) {
    $deviceParamsPath = "$($device.PSPath)\**\Device Parameters"

    # 检查 Device Parameters 是否存在
    if (Test-Path $deviceParamsPath) {
        try {
            # 设置 FlipFlopWheel 值为 1
            Set-ItemProperty -Path $deviceParamsPath -Name "FlipFlopWheel" -Value 1 -Type DWord
            $devicesModified++
            Write-Host "[成功] 已将 $($device.PSChildName) 的滚动方向设置为自然滚动。" -ForegroundColor Green
        }
        catch {
            Write-Host "[错误] 无法修改 $($device.PSChildName) 的设置：$($_.Exception.Message)" -ForegroundColor Red
        }
    }
}

if ($devicesModified -gt 0) {
    Write-Host "`n共成功修改了 $devicesModified 个设备的设置。" -ForegroundColor Cyan
    Write-Host "请重新插拔鼠标设备或重启电脑以使更改生效。" -ForegroundColor Yellow
}
else {
    Write-Host "`n未发现可修改的设备。" -ForegroundColor Yellow
}

# 等待用户按键后退出
Write-Host "`n按任意键退出..." -NoNewline
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

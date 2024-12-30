# 🖱️ Windows Natural Scrolling Tool

A PowerShell script that enables natural scrolling for all USB mouse devices in Windows, making them behave like macOS scrolling direction.

## ✨ Features

- 🔍 Automatically detects all USB mouse devices
- 🔄 Enables natural scrolling direction in batch
- 📝 Provides detailed execution logs
- ⚡ Supports error handling and status feedback

## 🛠️ Requirements

- Windows 10/11
- PowerShell 7.0 or higher
- Administrator privileges

## 📋 Prerequisites

Before running the script, ensure you have:

1. ✅ PowerShell 7+ installed on your system
   - Install from [Microsoft Store](https://www.microsoft.com/store/apps/9MZ1SNWT0N5D)
   - Or download from [GitHub](https://github.com/PowerShell/PowerShell/releases)
2. ✅ Administrator rights on your Windows system

## 🚀 Installation

1. Download `Set-NaturalScrolling.ps1`
2. Right-click the script and select "Run with PowerShell 7"
   - Or launch PowerShell 7 as Administrator and navigate to the script's directory

## 💻 Usage

```powershell
.\Set-NaturalScrolling.ps1
```

## ⚙️ How It Works

The script:

- Checks for administrator privileges
- Scans registry for USB mouse devices
- Modifies the FlipFlopWheel value for each device
- Provides immediate feedback on the operation

## 🔄 After Installation

Unplug and replug your mouse devices
Or restart your computer
Your mouse should now scroll in the natural direction

## 🤝 Contributing

Feel free to:

- Open issues
- Submit pull requests
- Suggest improvements

## ⚠️ Important Notes

- Backup your registry before running the script
- Some devices might require a system restart
- Not all mouse devices support this modification

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details

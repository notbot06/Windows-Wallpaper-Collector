# Windows-Wallpaper-Collector
**Developed by [notbot06](https://github.com/notbot06)**

A specialized tool to harvest high-resolution OEM wallpapers and Windows 11 system backgrounds.

### 🚀 What it does
This tool automatically scans `C:\Windows\Web\Wallpaper` and copies all contents—including manufacturer-specific backgrounds (Dell, HP, Lenovo, etc.)—to your USB drive, organized by date and machine model.

### 🚀 Usage
1. Extract the .zip file 
1. Place the `Run-Collector.bat` and `.ps1` in a folder on your USB. Or just copy the folder you extracted onto your usb.
2. Run `Run-Collector.bat`.
3. You're done! The OEM Wallpapers that would've shipped with your laptop (if present) are in the folder structure below:

### 📂 Output Structure
```text
(Your-Folder)
└── YYYY-MM-DD/
	└── Manufacturer_Model/
		└── OEM_Wallpapers/
```
### ⚖️ License
MIT License. Attribution to notbot06 required.

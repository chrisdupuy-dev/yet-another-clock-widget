<div style="display: flex; flex-direction: column; justify-content: center; align-items: center; margin:10px">
  <img src="./assets/logo.png" alt="logo" style="width:300px;"/>
  <span style="margin-top:5px"><a href="https://store.kde.org/p/2346893">Download from KDE Store</a></span>
</div>

# Yet Another Clock Widget for KDE Plasma 6
A KDE Plasma clock widget featuring the ability to add styles and effects including colors, blur, drop shadows and strokes.
![Example screenshot](./assets/0-example-comp.png "Example screenshot")
 \* [PaintCans Free](https://graffitifonts.com/free_fonts/paintcans_free) used for font in screenshot
## Features
### 🕒 **Can display the time, date and time zone!**
You can also hide them if you prefer.

### 🎨 **Tons of style customization options!**
Adjust the style of all labels either individually or globally, this includes:
  * Font
  * Size
  * Colors
  * Blur
  * Drop shadow
  * Stroke

### 🔀 **Format and position the way you want!**
On top of being able to display the time, date or time zone the way you want you can also anchor them around each other or create your own positional offsets.

## Installation
### KDE Desktop Store
1. Right click on the desktop and select "Enter Edit Mode"
1. Click on "Add or Manage Widgets..."
1. Click on "Get New..."
1. Click on "Download New Plasma Widgets"
1. Search for "Yet Another Clock Widget"
1. Click on "Install"

### KDE Website Store
Download and install from [here](https://store.kde.org/p/2346893)

### CLI
```bash
git clone https://github.com/chrisdupuy-dev/yet-another-clock-widget && kpackagetool6 -i yet-another-clock-widget/package/ -t Plasma/Applet
```
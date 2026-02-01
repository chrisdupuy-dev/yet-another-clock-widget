# Yet Another Clock Widget (WIP)
A KDE Plasma clock widget tailored towards style and effects.

## Pre-reqs
- plasma-sdk

## Running
1. Navigate to `./package` directory
1. Run `plasmoidviewer -a .`


# TODO
- Other
  - Fix widget width/height

- Styling
  - Make strokes less jank
    - Either scale the number of label redraws with the font or find another way
  - Drop shadow
    - Expose all the vars (offsets, blur, etc.)
  - Offsets (x,y)
  - Blur
  - Masking
  - Previewable

- Time
  - Show seconds option
    - Also fix refresh rate if seconds showing

- Date
  - Ability to adjust position
    - Above
    - Below
    - Sides
  - Date format
    - Long
    - Short
    - ISO
    - Custom
    - Link to formatting docs

- Timezone
  - Show Timezone
    - Never, always and only in tooltip
  - Update config icon
  - Timezone format
    - Code
    - City
    - UTC offset
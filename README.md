# Yet Another Clock Widget (WIP)
A KDE Plasma clock widget tailored towards style and effects.

## Pre-reqs
- plasma-sdk

## Running
1. Navigate to `./package` directory
1. Run `plasmoidviewer -a .`


# TODO
- Styling
  - Make strokes less jank
    - Either scale the number of label redraws with the font or find another way
  - Blur
  - Masking
  - Previewable

- Timezone
  - Show Timezone
    - Never, always and only in tooltip
  - Update config icon
  - Timezone format
    - Code
    - City
    - UTC offset

- Polish
  - Sensible defaults
  - Locale stuff
    - including metadata
  - Fix widget width/height cutting off other labels/shadows
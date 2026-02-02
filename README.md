# Yet Another Clock Widget (WIP)
A KDE Plasma clock widget tailored towards style and effects.

## Pre-reqs
- plasma-sdk

## Running
1. Navigate to `./package` directory
1. Run `plasmoidviewer -a .`


# TODO 1.0
- Styling
  - Make strokes less jank
    - Either scale the number of label redraws with the font or find another way
  - Blur
  - Previewable

- Polish
  - Sensible defaults
  - Locale stuff
    - including metadata
  - Fix widget width/height cutting off other labels/shadows
    - autoPaddingEnabled?
  - Fix stroke color
  - Fix drop shadow color

# TODO 1.1
- Styling
  - Masking
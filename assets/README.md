# Assets Directory

This directory contains all the static assets used in the Atlas Dashboard application.

## Structure

- **images/**: Application images, logos, and graphics
- **icons/**: Custom icons and icon assets
- **fonts/**: Custom font files (if any)

## Adding Assets

1. Place your asset files in the appropriate subdirectory
2. Update `pubspec.yaml` to include the assets:

```yaml
flutter:
  assets:
    - assets/images/logo.png
    - assets/icons/custom_icon.png
```

## Image Guidelines

- Use PNG for images with transparency
- Use WebP for optimized file sizes
- Provide multiple resolutions (1x, 2x, 3x) for crisp display on all devices
- Keep file sizes optimized for better performance

## Icon Guidelines

- Use vector formats (SVG) when possible
- Provide multiple sizes for raster icons
- Follow Material Design icon guidelines
- Use consistent naming convention

## Font Guidelines

- Only include custom fonts if necessary
- Ensure fonts are properly licensed
- Update `pubspec.yaml` with font family definitions

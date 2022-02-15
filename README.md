# RECON: Resize and convert

Convert PNG/JPG to WEBP format. Resize images to `resized` dir.

## Getting started

Clone or download the repo.

### Convert PNG/JPG/JPEG to WEBP

```sh
recon img2webp -d . -q 90
```

### Convert PNG to WEBP

```sh
recon png2webp -d . -q 90
```

### Convert JPG/JPEG to WEBP

```sh
recon jpg2webp -d . -q 90
```

### Resize all files to 540x284

```sh
recon resize -d . -w 540 -h 284
```

## Credits

- [Create optimize image](https://github.com/shinokada/create-optimize-images)

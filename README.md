# CONSIZE: CONvert and reSIZE

Convert PNG/JPG to WEBP format. Resize images to `resized` dir.

## Getting started

Clone or download the repo.

### Convert PNG/JPG/JPEG to WEBP

```sh
consize img2webp -d . -q 90
```

### Convert PNG to WEBP

```sh
consize png2webp -d . -q 90
```

### Convert JPG/JPEG to WEBP

```sh
consize jpg2webp -d . -q 90
```

### Resize all files to 540x284

```sh
consize resize -d . -w 540 -h 284
```

## Credits

- [Create optimize image](https://github.com/shinokada/create-optimize-images)

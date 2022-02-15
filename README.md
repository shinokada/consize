# CONSIZE: CONvert and reSIZE

Convert PNG/JPG to WEBP format. Resize images to `resized` dir.

## Getting started

### Homebrew

```sh
brew tap shinokada/consize
brew install consize
```


### Awesome package manager

After installing [Awesome package manager](https://github.com/shinokada/awesome):

```sh
awesome install shinokada/consize
```

### Clone or download

Please clone or download from the [repo](https://github.com/shinokada/consize).

## How to use this

### Convert PNG/JPG/JPEG to WEBP

```sh
consize img2webp -d . -q 90
```

### Resize all files to 540x284

```sh
consize resize -d . -w 540 -h 284
```

### Convert PNG to WEBP

```sh
consize png2webp -d . -q 90
```

### Convert JPG/JPEG to WEBP

```sh
consize jpg2webp -d . -q 90
```

## Credits

- [Create optimize image](https://github.com/shinokada/create-optimize-images)

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

### Debian/Ubuntu

Download the latest release from [the releases page](https://github.com/shinokada/consize/releases).

```sh
cd /path/to/dir
sudo apt install consize_x.x.x-1_all.deb
``` 

### Clone or download

Please clone or download from the [repo](https://github.com/shinokada/consize).

## How to use

### Convert PNG/JPG/JPEG to WEBP

```sh
consize img2webp -d . -q 90
```

### Resize all files to 540x284

```sh
consize resize -d . -w 540 -h 284
```

Combine both commands:

```sh
consize img2webp -d . -q 90 && consize resize -d . -w 540
```

### Convert PNG to WEBP

```sh
consize png2webp -d . -q 90
```

### Convert JPG/JPEG to WEBP

```sh
consize jpg2webp -d . -q 90
```

### Convert SVG to JPG

Install `svgexport`:

```sh
npm install svgexport -g
```

```sh
consize svg2jpg -d .
```

## Credits

- [Create optimize image](https://github.com/shinokada/create-optimize-images)

## Article

[Converting Images to WebP From Terminal](https://medium.com/mkdir-awesome/converting-images-to-webp-from-terminal-ab84f3bc6e20)
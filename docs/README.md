<h1 align="center">Consize: CONvert and reSIZE</h1>

<p align="center">
<a href="https://consize.codewithshin.com/">Consize</a>
</p>

<p align="center">
<a href="https://github.com/sponsors/shinokada" target="_blank"><img src="https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&logo=GitHub&color=%23fe8e86" height="25"></a>
<a href="https://developer.mozilla.org/en-US/docs/Web/Progressive_web_apps" target="_blank"><img src="https://img.shields.io/badge/PWA-enabled-brightgreen" alt="PWA Shield" height="25"></a>
<a href="https://twitter.com/shinokada" rel="nofollow" target="_blank"><img src="https://img.shields.io/badge/created%20by-@shinokada-4BBAAB.svg" alt="Created by Shin Okada" height="25"></a>
<a href="https://opensource.org/licenses/MIT" rel="nofollow" target="_blank"><img src="https://img.shields.io/github/license/shinokada/consize" alt="License" height="25"></a>
</p>

Bash script to convert formats and resize image.

## Getting started

### Homebrew

```sh
brew tap shinokada/consize
brew install consize
```

Homebrew will install dependencies, `imagemagick`, `webp`, and `optipng`.

### Awesome package manager

After installing [Awesome package manager](https://github.com/shinokada/awesome):

```sh
awesome install shinokada/consize
```

You need to install `imagemagick`, `webp`, and `optipng`.

```
// for example
brew i imagemagick webp optipng
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

Running this script will convert all images in the current directory.

### Convert PNG/JPG/JPEG to WEBP

```sh
consize img2webp -d . -q 90
```

Resized images will be in the `resized` dir.

### Resize all files to 540x284

```sh
consize resize -w 540 -h 284
```

Combine both commands:

```sh
consize img2webp -d . -q 90 && consize resize -w 540
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

## Optimize

These commands will run recursively in the current directory or directory specified by the `-o` option.

```bash
consize optimize_jpg
consize optimize_png
consize optimize_svg
```

## Credits

- [Create optimize image](https://github.com/shinokada/create-optimize-images)

## Article

[Converting Images to WebP From Terminal](https://medium.com/mkdir-awesome/converting-images-to-webp-from-terminal-ab84f3bc6e20)

## PWA: Fast & Offline

This website can be downloaded and installed on your device for offline access as a Progressive Web App.

To install a PWA, look for the "Add to Home Screen" option in the browser's menu or settings. On most mobile devices, this option can be found by visiting the website, then selecting the "Options" or "Menu" button in the browser, and looking for the "Add to Home Screen" option. On some desktop browsers, right-click on the page and select "Install".
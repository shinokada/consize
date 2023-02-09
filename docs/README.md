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

<p align="center">
<picture>
  <img
    src="public/images/consize.png"
    style="width: 100%;"
    alt="Consize"
  />
</picture>
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

### Options

| Options | Description |
|--|--|
|-i| Input dir option has the default value of the current directory, ./|
|-o| Output dir option has no default value |
|-q| Quality option has the default value of 100|

### Convert all image files (PNG/JPG/JPEG) to WEBP

```sh
consize img2webp -o path/to/outputdir
```

### Convert JPG/JPEG files

#### To WEBP

```sh
consize jpg2webp -o path/to/outputdir
```

#### To PNG

```sh
consize jpg2png -o path/to/outputdir
```

## Optimize

These commands will run **recursively** in the current directory or directory specified by the `-o` option.

```bash
consize optimize_jpg 
consize optimize_png
consize optimize_svg
```

## Organize files

The `consize organize_files` command will create directories based on the file extensions and move all files into their respective directories.

```bash
consize organize_files
```


### Convert PNG

#### To JPG

```sh
consize png2jpg -o path/to/outputdir
```

#### To WEBP

```sh
consize png2webp -o path/to/outputdir
```


### Resize JPG/PNG/WEBP

Resized images will be in the `resized` dir.

```sh
consize resize -w 540 -h 284
```

Set only `width`

```sh
consize resize -w 540
```


### Convert SVG

Install `svgexport`:

```sh
npm install svgexport -g
```

#### To JPG

```sh
consize svg2jpg
```

#### To PNG

```sh
consize svg2png
```

### Convert WEBP

#### To JPG

```sh
consize webp2jpg
```

#### To PNG

```sh
consize webp2png
```

## Credits

- [Create optimize image](https://github.com/shinokada/create-optimize-images)

## Article

[Converting Images to WebP From Terminal](https://medium.com/mkdir-awesome/converting-images-to-webp-from-terminal-ab84f3bc6e20)

## PWA: Fast & Offline

This website can be downloaded and installed on your device for offline access as a Progressive Web App.

To install a PWA, look for the "Add to Home Screen" option in the browser's menu or settings. On most mobile devices, this option can be found by visiting the website, then selecting the "Options" or "Menu" button in the browser, and looking for the "Add to Home Screen" option. On some desktop browsers, right-click on the page and select "Install".
#!/usr/bin/env bash

# Import files
source ../src/img2webp.sh
source ../src/jpg2png.sh
source ../src/jpg2webp.sh
source ../src/optimize_jpg.sh
source ../src/optimize_png.sh
source ../src/optimize_svg.sh
source ../src/organize_files.sh
source ../src/png2jpg.sh
source ../src/png2webp.sh
source ../src/resize.sh
source ../src/svg2jpg.sh
source ../src/svg2png.sh
source ../src/webp2jpg.sh
source ../src/webp2png.sh

source ../lib/utils.sh

test_count=1
error_count=0
success_count=0
test_failed=()
# Test variables
QUALITY=50
WIDTH=500

################################
# fn_img2webp
###############################
bannerColor "Test ${test_count}: fn_img2webp function" "black" "*"

INPUTDIR=./test-input-img2webp-dir
OUTPUTDIR=./test-output-img2webp-dir
# Create a test input directory and add some test png files
mkdir -p "${INPUTDIR}"
# creating png and jpg three images each.
for i in {1..3}; do
  convert -size 100x100 xc:white "${INPUTDIR}"/png_image_$i.png 2>&1 >/dev/null
  convert -size 100x100 xc:blue  "${INPUTDIR}"/jpg_image_$i.jpg 2>&1 >/dev/null
done


# Run the function
fn_img2webp >/dev/null

# Check if the converted webp files exist in the output directory
if [ $(find "${OUTPUTDIR}" -type f -iname "*.webp" | wc -l) -eq $(find "${INPUTDIR}" -type f \( -iname "*.png" -o -iname "*.jpg" \) | wc -l) ]; then
  bannerColor "Test passed: PNG and JPG files were converted to WEBP and moved to the output directory." "magenta" "*"
  success_count=$((success_count + 1))
else
  bannerColor "Test failed: PNG and JPG files were not converted and moved to the output directory." "red" "*"
  error_count=$((error_count + 1))
  test_failed+=("Test fn_img2webp")
fi

# Clean up the test directories
rm -rf "${INPUTDIR}" "${OUTPUTDIR}"
test_count=$((test_count + 1))

###############################
# jpg2png 
###############################
bannerColor "Test ${test_count}: fn_jpg2png function" "black" "*"
INPUTDIR=./test-input-jpg2png-dir
OUTPUTDIR=./test-output-jpg2png-dir
# Create a test input directory and add some test jpg files
mkdir -p "${INPUTDIR}"
for i in {1..3}; do
  convert -size 100x100 xc:white "${INPUTDIR}"/image_$i.jpg 2>&1 >/dev/null
done

# Run the function
fn_jpg2png >/dev/null

if [ -n "$OUTPUTDIR" ] && [ $(find "${OUTPUTDIR}" -type f -iname "*.png" | wc -l) -eq $(find "${INPUTDIR}" -type f -iname "*.jpg" | wc -l) ]; then
    bannerColor "Test passed: JPG files were converted to PNG and moved to the output directory." "magenta" "*"
    success_count=$((success_count + 1))
else
    bannerColor "Test failed: JPG files were not converted and moved to the output directory." "red" "*"
    error_count=$((error_count + 1))
    test_failed+=("Test fn_jpg2png")
fi

# Clean up the test directories
rm -rf "${INPUTDIR}" "${OUTPUTDIR}"
test_count=$((test_count + 1))

###############################
# jpg2webp
###############################
bannerColor "Test ${test_count}: fn_jpg2webp function" "black" "*"
INPUTDIR=./test-input-jpg2webp-dir
OUTPUTDIR=./test-output-jpg2webp-dir
# Create a test input directory and add some test jpg files
mkdir -p "${INPUTDIR}"
for i in {1..3}; do
  convert -size 100x100 xc:white "${INPUTDIR}"/image_$i.jpg 2>&1 >/dev/null
done

# Run the function
fn_jpg2webp >/dev/null

# Check if the converted webp files exist in the output directory
if [ $(find "${OUTPUTDIR}" -type f -iname "*.webp" | wc -l) -eq $(find "${INPUTDIR}" -type f -iname "*.jpg" | wc -l)  ]; then
    bannerColor "Test passed: JPG files were converted and moved to the output directory." "magenta" "*"
    success_count=$((success_count + 1))
else
    bannerColor "Test failed: JPG files were not converted and moved to the output directory." "red" "*"
    error_count=$((error_count + 1))
    test_failed+=("Test fn_jpg2webp")
fi

# Clean up the test directories
rm -rf "${INPUTDIR}" "${OUTPUTDIR}"
test_count=$((test_count + 1))

###############################
# optimize_jpg
###############################
bannerColor "Test ${test_count}: fn_optimize_jpg function" "black" "*"
INPUTDIR=./test-input-optimize_jpg-dir
OUTPUTDIR=./test-output-optimize_jpg-dir
# Create a test input directory and add some test jpg files
mkdir -p "${INPUTDIR}"
for i in {1..3}; do
  convert -size 1000x1000 xc:white -font Arial -pointsize 72 -fill black -gravity center -draw "text 0,0 'Image $i'" "${INPUTDIR}"/image_$i.jpg 2>&1 >/dev/null
done

# Run the function
fn_optimize_jpg >/dev/null

# Check if the optimized jpg files exist in the current directory or output directory
if [ $(find "${OUTPUTDIR}" -type f -iname "*-optimized.jpg" | wc -l) -eq $(find "${INPUTDIR}" -type f -iname "*.jpg" | wc -l)  ]; then
    bannerColor "Test passed: JPG files were optimized and exist in the output directory." "magenta" "*"
    success_count=$((success_count + 1))
else
    bannerColor "Test failed: JPG files were not optimized and exist in the output directory." "red" "*"
    error_count=$((error_count + 1))
    test_failed+=("Test fn_optimize_jpg")
fi

# Clean up the test directories
rm -rf "${INPUTDIR}" "${OUTPUTDIR}"
test_count=$((test_count + 1))

###############################
# optimize_png
###############################
bannerColor "Test ${test_count}: fn_optimize_png function" "black" "*"
INPUTDIR=./test-input-optimize_png-dir
OUTPUTDIR=./test-output-optimize_png-dir
# Create a test input directory and add some test jpg files
mkdir -p "${INPUTDIR}"
for i in {1..3}; do
  convert -size 1000x1000 xc:white -font Arial -pointsize 72 -fill black -gravity center -draw "text 0,0 'Image $i'" "${INPUTDIR}"/image_$i.png 
done

# Run the function
fn_optimize_png >/dev/null

# Check if the optimized jpg files exist in the current directory or output directory
if [ $(find "${OUTPUTDIR}" -type f -iname "*-optimized.png" | wc -l) -eq $(find "${INPUTDIR}" -type f -iname "*.png" | wc -l)  ]; then
    bannerColor "Test passed: PNG files were optimized and exist in the output directory." "magenta" "*"
    success_count=$((success_count + 1))
else
    bannerColor "Test failed: PNG files were not optimized and exist in the output directory." "red" "*"
    error_count=$((error_count + 1))
    test_failed+=("Test fn_optimize_png")
fi

# Clean up the test directories
rm -rf "${INPUTDIR}" "${OUTPUTDIR}"
test_count=$((test_count + 1))

###############################
# optimize_svg
###############################
bannerColor "Test ${test_count}: fn_optimize_svg function" "black" "*"
INPUTDIR=./test-input-optimize-svg-dir
OUTPUTDIR=./test-output-optimize-svg-dir
# Create a test input directory and add some test svg files
mkdir -p "${INPUTDIR}"
for i in {1..3}; do
  echo "<svg><rect width='100' height='100' fill='white'/><text x='50' y='50' font-size='20'>Image $i</text></svg>" > "${INPUTDIR}"/image_$i.svg 
done

# Run the function
fn_optimize_svg >/dev/null

# Check if the optimized svg files exist in the current directory or output directory
if [ $(find "${OUTPUTDIR}" -type f -iname "*-optimized.svg" | wc -l) -eq $(find "${INPUTDIR}" -type f -iname "*.svg" | wc -l)  ]; then
    bannerColor "Test passed: SVG files were optimized and exist in the output directory." "magenta" "*"
    success_count=$((success_count + 1))
else
    bannerColor "Test failed: SVG files were not optimized and exist in the output directory." "red" "*"
    error_count=$((error_count + 1))
    test_failed+=("Test fn_optimize_svg")
fi

# Clean up the test directories
rm -rf "${INPUTDIR}" "${OUTPUTDIR}"
test_count=$((test_count + 1))

###############################
# organize_files
###############################
bannerColor "Test ${test_count}: fn_organize_files function" "black" "*"
INPUTDIR=./test-input-organize-dir
OUTPUTDIR=./test-output-organize-dir
# Create a test input directory and add some test files
mkdir -p "${INPUTDIR}"
for i in {1..3}; do
  convert -size 100x100 xc:white "${INPUTDIR}"/image_$i.jpg 2>&1 >/dev/null
  echo "Hello, World!" >> "${INPUTDIR}"/file_$i.txt
done

# Run the function
echo "yes" | fn_organize_files >/dev/null

# Check if the files have been moved to their respective type directories
if [ -n "${INPUTDIR}" ] && [ $(find "${INPUTDIR}" -type f | wc -l) -eq 6 ]; then
  jpeg_count=$(find "${INPUTDIR}" -name "*.jpg" | wc -l)
  plain_count=$(find "${INPUTDIR}" -name "*.txt" | wc -l)
  if [ $jpeg_count -eq 3 ] && [ $plain_count -eq 3 ]; then
    bannerColor "Test passed: Files were created and stored in the correct format." "magenta" "*"
    success_count=$((success_count + 1))
  else
    echo "INPUTDIR contains $jpeg_count JPEG files and $plain_count text files."
    bannerColor "Test failed: Files were not created and stored in the correct format." "red" "*"
    error_count=$((error_count + 1))
    test_failed+=("Test fn_create_files")
  fi
else
  bannerColor "Test failed: Files were not created and stored in the correct format." "red" "*"
  error_count=$((error_count + 1))
  test_failed+=("Test fn_create_files")
fi


# Clean up the test directories
rm -rf "${INPUTDIR}" "${OUTPUTDIR}"
test_count=$((test_count + 1))

################################
# fn_png2jpg
################################
bannerColor "Test ${test_count}: fn_png2jpg function" "black" "*"
INPUTDIR=./test-input-png2jpg-dir
OUTPUTDIR=./test-output-png2jpg-dir
# Create a test input directory and add some test png files
mkdir -p "${INPUTDIR}"
for i in {1..3}; do
  convert -size 100x100 xc:white "${INPUTDIR}"/image_$i.png 2>&1 >/dev/null
done

# Run the function
fn_png2jpg >/dev/null

# Check if the converted jpg files exist in the output directory
if [ $(find "${OUTPUTDIR}" -type f -iname "*.jpg" | wc -l) -eq $(find "${INPUTDIR}" -type f -iname "*.png" | wc -l)  ]; then
    bannerColor "Test passed: PNG files were converted and moved to the output directory." "magenta" "*"
    success_count=$((success_count + 1))
else
    bannerColor "Test failed: PNG files were not converted and moved to the output directory." "red" "*"
    error_count=$((error_count + 1))
    test_failed+=("Test fn_png2jpg")
fi

# Clean up the test directories
rm -rf "${INPUTDIR}" "${OUTPUTDIR}" 
test_count=$((test_count + 1))

###############################
# png2webp
###############################
bannerColor "Test ${test_count}: fn_png2webp function" "black" "*"
INPUTDIR=./test-input-png2webp-dir
OUTPUTDIR=./test-output-png2webp-dir
# Create a test input directory and add some test png files
mkdir -p "${INPUTDIR}"
for i in {1..3}; do
  convert -size 100x100 xc:white "${INPUTDIR}"/image_$i.png 2>&1 >/dev/null
done

# Run the function
fn_png2webp >/dev/null

# Check if the converted webp files exist in the output directory
if [ $(find "${OUTPUTDIR}" -type f -iname "*.webp" | wc -l) -eq $(find "${INPUTDIR}" -type f -iname "*.png" | wc -l)  ]; then
    bannerColor "Test passed: PNG files were converted and moved to the output directory." "magenta" "*"
    success_count=$((success_count + 1))
else
    bannerColor "Test failed: PNG files were not converted and moved to the output directory." "red" "*"
    error_count=$((error_count + 1))
    test_failed+=("Test fn_png2webp")
fi

# Clean up the test directories
rm -rf "${INPUTDIR}" "${OUTPUTDIR}" 
test_count=$((test_count + 1))

###############################
# resize
###############################
bannerColor "Test ${test_count}: fn_resize function" "black" "*"
# Set width and height
WIDTH=300
INPUTDIR=./test-input-resize-dir
OUTPUTDIR=./test-output-resize-dir

# Create a test input directory and add some test image files
mkdir -p "${INPUTDIR}"
for i in {1..3}; do
  convert -size 100x100 xc:white -font Arial -pointsize 20 -draw "text 0,50 'Image $i'" "${INPUTDIR}"/image_$i.jpg
done

# Run the function
fn_resize >/dev/null

# Check if the resized files exist in the resized directory
if [ $(find "${OUTPUTDIR}" -type f -iname "*.jpg" | wc -l) -eq $(find "${INPUTDIR}" -type f -iname "*.jpg" | wc -l)  ]; then
    bannerColor "Test passed: Images were resized and exist in the resized directory." "magenta" "*"
    success_count=$((success_count + 1))
else
    bannerColor "Test failed: Images were not resized and exist in the resized directory." "red" "*"
    error_messages+=("Test failed: Images were not resized and exist in the resized directory.")
    error_count=$((error_count + 1))
    test_failed+=("Test fn_resize")
fi

# Clean up the test directories
rm -rf "${INPUTDIR}"  "${OUTPUTDIR}" 
test_count=$((test_count + 1))

###############################
# svg2jpg
###############################
bannerColor "Test ${test_count}: fn_svg2jpg function" "black" "*"

INPUTDIR=./test-input-svg2jpg-dir
OUTPUTDIR=./test-output-svg2jpg-dir
# Create a test input directory and add some test svg files
mkdir -p "${INPUTDIR}"
for i in {1..3}; do
  echo "<svg xmlns='http://www.w3.org/2000/svg' width='100' height='100'>
  <rect width='100' height='100' fill='white' />
  <text x='50' y='50' font-size='20' text-anchor='middle' fill='black'>Image $i</text>
</svg>" > "${INPUTDIR}"/image_$i.svg
done

# Run the function
fn_svg2jpg >/dev/null

# Check if the jpg files exist in the current directory or output directory
if [ $(find "${OUTPUTDIR}" -type f -iname "*.jpg" | wc -l) -eq $(find "${INPUTDIR}" -type f -iname "*.svg" | wc -l)  ]; then
    bannerColor "Test passed: SVG files were converted to JPG files and exist in the output directory." "magenta" "*"
    success_count=$((success_count + 1))
else
    error_messages+=("Test failed: SVG files were not converted to JPG files and exist in the output directory.")
    error_count=$((error_count + 1))
    test_failed+=("Test fn_svg2jpg")
fi

# Clean up the test directories
rm -rf "${INPUTDIR}" "${OUTPUTDIR}"
test_count=$((test_count + 1))

###############################
# svg2png
###############################
bannerColor "Test ${test_count}: fn_svg2png function" "black" "*"
INPUTDIR=./test-input-svg2png-dir
OUTPUTDIR=./test-output-svg2png-dir
# Create a test input directory and add some test svg files
mkdir -p "${INPUTDIR}"
for i in {1..3}; do
  echo "<svg xmlns='http://www.w3.org/2000/svg' width='100' height='100'>
  <rect width='100' height='100' fill='white' />
  <text x='50' y='50' font-size='20' text-anchor='middle' fill='black'>Image $i</text>
</svg>" > "${INPUTDIR}"/image_$i.svg
done

# Run the function
fn_svg2png 

# Check if the png files exist in the current directory or output directory
if [ $(find "${OUTPUTDIR}" -type f -iname "*.png" | wc -l) -eq $(find "${INPUTDIR}" -type f -iname "*.svg" | wc -l)  ]; then
    bannerColor "Test passed: SVG files were converted to PNG files and exist in the output directory." "magenta" "*"
    success_count=$((success_count + 1))
else
    error_messages+=("Test failed: SVG files were not converted to PNG files and exist in the output directory.")
    error_count=$((error_count + 1))
    test_failed+=("Test fn_svg2png")
fi

# Clean up the test directories
rm -rf "${INPUTDIR}" "${OUTPUTDIR}"
test_count=$((test_count + 1))

###############################
# webp2jpg
###############################
# Test fn_webp2jpg function
bannerColor "Test ${test_count}: fn_webp2jpg function" "black" "*"
INPUTDIR=./test-input-webp2jpg-dir
OUTPUTDIR=./test-output-webp2jpg-dir
# Create a test input directory and add some test webp files
mkdir -p "${INPUTDIR}"
for i in {1..3}; do
  convert -size 100x100 xc:white "${INPUTDIR}"/image_$i.webp 2>&1 >/dev/null
done

# Run the function
fn_webp2jpg >/dev/null

# Check if the converted jpg files exist in the output directory
if [ $(find "${OUTPUTDIR}" -type f -iname "*.jpg" | wc -l) -eq $(find "${INPUTDIR}" -type f -iname "*.webp" | wc -l)  ]; then
    bannerColor "Test passed: WebP files were converted and moved to the output directory." "magenta" "*"
    success_count=$((success_count + 1))
else
    bannerColor "Test failed: WebP files were not converted and moved to the output directory." "red" "*"
    error_count=$((error_count + 1))
    test_failed+=("Test fn_webp2jpg")
fi

# Clean up the test directories
rm -rf "${INPUTDIR}" "${OUTPUTDIR}" 
test_count=$((test_count + 1))

###############################
# webp2png
###############################
# Test fn_webp2jpg function
bannerColor "Test ${test_count}: fn_webp2png function" "black" "*"
INPUTDIR=./test-input-webp2png-dir
OUTPUTDIR=./test-output-webp2png-dir
# Create a test input directory and add some test webp files
mkdir -p "${INPUTDIR}"
for i in {1..3}; do
  convert -size 100x100 xc:white "${INPUTDIR}"/image_$i.webp 2>&1 >/dev/null
done

# Run the function
fn_webp2png >/dev/null

# Check if the converted jpg files exist in the output directory
if [ $(find "${OUTPUTDIR}" -type f -iname "*.png" | wc -l) -eq $(find "${INPUTDIR}" -type f -iname "*.webp" | wc -l)  ]; then
    bannerColor "Test passed: WebP files were converted and moved to the output directory." "magenta" "*"
    success_count=$((success_count + 1))
else
    bannerColor "Test failed: WebP files were not converted and moved to the output directory." "red" "*"
    error_count=$((error_count + 1))
    test_failed+=("Test fn_webp2png")
fi

# Clean up the test directories
rm -rf "${INPUTDIR}" "${OUTPUTDIR}" 
test_count=$((test_count + 1))

############################
# errors
###########################

if [ $error_count -eq 0 ]; then
    bannerColor "All Test passed: $success_count tests passed." "cyan" "="
else
    bannerColor "Test failed: $error_count errors found in the contents of the converted files." "red" "*"
    bannerColor "Failed Tests: " "red" "="
    for i in "${test_failed[@]}"; do
      bannerColor "$i" "red" "-"
    done
fi
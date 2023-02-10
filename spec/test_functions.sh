#!/usr/bin/env bash

# Import files
source ../src/img2webp.sh # done
source ../src/jpg2png.sh
source ../src/jpg2webp.sh
source ../src/optimize_jpg.sh
source ../src/optimize_png.sh
source ../src/optimize_svg.sh
source ../src/organize_files.sh
source ../src/png2jpg.sh # done
source ../src/png2webp.sh
source ../src/resize.sh
source ../src/svg2jpg.sh
source ../src/svg2png.sh
source ../src/webp2jpg.sh
source ../src/webp2png.sh

source ../lib/utils.sh

error_count=0
success_count=0
test_failed=()
# Test variables
INPUTDIR=./test-input-dir
OUTPUTDIR=./test-output-dir
QUALITY=50
WIDTH=500

################################
# fn_img2webp
###############################
bannerColor "Test fn_img2webp function" "yellow" "*"

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

###############################
# jpg2png 
###############################

bannerColor "Test fn_jpg2png function" "yellow" "*"

# Create a test input directory and add some test jpg files
mkdir -p "${INPUTDIR}"
for i in {1..3}; do
  convert -size 100x100 xc:white "${INPUTDIR}"/image_$i.jpg 2>&1 >/dev/null
done

# Run the function
fn_jpg2png >/dev/null

# Check if the converted png files exist in the output directory
if [ -n "$OUTPUTDIR" ] && [ $(find "${OUTPUTDIR}" -type f -iname "*.png" | wc -l) -eq $(find "${INPUTDIR}" -type f -iname "*.jpg" | wc -l)  ]; then
    bannerColor "Test passed: JPG files were converted to PNG and moved to the output directory." "magenta" "*"
    success_count=$((success_count + 1))
else
    bannerColor "Test failed: JPG files were not converted and moved to the output directory." "red" "*"
    error_count=$((error_count + 1))
    test_failed+=("Test fn_jpg2png")
fi

# Clean up the test directories
rm -rf "${INPUTDIR}" "${OUTPUTDIR}"

###############################
# jpg2webp
###############################
bannerColor "Test fn_jpg2webp function" "yellow" "*"

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

###############################
# optimize_jpg
###############################

bannerColor "Test fn_optimize_jpg function" "yellow" "*"

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

###############################
# optimize_png
###############################

bannerColor "Test fn_optimize_png function" "yellow" "*"

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

###############################
# optimize_svg
###############################

bannerColor "Test fn_optimize_svg function" "yellow" "*"

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



###############################
# organize_files
###############################


################################
# fn_png2jpg
################################
bannerColor "Test fn_png2jpg function" "yellow" "*"

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

###############################
# png2webp
###############################

bannerColor "Test fn_png2webp function" "yellow" "*"

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

###############################
# resize
###############################
bannerColor "Test fn_resize function" "yellow" "*"

# Create a test input directory and add some test image files
mkdir -p "${INPUTDIR}"
for i in {1..3}; do
  convert -size 100x100 xc:white -font Arial -pointsize 20 -draw "text 0,50 'Image $i'" "${INPUTDIR}"/image_$i.jpg
done

# Set width and height
WIDTH=300
INPUTDIR="$(pwd)/images"
CURRENT_DIR=$(pwd)

# Run the function
fn_resize >/dev/null

# Check if the resized files exist in the resized directory
if [ $(find "${INPUTDIR}/resized" -type f -iname "*.jpg" | wc -l) -eq $(find "${INPUTDIR}" -type f -iname "*.jpg" | wc -l)  ]; then
    bannerColor "Test passed: Images were resized and exist in the resized directory." "magenta" "*"
    success_count($((success_count + 1)))
else
    error_messages+=("Test failed: Images were not resized and exist in the resized directory.")
    error_count=$((error_count + 1))
    test_failed+=("Test fn_resize")
fi

# Check if the resized files have the correct dimension
# for resized_img in $(find "${INPUTDIR}"/resized -type f -iname "*.jpg"); do
#   dimension=$(identify -format "%wx%h" "$resized_img")
#   if [ "$dimension" != "${WIDTH}x${HEIGHT}" ]; then
#     error_messages+=("Test failed: Resized image $resized_img does not have the correct dimension.")
#     error_count=$((error_count + 1))
#     test_failed+=("Test fn_resize")
#     break
#   fi
# done

# Clean up the test directories
rm -rf "${INPUTDIR}"  "${OUTPUTDIR}" 

###############################
# svg2jpg
###############################
bannerColor "Test fn_svg2jpg function" "yellow" "*"

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

###############################
# svg2png
###############################
bannerColor "Test fn_svg2png function" "yellow" "*"

# Create a test input directory and add some test svg files
mkdir -p "${INPUTDIR}"
for i in {1..3}; do
  echo "<svg xmlns='http://www.w3.org/2000/svg' width='100' height='100'>
  <rect width='100' height='100' fill='white' />
  <text x='50' y='50' font-size='20' text-anchor='middle' fill='black'>Image $i</text>
</svg>" > "${INPUTDIR}"/image_$i.svg
done

# Run the function
fn_svg2png >/dev/null

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

###############################
# webp2jpg
###############################

# Test fn_webp2jpg function
bannerColor "Test fn_webp2jpg function" "yellow" "*"

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

###############################
# webp2png
###############################

# Test fn_webp2jpg function
bannerColor "Test fn_webp2png function" "yellow" "*"

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



############################
# errors
###########################

if [ $error_count -eq 0 ]; then
    bannerColor "All Test passed: $success_count tests passed." "magenta" "="
else
    bannerColor "Test failed: $error_count errors found in the contents of the converted files." "red" "*"
    bannerColor "Failed Tests: " "red" "="
    for i in "${test_failed[@]}"; do
      bannerColor "$i" "red" "-"
    done
fi
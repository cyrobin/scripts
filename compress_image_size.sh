#! /bin/bash
# compress_image_size.sh
#
# Require imagemagick

# Append a suffix to the modified files
SUFFIX="-light"
echo "Appending the following suffix to the modified files: ${SUFFIX}"

# for all *.jpg files in the current directory
echo "Processing all *.jpg files"
for filename in *.jpg
do
convert -strip -interlace Plane -auto-orient -gaussian-blur 0.05 -quality 85% "$filename" "${filename%%.jpg}$SUFFIX".jpg
echo "$filename" processed into "${filename%%.jpg}$SUFFIX".jpg
done

exit 0


#! /bin/bash
# svg2png
#
# Require inkscape and imagemagick

if test "$#" -ne 1; then
    echo "ERROR -- wrong usage -- usage is $0 <pattern_of_svg_files>"
fi

# Append a suffix to the modified files
echo "Creating a gif from $1*.svg files"

TMP=".tmp"

# for all *.svg files with the pattern given as argument
echo "Converting all $1*.svg files to png files"
for filename in $1*.svg ; do
    inkscape -z -e "${filename%%.svg}$TMP.png" "$filename"
    echo "$filename" processed into "${filename%%.png}$SUFFIX".png
done

# Make a gif
echo "Aggregating the png files into a gif"
N=$(ls $1*.svg |wc -l)
convert -dispose none  -delay 200 \
    +antialias \
    -draw "text 35,660 'Resulting plans'" -pointsize 35 -fill black \
    *$1*1$TMP.png  \
    $(for ((a=2; a<$N; a++)); do file=$(ls *$1*$a$TMP.png); \
        printf -- "-delay 200 -page +331+0 %s " $file; \
        done;) \
    -loop 0  $1.gif

exit 0


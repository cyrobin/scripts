#! /bin/bash
# convert_flv2mp3.sh
#
# Require ffmpeg
 
echo 'Converting .flv files to .mp3 (192kbps)'
for filename in *.flv #Traverse all files in directory.
do
ffmpeg -i "$filename" -vn -ar 44100 -ac 2 -ab 192k -f mp3 "${filename%%.flv}".mp3
done

echo 'Converting .mp4 files to .mp3 (192kbps)'
for filename in *.mp4 #Traverse all files in directory.
do
ffmpeg -i "$filename" -vn -ar 44100 -ac 2 -ab 192k -f mp3 "${filename%%.mp4}".mp3
done

exit 0




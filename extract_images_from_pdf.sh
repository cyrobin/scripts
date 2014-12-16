

#extract images :
#pdfimages -j in.pdf /tmp/out
#
#for I in *pdf ; do pdfimages -j $I /tmp/$I ; done

# Convert extract ppm to ps or png:

#pnmtops -nocenter -equalpixels -dpi 72 image.pnm -noturn -rle > image.ps

#pnmtopng image.pnm > image.png
#for J in /tmp/$I*ppm ; do pnmtopng $J > $J.png ; done



#extract images :
#pdfimages -j in.pdf /tmp/out
#
#for I in *pdf ; do pdfimages -j $I /tmp/$I ; done

# Convert extract ppm to ps or png:

#pnmtops -nocenter -equalpixels -dpi 72 image.pnm -noturn -rle > image.ps

#pnmtopng image.pnm > image.png
#for J in /tmp/$I*ppm ; do pnmtopng $J > $J.png ; done

# if vectorial image : use inkscape !
#Step 1
#Download and install the latest version of Inkscape (see Resources).

#Step 2
#Launch Inkscape and click "File" and then "Open" to select the PDF file containing the vector graphic.

#Step 3
#Select the page containing the vector graphic and then click "OK" on the "PDF Import Settings" window.

#Step 4
#Right-click the vector graphic and click "Ungroup" from the pop-up menu. This splits the image up into its vector components so you can extract the parts you require.

#Step 5
#Click and drag your cursor over the part of the image you want to extract. Once you release the mouse button, the selected image will have bounding boxes with scale/rotation handles around it.

#Step 6
#Right-click the selected image and click "Copy." Click "File," then "New," then "Default" and click "Edit" and "Paste" to extract the vector graphic from the PDF file to the new document.

#Step 7
#Click and drag the vector image into position on the blank page. Use the scale handles around the image to enlarge it to the dimensions that you prefer.

#Step 8
#Click "File" and "Save" and type a name for the vector file. Select "SVG" as the "Save as type" to store the file in a vector format.

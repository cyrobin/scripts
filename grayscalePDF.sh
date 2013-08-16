#! /bin/sh
# transform a pdf into grayscale

gs -sOutputFile=output.pdf -sDEVICE=pdfwrite \
  -sColorConversionStrategy=Gray -dProcessColorModel=/DeviceGray \
    -dCompatibilityLevel=1.4 input.pdf < /dev/null 

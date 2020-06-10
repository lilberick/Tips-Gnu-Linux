#!/bin/bash
cd img
scrot -s -q 100 capture.png
tesseract capture.png ocr -l jpn --psm 4
cat ocr.txt | xsel --clipboard --input
rm *.png ocr.txt


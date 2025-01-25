---
title: "OCR - Optical Character Recognition"
description: 'Currently (20230612173404), there are not many ways to convert full-blown images to TeX. Ideally, that would solve the problem of converting books, notes etc (digitalized to actual software-produced-books'
published: "2023-06-12"
image: "./images/image-post-./66.png"
draft: false
---

# OCR - Optical Character Recognition

## Old Remarks (20250125212710)

Currently (20230612173404), there are not many ways to convert full-blown images to TeX. Ideally, that would solve the problem of converting books, notes etc (digitalized to actual software-produced-books; or pure digital data, with characters etc.)

You can actually convert pure text (images), or pure math (images) to text and `TeX` respectively. But, can't convert an image that have both text and math

-	[https://www.twilio.com/blog/tesseract-js-react-ocr-part-one](https://www.twilio.com/blog/tesseract-js-react-ocr-part-one)

## Current possibilities 

`pix2tex`: you can screenshot an equation and convert it to tex. Very feasible. Maybe not to script it and automate - yet?.

You can install it like this:

``` bash
#!/usr/bin/bash
conda create -n pix2tex
conda activate pix2tex

pip install 'pix2tex[gui]'

echo "Installing gnome-screenshot as its pix2tex default screenshooter"
sudo apt-get install gnome-screenshot
```

- [https://github.com/lukas-blecher/LaTeX-OCR](https://github.com/lukas-blecher/LaTeX-OCR)

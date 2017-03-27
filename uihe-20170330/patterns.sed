#! /usr/bin/sed -f
# Run me as: sed -f patterns.sed -i .orig *.markdown

s/UvA\ \HPC\ course\ 2017\-02\-01/UNESCO\-IHE\ symposium\ 2017\-03\-30\&31/g; 
s/UvA\ logo/UNESCO\-IHE\ logo/g; 
s/UvA\-logo.png/Unesco\-Ihe\-logo.png/g; 
s/UvA\-20170201/uihe\-20170330/g; 
s/s\-uva/s\-uihe/g; 
s/123\:\ _local\\_images\\_Cursus_/147\:\ _wshop\\\-uihe\\_img_/g;
s/local_images_Cursus/wshop\-uihe_img/g;
s/UvA\ provides/UNESCO\-IHE\ provides/g

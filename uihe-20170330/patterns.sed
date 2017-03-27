#! /usr/bin/sed -f
# Run me as: sed -f patterns.sed -i .orig *.markdown

s/UvA\ \HPC\ course\ 2017\-02\-01/UNESCO\-IHE\ symposium\ 2017\-03\-30\&31/g; 
s/UvA\ logo/UNESCO\-IHE\ logo/g; 
s/UvA\-logo.png/Unesco\-Ihe\-logo.png/g; 
s/UvA\-20170201/uihe\-20170330/g; 
s/s\-uva/s\-uihe/g; 
s/UvA\ provides/UNESCO\-IHE\ provides/g

#! /usr/bin/sed -f
# Run me as: sed -f patterns.sed -i .orig *.markdown

s/UvA\ HPC\ course\ 2019\-01\-30/Good\ practices\ for\ HPC\ and\ Cloud\ 2019\-05\-23/g; 
s/UvA\ logo/NLeSC\ logo/g; 
s/UvA\-logo.png/escience_center_logo.png/g; 
s/UvA\-20180131/home\-20190523/g; 
s/UvA\ provides/SURFsara\ provides/g;
s/30th\ January\ 2019,\ UvA,\ Science\ Park\ SP\ G0\.23\-G0\.25/23rd\ May\ 2019,\ SURFsara,\ Science\ Park\ 140,\ 1098XG,\ Amsterdam/g


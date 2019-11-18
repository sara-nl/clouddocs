#! /usr/bin/sed -f
# Run me as: sed -f patterns.sed -i .orig *.markdown

s/Good\ practices\ for\ HPC\ and\ Cloud\ 2019\-05\-23/An Introduction\ to\ SURF\ HPC\ Cloud\ 2019\-11\-19/g;
s/NLeSC\ logo/KNMI\ logo/g;
s/escience_center_logo.png/knmi_logo.png/g;
s/home\-20190523/knmi\-20191119/g;
s/23rd\ May\ 2019,\ SURFsara,\ Science\ Park\ 140,\ 1098XG,\ Amsterdam/19th\ November\ 2019,\ KNMI,\ Utrechtseweg\ 297,\ 3731GA,\ De\ Bilt/g

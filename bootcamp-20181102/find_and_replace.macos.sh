find . -name "*.markdown" -exec sed -i ".orig" \
-e 's/\[HvA logo\](\/images\/HvA_logo.png)/\[UU logo\](\/images\/UU_logo_NL_CMYK.png)/g' \
-e 's/2018\-04\-10/2018\-11\-02/g' \
-e 's/bootcamp\-20180410/bootcamp\-20181102/g' \
-e 's/Ubuntu-16.04.4-Server (2018-04-01)/Ubuntu-16.04.5-Server (2018-10-02)/g' \
{} +

#-e 's/126\: local_images_Cursus/147\: Courses_img/g' \

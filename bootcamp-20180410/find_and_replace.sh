find . -name "*.markdown" -exec sed -i \
-e 's/\[TUEindhoven logo\](\/images\/TUEindhoven_logo.png)/\[HvA logo\](\/images\/HvA_logo.png)/g' \
-e 's/2017\-06\-15/2018\-04\-10/g' \
-e 's/126\: local_images_Cursus/147\: Courses_img/g' \
-e 's/Ubuntu 16.04.2 Server ONE/Ubuntu-16.04.4-Server (2018-04-01)/g' \
{} \;

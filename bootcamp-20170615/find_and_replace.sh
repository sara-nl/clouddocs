find . -name "*.markdown" -exec sed -i \
-e 's/\[TUDelft logo\](\/images\/TUDelft_logo.png)/\[TUEindhoven logo\](\/images\/TUEindhoven_logo.png)/g' \
-e 's/2016\-11\-10/2017\-06\-15/g' \
-e 's/126\: local_images_Cursus/147\: Courses_img/g' \
{} \;

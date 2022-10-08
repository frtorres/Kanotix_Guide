Commands: conver_photos command 
Kanotix_Guide
Wed Aug  5 18:27:06 EST 2015
================================

for a in `ls`; do echo $a && convert $a -resize <Width>x<Height> $a; done

# Resizes all images in the curent directory to x resolution.
# It is better than `mogrify -resize *.jpg` because of independence from extension of image (e.g. .jpg and .JPG) (:
# from: http://www.commandlinefu.com/commands/tagged/355/photos



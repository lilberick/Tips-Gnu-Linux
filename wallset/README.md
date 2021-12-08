# [Wallset](https://github.com/terroo/wallset)

## Instalación

* Dependencias

	+ [ffmpeg >=4.2.3](https://ffmpeg.org/)
	+ [feh >=3.4.1](https://feh.finalrewind.org/)
	+ [imagemagick >=7.0.10.16](https://www.imagemagick.org/)
	+ [xrandr >=1.5.1](https://gitlab.freedesktop.org/xorg/app/xrandr)
	+ [xdg-utils >=1.1.3](https://www.freedesktop.org/wiki/Software/xdg-utils/)
	+ [bash >=4.0](http://tiswww.case.edu/php/chet/bash/bashtop.html)
	+ [sed >=4.5](http://sed.sourceforge.net/)

* normal

	```sh
	$ git clone https://github.com/terroo/wallset down-wallset
	$ cd down-wallset
	$ sudo sh install.sh
	```

* Si no instala forzar la instalación

	```sh
	$ sudo ./install.sh --force
	```

## Flags

```sh
usage: wallset [options]
  
  Options:
    -u,--use [N]          Change the Wallpaper to the number entered. Use images with 3 digits, example: 014,003,099
    -a,--add img.jpg ...  Add images
    -S,--set              Use before the -a, --add parameter when you want to add already change       
    -q,--quit             Ends the loop
    -t,--time [N]         Creates an image loop with the time reported in seconds
    -d,--display          Opens the last image added
    -c,--count            Informs how many images there are
    -s,--show             Shows the current image
    -V,--video [video]    Add a video as Wallpaper
    -L,--list-videos      Lists the videos that have already been used
    -I,--set-video [N]    Use the video by the number listed in --list-videos
    -r,--remove           Remove the last image added
    -h,--help             Display this help
    -v,--version          Display the version of this program

* [N] Means that you need to use a number
** Only videos in .mp4 format
*** Only the first 10 seconds of the video will be displayed
**** Use 3-digit images, example: 011
```

## Ejemplos

1. Add an image

	```
	$ wallset -a img.jpg
	```

2. Add and set it as Wallpaper

	```
	$ wallset --set --add img.jpg
	```

3. Change to image with this number 

	```
	$ wallset -u 001
	```

4. Add the video (solo .mp4)(reproduce solo 10 primeros segundos)(1920x1080-10fps)

	```
	$ wallset -V video.mp4
	```

5. Use the video already used and listed 

	```
	$ wallset -I 3
	```

6. Detener

	```
	$ wallset -q
	```

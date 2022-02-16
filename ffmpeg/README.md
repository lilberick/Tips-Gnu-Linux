[![](.img/ffmpeg-logo.png)](https://ffmpeg.org/)

# Instalación

```sh
$ sudo apt install ffmpeg
$ sudo apt install ffmpeg-doc
$ sudo apt install x264
```

# Ejemplos

* para saber los codecs de un video

	```sh
	$ ffmpeg -i video.avi
	```

* cambiar framerate

	```sh
	$ ffmpeg -i video.mp4 -filter:v fps=30 output.mp4
	```

# Obtener Imágenes

* Convertir video a imagenes

	```sh
	$ ffmpeg -i video.mp4 imagen/imagen%d.png
	```

* Output one image every second

	```sh
	$ ffmpeg -i video.mp4 -vf fps=1 imagen%d.png
	```

* Output one image every minute

	```sh
	$ ffmpeg -i video.mp4 -vf fps=1/60 imagen%04d.png
	```

* output one image every 10 minutes

	```sh
	$ ffmpeg -i video.mp4 -vf fps=1/600 imagen%04d.png
	```

# Convertir mp4 a gif

* Simple

	```sh
	$ ffmpeg -i video.avi video.gif -hide_banner
	```

* Desde el segundo 15 tomar 20 segundos del video

	```sh
	$ ffmpeg -i video.mp4 -ss 15 -t 20 agif_15-35.gif -hide_banner
	```

* Convertir la resolucion

	* 160x90

		```sh
		$ ffmpeg -i video_320x180.mp4 -vf scale=160:90 agif_160x90.gif -hide_banner
		```

	* 640x360 (bueno para github)(10fps=18MB)

		```sh
		$ ffmpeg -i video.mp4 -vf scale=640:360 -r 10 agif_640x360.gif -hide_banner
		```

* Convertir a 10 frame por segundo

	```sh
	$ ffmpeg -i video.mp4 -r 10 agif_r10.gif -hide_banner
	```

* Detallado

	```sh
	$  ffmpeg -i video.mp4 -vf "fps=10,scale=320:-1:flags=lanczos" -c:v pam -f image2pipe - | convert -delay 10 - -loop 0 -layers optimize output.gif
	```

# Rotar video

```sh
0 = 90CounterCLockwise and Vertical Flip (default)
1 = 90Clockwise
2 = 90CounterClockwise
3 = 90Clockwise and Vertical Flip
```

* Rotar 90 antihorario

	```sh
	$ ffmpeg -i video.mp4 -vf "transpose=2" output.mp4
	```

* Rotar 180 antihorario

	```sh
	$ ffmpeg -i video.mp4 -vf "transpose=2,transpose=2" output.mp4
	```

# Quitar-Juntar

* Quitar audio. Nos quedamos con video sin audio

	```sh
	$ ffmpeg -i video.avi -an output.avi
	```

* Quitar video. Nos quedamos solo con el audio de un video

	```sh
	$ ffmpeg -i video.avi -vn output.mp3
	```

* Juntar video y un audio

	```sh
	$ ffmpeg -i video_sin_audio.avi -i solo_audio.mp3 todo_junto.avi
	```

* Unir varios videos y poner uno despues de otro

	```sh
	$ ffmpeg -i "concat:input1.mp4|input2.mp4|input3.mp4" -c copy output.mp4
	$ ffmpeg -i "concat:input1.h264|input2.h264|input3.h264" -c copy output.mp4
	```

* Unir varios audios, uno despues de otro

	```sh
	$ ffmpeg -i "concat:1.mp3|2.mp3" -c copy output.mp3
	```

# Convertir formato

* Convertir mp3 a wav

	```sh
	$ ffmpeg -i input.mp3 output.wav
	```

* Convertir avi a flv

	```sh
	$ ffmpeg -i video.avi -ar 22050 -f flv output.flv
	```

* convertir mp4 a 3gp

	```sh
	$ ffmpeg -i video.mp4 -r 20 -s 352x288 -vb 400k -acodec aac -strict experimental -ac 1 -ar 8000 -ab 24k output.3gp
	```

	[![Click aquí para verlo en Youtube](.img/agif_640x360.gif)](https://youtu.be/K_WAbOUQ6F8)

* dvd a mp4 (ripear dvd)

	```sh
	$ sudo apt install handbrake
	$ cat *.VOB > video.vob
	```

	* Normal

		```sh
		$ ffmpeg -i video.vob output.mp4
		```

	* para mayor compatibilidad

		```sh
		$ ffmpeg -i video.vob -vf format=yuv420p output.mp4
		```


# cortar video

* Tiempo inicio y tiempo fin

	* No hay perdida de primeros segundos

		```sh
		$ ffmpeg -ss 00:00:30.0 -i input.wmv -c copy -t 00:00:10.0 output.wmv
		```

	* A veces hay perdida de primeros segundos

		```sh
		$ ffmpeg -i input.mp4 -ss 00:00:00 -to 00:00:15 -c:v copy -c:a copy output.mp4
		```

* Inicio especifico y segundos despues

	* Desde segundo 30 hasta 40. no hay perdida de primeros segundos

		```sh
		$ ffmpeg -ss 30 -i input.wmv -c copy -t 10 output.wmv
		```

	* A veces hay perdida de segundos

		```sh
		$ ffmpeg -i input.mp4 -ss 00:00:00 -t 15 -c:v copy -c:a copy output.mp4
		```

* cortar en intervalos hasta culminar el video

	```sh
	$ ffmpeg -i input.mp4 -c copy -map 0 -segment_time 00:20:00 -f segment output%03d.mp4
	$ ffmpeg -i input.mp3 -c copy -map 0 -segment_time 00:05:00 -f segment output%03d.mp3
	```

# Reducir video size con la mejor calidad posible

* Bitrate 1Gb/segundos

	```sh
	$ ffmpeg -i input.mp4 -b 1000000 output.mp4
	$ ffmpeg -i input.mp4 -b 100000 -max_muxing_queue_size 9999 output.mp4
	```

* Establecer Rate Factor constante,reduce bitrate promedio,pero conserva una mejor calidad. Variar CRF entre 18-24(-CRF = +Bitrate)
 
	```sh 
	$ ffmpeg -i input.mp4 -vcodec libx265 -crf 20 output.mp4
	```

* Encode with libx264 CRF 18 (Aun no lo he probado)

	```sh
	$ ffmpeg -i input.avi -c:v libx264 -crf 18 -preset veryslow -c:a copy output.mp4
	```

# Video streaming youtube

* Obtener **StreamKey** de Youtube. Click en: **youtube/Create/GoLive/**
	
	```sh
	StreamKey		: aaaa-bbbb-cccc-dddd-eeee
	StreamUrl		: rtmp://a.rtmp.youtube.com/live2
	BackupServerUrl		: rtmp://b.rtmp.youtube.com/live2?backup=1
	```

* Live de un live de youtube (funciona muy bien)

	1. copiamos el link de un live: https://youtu.be/AdUw5RdyZxI

	2. comandos

		```sh
		$ ffmpeg -i $(youtube-dl -f best --get-url link) -f flv BackupServerUrl/StreamKey
		$ ffmpeg -i $(youtube-dl -f best --get-url https://youtu.be/AdUw5RdyZxI) -f flv rtmp://a.rtmp.youtube.com/live2/aaaa-bbbb-cccc-dddd-eeee
		$ ffmpeg -i $(youtube-dl -f best --get-url https://youtu.be/AdUw5RdyZxI) -f flv rtmp://a.rtmp.youtube.com/live2/aaaa-bbbb-cccc-dddd-eeee
		```

* Live de un video file

	```sh
	$ ffmpeg -i video.mkv -f flv StreamUrl/StreamKey
	$ ffmpeg -i video.mkv -f flv rtmp://a.rtmp.youtube.com/live2/aaaa-bbbb-cccc-dddd-eeee
	```

# Video streaming twitch

* Obtener **PrimaryStreamKey** de Twitch

	```sh
	Click en: CreatorDashboard/Settings/Stream/PrimaryStreamKey
	```
* Stream con webcam

	```sh
	$ ffmpeg -f video4linux2 -s 1280x960 -framerate 24 -i /dev/video0 -c:v h264_omx -threads 0 -an -f flv "rtmp://live.twitch.tv/app/PrimaryStreamKey"
	```

# Grabar video webcam

* Simple

	```sh
	$ ffmpeg -i /dev/video0 -ar 22050 -qscale 4 -s 380x284 -f flv resultado.flv
	$ ffmpeg -i /dev/video0 -ar 22050 -qscale 4 -s 380x284 -f avi resultado.avi
	```

* Grabar con tiempo determinado(-t)

	```sh
	$ ffmpeg -i /dev/video0 -ar 22050 -qscale 4 -s 380x284 -t 00:00:15 -f flv time.flv
	```

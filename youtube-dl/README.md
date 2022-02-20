[![](.img/youtube-dl.png)](https://youtube-dl.org/)

# [Instalación](https://github.com/ytdl-org/youtube-dl/blob/master/README.md#readme)

```sh
$ sudo apt install youtube-dl
```

# Básico

* Simple

	```sh
	$ youtube-dl URL
	```

* Descargar solo audio

	```sh
	$ youtube-dl -x URL
	```

# Solo una parte

* Descargar solo una parte del video

	```sh
	$ youtube-dl --postprocessor-args "-ss 00:00:05.00 -t 00:00:10.00" "https://www.youtube.com/watch?v=pi7EbeWRVKw"
	$ youtube-dl --postprocessor-args "-ss 00:00:05.00 -to 00:00:10.00" "https://www.youtube.com/watch?v=pi7EbeWRVKw"
	```

* Descargar solo una parte del audio

	```sh
	$ youtube-dl -x --postprocessor-args "-ss 00:00:05.00 -t 00:00:10.00" "https://www.youtube.com/watch?v=pi7EbeWRVKw"
	```

# Descargar el video en un formato específico

1. Ver los formatos disponibles para este video:

	`$ youtube-dl -F LINK`

	```sh
	format code  extension  resolution note
	249          webm       audio only tiny   52k , webm_dash container, opus @ 52k (48000Hz), 190.04KiB
	250          webm       audio only tiny   68k , webm_dash container, opus @ 68k (48000Hz), 249.74KiB
	140          m4a        audio only tiny  129k , m4a_dash container, mp4a.40.2@129k (44100Hz), 473.17KiB
	251          webm       audio only tiny  132k , webm_dash container, opus @132k (48000Hz), 481.66KiB
	278          webm       144x144    144p   60k , webm_dash container, vp9@  60k, 30fps, video only, 220.17KiB
	160          mp4        144x144    144p   69k , mp4_dash container, avc1.4d400b@  69k, 30fps, video only, 252.58KiB
	242          webm       240x240    240p  133k , webm_dash container, vp9@ 133k, 30fps, video only, 483.85KiB
	133          mp4        240x240    240p  155k , mp4_dash container, avc1.4d400d@ 155k, 30fps, video only, 567.12KiB
	243          webm       360x360    360p  238k , webm_dash container, vp9@ 238k, 30fps, video only, 868.05KiB
	134          mp4        360x360    360p  337k , mp4_dash container, avc1.4d4015@ 337k, 30fps, video only, 1.20MiB
	244          webm       480x480    480p  414k , webm_dash container, vp9@ 414k, 30fps, video only, 1.47MiB
	135          mp4        480x480    480p  645k , mp4_dash container, avc1.4d401e@ 645k, 30fps, video only, 2.29MiB
	247          webm       720x720    720p  841k , webm_dash container, vp9@ 841k, 30fps, video only, 2.99MiB
	136          mp4        720x720    720p 1228k , mp4_dash container, avc1.64001f@1228k, 30fps, video only, 4.36MiB
	248          webm       1080x1080  1080p 1477k , webm_dash container, vp9@1477k, 30fps, video only, 5.25MiB
	137          mp4        1080x1080  1080p 2464k , mp4_dash container, avc1.640020@2464k, 30fps, video only, 8.75MiB
	18           mp4        480x480    480p  596k , avc1.42001E, 30fps, mp4a.40.2 (48000Hz), 2.12MiB
	22           mp4        720x720    720p 1357k , avc1.64001F, 30fps, mp4a.40.2 (44100Hz) (best)
	```

2. Descargar en un formato específico

	```sh
	$ youtube-dl --format 22 https://www.youtube.com/watch?v=pi7EbeWRVKw
	```

# Descargar una lista de videos

1. Creamos un archivo llamado "Lista.txt":

	`$ vim Lista.txt`

	```sh
	https://www.youtube.com/watch?v=7WVBEB8-wa0
	https://www.youtube.com/watch?v=pAgnJDJN4VA
	https://www.youtube.com/watch?v=L397TWLwrUU
	```

2. Para descargar esos videos:

	```sh
	$ youtube-dl -a Lista.txt
	```

# Ver videos de youtube de manera óptima o solo escuchar

* Instalamos

	```sh
	$ sudo apt install omxplayer
	```

* Ejecución simple

	1. Ejecutamos para obtener la url temporal:

		```sh
		$ youtube-dl -g "enlace_del_video"
		```

	2. Reproducimos video:

		```sh
		$ omxplayer "url_temporal"
		```

* Ejecucion video usando una variable

	1. Guardamos la url temporal en una variable

		```sh
		video=$(youtube-dl -g "https://www.youtube.com/watch?v=pi7EbeWRVKw")
		```

	2. Reproducimos el video

		```sh
		$ omxplayer $video
		```

* Ejecutando solo audio de video usando una variable

	1. Guardamos la url temporal en una variable

		```sh
		video=$(youtube-dl -g -x "https://www.youtube.com/watch?v=pi7EbeWRVKw")
		```

	2. Reproducimos el video

		```sh
		$ omxplayer $video
		$ mplayer $video
		```

* Ejecución en un formato especifico(Video o audio)

	1. Ver los formatos disponibles para este video:

		```sh
		$ youtube-dl -F LINK
		```

	2. Guardamos la url temporal en una variable (Reemplazar 171 por otro)

		```sh
		video=$(youtube-dl -g --format 171 LINK)
		```

	3. Reproducimos el video

		```sh
		$ omxplayer $video
		```

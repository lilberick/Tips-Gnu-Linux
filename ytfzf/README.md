# [ytfzf](https://github.com/pystardust/ytfzf) : Buscar y ejecutar videos de youtube en la terminal

![](.img/ytfzf-logo.png)

## Instalación

1. dependencias

	```
	$ sudo apt install jq mpv youtube-dl fzf
	$ pip install ueberzug
	```

2. ytfzf

	```
	$ curl -sL "https://raw.githubusercontent.com/pystardust/ytfzf/master/ytfzf" | sudo tee /usr/bin/ytfzf >/dev/null && sudo chmod 755 /usr/bin/ytfzf
	```

## Configuración

```
$ vim ~/.config/ytfzf/conf.sh
```

```
YTFZF_HIST=0					# habilitar history
YTFZF_EXTMENU=' rofi -dmenu -fuzzy -width 1500'	# external menu
YTFZF_EXTMENU_LEN=220				# ajustar el ancho de menu
YTFZF_PREF="22"					# resolution a 720p
```

## Suscripción

```
$ vim ~/.config/ytfzf/subscriptions
```

```
## tech channels
https://www.youtube.com/channel/UCl8XUDjAOLc7GNKcDp9Nepg/videos
https://www.youtube.com/c/PatoJAD/videos
https://www.youtube.com/c/CallMeZatiel/videos
https://www.youtube.com/c/KarlasProject/videos
```

## Historial

```
$ cat ~/.cache/ytfzf/ytfzf_hst
```

## Comandos

```
ytfzf -f		: buscar en la terminal
ytfzf -fD		: buscar usando dmenu
ytfzf -H		: history
ytfzf -x		: clear history
ytfzf -S		: Defaults to 10 results from each channel suscriptions
ytfzf --subs=15		: To show 15 results youtube suscriptions
ytfzf -ml TuBusqueda	: buscar para solo escuchar un video de youtube
```

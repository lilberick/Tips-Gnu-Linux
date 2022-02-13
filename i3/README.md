# [![](.img/titulo.png)](https://i3wm.org/)

# Instalación

1. Instalación desde repositorio

	```sh
	$ sudo apt install i3
	```

2. Reiniciar el usuario

3. Responder las preguntas

	```sh
	desea crear el archivo de configuracion
	/home/usuario/.config/i3/config
	Click en: Enter (Yes, generate the config)
	```

	```sh
	Please choose either
	<Win> Win as default modifier (Seleccionar esta)
	<Alt> Alt as default modifier
	```

# Shortcuts: (mod=win)(Mod4=win)(Mod1=alt)

|Shortcut		| Descripción						|
------------------------|-------------------------------------------------------|
|mod+Enter		|Abrir terminal						|
|mod+Shift+q		|cerar cualquier ventana				|
|mod+shift+Space	|hacer ventana flotante					|
|mod+shift+flecha	|mover ventana en ubicacion de flecha			|
|mod+(j,k,l,;)		|moverse entre ventanas					|
|mod+(v,h)		|definir si apareceran en vertical o horizontal		|
|mod+(1..9)		|navegar entre workspaces				|
|mod+shift+(1..9)	|mover ventana a otro workspace				|
|mod+d			|abrir otras aplicaciones con dmenu			|
|mod+e			|switch horizontalidad o verticalidad			|
|mod+s			|stacking(una ventana sobre otra)			|
|mod+w			|tabbed(una ventana al costado de otra)			|
|mod+f			|maximizar ventana					|
|mod+r+flechas		|modificar tamanio de ventana				|
|mod+shift+r		|reiniciar						|
|mod+shift+e		|salir de i3						|
|mod+x			|abrir dmenu (nautilus carpeta,xdg-open carpeta)	|

# Configuración shortcuts

```sh
$ vim ~/.config/i3/config
```

1. Cambiar la tecla de mod

	* cambiar la tecla de mod a la de Windows

		```sh
		set $mod Mod4
		```

	* cambiar la tecla de mod a la de Alt

		```sh
		set $mod Mod1
		```

2. Refrescar luego de aplicar los cambios en la configuracion

	```sh
	bindsym $mod+Shift+r restart
	```

2. Iniciar una terminal específica

	* terminal de i3

		```sh
		bindsym $mod+Return exec i3-sensible-terminal
		```

	* terminal de gnome

		```sh
		bindsym $mod+Return exec gnome-terminal
		```
	* tilix

		```sh
		bindsym $mod+Return exec tilix
		```

3. cerrar ventana seleccionada

	```sh
	bindsym $mod+q kill
	```

4. cambiar nombres del workspaces

	* We use variables to avoid repeating the names

		```sh
		set $ws1 "1"
		set $ws2 "Internet"
		set $ws3 "Multimedia"
		set $ws4 "4"
		set $ws5 "5"
		```

	* switch to workspace

		```sh
		bindsym $mod+1 workspace $ws1
		bindsym $mod+2 workspace $ws2
		bindsym $mod+3 workspace $ws3
		bindsym $mod+4 workspace $ws4
		bindsym $mod+5 workspace $ws5
		```
5. Screenshot
	
	```sh
	bindsym Print exec flameshot gui
	bindsym Control+Print exec flameshot full -p ~/Pictures
	bindsym Control+Shift+Print exec flameshot full -c
	```

# Configuración de lo que aparece en la barra inferior

```sh
$ vim  /etc/i3status.conf
```

# Cambiar Wallpapaper

* Usando Nitrogen

	1. abrir directorio de imagenes

		```sh
		$ nitrogen /home/usuaio/Pictures/
		```

	2. Seleccionar la imagen

	3. Hacer que los cambios se guarden permanentemente

		* `$ vim ~/.config/i3/config`

			```sh
			exec nitrogen --restore
			```
* Usando feh 

	1. Cambiar wallpaper

		```sh
		$ feh --bg-scale ~/wallpaper/fondo.jpg
		```

	2. Hacer que los cambios se guarden permanentemente

		* `$ vim ~/.config/i3/config`

			```sh
			exec ~/.fehbg
			```

# Idioma del teclado

* `$ vim ~/.config/i3/config`

	```sh
	bindsym $mod+q exec "setxkbmap es -model pc105"
	bindsym $mod+z exec "setxkbmap us"
	bindsym $mod+x exec "setxkbmap ja"
	```

# Habilitar terminal transparente 

1. Instalo la terminal que voy a usar: [Tilix](https://gnunn1.github.io/tilix-web/)

	```sh
	$ sudo apt install tilix
	$ sudo apt install libvte-common
	```

2. Habilito en la configuración de i3

	* `$ sudo apt install compton`


	* `$ vim ~/.config/i3/config`

		```sh
		exec --no-startup-id compton
		```

# Configurar teclado como mouse

```sh
$ sudo apt install xdotool
$ sudo vim ~/.config/i3/config
```

```sh
set $mod Mod4
set $mod2 Mod1
mode "mouse" {
	# set your three speeds here
	set $slow 1
	set $quick 10
	set $fast 50
	# Mouse movement (slow/fine-tuned) -- vim keybindings
	bindsym h exec xdotool mousemove_relative -- -$slow 0
	bindsym j exec xdotool mousemove_relative 0 $slow
	bindsym k exec xdotool mousemove_relative -- 0 -$slow
	bindsym l exec xdotool mousemove_relative $slow 0
	# Mouse movement (slow/fine-tuned) -- arrow keys
	bindsym Left exec xdotool mousemove_relative -- -$slow 0
	bindsym Down exec xdotool mousemove_relative 0 $slow
	bindsym Up exec xdotool mousemove_relative -- 0 -$slow
	bindsym Right exec xdotool mousemove_relative $slow 0
	# Mouse movement (quicker) -- vim keybindings
	bindsym Shift+h exec xdotool mousemove_relative -- -$quick 0
	bindsym Shift+j exec xdotool mousemove_relative 0 $quick
	bindsym Shift+k exec xdotool mousemove_relative -- 0 -$quick
	bindsym Shift+l exec xdotool mousemove_relative $quick 0
	# Mouse movement (quicker) -- arrow keys
	bindsym Shift+Left exec xdotool mousemove_relative -- -$quick 0
	bindsym Shift+Down exec xdotool mousemove_relative 0 $quick
	bindsym Shift+Up exec xdotool mousemove_relative -- 0 -$quick
	bindsym Shift+Right exec xdotool mousemove_relative $quick 0
	# Mouse movement (fast) -- vim keybindings
	bindsym Shift+$mod2+h exec xdotool mousemove_relative -- -$fast 0
	bindsym Shift+$mod2+j exec xdotool mousemove_relative 0 $fast
	bindsym Shift+$mod2+k exec xdotool mousemove_relative -- 0 -$fast
	bindsym Shift+$mod2+l exec xdotool mousemove_relative $fast 0
	# Mouse movement (fast) -- arrow keys
	bindsym Shift+$mod2+Left exec xdotool mousemove_relative -- -$fast 0
	bindsym Shift+$mod2+Down exec xdotool mousemove_relative 0 $fast
	bindsym Shift+$mod2+Up exec xdotool mousemove_relative -- 0 -$fast
	bindsym Shift+$mod2+Right exec xdotool mousemove_relative $fast 0
	# Left Click
	bindsym f exec xdotool click 1
	# Middle Click
	bindsym d exec xdotool click 2
	# Right Click
	bindsym s exec xdotool click 3
	# Left Click-and-drag
	bindsym Shift+f exec xdotool mousedown 1
	# Middle Click-and-drag 
	bindsym Shift+d exec xdotool mousedown 2
	# Right Click-and-drag
	bindsym Shift+s exec xdotool mousedown 3
	# Left Drag release
	bindsym $mod2+f exec xdotool mouseup 1
	# Middle Drag release
	bindsym $mod2+d exec xdotool mouseup 2
	# Right Drag release
	bindsym $mod2+s exec xdotool mouseup 3
	# return to normal keybindings -- IMPORTANT!!
	bindsym Escape mode "default"
}
bindsym $mod+$mod2+Shift+m mode "mouse"
```

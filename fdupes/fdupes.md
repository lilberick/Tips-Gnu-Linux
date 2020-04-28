# fdupes: Encontrar archivos duplicados o repetidos
>**[Clic para ver el video tutorial](https://www.youtube.com/watch?v=asqukxOZ_Eg "Clic para ver el video tutorial")**
1. Instalación
   ```
   $ sudo apt install fdupes
   ```
2. Busca dentro de una carpeta
   ```
   $ fdupes carpeta
   ```
3. Busca recursívamente, es decir, busca en sub-carpetas
   ```
   $ fdupes -r carpeta 
   ```
4. Si queremos buscar de forma recursiva en todos los directorios
   ```
   $ fdupes -r ./*
   ```
5. Para eliminar archivos. Pedirá que archivos deseo conservar
   ```
   $ fdupes -d ./*
   ```
6. Eliminar buscando de forma recursiva
   ```
   $ fduupes -r -d ./*
   ```
7. Eliminar archivos repetidos conservando el primer archivo en la busqueda
   ```
   $ fdupes -rdN dir/
     r: recursive
     d: preserver first file, delete other dupes
     N: run silently (no prompt)
   ```
   [](./img/1.png)

>**[Clic para ver el video tutorial](https://www.youtube.com/watch?v=asqukxOZ_Eg "Clic para ver el video tutorial")**
  

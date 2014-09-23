Twitter App de Popularidad 
=========
Sistemas y Tecnologías web
-------


Objetivo
-----

Acceder a Twitter con  una aplicación Sinatra que muestre en una página los amigos más populares de un usuario cualquiera(un máximo de 10), para ello se clasificarán de mayor a menor según el numero de seguidores.


Funcionamiento
-----

La aplicación se ejecutará en local, para ello clona el repositorio de github [twitter-popular], de la siguiente forma: 

```sh
user@ubuntu-hp:~/twitter-popular$ git clone git@github.com:alu0100700435/twitter-popular.git
```
Una vez clonado el repositorio, modifique el archivo configure.rb con sus claves. Y a continuación ejecuta bundler:

```sh
user@ubuntu-hp:~/twitter-popular$ bundle install
```

Una vez hecho todo lo anterior, procede a ejecutar el archivo twitter.rb o twitter_v2.rb, recomendable con una version de ruby 1.9.

```sh
user@ubuntu-hp:~/twitter-popular$ ruby twitter.rb 
== Sinatra/1.4.5 has taken the stage on 4567 for development with backup from Thin
Thin web server (v1.6.2 codename Doc Brown)
Maximum connections set to 1024
Listening on localhost:4567, CTRL+C to stop
```

Una vez en ejecución, abre el navegador y escribe en la barra de direcciones *localhost:4567* y accederás a la web de la aplicación:

![ejemplo navegador](https://raw.githubusercontent.com/alu0100700435/twitter-popular/gh-pages/public/ejemplo.png) 

Y ya, sólo has de poner el usuario twitter que desees y enviar, y así apareceran sus amigos más populares. 
Es probable, que si el usuario elegido tiene muchos amigos, la aplicación tarde en responder o no responda debido a un excesivo tiempo de acceso. 

[twitter-popular]:https://github.com/alu0100700435/twitter-popular

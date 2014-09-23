# -*- coding: utf-8 -*-
require 'twitter'
require 'sinatra'

require './configure'

get '/' do  
  @fc = 0 # numero de amigos
  @name = ''  #nombre de usuario twitter
  @users = []
  erb :twitter
end

post '/' do  
  @fc = 0   
  @users = []
  @name = params[:firstname] || ''  #recoge del parametro firstname el nombre de usuario
  client = my_twitter_client()  #establece conexion twitter
  
  if client.user? @name #si el usuario introducido es de twitter 
        amigos = client.friends(@name) #recoge una lista de amigos
        usuarios = (usuarios!= '') ? amigos.map{ |i| [i.name ,i.followers_count]} : '' #guarda en un array solo el nombre y los seguidores
        
        usuarios = usuarios.sort_by {|k,v| -v} #ordena de mayor a menor
        
        a_user = client.user(@name) 
        @fc = a_user.friends_count
        
        if(@fc < 10)
            @fc.times do |i|
                @users[i] = usuarios[i]
            end      
        end
        if(@fc >= 10)    
            10.times do |i|
                @users[i] = usuarios[i]
            end 
        end   
  end
  erb :twitter
end
 

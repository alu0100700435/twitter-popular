# -*- coding: utf-8 -*-
require 'twitter'
require 'sinatra'

require './configure'

get '/' do  
  @fc = 0 # numero de amigos
  @name = ''  #nombre de usuario twitter
  @usuarios = Hash.new	#almacenara los amigos y el numero de seguidores
  @users = []
  erb :twitter
end

post '/' do  
  @fc = 0   
  @usuarios = Hash.new
  @users = []
  @name = params[:firstname] || ''  #recoge del parametro firstname el nombre de usuario
  client = my_twitter_client()  #establece conexion twitter
  
  if client.user? @name #si el usuario introducido es de twitter 
    @fc = client.user(@name).friends_count #recoge el numero de amigos del usuario
        
    if (@fc <=20) #si tiene menos de 20 amigos
        amigos = client.friend_ids(@name).attrs[:ids].take(@fc) #coge tantos amigos como tiene el usuario segun su atributo id
        @fc.times do |i|            
            amigos.map{@usuarios[client.user(amigos[i]).name] = client.user(amigos[i]).followers_count.to_i} 
        end 
    end
    
    if (@fc > 20) #si tiene mas de 20 amigos  
        amigos = client.friend_ids(@name).attrs[:ids].take(20) #coge 20 amigos  del usuario segun su atributo id
        20.times do |i|            
            amigos.map{@usuarios[client.user(amigos[i]).name] = client.user(amigos[i]).followers_count.to_i} 
        end         
    end 
    
    @users = @usuarios.sort_by {|k,v| -v} #ordena los amigos de mayor a menor segun sus seguidores              
  end
  erb :twitter
end
 

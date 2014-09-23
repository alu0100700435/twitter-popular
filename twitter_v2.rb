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
    
    a_user = client.user(@name) 
    @fc = a_user.friends_count #recoge el numero de amigos del usuario
    
    
    if (@fc < 101) #si tiene menos de diez amigos
        amigos = client.friend_ids(@name).attrs[:ids].take(@fc) #coge 10 amigos del usuario segun su atributo id
        @fc.times do |i| 
            user_n = client.user(amigos[i])
            @usuarios[user_n.screen_name.to_s] = user_n.followers_count.to_i 
        end 
        
    end
    if (@fc >= 101) #si tiene mas de diez amigos  
        amigos = client.friend_ids(@name).attrs[:ids]#coge 10 amigos del usuario segun su atributo id
        @fc.times do |i|
            user_n = client.user(amigos[i])
            @usuarios[user_n.screen_name.to_s] = user_n.followers_count.to_i
            sleep(5)
        end         
    end 
    
    @usuarios = @usuarios.sort_by {|k,v| -v} #ordena los amigos de mayor a menor segun sus seguidores  
    
    if(@fc < 10)
        @fc.times do |i|
            @users[i] = @usuarios[i]
        end      
    end
    if(@fc >= 10)    
        10.times do |i|
            @users[i] = @usuarios[i]
        end 
    end   
  end
  erb :twitter
end
 

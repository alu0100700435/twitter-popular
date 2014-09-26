require 'twitter'
require 'sinatra'
require './configure'
get '/' do
    @fc = 0 # numero de amigos
    @name = '' #nombre de usuario twitter
    @usuarios = Hash.new	#almacenara los amigos y el numero de seguidores
    @users = [] #contendra los amigos ordenados
    erb :twitter
end
post '/' do
    @fc = 0
    @usuarios = Hash.new #almacenara los amigos y el numero de seguidores
    @name = params[:firstname] || '' #recoge del parametro firstname el nombre de usuario
    @users = []  #contendra los amigos ordenados 
    client = my_twitter_client() #establece conexion twitter
    
    if client.user? @name #si el usuario introducido es de twitter
        a_user = client.user(@name)
        @fc = a_user.friends_count #recoge el numero de amigos del usuario
         
        if (@fc <= 10) #si tiene menos de diez amigos
            amigos = client.friend_ids(@name).attrs[:ids].take(@fc) #coge fc amigos del usuario segun su atributo id
            @fc.times do |i|
                user_n = client.user(amigos[i])
                @usuarios[user_n.screen_name.to_s] = user_n.followers_count.to_i
            end
        end
        if (@fc > 10) #si tiene mas de diez amigos
            amigos = client.friend_ids(@name).attrs[:ids].take(10) #coge 10 amigos del usuario segun su atributo id
            10.times do |i|
                user_n = client.user(amigos[i])
                @usuarios[user_n.screen_name.to_s] = user_n.followers_count.to_i
            end
        end
        @users = @usuarios.sort_by {|k,v| -v} #ordena los amigos de mayor a menor segun sus seguidores
    end
    erb :twitter
end
 

class FriendsController < ApplicationController
    
    # INDEX
    get '/friends' do
        @friends = Friend.all
        erb :"/friends/index"
    end

    # NEW
    get '/friends/new' do
        erb :"/friends/new"
    end

    # CREATE
    post '/friends' do
        @friend = Friend.create(name: params[:name], age: params[:age])
        redirect "/friends/:id"
    end

    # SHOW
    get '/friends/:id' do
        @friend = Friend.find(params[:id])
        erb :"/friends/show"
    end

    # EDIT
    get '/friends/:id/edit' do
        erb :"/friends/edit"
    end

    # UPDATE 
    patch '/friends/:id' do
        redirect "/friends/:id"
    end

    # DESTROY
    delete '/friends/:id/delete' do
        @friend = Friend.find(params[:id])
        friend.delete
        redirect '/friends'
    end



end
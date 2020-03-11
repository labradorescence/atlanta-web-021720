class ConversationsController < ApplicationController

    # INDEX
    get '/conversations' do
        @conversations = Conversation.all
        erb :"/conversations/index"
    end


    # CREATE
    get '/conversations/new' do
        erb :"/conversations/new"
    end

    post '/conversations' do 
        @conversation = Conversation.create(topic: params[:topic], length: params[:length])
        redirect "/conversations/:id"
    end

    # SHOW
    get '/conversations/:id' do
        @conversation = Conversation.find(params[:id])
        erb :"conversations/show"
    end


end

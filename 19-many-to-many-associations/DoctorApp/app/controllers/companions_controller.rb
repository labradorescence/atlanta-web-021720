class CompanionsController < ApplicationController

    def show 
        @companion = Companion.find(params[:id])
    end



end
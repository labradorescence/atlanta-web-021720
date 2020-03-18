class OwnersController < ApplicationController

    def index
        @owners = Owner.all
        # render :'owners/index'
    end

end
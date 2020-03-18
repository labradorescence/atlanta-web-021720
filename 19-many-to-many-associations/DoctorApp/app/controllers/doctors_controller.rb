class DoctorsController < ApplicationController

    def index
        @doctors = Doctor.all
    end

    def show
        @doctor = Doctor.find(params[:id])
    end

    def create
        @doctor = Doctor.new(doctor_params)
        
        if @doctor.valid?
            @doctor.save
            redirect_to doctor_path(@doctor)
        else 
            flash[:message] = "The value you entered is not valid...try again."
            render :new
        end
        
    end

    def new 
        @doctor = Doctor.new
    end

    private 

    def doctor_params 
        params.require(:doctor).permit(:name, :nickname)
    end

end
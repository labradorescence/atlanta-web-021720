class PatientsController < ApplicationController

    def index
        @patients = Patient.all
    end

    def show
        @patient = Patient.find(params[:id])
    end

    def new
        @patient = Patient.new
    end

    def create
        @patient = Patient.new
        @patient.name = params[:patient][:name]
        @patient.condition = params[:patient][:condition]
        @patient.doctor_id = params[:patient][:doctor_id]
        @patient.save

        redirect_to patient_path(@patient)
    end
end
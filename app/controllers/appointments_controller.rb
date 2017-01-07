class AppointmentsController < ApplicationController
   
    def index
        @appointments = Patient.all
        @doctors_assigned =  Patient.find_by(name: "Alexandro Navarro").doctors
        @doctor = Doctor.find_by(name: @name_of_doctor)
    end
    
    def show
        find_appointment
    end
    
    def new
        @appointment = Appointment.new
        @patient = Patient.new
    end
    
    def create
        @appointment = Appointment.new(appointment_params)
        if @appointment.save
            redirect_to @appointment
        else
            render "New"
        end
    end
    
    
    private
    
    def appointment_params
        params.require(:appointment).permit(:date, :doctor_id, :patient_id)
    end
    
    def find_appointment
        @appointment = Appointment.find(params[:id])
    end
    
    def go_doctors
        @doctor_signup = Doctor.find(params[:id])
    end
    
    
end

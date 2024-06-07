module Api
  module V1
    class AppointmentsController < ApplicationController
      before_action :set_appointment, only: %i[show update destroy]

      # GET /api/v1/appointments
      # GET /api/v1/appointments.json
      def index
        @appointments = Appointment.all
      end

      # GET /api/v1/appointments/1
      # GET /api/v1/appointments/1.json
      def show; end

      # POST /api/v1/appointments
      # POST /api/v1/appointments.json
      def create
        @appointment = Appointment.new(appointment_params)

        if @appointment.save
          render :show, status: :created, location: @appointment
        else
          render json: @appointment.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/appointments/1
      # PATCH/PUT /api/v1/appointments/1.json
      def update
        if @appointment.update(appointment_params)
          render :show, status: :ok, location: @appointment
        else
          render json: @appointment.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/appointments/1
      # DELETE /api/v1/appointments/1.json
      def destroy
        @appointment.destroy!
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_appointment
        @appointment = Appointment.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def appointment_params
        params.require(:appointment).permit(:date, :time, :status, :patients_id, :specialist_id)
      end
    end
  end
end

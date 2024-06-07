module Api
  module V1
    class PatientsController < ApplicationController
      before_action :set_patient, only: %i[show update destroy]

      # GET /api/v1/patients
      # GET /api/v1/patients.json
      def index
        @patients = Patient.all
      end

      # GET /api/v1/patients/1
      # GET /api/v1/patients/1.json
      def show; end

      # POST /api/v1/patients
      # POST /api/v1/patients.json
      def create
        @patient = Patient.new(patient_params)

        if @patient.save
          render :show, status: :created, location: @patient
        else
          render json: @patient.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/patients/1
      # PATCH/PUT /api/v1/patients/1.json
      def update
        if @patient.update(patient_params)
          render :show, status: :ok, location: @patient
        else
          render json: @patient.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/patients/1
      # DELETE /api/v1/patients/1.json
      def destroy
        @patient.destroy!
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_patient
        @patient = Patient.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def patient_params
        params.require(:patient).permit(:name, :lastname, :email, :phone, :specialty)
      end
    end
  end
end

module Api
  module V1
    class SpecialistsController < ApplicationController
      before_action :set_specialist, only: %i[show update destroy]

      # GET /api/v1/specialists
      # GET /api/v1/specialists.json
      def index
        @specialists = Specialist.all
      end

      # GET /api/v1/specialists/1
      # GET /api/v1/specialists/1.json
      def show; end

      # POST /api/v1/specialists
      # POST /api/v1/specialists.json
      def create
        @specialist = Specialist.new(specialist_params)

        if @specialist.save
          render :show, status: :created, location: api_v1_patient_url(@specialist)
        else
          render json: @specialist.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/specialists/1
      # PATCH/PUT /api/v1/specialists/1.json
      def update
        if @specialist.update(specialist_params)
          render :show, status: :ok, location: api_v1_patient_url(@specialist)
        else
          render json: @specialist.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/specialists/1
      # DELETE /api/v1/specialists/1.json
      def destroy
        @specialist.destroy!
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_specialist
        @specialist = Specialist.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def specialist_params
        params.require(:specialist).permit(:name, :lastname, :email, :phone, :specialty)
      end
    end
  end
end

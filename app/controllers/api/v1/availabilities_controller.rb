module Api
  module V1
    class AvailabilitiesController < ApplicationController
      before_action :set_api_v1_availability, only: %i[show update destroy]

      # GET /api/v1/availabilities
      # GET /api/v1/availabilities.json
      def index
        @api_v1_availabilities = Api::V1::Availability.all
      end

      # GET /api/v1/availabilities/1
      # GET /api/v1/availabilities/1.json
      def show; end

      # POST /api/v1/availabilities
      # POST /api/v1/availabilities.json
      def create
        @api_v1_availability = Api::V1::Availability.new(api_v1_availability_params)

        if @api_v1_availability.save
          render :show, status: :created, location: @api_v1_availability
        else
          render json: @api_v1_availability.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/availabilities/1
      # PATCH/PUT /api/v1/availabilities/1.json
      def update
        if @api_v1_availability.update(api_v1_availability_params)
          render :show, status: :ok, location: @api_v1_availability
        else
          render json: @api_v1_availability.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/availabilities/1
      # DELETE /api/v1/availabilities/1.json
      def destroy
        @api_v1_availability.destroy!
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_api_v1_availability
        @api_v1_availability = Api::V1::Availability.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def api_v1_availability_params
        params.require(:api_v1_availability).permit(:date, :start_time, :end_time, :specialist_id)
      end
    end
  end
end

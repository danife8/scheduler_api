module Api
  module V1
    class AvailabilitiesController < ApplicationController
      before_action :set_specialist
      before_action :set_availability, only: %i[show update destroy]

      # GET /api/v1/specialists/:id/availabilities
      # GET /api/v1/specialists/:id/availabilities.json
      def index
        @availabilities = @specialist.availabilities
      end

      # GET /api/v1/specialists/:id/availabilities/1
      # GET /api/v1/specialists/:id/availabilities/1.json
      def show; end

      # POST /api/v1/specialists/:id/availabilities
      # POST /api/v1/specialists/:id/availabilities.json
      def create
        @availability = @specialist.availabilities.build(availability_params)
        if @availability.save
          render :show, status: :created, location: api_v1_specialist_availabilities_url(@availability)
        else
          render json: @availability.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/specialists/:id/availabilities/1
      # PATCH/PUT /api/v1/specialists/:id/availabilities/1.json
      def update
        if @availability.update(availability_params)
          render :show, status: :ok, location: api_v1_specialist_availabilities_url(@availability)
        else
          render json: @availability.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/specialists/:id/availabilities/1
      # DELETE /api/v1/specialists/:id/availabilities/1.json
      def destroy
        @availability.destroy!
      end

      private

      def set_specialist
        @specialist = Specialist.find(params[:specialist_id])
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_availability
        @availability = @specialist.availabilities.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def availability_params
        params.require(:availability).permit(:date, :start_time, :end_time, :specialist_id)
      end
    end
  end
end

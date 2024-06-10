require 'rails_helper'

RSpec.describe '/api/v1/availabilities' do
  let(:specialist) { create(:specialist) }
  let(:valid_attributes) do
    {
      date: 'Mon, 21 Oct 2024',
      start_time: '09:00:00.000000000',
      end_time: '17:00:00.000000000',
      specialist:
    }
  end

  let(:invalid_attributes) do
    {
      date: 2.days.ago,
      start_time: nil,
      end_time: nil
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Availability.create! valid_attributes
      get api_v1_specialist_availabilities_url(specialist.id), as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      availability = Availability.create! valid_attributes
      get api_v1_specialist_availabilities_url(specialist.id, availability), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Availability' do
        expect do
          post api_v1_specialist_availabilities_url(specialist.id),
               params: { availability: valid_attributes }, as: :json
        end.to change(Availability, :count).by(1)
      end

      it 'renders a JSON response with the new availability' do
        post api_v1_specialist_availabilities_url(specialist.id),
             params: { availability: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Availability' do
        expect do
          post api_v1_specialist_availabilities_url(specialist.id),
               params: { availability: invalid_attributes }, as: :json
        end.not_to change(Availability, :count)
      end

      it 'renders a JSON response with errors for the new availability' do
        post api_v1_specialist_availabilities_url(specialist.id),
             params: { availability: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          date: '2024-10-22 00:00:00.000000000 +0000',
          start_time: '2000-01-01 16:00:00.000000000 +0000',
          end_time: '2000-01-01 12:00:00.000000000 +0000'
        }
      end

      it 'updates the requested availability' do
        availability = Availability.create! valid_attributes
        patch api_v1_specialist_availability_path(specialist.id, availability.id),
              params: { availability: new_attributes }, as: :json
        availability.reload
        expect(availability.date).to eq(new_attributes[:date])
        expect(availability.start_time).to eq(new_attributes[:start_time])
        expect(availability.end_time).to eq(new_attributes[:end_time])
      end

      it 'renders a JSON response with the availability' do
        availability = Availability.create! valid_attributes
        patch api_v1_specialist_availability_path(specialist.id, availability.id),
              params: { availability: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the availability' do
        availability = Availability.create! valid_attributes
        patch api_v1_specialist_availability_path(specialist.id, availability.id),
              params: { availability: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested availability' do
      availability = Availability.create! valid_attributes
      expect do
        delete api_v1_specialist_availability_path(specialist.id, availability.id), as: :json
      end.to change(Availability, :count).by(-1)
    end
  end
end

require 'rails_helper'

RSpec.describe '/specialists' do
  let(:valid_attributes) do
    {
      name: Faker::Name.first_name,
      lastname: Faker::Name.last_name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      specialty: Faker::Job.position
    }
  end

  let(:invalid_attributes) do
    {
      name: nil,
      lastname: nil,
      email: nil,
      phone: nil,
      specialty: nil
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Specialist.create! valid_attributes
      get api_v1_specialists_url, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      specialist = Specialist.create! valid_attributes
      get api_v1_specialist_url(specialist), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Specialist' do
        expect do
          post api_v1_specialists_url,
               params: { specialist: valid_attributes }, as: :json
        end.to change(Specialist, :count).by(1)
      end

      it 'renders a JSON response with the new specialist' do
        post api_v1_specialists_url,
             params: { specialist: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Specialist' do
        expect do
          post api_v1_specialists_url,
               params: { specialist: invalid_attributes }, as: :json
        end.not_to change(Specialist, :count)
      end

      it 'renders a JSON response with errors for the new specialist' do
        post api_v1_specialists_url,
             params: { specialist: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          name: 'New name',
          lastname: 'New lastname',
          email: 'new@email.com',
          phone: '54123456789',
          specialty: 'Psychologist'
        }
      end

      it 'updates the requested specialist' do
        specialist = Specialist.create! valid_attributes
        patch api_v1_specialist_url(specialist),
              params: { specialist: new_attributes }, as: :json
        specialist.reload
        expect(specialist).to have_attributes(new_attributes)
      end

      it 'renders a JSON response with the specialist' do
        specialist = Specialist.create! valid_attributes
        patch api_v1_specialist_url(specialist),
              params: { specialist: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the specialist' do
        specialist = Specialist.create! valid_attributes
        patch api_v1_specialist_url(specialist),
              params: { specialist: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested specialist' do
      specialist = Specialist.create! valid_attributes
      expect do
        delete api_v1_specialist_url(specialist), as: :json
      end.to change(Specialist, :count).by(-1)
    end
  end
end

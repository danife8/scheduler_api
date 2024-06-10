require 'rails_helper'

RSpec.describe '/patients' do
  let(:valid_attributes) do
    {
      name: Faker::Name.first_name,
      lastname: Faker::Name.last_name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number
    }
  end

  let(:invalid_attributes) do
    {
      name: nil,
      lastname: nil,
      email: nil,
      phone: nil
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Patient.create! valid_attributes
      get api_v1_patients_url, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      patient = Patient.create! valid_attributes
      get api_v1_patient_url(patient), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Patient' do
        expect do
          post api_v1_patients_url,
               params: { patient: valid_attributes }, as: :json
        end.to change(Patient, :count).by(1)
      end

      it 'renders a JSON response with the new patient' do
        post api_v1_patients_url,
             params: { patient: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Patient' do
        expect do
          post api_v1_patients_url,
               params: { patient: invalid_attributes }, as: :json
        end.not_to change(Patient, :count)
      end

      it 'renders a JSON response with errors for the new patient' do
        post api_v1_patients_url,
             params: { patient: invalid_attributes }, as: :json
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
          phone: '54123456789'
        }
      end

      it 'updates the requested patient' do
        patient = Patient.create! valid_attributes
        patch api_v1_patient_url(patient),
              params: { patient: new_attributes }, as: :json
        patient.reload
        expect(patient).to have_attributes(new_attributes)
      end

      it 'renders a JSON response with the patient' do
        patient = Patient.create! valid_attributes
        patch api_v1_patient_url(patient),
              params: { patient: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the patient' do
        patient = Patient.create! valid_attributes
        patch api_v1_patient_url(patient),
              params: { patient: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested patient' do
      patient = Patient.create! valid_attributes
      expect do
        delete api_v1_patient_url(patient), as: :json
      end.to change(Patient, :count).by(-1)
    end
  end
end

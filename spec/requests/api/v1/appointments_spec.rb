require 'rails_helper'

RSpec.describe '/appointments' do
  let(:patient) { create(:patient) }
  let(:specialist) { create(:specialist) }
  let(:availabilities) do
    create(:availabilities,
           :specialist,
           date: 'Mon, 21 Oct 2024',
           start_time: '9:00:00.000000000',
           end_time: '17:00:00.000000000')
  end
  let(:valid_attributes) do
    {
      date: 'Mon, 21 Oct 2024',
      time: '10:00:00.000000000',
      patient_id: patient.id,
      specialist_id: specialist.id
    }
  end

  let(:invalid_attributes) do
    {
      date: nil,
      time: nil,
      patient_id: patient.id,
      specialist_id: specialist.id
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Appointment.create! valid_attributes
      get api_v1_appointments_url, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      appointment = Appointment.create! valid_attributes
      get api_v1_appointment_url(appointment), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Appointment' do
        expect do
          post api_v1_appointments_path,
               params: { appointment: valid_attributes }, as: :json
        end.to change(Appointment, :count).by(1)
      end

      it 'renders a JSON response with the new appointment' do
        post api_v1_appointments_path,
             params: { appointment: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Appointment' do
        expect do
          post api_v1_appointments_url,
               params: { appointment: invalid_attributes }, as: :json
        end.not_to change(Appointment, :count)
      end

      it 'renders a JSON response with errors for the new appointment' do
        post api_v1_appointments_url,
             params: { appointment: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          date: '2024-10-21 00:00:00.000000000 +0000',
          time: '2000-01-01 10:00:00.000000000 +0000',
          patient:,
          specialist:
        }
      end

      it 'updates the requested appointment' do
        appointment = Appointment.create! valid_attributes
        patch api_v1_appointment_url(appointment),
              params: { appointment: new_attributes }, as: :json
        appointment.reload
        expect(appointment.date).to eq(new_attributes[:date])
        expect(appointment.time).to eq(new_attributes[:time])
      end

      it 'renders a JSON response with the appointment' do
        appointment = Appointment.create! valid_attributes
        patch api_v1_appointment_url(appointment),
              params: { appointment: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the appointment' do
        appointment = Appointment.create! valid_attributes
        patch api_v1_appointment_url(appointment),
              params: { appointment: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested appointment' do
      appointment = Appointment.create! valid_attributes
      expect do
        delete api_v1_appointment_url(appointment), as: :json
      end.to change(Appointment, :count).by(-1)
    end
  end
end

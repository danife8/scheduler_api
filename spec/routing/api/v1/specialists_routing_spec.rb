require 'rails_helper'

RSpec.describe Api::V1::SpecialistsController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/specialists').to route_to('api/v1/specialists#index')
    end

    it 'routes to #show' do
      expect(get: '/api/v1/specialists/1').to route_to('api/v1/specialists#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/v1/specialists').to route_to('api/v1/specialists#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/v1/specialists/1').to route_to('api/v1/specialists#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/v1/specialists/1').to route_to('api/v1/specialists#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/v1/specialists/1').to route_to('api/v1/specialists#destroy', id: '1')
    end
  end
end

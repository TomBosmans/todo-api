# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'has a 200 status' do
      get :index
      expect(response).to have_http_status :ok
    end
  end

  describe 'GET #show' do
    it 'has a 200 status' do
      user = create :user
      get :show, params: { id: user.id }
      expect(response).to have_http_status :ok
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'has a status 201' do
        params = attributes_for :user
        post :create, params: { user: params }
        expect(response).to have_http_status :created
      end
    end

    context 'with invalid params' do
      it 'has a 422 status' do
        params = attributes_for :user, email: nil
        post :create, params: { user: params }
        expect(response).to have_http_status :unprocessable_entity
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid params' do
      it 'has a 204 status' do
        user = create :user
        patch :update, params: { id: user.id, user: { name: 'the new name' } }
        expect(response).to have_http_status :no_content
      end
    end

    context 'with invalid params' do
      it 'has a 422 status' do
        user = create :user
        patch :update, params: { id: user.id, user: { email: nil } }
        expect(response).to have_http_status :unprocessable_entity
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'has a status 204' do
      user = create :user
      delete :destroy, params: { id: user.id }
      expect(response).to have_http_status :no_content
    end
  end
end

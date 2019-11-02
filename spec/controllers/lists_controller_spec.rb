# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  describe 'GET #index' do
    it 'has a 200 status' do
      get :index
      expect(response).to have_http_status :ok
    end
  end

  describe 'GET #show' do
    it 'has a 200 status' do
      list = create :list
      get :show, params: { id: list.id }
      expect(response).to have_http_status :ok
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'has a status 201' do
        params = attributes_for :list
        post :create, params: { list: params }
        expect(response).to have_http_status :created
      end
    end

    context 'with invalid params' do
      it 'has a 422 status' do
        params = attributes_for :list, name: nil
        post :create, params: { list: params }
        expect(response).to have_http_status :unprocessable_entity
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid params' do
      it 'has a 204 status' do
        list = create :list
        patch :update, params: { id: list.id, list: { name: 'the new name' } }
        expect(response).to have_http_status :no_content
      end
    end

    context 'with invalid params' do
      it 'has a 422 status' do
        list = create :list
        patch :update, params: { id: list.id, list: { name: nil } }
        expect(response).to have_http_status :unprocessable_entity
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'has a status 204' do
      list = create :list
      delete :destroy, params: { id: list.id }
      expect(response).to have_http_status :no_content
    end
  end
end

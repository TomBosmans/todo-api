# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  describe 'GET #index' do
    it 'has a 200 status' do
      get :index
      expect(response).to have_http_status :ok
    end
  end

  describe 'GET #show' do
    it 'has a 200 status' do
      todo = create :todo
      get :show, params: { id: todo.id }
      expect(response).to have_http_status :ok
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'has a status 201' do
        list = create :list
        params = attributes_for :todo, list_id: list.id
        post :create, params: { todo: params }
        expect(response).to have_http_status :created
      end
    end

    context 'with invalid params' do
      it 'has a 422 status' do
        list = create :list
        params = attributes_for :todo, list_id: list.id, name: nil
        post :create, params: { todo: params }
        expect(response).to have_http_status :unprocessable_entity
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid params' do
      it 'has a 204 status' do
        todo = create :todo
        patch :update, params: { id: todo.id, todo: { name: 'the new name' } }
        expect(response).to have_http_status :no_content
      end
    end

    context 'with invalid params' do
      it 'has a 422 status' do
        todo = create :todo
        patch :update, params: { id: todo.id, todo: { name: nil } }
        expect(response).to have_http_status :unprocessable_entity
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'has a status 204' do
      todo = create :todo
      delete :destroy, params: { id: todo.id }
      expect(response).to have_http_status :no_content
    end
  end
end

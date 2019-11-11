# frozen_string_literal: true

RSpec.shared_examples 'json api to many relationships controller' do |actions = %i[create update destroy]|
  let(:parent_name) { described_class.new.parent_name }
  let(:parent) { create parent_name }
  let(:resource_name) { described_class.new.resource_name }
  let(:params) { { "#{parent_name}_id" => parent.id } }

  if actions.include?(:create)
    describe 'POST #create' do
      it 'has a 204 status' do
        resources = create_list resource_name, 3
        data = resources.map { |resource| { id: resource.id } }
        post :create, params: params.merge(data: data)
        expect(response).to have_http_status :no_content
      end

      it 'adds the given resources to the parent' do
        parent_resources = create_list resource_name, 3, parent_name => parent
        resources = create_list resource_name, 3
        data = resources.map { |resource| { id: resource.id } }
        post :create, params: params.merge(data: data)
        expect(parent.send(resource_name.pluralize)).to match_array(parent_resources + resources)
      end
    end
  end

  if actions.include?(:update)
    describe 'PATCH #update' do
      it 'has a 204 status' do
        resources = create_list resource_name, 3
        data = resources.map { |resource| { id: resource.id } }
        patch :update, params: params.merge(data: data)
        expect(response).to have_http_status :no_content
      end
    end

    it 'replaces the parents resources' do
      create_list resource_name, 3, parent_name => parent
      resources = create_list resource_name, 3
      data = resources.map { |resource| { id: resource.id } }
      patch :update, params: params.merge(data: data)
      expect(parent.send(resource_name.pluralize)).to match_array(resources)
    end
  end

  if actions.include?(:destroy)
    describe 'DELETE #destroy' do
      it 'has a 204 status' do
        resources = create_list resource_name, 3, parent_name => parent
        data = resources.map { |resource| { id: resource.id } }
        delete :destroy, params: params.merge(data: data)
        expect(response).to have_http_status :no_content
      end

      it 'removes the relationship with the parent' do
        not_destroyed_resources = create_list resource_name, 3, parent_name => parent
        resources = create_list resource_name, 3, parent_name => parent
        data = resources.map { |resource| { id: resource.id } }
        delete :destroy, params: params.merge(data: data)
        expect(parent.send(resource_name.pluralize)).to match_array(not_destroyed_resources)
      end

      it 'does not destroy the resources' do
        resources = create_list resource_name, 3, parent_name => parent
        data = resources.map { |resource| { id: resource.id } }
        delete :destroy, params: params.merge(data: data)
        expect(resources.each(&:reload)).to be_present
      end
    end
  end
end

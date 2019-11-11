# frozen_string_literal: true

RSpec.shared_examples 'json api to one relationships controller' do
  let(:parent_name) { described_class.new.parent_name }
  let(:parent) { create parent_name }
  let(:resource_name) { described_class.new.resource_name }
  let(:params) { { "#{parent_name}_id" => parent.id } }

  describe 'PATCH #update' do
    it 'has a 204 status' do
      resource = create resource_name
      patch :update, params: params.merge(data: { id: resource.id })
      expect(response).to have_http_status :no_content
    end

    it 'updates the relationships on the parent' do
      resource = create resource_name
      patch :update, params: params.merge(data: { id: resource.id })
      expect(parent.reload.send(resource_name)).to eq resource
    end
  end
end

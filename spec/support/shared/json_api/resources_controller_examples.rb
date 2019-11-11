# frozen_string_literal: true

RSpec.shared_examples 'json api resources controller' do |actions = %i[index show create update destroy]|
  let(:nested?) { described_class.new.nested? }
  let(:parent_name) { described_class.new.parent_name }
  let(:parent) { create parent_name }
  let(:resource_name) { described_class.new.resource_name }
  let(:resource_model) { resource_name.camelcase.constantize }
  let(:resource_serializer) { "JsonApi::#{resource_model}Serializer".constantize }
  let(:create_service) { "#{resource_model}::CreateService".constantize }
  let(:update_service) { "#{resource_model}::UpdateService".constantize }
  let(:destroy_service) { "#{resource_model}::DestroyService".constantize }
  let(:params) do
    params = {}
    params = params.merge("#{parent_name}_id" => parent.id) if nested?
    params
  end
  let(:params_dummy) do
    params.merge(data: { attributes: { empty: true } })
  end

  def build_resource
    build resource_name
  end

  def create_resource
    resource = build_resource
    resource.save
    resource
  end

  if actions.include?(:index)
    describe 'GET #index' do
      it 'has a 200 status' do
        get :index, params: params
        expect(response).to have_http_status :ok
      end

      it 'uses the resource serializer' do
        allow(resource_serializer).to receive(:new).and_call_original
        get :index, params: params
        expect(resource_serializer).to have_received(:new)
      end

      it 'paginates the resources' do
        5.times { create_resource }
        get :index, params: params.merge(page: { number: 2, size: 2 })
        expect(JSON.parse(response.body)['data'].count).to eq 2
      end

      it 'sorts the resources' do
        5.times { create_resource }
        get :index, params: params.merge(sort: '-id')
        ids = JSON.parse(response.body)['data'].map { |resource| resource['id'].to_i }
        expect(ids).to eq(resource_model.order(id: :desc).ids)
      end
    end
  end

  if actions.include?(:show)
    describe 'GET #show' do
      it 'has a 200 status' do
        resource = create_resource
        get :show, params: params.merge(id: resource.id)
        expect(response).to have_http_status :ok
      end

      it 'uses the resource serializer' do
        resource = create_resource
        allow(resource_serializer).to receive(:new).and_call_original
        get :show, params: params.merge(id: resource.id)
        expect(resource_serializer).to have_received(:new)
      end
    end
  end

  if actions.include?(:create)
    describe 'POST #create' do
      it 'uses create service' do
        resource = create_resource
        allow(create_service).to receive(:execute).and_return(resource)
        post :create, params: params_dummy
        expect(create_service).to have_received(:execute)
      end

      context 'when create succeeds' do
        it 'has a status 201' do
          resource = create_resource
          allow(create_service).to receive(:execute).and_return(resource)
          post :create, params: params_dummy
          expect(response).to have_http_status :created
        end

        it 'uses the resource serializer' do
          resource = create_resource
          allow(create_service).to receive(:execute).and_return(resource)
          allow(resource_serializer).to receive(:new).and_call_original
          post :create, params: params_dummy
          expect(resource_serializer).to have_received(:new)
        end
      end

      context 'when create fails' do
        it 'has a 422 status' do
          resource = build_resource
          resource.errors.add :base, 'Invalid resrouce'
          allow(create_service).to receive(:execute).and_return(resource)
          post :create, params: params_dummy
          expect(response).to have_http_status :unprocessable_entity
        end
      end
    end
  end

  if actions.include?(:update)
    describe 'PATCH #update' do
      it 'uses update service' do
        resource = create_resource
        allow(update_service).to receive(:execute).and_return(resource)
        patch :update, params: params_dummy.merge(id: resource.id)
        expect(update_service).to have_received(:execute)
      end

      context 'when update succeeds' do
        it 'has a 204 status' do
          resource = create_resource
          allow(update_service).to receive(:execute).and_return(resource)
          patch :update, params: params_dummy.merge(id: resource.id)
          expect(response).to have_http_status :no_content
        end
      end

      context 'when update fails' do
        it 'has a 422 status' do
          resource = create_resource
          resource.errors.add :base, 'Invalid resource'
          allow(update_service).to receive(:execute).and_return(resource)
          patch :update, params: params_dummy.merge(id: resource.id)
          expect(response).to have_http_status :unprocessable_entity
        end
      end
    end
  end

  if actions.include?(:destroy)
    describe 'DELETE #destroy' do
      it 'has a 204 status' do
        resource = create_resource
        delete :destroy, params: params.merge(id: resource.id)
        expect(response).to have_http_status :no_content
      end

      it 'uses destroy service' do
        resource = create_resource
        allow(destroy_service).to receive(:execute)
        delete :destroy, params: params.merge(id: resource.id)
        expect(destroy_service).to have_received(:execute)
      end
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe JsonApi::Lists::TodosController, type: :controller do
  include_examples 'json api resources controller' do
    def build_resource
      build :todo, list: parent
    end
  end
end

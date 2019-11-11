# frozen_string_literal: true

require 'rails_helper'

RSpec.describe JsonApi::Lists::Relationships::TodosController, type: :controller do
  include_examples 'json api to many relationships controller'
end

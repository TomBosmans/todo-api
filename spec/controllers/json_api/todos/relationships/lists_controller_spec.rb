# frozen_string_literal: true

require 'rails_helper'

RSpec.describe JsonApi::Todos::Relationships::ListsController, type: :controller do
  include_examples 'json api to one relationships controller'
end

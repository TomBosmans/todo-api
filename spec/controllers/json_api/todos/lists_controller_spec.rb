# frozen_string_literal: true

require 'rails_helper'

RSpec.describe JsonApi::Todos::ListsController, type: :controller do
  include_examples 'json api resources controller', %i[show update destroy]
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe JsonApi::TodosController, type: :controller do
  include_examples 'json api resources controller'
end

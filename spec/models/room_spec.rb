# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Room, type: :model do
  before(:all) do
    @room = create(:room)
  end

  it 'is valid with valid attrs' do
    expect(@room).to be_valid
  end
end

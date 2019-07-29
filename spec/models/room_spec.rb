# frozen_string_literal: true

# == Schema Information
#
# Table name: rooms
#
#  id         :bigint           not null, primary key
#  name       :string           default(""), not null
#  identifier :string           not null
#  capacity   :integer          default(1)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  aasm_state :string
#


require 'rails_helper'

RSpec.describe Room, type: :model do
  before(:all) do
    @room = create(:room)
  end

  describe 'saving valid object' do
    it 'is valid with valid attrs' do
      expect(@room).to be_valid
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:capacity) }
  end

  describe 'aasm transitions' do
    it { should have_states :available, :busy, :unavailable }
  end
end

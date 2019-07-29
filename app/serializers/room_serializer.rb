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

class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :identifier, :capacity
end

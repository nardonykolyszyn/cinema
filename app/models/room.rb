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
#

class Room < ApplicationRecord
  include Stateable
  ## Validations
  # Rubocop marks as a fault one-single validation for several attributes.
  validates :capacity, presence: true
  validates :name,
            presence: true,
            uniqueness: true,
            format: { with: /[a-zA-Z]/, message: 'may only contain letters' }
end

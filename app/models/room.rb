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
  ## AASM support
  include Stateable
  ## Callbacks
  after_validation :assign_identifier, if: :new_record?
  ## Validations
  # Rubocop marks as a fault one-single validation for several attributes.
  validates :capacity, presence: true, numericality: { less_than_or_equal_to: 10 }
  validates :name,
            presence: true,
            uniqueness: true,
            format: { with: /[a-zA-Z]/, message: 'may only contain letters' }

  private

  def assign_identifier
    self.identifier = "#{SecureRandom.base64[0..4]}-#{name.parameterize}"
  end
end

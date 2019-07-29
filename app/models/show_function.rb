# frozen_string_literal: true

# == Schema Information
#
# Table name: show_functions
#
#  id          :bigint           not null, primary key
#  function_id :bigint
#  starts_at   :datetime
#  ends_at     :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  client_id   :bigint
#

class ShowFunction < ApplicationRecord
  ## Validations
  validate :available_spots
  ## Associations
  belongs_to :function
  belongs_to :client

  private

  # It validates that show_functions are not higher than room capacity.
  def available_spots
    if function.current_show_functions.size >= function.room_capacity
      errors.add(:function, 'room has reached its maximum capacity')
    end
  end
end

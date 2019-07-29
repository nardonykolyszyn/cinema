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
  ## Callbacks
  after_save :block_room
  ## Validations
  validate :available_spots
  ## Associations
  belongs_to :function
  belongs_to :client

  private

  def block_room
    function.room.busy! if limit_reached?
  end

  def limit_reached?
    function.current_show_functions.size >= function.room_capacity
  end

  # It validates that show_functions are not higher than room capacity.
  def available_spots
    errors.add(:function, 'room has reached its maximum capacity') if limit_reached?
  end
end

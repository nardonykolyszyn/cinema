# frozen_string_literal: true

# == Schema Information
#
# Table name: functions
#
#  id         :bigint           not null, primary key
#  show_at    :date
#  movie_id   :bigint
#  room_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Function < ApplicationRecord
  ## Delegator
  delegate :capacity, to: :room, prefix: true
  ## Validations
  validates :show_at, presence: true
  ## Associations
  has_many :show_functions
  belongs_to :movie
  belongs_to :room
  ## Instance methods
  def current_show_functions
    show_functions
  end
end

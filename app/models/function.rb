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
  ## Class constants
  MOVIE_PER_DAY = 1
  ## Delegator
  delegate :capacity, to: :room, prefix: true
  ## Validations
  validates :show_at, presence: true
  validate  :in_day_functions
  ## Associations
  has_many :show_functions
  belongs_to :movie
  belongs_to :room
  ## Instance methods
  def current_show_functions
    show_functions
  end

  private

  def in_day_functions
    errors.add(:room, "this room can't present any other movie today") unless (room.today_functions.size || 0) < MOVIE_PER_DAY
  end
end

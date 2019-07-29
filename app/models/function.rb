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
  ## Validations
  validates :show_at, presence: true
  ## Associations
  has_many :function_movies
  has_many :movies, through: :function_movies
  belongs_to :movie
  belongs_to :room
end

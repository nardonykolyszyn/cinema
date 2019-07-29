# frozen_string_literal: true

class Function < ApplicationRecord
  ## Validations
  validates :show_at, presence: true
  ## Associations
  has_many :function_movies
  has_many :movies, through: :function_movies
  belongs_to :movie
  belongs_to :room
end

# frozen_string_literal: true

class Function < ApplicationRecord
  ## Validations
  validates :show_at, presence: true
  ## Associations
  belongs_to :movie
  belongs_to :room
end

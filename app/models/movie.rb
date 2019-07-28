# frozen_string_literal: true

class Movie < ApplicationRecord
  ## Enum method
  enum gender: %i[horror romantic comedy adventure].freeze
  ## Associations
  ## Validations
end

# frozen_string_literal: true

# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  name       :string
#  year       :integer
#  gender     :integer          default("horror")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Movie < ApplicationRecord
  ## Enum method
  enum gender: %i[horror romantic comedy adventure action].freeze
  ## Associations
  has_many :functions
  ## Validations
end

# frozen_string_literal: true

# == Schema Information
#
# Table name: clients
#
#  id              :bigint           not null, primary key
#  first_name      :string
#  last_name       :string
#  document_type   :integer          default(0)
#  document_number :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Client < ApplicationRecord
  ## Enum method
  enum document_type: %i[ce cc passport]
  ## Validations
  validates :document_number, presence: true
  validates :document_type, inclusion: { in: document_types.keys }
  ## Associations
  has_many :show_functions
end

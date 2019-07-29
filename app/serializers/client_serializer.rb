# frozen_string_literal: true

# == Schema Information
#
# Table name: clients
#
#  id              :bigint           not null, primary key
#  first_name      :string
#  last_name       :string
#  document_type   :integer          default("ce")
#  document_number :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ClientSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :document_type, :document_number
end

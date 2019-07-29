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

class ShowFunctionSerializer < ActiveModel::Serializer
  attributes :id, :starts_at, :ends_at, :client, :function

  def function
    ::FunctionSerializer.new(object.function)
  end

  def client
    ::ClientSerializer.new(object.client)
  end
end

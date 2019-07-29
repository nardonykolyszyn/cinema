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


class MovieSerializer < ActiveModel::Serializer
  attributes :id, :name, :year, :gender
end

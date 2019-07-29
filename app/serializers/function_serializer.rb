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

class FunctionSerializer < ActiveModel::Serializer
  attributes :id, :show_at, :room, :movie

  def room
    ::RoomSerializer.new(object.room).attributes
  end

  def movie
    ::MovieSerializer.new(object.movie).attributes
  end
end

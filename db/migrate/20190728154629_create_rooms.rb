# frozen_string_literal: true

class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name, null: false, default: ''
      t.string :identifier, null: false, dafault: ''
      t.integer :capacity, default: 1

      t.timestamps
    end
  end
end

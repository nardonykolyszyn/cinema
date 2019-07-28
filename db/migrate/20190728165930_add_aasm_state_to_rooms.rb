# frozen_string_literal: true

class AddAasmStateToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :aasm_state, :string
  end
end

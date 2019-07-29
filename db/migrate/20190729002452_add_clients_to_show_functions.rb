# frozen_string_literal: true

class AddClientsToShowFunctions < ActiveRecord::Migration[5.2]
  def change
    add_reference :show_functions, :client, foreign_key: { on_delete: :cascade }, index: true
  end
end

# frozen_string_literal: true

class CreateShowFunctions < ActiveRecord::Migration[5.2]
  def change
    create_table :show_functions do |t|
      t.belongs_to :function, foreign_key: { on_delete: :cascade }, index: true
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end

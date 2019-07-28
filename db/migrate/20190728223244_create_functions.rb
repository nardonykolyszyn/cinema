# frozen_string_literal: true

class CreateFunctions < ActiveRecord::Migration[5.2]
  def change
    create_table :functions do |t|
      t.date :show_at
      t.belongs_to :movie, foreign_key: { on_delete: :cascade }
      t.belongs_to :room, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end

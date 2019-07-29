# frozen_string_literal: true

class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.integer :document_type, default: 0
      t.string :document_number

      t.timestamps
    end
  end
end

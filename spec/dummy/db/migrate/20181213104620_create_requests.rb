# frozen_string_literal: true

class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

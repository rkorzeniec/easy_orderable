class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end

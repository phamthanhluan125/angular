class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :name, null: false
      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end

class CreateCategoryShips < ActiveRecord::Migration
  def change
    create_table :category_ships do |t|
      t.integer :topic_id, :index => true
      t.integer :category_id, :index => true
      t.timestamps null: false
    end
  end
end

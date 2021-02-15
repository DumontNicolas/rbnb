class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.string :category
      t.integer :price

      t.timestamps
    end
  end
end

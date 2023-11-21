class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :author
      t.integer :price
      t.boolean :available
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

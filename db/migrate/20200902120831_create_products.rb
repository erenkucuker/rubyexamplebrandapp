class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.belongs_to :brand

      t.timestamps
    end
  end
end

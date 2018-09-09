class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :time
      t.string :category
      t.text :instruction
      t.integer :serving_size

      t.timestamps
    end
  end
end

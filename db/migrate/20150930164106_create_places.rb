class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.text :address
      t.decimal :lat
      t.decimal :long
      t.string :name
      t.references :category, index: true, foreign_key: true
      t.references :author, polymorphic: true, index: true
      t.references :people, array: true, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

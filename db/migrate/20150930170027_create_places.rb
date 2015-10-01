class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.json :address
      t.decimal :lat
      t.decimal :long
      t.string :name
      t.references :category, index: true, foreign_key: true
      t.references :author, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end

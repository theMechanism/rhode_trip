class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      # contain address fields in same table
      t.datetime :publish_date
      t.string :line_1
      t.string :line_2
      t.string :city
      t.string :zip
      t.decimal :lat
      t.decimal :long
      t.string :name
      t.boolean :approved
      t.references :author, index: true

      t.timestamps null: false
    end
  end
end

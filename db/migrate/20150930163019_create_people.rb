class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.text :abstract
      t.text :description
      t.string :occupation
      t.boolean :allow_comments
      t.boolean :approved
      t.references :author, index: true

      t.timestamps null: false
    end
  end
end

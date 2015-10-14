class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :display_name
      t.string :role

      t.timestamps null: false
    end
  end
end

class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :display_name
      t.string :role

      t.timestamps null: false
    end
  end
end

class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :username
      t.string :email
      t.string :role

      t.timestamps null: false
    end
  end
end

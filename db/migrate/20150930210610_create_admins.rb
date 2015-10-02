class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :display_name
      # t.string :role -- in later versions may make sense for Admin#ROLES

      t.timestamps null: false
    end
  end
end

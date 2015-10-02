class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :display_name
      t.boolean :can_self_publish

      t.timestamps null: false
    end
  end
end

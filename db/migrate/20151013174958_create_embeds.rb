class CreateEmbeds < ActiveRecord::Migration
  def change
    create_table :embeds do |t|
      t.references :uploadable, polymorphic: true, index: true
      t.references :upload, index: true

      t.timestamps null: false
    end
  end
end

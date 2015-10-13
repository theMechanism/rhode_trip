class CreateEmbeds < ActiveRecord::Migration
  def change
    create_table :embeds do |t|
      t.references :uploadable, polymorphic: true, index: true
      t.upload :references

      t.timestamps null: false
    end
  end
end

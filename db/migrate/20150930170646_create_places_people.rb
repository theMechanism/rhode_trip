class CreatePlacesPeople < ActiveRecord::Migration
  def change
    create_join_table :places, :people do |t|
      t.references :person
      t.references :place
    end
  end
end

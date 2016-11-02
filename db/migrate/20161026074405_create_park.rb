class CreatePark < ActiveRecord::Migration
  def change
    create_table :parks, :inherits => :site do |t|
      t.string :parkType, :acres
      t.timestamps
    end
  end
end

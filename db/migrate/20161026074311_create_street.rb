class CreateStreet < ActiveRecord::Migration
  def change
    create_table :streets, :inherits => :site do |t|
      t.string :start, :end, :direction, :miles
      t.timestamps
    end
  end
end

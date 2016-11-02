class CreateWash < ActiveRecord::Migration
  def change
    create_table :washes, :inherits => :site do |t|
      t.string :waterFlow
      t.string :Miles
      t.timestamps
    end
  end
end

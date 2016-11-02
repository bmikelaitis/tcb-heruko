class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :toolName
      t.string :totalQuantity
      t.string :description
      t.timestamps
    end
  end
end

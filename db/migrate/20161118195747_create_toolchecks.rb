class CreateToolchecks < ActiveRecord::Migration
  def change
    create_table :toolchecks do |t|
       t.integer :organization_id, :tool_id, :admin_id
      t.string :Type, :Status
      t.integer :quantityRented
      t.boolean :approved, default: false
      t.datetime :dateCheckedOut
      t.timestamps
    end
  end
end

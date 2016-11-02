class CreateToolCheckout < ActiveRecord::Migration
  def change
    create_table :tool_checkouts do |t|
      t.integer :organization_id, :tool_id, :volunteer_id
      t.string :Type, :Status
      t.integer :quantityRented
      t.boolean :approved
      t.datetime :dateCheckedOut
      t.timestamps
    end
  end
end

class CreateToolNotes < ActiveRecord::Migration
  def change
    create_table :tool_notes do |t|
      t.integer :tool_id, :volunteer_id
      t.string :toolNotes
      t.timestamps
    end
  end
end

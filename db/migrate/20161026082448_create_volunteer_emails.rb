class CreateVolunteerEmails < ActiveRecord::Migration
  def change
    create_table :volunteer_emails do |t|
      t.integer :volunteer_id
      t.string :email
      t.timestamps
    end
  end
end

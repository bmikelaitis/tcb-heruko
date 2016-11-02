class CreateRegularMembers < ActiveRecord::Migration
  def change
    create_table :regular_members do |t|
      t.decimal :reportedHours,  precision: 6, scale: 2
    end
  end
end

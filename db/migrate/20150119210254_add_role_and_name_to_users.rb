class AddRoleAndNameToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :role, null: false, default: 0
      t.string :name
    end
  end
end

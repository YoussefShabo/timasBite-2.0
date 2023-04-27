class AddUserIdToBites < ActiveRecord::Migration[7.0]
  def change
    add_column :bites, :user_id, :integer
    add_index :bites, :user_id
  end
end

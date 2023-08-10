class AddUserToCategory < ActiveRecord::Migration[7.0]

  def up
    add_column :categories, :user_id, :integer
  end

  def down
    remove_column :categories, :user_id
  end
end

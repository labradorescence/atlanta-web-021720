class AddColumnToConversations < ActiveRecord::Migration[5.1]
  def change
    add_column :conversations, :friend_id, :integer
  end
end

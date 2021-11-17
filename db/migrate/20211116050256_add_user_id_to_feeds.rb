class AddUserIdToFeeds < ActiveRecord::Migration[6.1]
  def change
    add_column :feeds, :user_id, :int
  end
end

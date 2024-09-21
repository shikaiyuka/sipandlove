class AddBaseToTweet < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :Base, :string
  end
end

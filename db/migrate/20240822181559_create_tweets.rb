class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :cocktail
      t.string :comment

      t.timestamps
    end
  end
end

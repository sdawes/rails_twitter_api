class CreateFollowers < ActiveRecord::Migration[5.0]
  def change
    create_table :followers do |t|
      t.string :twitter_followers

      t.timestamps
    end
  end
end

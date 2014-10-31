class CreateRetweets < ActiveRecord::Migration
  def change
    create_table :retweets do |t|
      t.integer :tweet_id
      t.integer :retweeter_id
      t.timestamps
    end
  end
end

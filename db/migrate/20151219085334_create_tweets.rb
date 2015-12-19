class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string      :name
      t.integer :tani
      t.text        :text
      t.timestamps
    end
  end
end
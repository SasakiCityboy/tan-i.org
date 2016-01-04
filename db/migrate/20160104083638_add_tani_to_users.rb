class AddTaniToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tani, :string
  end
end

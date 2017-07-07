class AddSizeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :size, :string
  end
end

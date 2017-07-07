class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    drop_table :users if ActiveRecord::Base.connection.table_exists? :users
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps null: false
    end
  end
end

class AddRsvpToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :rsvp, :string
    add_column :users, :clicked_invite, :integer, default: 0
  end
end

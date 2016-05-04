class AddValideToclubsUsers < ActiveRecord::Migration
  def change
    add_column :clubs_users, :valide, :boolean
  end
end

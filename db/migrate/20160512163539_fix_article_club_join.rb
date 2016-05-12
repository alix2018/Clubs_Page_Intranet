class FixArticleClubJoin < ActiveRecord::Migration
  def change
  	drop_table :publications
  	add_column :articles, :club_id, :int,  null: false
  end
end

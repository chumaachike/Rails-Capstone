class CreateDealCategoryJoinTable < ActiveRecord::Migration[7.0]
  create_join_table :categories, :deals do |t|
    t.index :category_id
    t.index :deal_id
  end
end

class CreateBounties < ActiveRecord::Migration
  def change
    create_table :bounties do |t|
      t.string :title
      t.text :description
      t.integer :post_id
      t.timestamps          
    end
  end
end

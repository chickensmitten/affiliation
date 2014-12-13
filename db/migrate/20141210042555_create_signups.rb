class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.string :username, :email
      t.integer :post_id
      t.timestamps      
    end
  end
end

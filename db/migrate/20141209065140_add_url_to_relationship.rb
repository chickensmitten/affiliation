class AddUrlToRelationship < ActiveRecord::Migration
  def change
    add_column :relationships, :url, :string
  end
end

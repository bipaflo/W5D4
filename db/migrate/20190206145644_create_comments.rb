class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.belongs_to :gossip, index: true
      t.string :author
      t.string :content
      t.timestamps
    end
  end
end

class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string  :text
      t.integer :designer_id
      t.integer :attachable_id
      t.string  :attachable_type

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end

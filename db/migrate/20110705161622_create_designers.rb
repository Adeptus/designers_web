class CreateDesigners < ActiveRecord::Migration
  def self.up
    create_table :designers do |t|
      t.string :name
      t.integer :tel
      t.string :image_url
      t.text :presentation

      t.timestamps
    end
  end

  def self.down
    drop_table :designers
  end
end

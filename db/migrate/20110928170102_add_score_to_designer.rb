class AddScoreToDesigner < ActiveRecord::Migration
  def self.up
    add_column :designers, :score, :float
  end

  def self.down
    remove_column :designers, :score
  end
end

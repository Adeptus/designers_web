class AddScoreToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :score, :float
  end

  def self.down
    remove_column :projects, :score
  end
end

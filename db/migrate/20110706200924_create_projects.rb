class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.integer :portfolio_id, :null => false, :options =>
      "CONSTRAINT fk_project_portfolios REFERENCES portfolios(id)"
      t.string :text
      t.string :link
      t.string :image_url

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end

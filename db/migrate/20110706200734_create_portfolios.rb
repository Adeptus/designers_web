class CreatePortfolios < ActiveRecord::Migration
  def self.up
    create_table :portfolios do |t|
      t.integer :designer_id, :null => false, :options =>
      "CONSTRAINT fk_portfolio_designers REFERENCES designers(id)"
      t.string :text

      t.timestamps
    end
  end

  def self.down
    drop_table :portfolios
  end
end

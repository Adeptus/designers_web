class Project < ActiveRecord::Base
  belongs_to :portfolio

  validates_presence_of     :portfolio_id
  validates_numericality_of :portfolio_id
end

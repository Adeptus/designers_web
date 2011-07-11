class Portfolio < ActiveRecord::Base
  belongs_to :designer
  has_many   :projects
end

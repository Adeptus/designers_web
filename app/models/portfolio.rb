class Portfolio < ActiveRecord::Base
  belongs_to :designer
  has_many   :projects
  has_many   :comments, :as => :attachable
end

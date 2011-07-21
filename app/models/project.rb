class Project < ActiveRecord::Base
  belongs_to :portfolio
  has_many   :comments, :as => :attachable
end

class Comment < ActiveRecord::Base
  belongs_to :designer
  belongs_to :attachable, :polymorphic => true
end

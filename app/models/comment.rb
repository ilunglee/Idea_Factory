class Comment < ActiveRecord::Base
  belongs_to :comment, dependent: :destroy
  belongs_to :user

  validates_presence_of :body
  
  scope :ordered_by_creation, -> { order("created_at DESC")}
end

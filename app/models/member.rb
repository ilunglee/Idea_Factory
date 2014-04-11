class Member < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea

  validates :idea_id, uniqueness: {scope: :user_id} #search by user_id

  def find_membership(idea)
    Member.where(user_id: current_user.id, idea_id: idea.id)
  end
end

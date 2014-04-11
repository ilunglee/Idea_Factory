class Idea < ActiveRecord::Base
  validates :title, presence: {message: "must have title"}, uniqueness: true
  validates :body, presence: {message: "must have body"}, uniqueness: true   

  default_scope { order("created_at DESC") }
  belongs_to :user
  has_many :comments
  has_many :members
  has_many :memberships, through: :members, source: :user

  def get_owner(user_id)
    if @user = User.find_by_id(user_id)
      return @user.full_name || @user.email
    end
  end   

  def get_membership(user_id)
    self.members.where(user_id: user_id)
  end

  def get_like(user_id)
  end

end

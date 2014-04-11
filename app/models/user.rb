class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ideas
  has_many :comments
  has_many :memberships, through: :ideas, source: :members
  has_many :members

  def membership_of(idea)
    Member.where(idea: idea, user: self).first
  end

  def find_for_idea(idea)
   Member.where(idea: idea, user: self).first
  end

  def full_name
    if first_name || last_name
      "#{first_name} #{last_name}".squeeze(" ").strip
    else
      email
    end
  end
end

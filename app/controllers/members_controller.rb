class MembersController < ApplicationController
  before_action :authenticate_user!, except: [:create, :destroy]
  # before_action :authenticate_user!
  before_action :find_idea

  def create
    @member       = @idea.members.new
    @member.user  = current_user
    if @member.save
      redirect_to root_path, notice: "Thanks for joining!"
    else
      redirect_to root_path, error: "Your cannot join"
    end
  end

  def destroy
    @member = current_user.members.find params[:id]
    if @member.destroy
      redirect_to root_path, notice: "Vote Delete"
    else
      redirect_to root_path, error: "Vote couldn't be removed"
    end
  end

  private

  def find_idea
    @idea = Idea.find(params[:idea_id])
  end


  # def vote_params
  #   params.require(:vote).permit(:user, :idea_id)
  # end

end

class IdeasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_idea, only: [:edit, :update, :destroy]

  def index
    @ideas = Idea.all
    @members = Member.all
    # @current_user = current_user
    # @members = current_user.members
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = current_user.ideas.new(idea_attributes)
    if @idea.save
      redirect_to ideas_path, notice: "Your idea was created successfully!"
    else
      flash.now[:error] = "Please correct the form" 
      render :new
    end
  end

  def show
    @idea        = Idea.find params[:id]
    @comments    = @idea.comments.ordered_by_creation
  end

  def edit
  end

  def update
    if @idea.update_attributes(idea_attributes)
      redirect_to @idea, notice: "Idea updated successfully" 
    else
      flash.now[:error] = "couldn't update Idea"
      render :edit
    end
  end

  private

  def find_idea
    @idea = current_user.ideas.find_by_id params[:id]
    redirect_to root_path, notice: "Access Denined" unless @idea
  end

  def idea_attributes
    params.require(:idea).permit([:title, :body])
  end

  


end

class LikesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_topic

  def create
    @like = @topic.find_my_like(current_user)

    unless @like
      @like = Like.create!( :topic => @topic, :user => current_user )
    end

    render "reload"
  end

  def destroy
    @like = @topic.likes.find( params[:id] )
    @like.destroy

    @like = nil

    render "reload"
  end

  protected

  def set_topic
    @topic = Topic.find( params[:topic_id ])
  end

end

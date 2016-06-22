class LikesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_topic

  def create
    Like.create!( :topic => @topic, :user => current_user )

    redirect_to :back
  end

  def destroy
    like = @topic.likes.find( params[:id] )
    like.destroy

    redirect_to :back
  end

  protected

  def set_topic
    @topic = Topic.find( params[:topic_id ])
  end

end

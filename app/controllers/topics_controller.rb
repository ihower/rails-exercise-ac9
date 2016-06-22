class TopicsController < ApplicationController

  def index
    @topics = Topic.page(params[:page])
  end

end

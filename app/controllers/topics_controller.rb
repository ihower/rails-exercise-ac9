class TopicsController < ApplicationController

  def index
    @topics = Topic.order("id DESC").page(params[:page])
  end

  def show
    @topic = Topic.find( params[:id] )
  end

  def new
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find( params[:id] )
  end

  def create
    @topic = Topic.new( topic_params )

    if @topic.save
      redirect_to topics_path
    else
      render :new
    end
  end

  def update
    @topic = Topic.find( params[:id] )
    if @topic.update( topic_params )
      redirect_to topics_path
    else
      render :edit
    end
  end

  def destroy
    @topic = Topic.find( params[:id] )
    @topic.destroy

    redirect_to topics_path
  end

  protected

  def topic_params
    params.require(:topic).permit(:title, :content)
  end

end

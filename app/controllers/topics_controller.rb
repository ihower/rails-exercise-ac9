class TopicsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @topics = Topic.order("id DESC").page(params[:page])
  end

  def show
    @topic = Topic.find( params[:id] )

    respond_to do |format|
      format.html # show.html.erb
      format.js  # show.js.erb
    end
  end

  def new
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find( params[:id] )
  end

  def create
    @topic = Topic.new( topic_params )
    @topic.user = current_user

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

    respond_to do |format|
      format.html { redirect_to topics_path }
      format.js # destroy.js.erb
    end
  end

  def subscribe
    @topic = Topic.find( params[:id] )
    @subscription = @topic.find_my_subscription(current_user)
    unless @subscription
      @subscription = Subscription.create!( :topic => @topic, :user => current_user )
    end

    redirect_to :back
  end

  def unsubscribe
    @topic = Topic.find( params[:id] )
    @subscription = @topic.find_my_subscription(current_user)
    @subscription.destroy

    redirect_to :back
  end

  protected

  def topic_params
    params.require(:topic).permit(:title, :content, :category_ids => [])
  end

end

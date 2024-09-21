class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def top
  end
  def index
    @tweets = Tweet.all.order(created_at: :desc)
    @tweet = Tweet.new

    if params[:search] != nil && params[:search] != ''
      #部分検索かつ複数検索
      search = params[:search]
      @tweets = Tweet.joins(:user).where("comment LIKE ? OR cocktail LIKE ?", "%#{search}%", "%#{search}%")
    end
   
    if params[:tag_name]
      @tweets = Tweet.tagged_with("#{params[:tag_name]}")
    end

  end

  def show
  end
  
  def new
    @tweet = Tweet.new
  end

  def create
    tweet = Tweet.new(tweet_params)
    tweet.user_id = current_user.id 
    if tweet.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to :action => "index", :id => tweet.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: :index
  end

  private
  def tweet_params
    params.require(:tweet).permit(:cocktail, :image, :Base, :comment, :tag_list, :created_at)
  end

end

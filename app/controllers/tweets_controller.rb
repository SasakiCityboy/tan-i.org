class TweetsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @tweets = Tweet.order("created_at DESC").page(params[:page]).per(10)
  end

  def new
  end

  def create
    Tweet.create(name: tweet_params[:name], tani: tweet_params[:tani], text: tweet_params[:text], user_id: current_user.id)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.destroy
    end
  end


  def edit
    @tweet = Tweet.find(params[:id])
  end


  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
    end
  end

  private
  def tweet_params
    params.permit(:name, :tani, :text)
  end


  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end

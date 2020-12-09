class TweetsController < ApplicationController
before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  def index
    @tweets = Tweet.all
  end

  def show
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if params[:back]
      render :new
    elsif @tweet.save
      redirect_to new_tweet_path, notice:"登録しました"
    elsif
      render :new
    end
  end

  def edit
  end

  def confirm
    @tweet = Tweet.new(tweet_params)
    @tweet.id = params[:id]
  end

  def update
    @tweet.update(tweet_params)
    if @tweet.save
      redirect_to tweets_path, notice:"修正しました"
    elsif
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice:"削除しました"
  end

  private
  def tweet_params
    params.require(:tweet).permit(:content)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
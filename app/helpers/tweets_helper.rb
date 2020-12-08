module TweetsHelper
  def new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_tweets_path
    elsif action_name == 'edit'
      confirm_tweet_path
    end
  end

  def create_or_update
    unless @tweet.id?
      tweets_path
    else
      tweet_path
    end
  end

  def select_method
    @tweet.id ? 'patch' : 'post'
  end
end
class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweets = Tweet.new
  end
  
  def create
    @tweets = Tweet.new(message: params[:tweet][:message], tdate: Time.current)
    if !@tweets.save then
      render 'new'
    else
      flash[:notice]='ツイートしました。'
    redirect_to '/'
    end
  end
  
  def show
    @tweets = Tweet.find(params[:id])
  end
  
  def edit
    @tweets = Tweet.find(params[:id])
  end
  
  def update
    @tweets = Tweet.find(params[:id])
    if !@tweets.update(message: params[:tweet][:message]) then
      render 'edit'
    else
      flash[:notice] = '更新しました。'
    redirect_to '/'
    end
  end
  
  def destroy
    tweets = Tweet.find(params[:id])
    tweets.destroy
    flash[:notice] = '削除しました。'
    redirect_to '/'
  end
  
  
  
end

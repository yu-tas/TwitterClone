class PostsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy] # destroyアクションを追加

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new                                         #controllerでデータを作りviewからブラウザ表示
  end 

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "tweetを作成しました！"
    else
      render :new  
    end                            
  end

  def show
  end  
  
  def edit
  end

  def update
    
    if @post.update(post_params)
      redirect_to post_path, notice: "tweetを編集しました！"
    else 
      render :edit
    end
  end

  def destroy
      @post.destroy
      redirect_to posts_path, notice:"tweetを削除しました！"    
  end
  
private                                                       #予期せぬところからblog_paramsを呼び出せないようにするため

def post_params
  params.require(:post).permit(:content)                    #送られてきたデータをパラメーターで取得
end

def set_tweet
  @post = Post.find(params[:id])
end
end



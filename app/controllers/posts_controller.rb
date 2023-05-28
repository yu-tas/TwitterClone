class PostsController < ApplicationController
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
    @post = Post.find(params[:id])
  end  
  
private                                                       #予期せぬところからblog_paramsを呼び出せないようにするため

  def post_params
    params.require(:post).permit(:content)                    #送られてきたデータをパラメーターで取得
  end
end


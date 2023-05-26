class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new                                    #controllerでデータを作りviewからブラウザ表示
  end 

  def create
    Post.create(content: params[:post][:content])       #送られてきたデータをパラメーターで取得
    redirect_to new_post_path
  end
  
end


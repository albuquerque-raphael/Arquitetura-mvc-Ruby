class PostsController < ApplicationController
    def index
      @posts = Post.all
      if @posts.nil?
        flash[:notice] = "Nenhum post encontrado."
      end
    end
  
    def show
      @post = Post.find(params[:id]) # Encontra o post pelo ID passado na URL
    end
  
    def new
      @post = Post.new
    end
  
    def create
      @post = Post.new(post_params)
  
      if @post.save
        redirect_to @post, notice: 'Post foi criado com sucesso.'
      else
        render :new
      end
    end
  
    private
  
    def post_params
      params.require(:post).permit(:title, :content)
    end
  end
  
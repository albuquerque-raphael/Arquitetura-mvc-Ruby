class PostsController < ApplicationController
  def index
    @posts = Post.all
    if @posts.empty?
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
def edit
    @post = Post.find(params[:id]) # Busca o post pelo ID para edição
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post, notice: 'Post foi atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy # Exclui o post do banco de dados

    redirect_to posts_path, notice: 'Post foi deletado com sucesso.'
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
class PrototypesController < ApplicationController
  before_action :set_prototypes, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]
  before_action :authenticate_user!

  def index
    @prototypes = Prototype.all
    # Prototypeはモデル
    # @prototypesはインスタンス変数
  end


  def new
    @prototype = Prototype.new
  end

  def create
    prototype = Prototype.new(prototype_params)
    if prototype.save
    redirect_to action: :index
    else
    redirect_to action: :new
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to action: :index
  end

  def edit
    @prototype= Prototype.find(params[:id])
  end

 
  def update
    prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to prototype_path(prototype)
    else
      render :edit
    end
  end


  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
    @prototype = Prototype.find(params[:id])
  end

  def search
    @prototypes = SearchprototypesService.search(params[:keyword])
  end

  private

  def prototype_params
    params.require(:prototype).permit(:consept, :title, :catch, :image).merge(user_id: current_user.id)
  end

  def set_prototypes
    @prototype = Prototype.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
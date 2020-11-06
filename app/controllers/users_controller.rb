class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @comments = @user.name
    @prototypes = @user.prototypes
  end

  private

  def user_params
    params.require(:user, :name).permit(:name, :email)
  end
end

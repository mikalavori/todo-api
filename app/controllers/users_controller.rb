class UsersController < ApplicationController
  before_action :authorize_request, only: [:show, :update, :destroy]

  def show
    render json: current_user, status: :ok
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update
    if current_user.update(user_params)
      render json: current_user, status: :ok
    else
      render json: current_user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    current_user.destroy
  end

  def authenticate
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: user
    else
      render json: { error: 'Invalid username / password' }, status: :unauthorized
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def authorize_request
    status, @current_user, asd = AuthorizeRequest.call(request.headers)
    render_unauthorized unless current_user
  end

  def current_user
    @current_user
  end
end

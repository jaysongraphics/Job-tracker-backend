class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    users = User.all

    render json: users
  end

  # GET /users/1
  def show
    render json: user
  end

  # POST /users
  def create
    user = User.new(user_params)

    if user.save
      token = JWT.encode({user_id: user.id}, 'randomstring123', 'HS256')
      render json: {user: UserSerializer.new(user), token: token}

    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if user.update(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    user.destroy
  end

  def login 
    user = login_user
    if user && user.authenticate(params[:password])
      token = JWT.encode({user_id: user.id}, 'randomstring123', 'HS256')
      render json: {user: UserSerializer.new(user), token: token}
    else
      render json: { errors: ["Invalid username or password"] }, status: :unauthorized
  end
end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.

    def login_user 
      user = User.find_by(email: params[:email])
    end
    
    def set_user
      user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
     params.permit(:name, :email, :picture, :password)
    end
end

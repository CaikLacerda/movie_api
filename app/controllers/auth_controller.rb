class AuthController < ApplicationController
  def signup
    user = User.new(user_params)
    if user.save
      render json: { message: 'Usuario criado'}, status: :created
    else
      render json: { errors: user.error.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(email: params[:email].to_s.downcase)
    if user&.authenticate(params[:password])
      token = JsonWebToken.encode({sub: user.id})
      render json: {token: token}, status: :ok
    else
      render json: {error: 'Credenciais invalidas'}, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found 
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  
  private

  def render_not_found(exception)
    render json: { error: exception.message}, status: :not_found
  end

  def render_unprocessable_entity(exception)
    render json: { error: exception.record.errors.full_messages}, status: :unprocessable_entity
  end

  def authenticate__request!
    header = request.headers['Authorization']
    token = header&.split(' ')&.last
    payload = JsonWebToken.decode(token)
    @current_user = User.find(payload[:sub])
  end

  def current_user
    @current_user
  end

  def render_error(e)
    Rails.logger.warn("[Auth] #{e.class}: #{e.message}")
    render json: { error: 'Erro interno' }, status: :internal_server_error unless performed?
  end
end

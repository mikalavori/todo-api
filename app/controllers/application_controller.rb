class ApplicationController < ActionController::API
  def authorize_request
    status, @current_user = AuthorizeRequest.call(request.headers)
    if current_user.blank? || status == :fail
      return render_unauthorized
    elsif status == :exiperd
      return render_expired
    end
  end

  def current_user
    @current_user
  end

  def render_unauthorized
    render json: { error: "You're not authorized" }, status: :unauthorized
  end

  def render_expired
    render json: { error: 'Token is expired' }, status: :unauthorized
  end
end

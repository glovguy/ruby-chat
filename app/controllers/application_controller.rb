class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_as_admin
    return render :file => "public/404.html", :status => :unauthorized unless has_admin_password?
  end

  def has_admin_password?
    params[:password] == 'monknee'
  end
end

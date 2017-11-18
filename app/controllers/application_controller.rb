class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #add_breadcrumb 'Home', :root_path
  
  def remove_breadcrumbs
    @breadcrumbs = nil
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

end

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, exept: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    # indexページへ遷移
    post_images_path
  end
  
  def after_sign_out_path_for(resource)
    about_path
  end
  
  protected
  
  # ストロングパラメターみたいなものを定義
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
  end  
  
end

class ApplicationController < ActionController::Base
    before_action :authenticate_user!,except: [:top]
    #deviseの機能が使われるアクションが実行される時に、その前にconfigure_permitted_parametersを実行
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected
    
    def configure_permitted_parameters
      added_attrs = [:user_name, :email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      #nameカラムを追加したため
      devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
    end
  end
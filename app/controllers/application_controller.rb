class ApplicationController < ActionController::Base
    before_action :authenticate_user!,except: [:top, :about]
    #deviseの機能が使われるアクションが実行される時に、その前にconfigure_permitted_parametersを実行
    before_action :configure_permitted_parameters, if: :devise_controller?
    #前のページを保存しておくメソッドを呼び出す
    before_action :set_request_from

    def after_sign_in_path_for(resource)
      user_path(resource)
    end
    def set_request_from
      if session[:request_from]
        @request_from = session[:request_from]
      end
      # 現在のURLを保存しておく
      session[:request_from] = request.original_url
    end

    protected
    
    def configure_permitted_parameters
      added_attrs = [:user_name, :email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      #nameカラムを追加したため
      devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
    end
  end